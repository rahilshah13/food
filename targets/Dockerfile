FROM python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends curl bash ca-certificates psmisc zstd && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://ollama.com/install.sh | sh

# cache gemma2:2b during build
ENV OLLAMA_MODELS=/root/.ollama/models
RUN bash -c ' \
    export OLLAMA_MODELS=/root/.ollama/models && \
    ollama serve & \
    PID=$! && \
    until curl -s http://localhost:11434/api/tags >/dev/null; do \
        sleep 1; \
    done && \
    ollama pull gemma2:2b && \
    kill $PID \
'

WORKDIR /app
ENV DEFAULT_STACK='[{"name":"Prednisone","dose":60,"unit":"mg","route":"PO","ka":1.2,"ke":0.23,"vd":50,"kd":1.0,"hillN":1.5},{"name":"Acetaminophen","dose":1000,"unit":"mg","route":"PO","ka":2.0,"ke":0.28,"vd":45,"kd":5.0,"hillN":1.0},{"name":"Vedolizumab","dose":300,"unit":"mg","route":"IM/SC","ka":0.5,"ke":0.01,"vd":8,"kd":0.1,"hillN":1.2},{"name":"Tofacitinib","dose":5,"unit":"mg","route":"PO","ka":3.0,"ke":0.23,"vd":87,"kd":0.2,"hillN":1.2},{"name":"Nicotine","dose":100,"unit":"mg","route":"Vapor","ka":5.0,"ke":0.35,"vd":120,"kd":0.5,"hillN":1.0},{"name":"Caffeine","dose":200,"unit":"mg","route":"PO","ka":2.5,"ke":0.14,"vd":40,"kd":2.0,"hillN":1.0}]'
ENV PASSIVE_PREWARM=true
ENV PASSIVE_PREWARM_DELAY_MS=250
RUN mkdir -p /app/public /app/data
VOLUME ["/app/data"]

RUN cat << 'EOF' > /app/server.py
import http.server, socketserver, json, urllib.request, urllib.error, os, sys, time, threading, re
from urllib.parse import urlparse, parse_qs

DATA_DIR = "/app/data"
os.makedirs(DATA_DIR, exist_ok=True)
MOLECULES_CACHE_PATH = os.path.join(DATA_DIR, "orange_book_molecules.json")
FACTS_CACHE_PATH = os.path.join(DATA_DIR, "facts_cache.jsonl")

_facts_lock = threading.Lock()
_molecules_lock = threading.Lock()

def query_ollama(prompt, timeout=120):
    req = urllib.request.Request(
        "http://localhost:11434/api/generate",
        data=json.dumps({"model": "gemma2:2b", "prompt": prompt, "stream": False}).encode(),
        headers={'Content-Type': 'application/json'}
    )
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return json.loads(r.read().decode()).get('response', '')

def clean_json(text):
    text = text.strip()
    if text.startswith("```json"): text = text[7:]
    elif text.startswith("```"): text = text[3:]
    if text.endswith("```"): text = text[:-3]
    return text.strip()

# ---------------- Orange Book ingestion (openFDA JSON, not the raw ~-delimited zip) ----------------

def fetch_orange_book_molecules(page_size=1000, max_pages=500):
    """Walk every Orange Book record via openFDA's search_after cursor and
    collect every unique active-ingredient name.

    openFDA hard-caps skip/limit pagination at 26,000 total records
    (skip<=25000, limit<=1000) -- past that it returns 400 no matter what, and
    the Orange Book's underlying product-strength records exceed that count.
    The documented way past this ceiling is to follow the "next" URL openFDA
    returns in the response's Link header (a search_after cursor), which has
    no such limit. See https://open.fda.gov/apis/paging/.

    Runs at container startup on a background thread, NOT at image build time.
    """
    seen = set()
    url = f"https://api.fda.gov/drug/orangebook.json?limit={page_size}"
    for _ in range(max_pages):
        try:
            req = urllib.request.Request(url, headers={'User-Agent': 'systems-pharm-sim/1.0'})
            with urllib.request.urlopen(req, timeout=30) as r:
                payload = json.loads(r.read().decode())
                link_header = r.headers.get('Link')
        except urllib.error.HTTPError as e:
            print(f"[WARN] Orange Book fetch failed: {e}", flush=True)
            break
        except Exception as e:
            print(f"[WARN] Orange Book fetch error: {e}", flush=True)
            break

        results = payload.get('results', [])
        for rec in results:
            for prod in rec.get('products', []):
                for ai in prod.get('active_ingredients', []):
                    name = (ai.get('name') or '').strip()
                    if name:
                        seen.add(name.upper())

        if not results:
            break

        m = re.search(r'<([^>]+)>;\s*rel="next"', link_header or '')
        if not m:
            break  # no Link header -> that was the last page
        url = m.group(1)
        time.sleep(0.25)  # be polite to the public API

    return sorted(seen)

def load_or_fetch_molecules():
    with _molecules_lock:
        if os.path.exists(MOLECULES_CACHE_PATH):
            try:
                with open(MOLECULES_CACHE_PATH) as f:
                    return json.load(f)
            except Exception:
                pass
        print("[INFO] Fetching full Orange Book ingredient list from openFDA...", flush=True)
        molecules = fetch_orange_book_molecules()
        print(f"[INFO] Retrieved {len(molecules)} unique Orange Book molecules.", flush=True)
        try:
            with open(MOLECULES_CACHE_PATH, 'w') as f:
                json.dump(molecules, f)
        except Exception as e:
            print(f"[WARN] Could not persist molecule cache: {e}", flush=True)
        return molecules

MOLECULES = []  # populated by a background thread after the server starts


def load_facts_cache():
    cache = {}
    if os.path.exists(FACTS_CACHE_PATH):
        with open(FACTS_CACHE_PATH) as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    obj = json.loads(line)
                    cache[obj['molecule']] = obj['facts']
                except Exception:
                    continue  # tolerate a truncated last line from an interrupted run
    return cache

FACTS_CACHE = load_facts_cache()

def append_fact(molecule, facts_text):
    with _facts_lock:
        FACTS_CACHE[molecule] = facts_text
        with open(FACTS_CACHE_PATH, 'a') as f:
            f.write(json.dumps({"molecule": molecule, "facts": facts_text}) + "\n")

def generate_facts_for(name):
    key = name.upper()
    if key in FACTS_CACHE:
        return FACTS_CACHE[key]
    prompt = (
        f"Generate valid Trealla Prolog facts for the drug '{name}'. "
        "Format: molecule_target('SMILES', Target, Mech, [Params]). "
        "target_process(Target, Sys). process_pathway(Sys, Path). Code only, no markdown."
    )
    raw = query_ollama(prompt)
    append_fact(key, raw)
    return raw


PASSIVE_PREWARM_ENABLED = os.environ.get('PASSIVE_PREWARM', 'true').lower() == 'true'
PASSIVE_PREWARM_DELAY_S = float(os.environ.get('PASSIVE_PREWARM_DELAY_MS', '250')) / 1000.0

_prewarm_status_lock = threading.Lock()
prewarm_status = {"total": 0, "done": 0, "running": False, "current": None}

def passive_prewarm_loop():
    while not MOLECULES:  # wait for the Orange Book list to finish loading
        time.sleep(1)

    with _prewarm_status_lock:
        prewarm_status["total"] = len(MOLECULES)
        prewarm_status["running"] = True

    for name in MOLECULES:
        key = name.upper()
        if key not in FACTS_CACHE:
            with _prewarm_status_lock:
                prewarm_status["current"] = name
            try:
                generate_facts_for(name)
            except Exception as e:
                print(f"[WARN] passive prewarm failed for {name}: {e}", flush=True)
            time.sleep(PASSIVE_PREWARM_DELAY_S)
        with _prewarm_status_lock:
            prewarm_status["done"] += 1

    with _prewarm_status_lock:
        prewarm_status["running"] = False
        prewarm_status["current"] = None
    print(f"[INFO] Passive Orange Book prewarm complete: {len(FACTS_CACHE)} molecules cached.", flush=True)

# ---------------- HTTP handler ----------------

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

        elif p.path == '/api/molecules':
            q = parse_qs(p.query).get('q', [''])[0].strip().upper()
            pool = MOLECULES if MOLECULES else []
            matches = [m for m in pool if q in m][:50] if q else pool[:50]
            self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
            self.wfile.write(json.dumps({"total": len(pool), "results": matches}).encode())

        elif p.path == '/api/molecules-status':
            with _prewarm_status_lock:
                prewarm_snapshot = dict(prewarm_status)
            self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
            self.wfile.write(json.dumps({
                "loaded": len(MOLECULES),
                "facts_cached": len(FACTS_CACHE),
                "prewarm": prewarm_snapshot
            }).encode())

        else:
            super().do_GET()

    def do_POST(self):
        cl = int(self.headers.get('Content-Length', 0))
        d = json.loads(self.rfile.read(cl).decode())

        if self.path == '/api/generate-facts':
            names = [x['name'] for x in d.get('drugs', [])]
            parts = []
            for name in names:
                try:
                    parts.append(generate_facts_for(name))
                except Exception as e:
                    parts.append(f"% generation failed for {name}: {e}")
            self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
            self.wfile.write(json.dumps({"facts": "\n".join(parts)}).encode())

        elif self.path == '/api/generate-lomns':
            lomns = []
            for x in d.get('drugs', []):
                prompt = f"Write a formal LOMN for {x['name']} ({x['dose']}{x['unit']}, {x['route']}) with coverage criteria and lab placeholders."
                try:
                    text = query_ollama(prompt)
                except Exception as e:
                    text = f"Generation failed: {e}"
                lomns.append({"drug": x['name'], "lomn": text})
            self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
            self.wfile.write(json.dumps({"lomns": lomns}).encode())

        else:
            self.send_response(404); self.end_headers()

def start_molecule_loader():
    global MOLECULES
    MOLECULES = load_or_fetch_molecules()

PORT = 8080
threading.Thread(target=start_molecule_loader, daemon=True).start()
if PASSIVE_PREWARM_ENABLED:
    threading.Thread(target=passive_prewarm_loop, daemon=True).start()
else:
    print("[INFO] PASSIVE_PREWARM=false: facts will only be generated on demand.", flush=True)
with socketserver.TCPServer(("", PORT), H) as s:
    sys.stdout.write(f"[INFO] Server starting up and listening on port {PORT}...\n")
    sys.stdout.flush()
    s.serve_forever()
EOF


RUN cat << 'EOF' > /app/prewarm_facts.py
#!/usr/bin/env python3
import json, os, sys, time, urllib.request

DATA_DIR = "/app/data"
FACTS_CACHE_PATH = os.path.join(DATA_DIR, "facts_cache.jsonl")
MOLECULES_CACHE_PATH = os.path.join(DATA_DIR, "orange_book_molecules.json")

def query_ollama(prompt, timeout=120):
    req = urllib.request.Request(
        "http://localhost:11434/api/generate",
        data=json.dumps({"model": "gemma2:2b", "prompt": prompt, "stream": False}).encode(),
        headers={'Content-Type': 'application/json'}
    )
    with urllib.request.urlopen(req, timeout=timeout) as r:
        return json.loads(r.read().decode()).get('response', '')

def load_done():
    done = set()
    if os.path.exists(FACTS_CACHE_PATH):
        with open(FACTS_CACHE_PATH) as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    done.add(json.loads(line)['molecule'])
                except Exception:
                    continue
    return done

def wait_for_molecule_list(max_wait_s=300):
    waited = 0
    while not os.path.exists(MOLECULES_CACHE_PATH) and waited < max_wait_s:
        print("[INFO] Waiting for the server's Orange Book fetch to finish...", flush=True)
        time.sleep(5)
        waited += 5
    return os.path.exists(MOLECULES_CACHE_PATH)

def main():
    if not wait_for_molecule_list():
        print("[ERROR] Molecule cache never appeared (check the server's Orange "
              "Book fetch / network access). Aborting.", file=sys.stderr)
        sys.exit(1)

    with open(MOLECULES_CACHE_PATH) as f:
        molecules = json.load(f)

    done = load_done()
    todo = [m for m in molecules if m not in done]
    print(f"[INFO] {len(done)} already cached, {len(todo)} remaining out of {len(molecules)} total.", flush=True)

    for i, name in enumerate(todo, 1):
        prompt = (
            f"Generate valid Trealla Prolog facts for the drug '{name}'. "
            "Format: molecule_target('SMILES', Target, Mech, [Params]). "
            "target_process(Target, Sys). process_pathway(Sys, Path). Code only, no markdown."
        )
        try:
            facts = query_ollama(prompt)
        except Exception as e:
            print(f"[WARN] ({i}/{len(todo)}) failed for {name}: {e}", flush=True)
            continue
        with open(FACTS_CACHE_PATH, 'a') as f:
            f.write(json.dumps({"molecule": name, "facts": facts}) + "\n")
        if i % 25 == 0:
            print(f"[INFO] {i}/{len(todo)} done...", flush=True)
        time.sleep(0.1)

    print("[INFO] Prewarm complete.", flush=True)

if __name__ == "__main__":
    main()
EOF


RUN cat << 'EOF' > /app/public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Systems-Pharmacology Simulator</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script type="importmap">
        {
            "imports": {
                "solid-js": "https://esm.sh/solid-js@1.8.20",
                "solid-js/web": "https://esm.sh/solid-js@1.8.20/web",
                "solid-js/html": "https://esm.sh/solid-js@1.8.20/html",
                "trealla": "https://esm.sh/trealla@0.10.0"
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
                <strong>Disclaimer:</strong> Stack parameters and pharmacological properties are dynamically synthesized via Gemma 2b via local Ollama inference. Molecule names come from the real FDA Orange Book; PK parameters attached to a manually added molecule are generic placeholders, not looked-up values.
            </div>
        </header>

        <div id="app"></div>
    </main>

    <script type="module">
        import { createSignal, onMount, onCleanup, For, Show } from 'solid-js';
        import { render } from 'solid-js/web';
        import { load, Prolog } from 'trealla';
        import html from 'solid-js/html';

        function App() {
            const [isLoading, setIsLoading] = createSignal(true);
            const [loadingMessage, setLoadingMessage] = createSignal('Initializing WASM runtime...');
            const [progress, setProgress] = createSignal(15);
            const [stack, setStack] = createSignal([]);
            const [stackSize, setStackSize] = createSignal(4);
            const [analysis, setAnalysis] = createSignal({ impacts: [] });
            const [lomns, setLomns] = createSignal([]);

            const [molQuery, setMolQuery] = createSignal('');
            const [molResults, setMolResults] = createSignal([]);
            const [molTotal, setMolTotal] = createSignal(0);
            let molDebounce;

            // Passive Orange Book prewarm progress, polled from the server --
            // that background fill-in keeps running regardless of this tab.
            const [prewarmDone, setPrewarmDone] = createSignal(0);
            const [prewarmTotal, setPrewarmTotal] = createSignal(0);
            const [prewarmRunning, setPrewarmRunning] = createSignal(false);

            onMount(() => {
                const pollStatus = async () => {
                    try {
                        const res = await fetch('/api/molecules-status');
                        const data = await res.json();
                        setMolTotal(data.loaded || 0);
                        setPrewarmDone(data.prewarm?.done || 0);
                        setPrewarmTotal(data.prewarm?.total || 0);
                        setPrewarmRunning(!!data.prewarm?.running);
                    } catch (e) { /* transient -- keep last known values */ }
                };
                pollStatus();
                const interval = setInterval(pollStatus, 4000);
                onCleanup(() => clearInterval(interval));
            });

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

            const searchMolecules = (q) => {
                setMolQuery(q);
                clearTimeout(molDebounce);
                molDebounce = setTimeout(async () => {
                    try {
                        const res = await fetch(`/api/molecules?q=${encodeURIComponent(q)}`);
                        const data = await res.json();
                        setMolResults(data.results || []);
                        setMolTotal(data.total || 0);
                    } catch (e) { console.error(e); }
                }, 250);
            };

            const addMolecule = (name) => {
                setStack([...stack(), {
                    name, dose: 0, unit: 'mg', route: 'PO',
                    ka: 1.5, ke: 0.2, vd: 50, kd: 1.0, hillN: 1.0
                }]);
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

            return html`
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 relative">
                    <div class="lg:col-span-2 flex justify-end">
                        <div class="inline-flex items-center gap-2 text-xs font-medium bg-slate-100 border border-slate-200 rounded-full px-3 py-1 text-slate-700">
                            <span
                                class=${() => `w-2 h-2 rounded-full ${
                                    prewarmTotal() === 0 ? 'bg-slate-400 animate-pulse'
                                    : prewarmRunning() ? 'bg-blue-500 animate-pulse'
                                    : 'bg-emerald-500'
                                }`}
                            ></span>
                            <${Show}
                                when=${() => prewarmTotal() > 0}
                                fallback=${html`<span>Loading Orange Book...</span>`}
                            >
                                <span>Orange Book facts: ${prewarmDone}/${prewarmTotal}${() => prewarmRunning() ? ' (filling in...)' : ' cached'}</span>
                            <//>
                        </div>
                    </div>

                    <${Show} when=${isLoading}>
                        <div class="absolute inset-0 bg-white/95 flex flex-col items-center justify-center z-20 rounded-xl p-6 text-center">
                            <div class="text-sm font-semibold text-slate-800 mb-2">${loadingMessage}</div>
                            <div class="w-64 h-2 bg-slate-200 rounded-full overflow-hidden">
                                <div class="h-full bg-blue-600 transition-all duration-300" style=${() => ({ width: `${progress()}%` })}></div>
                            </div>
                        </div>
                    <//>

                    <section class="bg-slate-50 p-5 rounded-xl border border-slate-200 flex flex-col">
                        <h2 class="text-xs font-bold uppercase tracking-wider text-slate-700 mb-3">Active Drug Stack</h2>

                        <div class="flex items-center gap-2 mb-4 flex-wrap">
                            <input
                                type="number"
                                min="1"
                                max="10"
                                value=${stackSize}
                                onInput=${e => setStackSize(parseInt(e.target.value) || 4)}
                                class="w-16 px-3 py-2 text-sm bg-white border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                                title="Stack Size"
                            />
                            <button onClick=${generateRandomStack} class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 text-sm font-medium rounded-lg transition-colors shadow-sm">
                                Random Stack
                            </button>
                            <button onClick=${generateLomns} class="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 text-sm font-medium rounded-lg transition-colors shadow-sm">
                                Generate LOMNs
                            </button>
                        </div>

                        <div class="mb-4">
                            <label class="text-xs font-semibold text-slate-600 block mb-1">
                                Add from FDA Orange Book (${molTotal} molecules loaded)
                            </label>
                            <input
                                type="text"
                                placeholder="Search e.g. metformin"
                                value=${molQuery}
                                onInput=${e => searchMolecules(e.target.value)}
                                class="w-full px-3 py-2 text-sm bg-white border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                            />
                            <${Show} when=${() => molResults().length > 0}>
                                <ul class="mt-2 border border-slate-200 rounded-lg divide-y divide-slate-100 max-h-40 overflow-y-auto bg-white">
                                    <${For} each=${molResults}>
                                        ${(m) => html`
                                            <li class="flex justify-between items-center px-3 py-1.5 text-xs">
                                                <span>${m}</span>
                                                <button onClick=${() => addMolecule(m)} class="text-blue-600 hover:text-blue-800 font-semibold">Add</button>
                                            </li>
                                        `}
                                    <//>
                                </ul>
                            <//>
                        </div>

                        <ul class="space-y-2 overflow-y-auto max-h-72 pr-1">
                            <${For} each=${stack}>
                                ${(item) => html`
                                    <li class="bg-white p-3 rounded-lg border border-slate-200 flex justify-between items-center text-sm shadow-2xs">
                                        <span class="font-semibold text-slate-800">${item.name}</span>
                                        <span class="text-slate-500 font-mono text-xs bg-slate-100 px-2 py-1 rounded">
                                            ${item.dose}${item.unit} (${item.route})
                                        </span>
                                    </li>
                                `}
                            <//>
                        </ul>
                    </section>

                    <section class="bg-slate-50 p-5 rounded-xl border border-slate-200 flex flex-col space-y-6">
                        <div>
                            <h2 class="text-xs font-bold uppercase tracking-wider text-slate-700 mb-1">Cellular Perturbation Index (CPI) Matrix</h2>
                            <p class="text-xs text-slate-500 mb-3">Calculated via 1-compartment kinetics (T=12 h) & sigmoidal Hill receptor occupancy.</p>

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
                                        <${For} each=${() => analysis().impacts}>
                                            ${(row) => html`
                                                <tr class="hover:bg-slate-50">
                                                    <td class="p-3 font-semibold text-slate-800">${row.drug}</td>
                                                    <td class="p-3 text-slate-600">${row.organ}</td>
                                                    <td class="p-3 text-slate-600">${row.cell}</td>
                                                    <td class="p-3">
                                                        <span class="bg-slate-100 text-slate-800 px-2 py-0.5 rounded font-mono text-[11px] font-medium">
                                                            ${row.cpi}%
                                                        </span>
                                                    </td>
                                                </tr>
                                            `}
                                        <//>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <${Show} when=${() => lomns().length > 0}>
                            <div>
                                <h2 class="text-xs font-bold uppercase tracking-wider text-slate-700 mb-2">Letters of Medical Necessity (LOMN)</h2>
                                <div class="space-y-3 max-h-80 overflow-y-auto pr-1">
                                    <${For} each=${lomns}>
                                        ${(lomnItem) => html`
                                            <div class="bg-white border border-slate-300 p-4 rounded-lg shadow-2xs">
                                                <h3 class="font-bold text-sm text-slate-800 mb-1">${lomnItem.drug}</h3>
                                                <pre class="whitespace-pre-wrap text-xs bg-slate-50 p-3 rounded-md border border-slate-100 text-slate-700 font-sans leading-relaxed">${lomnItem.lomn}</pre>
                                            </div>
                                        `}
                                    <//>
                                </div>
                            </div>
                        <//>
                    </section>
                </div>
            `;
        }

        render(() => html`<${App}/>`, document.getElementById('app'));
    </script>
</body>
</html>
EOF

RUN cat << 'EOF' > /app/entrypoint.sh
#!/bin/bash
export OLLAMA_ORIGINS="*"
export OLLAMA_MODELS=/root/.ollama/models
mkdir -p /app/data
echo "[INFO] Starting Ollama server..."
ollama serve > /app/ollama.log 2>&1 &
PID=$!
for i in {1..30}; do
    curl -s http://localhost:11434/api/tags >/dev/null && break
    sleep 2
    kill -0 $PID 2>/dev/null || { cat /app/ollama.log; exit 1; }
done
echo "[INFO] Ollama server is up and running."
echo "[INFO] Starting Python HTTP server (passive Orange Book prewarm: ${PASSIVE_PREWARM})..."
exec python3 /app/server.py
EOF

RUN chmod +x /app/entrypoint.sh
EXPOSE 8080
ENTRYPOINT ["/app/entrypoint.sh"]
