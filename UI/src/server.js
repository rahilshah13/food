const express = require("express");
const { exec } = require("child_process");
const cors = require("cors");
const path = require("path");
const fs = require("fs");
const csv = require("csv-parser");

const app = express();
app.use(cors());
app.use(express.json());

app.use(express.static(path.join(__dirname, "frontend/dist")));
app.use(express.static(path.join(__dirname, "server/public")));

// Load ingredients CSV for lookup
app.get("/api/ingredients", (req, res) => {
  const results = [];
  fs.createReadStream(path.join(__dirname, "ingredients.csv"))
    .pipe(csv())
    .on("data", (data) => {
      const cas = data.cas || data.CAS || Object.values(data)[0];
      const name = data.name || data.Name || Object.values(data)[1];
      if (cas && name) results.push({ cas, name });
    })
    .on("end", () => res.json(results));
});

// --- OLLAMA NATURAL LANGUAGE SERIALIZER ENDPOINT ---
app.post("/api/parse-formula", async (req, res) => {
  const { inputList } = req.body;
  if (!inputList) return res.status(400).json({ error: "No input list provided." });

  const ingredientsDb = [];
  fs.createReadStream(path.join(__dirname, "ingredients.csv"))
    .pipe(csv())
    .on("data", (data) => {
      const cas = data.cas || data.CAS || Object.values(data)[0];
      const name = data.name || data.Name || Object.values(data)[1];
      if (cas && name) ingredientsDb.push({ cas, name });
    })
    .on("end", async () => {
      try {
        const ollamaHost = process.env.OLLAMA_HOST || "http://localhost:11434";
        const prompt = `You are a chemical formula assistant. Match the following comma-separated user input items to the closest matching items from the provided database. Return ONLY a valid JSON array of objects with keys "cas" and "name". No markdown formatting or extra text.\n\nDatabase:\n${JSON.stringify(ingredientsDb.slice(0, 100))}\n\nUser Input: ${inputList}`;

        const ollamaRes = await fetch(`${ollamaHost}/api/generate`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            model: "llama3.2",
            prompt: prompt,
            stream: false,
            format: "json"
          })
        });

        const data = await ollamaRes.json();
        const parsedItems = JSON.parse(data.response || "[]");
        res.json({ success: true, items: parsedItems });
      } catch (err) {
        console.error("Ollama parsing error:", err);
        res.status(500).json({ error: "Failed to serialize items via Ollama service." });
      }
    });
});

// --- OLLAMA OBJECT-RIGGING-PHYSICS SEQUENCING ENDPOINT ---
app.post("/api/generate-rigging-sequence", async (req, res) => {
  const { promptText } = req.body;
  if (!promptText) return res.status(400).json({ error: "No prompt text provided." });

  const ollamaHost = process.env.OLLAMA_HOST || "http://localhost:11434";
  const systemPrompt = `You are a physics and object-rigging simulation engine. Translate the user description into a structured JSON array of physical rigging events, constraints, forces, and object transformations for simulation sequencing. 
Return ONLY a valid JSON array of objects with keys: "objectId", "action", "forceVector" [fx, fy, fz], "elasticity", "viscosity", and "triggerTime". No markdown formatting, no explanation.`;

  try {
    const ollamaRes = await fetch(`${ollamaHost}/api/generate`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        model: "llama3.2",
        prompt: `${systemPrompt}\n\nDescription: ${promptText}`,
        stream: false,
        format: "json"
      })
    });

    const data = await ollamaRes.json();
    let cleaned = data.response.trim();
    if (cleaned.startsWith("```json")) cleaned = cleaned.slice(7);
    if (cleaned.startsWith("```")) cleaned = cleaned.slice(3);
    if (cleaned.endsWith("```")) cleaned = cleaned.slice(-3);

    const parsedSequence = JSON.parse(cleaned.trim());
    
    // Save generated rigging physics profile for C backend ingestion
    fs.writeFileSync(path.join(__dirname, "rigging_sequence.json"), JSON.stringify(parsedSequence, null, 2));

    res.json({ success: true, sequence: parsedSequence });
  } catch (err) {
    console.error("Ollama rigging sequence error:", err);
    res.status(500).json({ success: false, error: err.message, sequence: [] });
  }
});

// Density Normalization Algorithm & Render Stream
app.post("/api/render-stream", (req, res) => {
  res.setHeader("Content-Type", "text/event-stream");
  res.setHeader("Cache-Control", "no-cache");
  res.setHeader("Connection", "keep-alive");

  const { seconds = 20, fps = 30, velocity = 25.0, temp = 298.15, humidity = 0.5, ingredients = [] } = req.body;

  const ingredientDataMap = {};
  fs.createReadStream(path.join(__dirname, "ingredients.csv"))
    .pipe(csv())
    .on("data", (row) => {
      const cas = row.cas || row.CAS || Object.values(row)[0];
      const mw = parseFloat(row.MolecularWeight || row.mw || 150.0);
      if (cas) ingredientDataMap[cas] = isNaN(mw) ? 150.0 : mw;
    })
    .on("end", () => {
      const processedFormula = ingredients.map(item => {
        const mw = ingredientDataMap[item.cas] || 150.0;
        const normalizedDensity = Math.min(2.0, Math.max(0.5, mw / 150.0));
        return {
          cas: item.cas,
          color: item.color || '#6366f1',
          densityWeight: normalizedDensity
        };
      });

      fs.writeFileSync(path.join(__dirname, "formula.txt"), processedFormula.map(i => `${i.cas}:${i.color}:${i.densityWeight}`).join("\n"));

      const filename = `render_${Date.now()}.gif`;
      const pubDir = path.join(__dirname, "server/public");
      if (!fs.existsSync(pubDir)) fs.mkdirSync(pubDir, { recursive: true });
      const outPath = path.join(pubDir, filename);

      const cmd = `./perfume_render -s ${seconds} -r ${fps} -v ${velocity} -t ${temp} -m ${humidity} -o ${outPath}`;
      
      const child = exec(cmd, { cwd: __dirname });
      child.stdout.on("data", (data) => {
        const lines = data.toString().split("\n");
        for (const line of lines) {
          if (line.startsWith("PROGRESS:")) {
            const val = line.replace("PROGRESS:", "").trim();
            res.write(`data: ${JSON.stringify({ progress: parseInt(val) })}\n\n`);
          }
        }
      });

      child.on("close", (code) => {
        if (code === 0 && fs.existsSync(outPath)) {
          res.write(`data: ${JSON.stringify({ filename: `/${filename}`, progress: 100 })}\n\n`);
        } else {
          res.write(`data: ${JSON.stringify({ error: "Render failed" })}\n\n`);
        }
        res.end();
      });
    });
});

app.listen(3000, () => console.log("Server running on port 3000"));
