# docker build -t orangebook . && docker run -d -p 8080:8080 orangebook
FROM python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends curl bash ca-certificates psmisc && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://ollama.com/install.sh | sh
WORKDIR /app
ENV DEFAULT_STACK='[{"name":"Prednisone","dose":60,"unit":"mg","route":"PO","ka":1.2,"ke":0.23,"vd":50,"kd":1.0,"hillN":1.5},{"name":"Acetaminophen","dose":1000,"unit":"mg","route":"PO","ka":2.0,"ke":0.28,"vd":45,"kd":5.0,"hillN":1.0},{"name":"Vedolizumab","dose":300,"unit":"mg","route":"IM/SC","ka":0.5,"ke":0.01,"vd":8,"kd":0.1,"hillN":1.2},{"name":"Tofacitinib","dose":5,"unit":"mg","route":"PO","ka":3.0,"ke":0.23,"vd":87,"kd":0.2,"hillN":1.2},{"name":"Nicotine","dose":100,"unit":"mg","route":"Vapor","ka":5.0,"ke":0.35,"vd":120,"kd":0.5,"hillN":1.0},{"name":"Caffeine","dose":200,"unit":"mg","route":"PO","ka":2.5,"ke":0.14,"vd":40,"kd":2.0,"hillN":1.0}]'
RUN mkdir -p /app/public
RUN cat << 'EOF' > /app/server.py
import http.server, socketserver, json, urllib.request, os
from urllib.parse import urlparse, parse_qs

def query_ollama(prompt):
    req = urllib.request.Request("http://localhost:11434/api/generate", data=json.dumps({"model": "gemma2:2b", "prompt": prompt, "stream": False}).encode(), headers={'Content-Type': 'application/json'})
    with urllib.request.urlopen(req) as r:
        return json.loads(r.read().decode()).get('response', '')

def clean_json(text):
    text = text.strip()
    if text.startswith("```json"): text = text[7:]
    elif text.startswith("```"): text = text[3:]
    if text.endswith("```"): text = text[:-3]
    return text.strip()

class H(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *a, **kw): super().__init__(*a, directory="/app/public", **kw)
    def do_GET(self):
        p = urlparse(self.path)
        if p.path == '/api/default-stack':
            self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
            self.wfile.write(os.environ.get('DEFAULT_STACK', '[]').encode())
        elif p.path == '/api/random-stack':
            n = int(parse_qs(p.query).get('n', [4])[0])
            prompt = f"Generate a JSON array of exactly {n} random pharmacological drugs. Each object must have keys: name (string), dose (number), unit (string), route (string), ka (number), ke (number), vd (number), kd (number), hillN (number). Return ONLY raw valid JSON array, no markdown."
            for _ in range(3):
                try:
                    raw = query_ollama(prompt)
                    data = json.loads(clean_json(raw))
                    if isinstance(data, list) and len(data) > 0:
                        self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
                        self.wfile.write(json.dumps(data).encode())
                        return
                except Exception:
                    prompt = f"The previous output was invalid JSON. Fix it and return ONLY a valid JSON array of {n} drug objects with keys: name, dose, unit, route, ka, ke, vd, kd, hillN."
            self.send_response(500); self.end_headers(); self.wfile.write(b"[]")
        else: super().do_GET()
    def do_POST(self):
        cl = int(self.headers.get('Content-Length', 0))
        d = json.loads(self.rfile.read(cl).decode())
        if self.path == '/api/generate-facts':
            names = [x['name'] for x in d.get('drugs', [])]
            prompt = f"Generate valid Trealla Prolog facts for stack: {names}. Format: molecule_target('SMILES', Target, Mech, [Params]). target_process(Target, Sys). process_pathway(Sys, Path). Code only."
        else:
            prompt = "".join([f"Write a formal LOMN for {x['name']} ({x['dose']}{x['unit']}, {x['route']}) with coverage criteria and lab placeholders.\n" for x in d.get('drugs', [])])
        
        try:
            res_text = query_ollama(prompt)
            self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
            self.wfile.write(json.dumps({"facts" if 'facts' in self.path else "lomns": [{"drug": x['name'], "lomn": res_text} for x in d.get('drugs', [])] if 'lomns' in self.path else res_text}).encode())
        except Exception as e:
            self.send_response(500); self.end_headers(); self.wfile.write(str(e).encode())
with socketserver.TCPServer(("", 8080), H) as s: s.serve_forever()
EOF
RUN cat << 'EOF' > /app/public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Systems-Pharmacology Simulator</title>
    <script src="[https://cdn.tailwindcss.com](https://cdn.tailwindcss.com)"></script>
    <script type="importmap">
        {
            "imports": {
                "solid-js": "[https://esm.sh/solid-js@1.8.20](https://esm.sh/solid-js@1.8.20)",
                "solid-js/web": "[https://esm.sh/solid-js@1.8.20/web](https://esm.sh/solid-js@1.8.20/web)",
                "trealla": "[https://esm.sh/trealla@0.10.0](https://esm.sh/trealla@0.10.0)"
            }
        }
    </script>
</head>
<body class="bg-slate-50 p-4 sm:p-8 text-slate-900 font-sans antialiased">
    <main class="max-w-5xl mx-auto bg-white p-6 sm:p-8 rounded-xl border border-slate-200 shadow-sm">
        <header class="mb-6">
            <h1 class="text-2xl font-bold tracking-tight text-slate-900 mb-1">Systems-Pharmacology Simulator</h1>
            <p class="text-sm text-slate-600 mb-4">
                Client-side Trealla WASM engine evaluating multi-drug pharmacokinetics, Hill receptor occupancy, and Cellular Perturbation Indices (CPI).
            </p>
            <div class="bg-blue-50 border border-blue-200 text-blue-900 p-3 rounded-lg text-xs leading-relaxed">
                <strong>Disclaimer:</strong> Stack parameters and pharmacological properties are dynamically synthesized via Gemma 2b via local Ollama inference.
            </div>
        </header>

        <div id="app"></div>
    </main>

    <script type="module">
        import { createSignal, onMount, For, Show } from 'solid-js';
        import { render } from 'solid-js/web';
        import { load, Prolog } from 'trealla';

        function App() {
            const [isLoading, setIsLoading] = createSignal(true);
            const [loadingMessage, setLoadingMessage] = createSignal('Initializing WASM runtime...');
            const [progress, setProgress] = createSignal(15);
            const [stack, setStack] = createSignal([]);
            const [stackSize, setStackSize] = createSignal(4);
            const [analysis, setAnalysis] = createSignal({ impacts: [] });
            const [lomns, setLomns] = createSignal([]);
            
            let pl = null;

            onMount(async () => {
                try {
                    setLoadingMessage('Fetching default drug stack...');
                    setProgress(30);
                    const stackRes = await fetch('/api/default-stack');
                    const defaultStackData = await stackRes.json();
                    setStack(defaultStackData);

                    setLoadingMessage('Loading Trealla WASM engine...');
                    setProgress(50);
                    await load();
                    pl = new Prolog();

                    setLoadingMessage('Querying Gemma 2b for stack facts...');
                    setProgress(75);
                    const res = await fetch('/api/generate-facts', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ drugs: defaultStackData })
                    });
                    const data = await res.json();
                    
                    setLoadingMessage('Executing Prolog simulation...');
                    setProgress(90);
                    await runPrologAnalysis(data.facts || '');
                    
                    setProgress(100);
                } catch (e) {
                    setLoadingMessage('Initialization failed. Check console.');
                } finally {
                    setTimeout(() => setIsLoading(false), 300);
                }
            });

            const generateRandomStack = async () => {
                setIsLoading(true);
                setLoadingMessage('Generating random stack via Gemma...');
                setProgress(40);
                setLomns([]);
                try {
                    const res = await fetch(`/api/random-stack?n=${stackSize()}`);
                    const newStack = await res.json();
                    setStack(newStack);
                    
                    setProgress(70);
                    setLoadingMessage('Querying Gemma for new stack facts...');
                    const resFacts = await fetch('/api/generate-facts', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ drugs: newStack })
                    });
                    const data = await resFacts.json();
                    
                    setProgress(90);
                    setLoadingMessage('Running Prolog simulation...');
                    await runPrologAnalysis(data.facts || '');
                    
                    setProgress(100);
                } catch (e) {
                    console.error(e);
                } finally {
                    setTimeout(() => setIsLoading(false), 300);
                }
            };

            const generateLomns = async () => {
                setIsLoading(true);
                setLoadingMessage('Generating Letters of Medical Necessity...');
                setProgress(50);
                try {
                    const res = await fetch('/api/generate-lomns', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ drugs: stack() })
                    });
                    const data = await res.json();
                    setLomns(data.lomns || []);
                    setProgress(100);
                } catch (e) {
                    console.error(e);
                } finally {
                    setTimeout(() => setIsLoading(false), 300);
                }
            };

            const runPrologAnalysis = async (gemmaFacts) => {
                if (!pl) return;
                const stackTerms = stack().map(s => 
                    `drug('${s.name}', ${s.dose}, ${s.ka}, ${s.ke}, ${s.vd}, ${s.kd}, ${s.hillN})`
                ).join(', ');

                const prologCode = `
                    organ(blood, [erythrocyte-0.9, neutrophil-0.05, t_lymphocyte-0.03]).
                    organ(liver, [hepatocyte-0.8, macrophage-0.1]).
                    organ(brain, [pyramidal_neuron-0.6]).

                    hill(C, Kd, N, O) :-
                        ( C =< 0 -> O = 0
                        ; Cn is C ** N,
                          Kdn is Kd ** N,
                          O is (Cn / (Cn + Kdn)) * 100
                        ).

                    conc(D, Ka, Ke, V, T, C) :-
                        T >= 0,
                        ( abs(Ka - Ke) < 1e-5 -> K1 is Ka + 1e-4 ; K1 is Ka ),
                        C is (D * K1 / (V * abs(K1 - Ke))) * (exp(-Ke * T) - exp(-K1 * T)).

                    eval([], []).
                    eval([drug(N, D, Ka, Ke, V, Kd, N2) | R], Res) :-
                        conc(D, Ka, Ke, V, 12, C),
                        findall(
                            impact(N, Org, Cell, CPI),
                            (
                                organ(Org, Cells),
                                member(Cell - Frac, Cells),
                                hill(C, Kd, N2, O),
                                CPI is O * Frac
                            ),
                            Di
                        ),
                        eval(R, Rr),
                        append(Di, Rr, Res).

                    sim(S, R) :- eval(S, R).
                `;

                try {
                    await pl.queryOnce(prologCode);
                    const queryRes = await pl.queryOnce(`sim([${stackTerms}], R).`);
                    if (queryRes && queryRes.answer && queryRes.answer.R) {
                        const impacts = queryRes.answer.R.map(x => ({
                            drug: x.args[0],
                            organ: x.args[1],
                            cell: x.args[2],
                            cpi: (+x.args[3]).toFixed(2)
                        }));
                        setAnalysis({ impacts });
                    }
                } catch (err) {
                    console.error("Prolog execution error:", err);
                }
            };

            return (
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 relative">
                    <Show when="{isLoading()}">
                        <div class="absolute inset-0 bg-white/95 flex flex-col items-center justify-center z-20 rounded-xl p-6 text-center">
                            <div class="text-sm font-semibold text-slate-800 mb-2">{loadingMessage()}</div>
                            <div class="w-64 h-2 bg-slate-200 rounded-full overflow-hidden">
                                <div class="h-full bg-blue-600 transition-all duration-300" style={{ width: `${prog()}%` }}></div>
                            </div>
                        </div>
                    </Show>

                    {/* Left Column: Active Stack Configuration */}
                    <section class="bg-slate-50 p-5 rounded-xl border border-slate-200 flex flex-col">
                        <h2 class="text-xs font-bold uppercase tracking-wider text-slate-700 mb-3">Active Drug Stack</h2>
                        
                        <div class="flex items-center gap-2 mb-4 flex-wrap">
                            <input 
                                type="number" 
                                min="1" 
                                max="10" 
                                value={stackSize()} 
                                onInput={e => setStackSize(parseInt(e.target.value) || 4)} 
                                class="w-16 px-3 py-2 text-sm bg-white border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" 
                                title="Stack Size"
                            />
                            <button onClick={generateRandomStack} class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 text-sm font-medium rounded-lg transition-colors shadow-sm">
                                Random Stack
                            </button>
                            <button onClick={generateLomns} class="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 text-sm font-medium rounded-lg transition-colors shadow-sm">
                                Generate LOMNs
                            </button>
                        </div>

                        <ul class="space-y-2 overflow-y-auto max-h-72 pr-1">
                            <For each="{stack()}">
                                {(item) => (
                                    <li class="bg-white p-3 rounded-lg border border-slate-200 flex justify-between items-center text-sm shadow-2xs">
                                        <span class="font-semibold text-slate-800">{item.name}</span>
                                        <span class="text-slate-500 font-mono text-xs bg-slate-100 px-2 py-1 rounded">
                                            {item.dose}{item.unit} ({item.route})
                                        </span>
                                    </li>
                                )}
                            </For>
                        </ul>
                    </section>

                    {/* Right Column: Simulation Results & LOMNs */}
                    <section class="bg-slate-50 p-5 rounded-xl border border-slate-200 flex flex-col space-y-6">
                        <div>
                            <h2 class="text-xs font-bold uppercase tracking-wider text-slate-700 mb-1">Cellular Perturbation Index (CPI) Matrix</h2>
                            <p class="text-xs text-slate-500 mb-3">Calculated via 1-compartment kinetics ($T=12\text{ h}$) & sigmoidal Hill receptor occupancy.</p>
                            
                            <div class="overflow-x-auto border border-slate-200 rounded-lg bg-white">
                                <table class="w-full text-left text-xs">
                                    <thead class="bg-slate-100 border-b border-slate-200 text-slate-700 uppercase font-semibold">
                                        <tr>
                                            <th class="p-3">Agent</th>
                                            <th class="p-3">Organ</th>
                                            <th class="p-3">Cell</th>
                                            <th class="p-3">CPI</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-slate-100">
                                        <For each="{analysis().impacts}">
                                            {(row) => (
                                                <tr class="hover:bg-slate-50">
                                                    <td class="p-3 font-semibold text-slate-800">{row.drug}</td>
                                                    <td class="p-3 text-slate-600">{row.organ}</td>
                                                    <td class="p-3 text-slate-600">{row.cell}</td>
                                                    <td class="p-3">
                                                        <span class="bg-slate-100 text-slate-800 px-2 py-0.5 rounded font-mono text-[11px] font-medium">
                                                            {row.cpi}%
                                                        </span>
                                                    </td>
                                                </tr>
                                            )}
                                        </For>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <Show when="{lomns().length"> 0}>
                            <div>
                                <h2 class="text-xs font-bold uppercase tracking-wider text-slate-700 mb-2">Letters of Medical Necessity (LOMN)</h2>
                                <div class="space-y-3 max-h-80 overflow-y-auto pr-1">
                                    <For each="{lomns()}">
                                        {(lomnItem) => (
                                            <div class="bg-white border border-slate-300 p-4 rounded-lg shadow-2xs">
                                                <h3 class="font-bold text-sm text-slate-800 mb-1">{lomnItem.drug}</h3>
                                                <pre class="whitespace-pre-wrap text-xs bg-slate-50 p-3 rounded-md border border-slate-100 text-slate-700 font-sans leading-relaxed">
                                                    {lomnItem.lomn}
                                                </pre>
                                            </div>
                                        )}
                                    </For>
                                </div>
                            </div>
                        </Show>
                    </section>
                </div>
            );
        }

        render(() => <App/>, document.getElementById('app'));
    </script>
</body>
</html>
EOF
RUN cat << 'EOF' > /app/entrypoint.sh
#!/bin/bash
export OLLAMA_ORIGINS="*"
mkdir -p /root/.ollama
ollama serve > /app/ollama.log 2>&1 &
PID=$!
for i in {1..60}; do
    curl -s http://localhost:11434/api/tags >/dev/null && break
    sleep 5
    kill -0 $PID 2>/dev/null || { cat /app/ollama.log; exit 1; }
done
ollama pull gemma2:2b
exec python3 /app/server.py
EOF
RUN chmod +x /app/entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/app/entrypoint.sh"]
