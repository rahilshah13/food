const express = require("express");
const { exec, spawn } = require("child_process");
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
  const csvPath = path.join(__dirname, "ingredients.csv");
  if (!fs.existsSync(csvPath)) return res.json([]);
  fs.createReadStream(csvPath)
    .pipe(csv())
    .on("data", (data) => {
      const cas = data.cas || data.CAS || Object.values(data)[0];
      const name = data.name || data.Name || Object.values(data)[1];
      if (cas && name) results.push({ cas, name });
    })
    .on("end", () => res.json(results));
});

// --- MEAL PLAN POST ENDPOINT ---
app.post("/api/meal-plan", (req, res) => {
  const { gender = 'm', mass = 80, days = 7305 } = req.body;
  const filename = `human_growth_${Date.now()}.txt`;
  const filepath = path.join(__dirname, filename);

  const tplArgs = [
    path.join(__dirname, 'food.pl'),
    path.join(__dirname, 'grow.pl'),
    path.join(__dirname, 'human.pl'),
    '-g', `write_human_report('${gender}', ${mass}, ${days}, '${filepath}'), halt.`
  ];

  const tplProcess = spawn('tpl', tplArgs);
  let stderrData = '';

  tplProcess.stderr.on('data', (data) => {
    stderrData += data.toString();
  });

  tplProcess.on('close', (code) => {
    if (code === 0 && fs.existsSync(filepath)) {
      const reportContent = fs.readFileSync(filepath, 'utf8');
      try { fs.unlinkSync(filepath); } catch(e) {}
      res.json({ success: true, report: reportContent });
    } else {
      res.status(500).json({ success: false, error: stderrData || `TPL execution failed with code ${code}` });
    }
  });
});

// --- RANDOM STACK STREAMING ENDPOINT ---
app.get("/api/random-stack-stream", (req, res) => {
  res.setHeader("Content-Type", "text/event-stream");
  res.setHeader("Cache-Control", "no-cache");
  res.setHeader("Connection", "keep-alive");

  const n = parseInt(req.query.n) || 4;
  const sendSSE = (progress, status, stack = null, error = null) => {
    res.write(`data: ${JSON.stringify({ progress, status, stack, error })}\n\n`);
  };

  sendSSE(25, "Scanning targets knowledge base...");

  setTimeout(() => {
    sendSSE(65, "Parsing druggable targets & binding coefficients...");
    
    try {
      let availableDrugs = [];
      const targetsPath = path.join(__dirname, "targets.pl");
      
      if (fs.existsSync(targetsPath)) {
        const lines = fs.readFileSync(targetsPath, 'utf8').split('\n');
        for (const line of lines) {
          if (line.includes('druggable_target')) {
            const match = line.match(/druggable_target\(([^,\s]+),\s*'([^']+)'/);
            if (match) {
              availableDrugs.push({ id: match[1], name: match[2] });
            }
          }
        }
      }

      if (availableDrugs.length === 0) {
        availableDrugs = [
          { id: 't1', name: 'Metformin' },
          { id: 't2', name: 'Atorvastatin' },
          { id: 't3', name: 'Lisinopril' },
          { id: 't4', name: 'Amlodipine' },
          { id: 't5', name: 'Omeprazole' }
        ];
      }

      const shuffled = [...availableDrugs].sort(() => 0.5 - Math.random());
      const selected = shuffled.slice(0, Math.min(n, shuffled.length)).map(d => ({
        name: d.name,
        dose: 100,
        unit: 'mg',
        route: 'PO',
        ka: 1.5,
        ke: 0.2,
        vd: 50,
        kd: 1.0,
        hillN: 1.0
      }));

      sendSSE(100, "Complete", selected, null);
    } catch (err) {
      sendSSE(100, "Error", null, err.message);
    }
    res.end();
  }, 300);
});

// --- OLLAMA NATURAL LANGUAGE SERIALIZER ENDPOINT ---
app.post("/api/parse-formula", async (req, res) => {
  const { inputList } = req.body;
  if (!inputList) return res.status(400).json({ error: "No input list provided." });

  const ingredientsDb = [];
  const csvPath = path.join(__dirname, "ingredients.csv");
  if (!fs.existsSync(csvPath)) return res.status(500).json({ error: "ingredients.csv not found" });

  fs.createReadStream(csvPath)
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

// Density Normalization Algorithm & Render Stream
app.post("/api/render-stream", (req, res) => {
  res.setHeader("Content-Type", "text/event-stream");
  res.setHeader("Cache-Control", "no-cache");
  res.setHeader("Connection", "keep-alive");

  const { seconds = 20, fps = 30, velocity = 25.0, temp = 298.15, humidity = 0.5, ingredients = [] } = req.body;

  const ingredientDataMap = {};
  const csvPath = path.join(__dirname, "ingredients.csv");
  if (!fs.existsSync(csvPath)) {
    res.write(`data: ${JSON.stringify({ error: "ingredients.csv not found" })}\n\n`);
    res.end();
    return;
  }

  fs.createReadStream(csvPath)
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

      child.stderr.on("data", (data) => {
        console.error("Renderer stderr:", data.toString());
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