import { createEffect, For, Show, createSignal, onCleanup } from 'solid-js';
import { createStore } from 'solid-js/store';
import { load, Prolog } from 'trealla';

const COLORS = ['#000000', '#333333', '#666666', '#999999', '#cccccc', '#555555'];

const FLAVOR_TAGS_MAP = {
  'Bergamot': ['citrus', 'floral', 'crisp', 'zesty'],
  'Jasmine': ['floral', 'sweet', 'indolic', 'rich'],
  'Sandalwood': ['woody', 'balsamic', 'creamy', 'warm'],
  'Vanillin': ['sweet', 'gourmand', 'creamy', 'warm'],
  'Vetiver': ['earthy', 'woody', 'smoky', 'roots'],
  'Patchouli': ['earthy', 'woody', 'herbaceous', 'musky']
};

const getFlavorTags = (name) => {
  for (const [key, tags] of Object.entries(FLAVOR_TAGS_MAP)) {
    if (name.toLowerCase().includes(key.toLowerCase())) return tags;
  }
  return ['aromatic', 'organic', 'complex'];
};

export default function App() {
  const [activeTab, setActiveTab] = createSignal('dispersion'); // 'dispersion' | 'paint_lab' | 'pharmacology' | 'meal_plan'

  // Dispersion State
  const [state, setState] = createStore({
    seconds: 20, fps: 30, velocity: 25.0, temp: 298.15, humidity: 0.5,
    ingredients: [], searchQuery: '', selectedIngredients: [],
    loading: false, statusMessage: '', videoUrl: '', history: [],
    lastRenderedParams: null,
    currentFrame: 0,
    layers: [
      { id: 'atomizer', name: 'Atomizer & Fluid SDF', type: 'atomizer', zIndex: 1, opacity: 1.0, visible: true },
      { id: '2d_sketch', name: '2D Sketch & Smoke', type: '2d_sketch', zIndex: 2, opacity: 0.8, visible: true },
      { id: 'point_cloud', name: 'Point Cloud Dynamics', type: 'point_cloud', zIndex: 3, opacity: 0.9, visible: true },
      { id: 'opengl_glsl', name: 'OpenGL GLSL Shader', type: 'opengl_glsl', zIndex: 4, opacity: 0.7, visible: true }
    ],
    activeTool: 'brush',
    brushSize: 5,
    brushColor: '#000000'
  });

  // Paint Lab State
  const [paintState, setPaintState] = createStore({
    hexColor: '#D2B48C',
    viscosity: 12.0,
    surfaceTension: 0.75,
    simulationRunning: true
  });

  // Pharmacology State
  const [pharmState, setPharmState] = createStore({
    stack: [],
    stackSize: 4,
    analysis: { impacts: [] },
    molResults: [],
    molTotal: 0,
    prewarmDone: 0,
    prewarmTotal: 0,
    prewarmRunning: false,
    molQuery: '',
    lomns: []
  });

  // Meal Plan State
  const [mealState, setMealState] = createStore({
    gender: 'm',
    mass: 80,
    days: 7305,
    loading: false,
    report: ''
  });

  let pl = null;
  const [tempUnit, setTempUnit] = createSignal('K');
  const [copyStatus, setCopyStatus] = createSignal('');
  let canvasRef;
  let paintSimCanvasRef;
  let molDebounce;

  const totalFrames = () => state.seconds * state.fps;

  // Initialize Pharmacology & Trealla WASM on mount
  createEffect(async () => {
    try {
      const stackRes = await fetch('/api/default-stack');
      const defaultStackData = await stackRes.json();
      setPharmState('stack', defaultStackData);

      await load();
      pl = new Prolog();

      const res = await fetch('/api/generate-facts', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ drugs: defaultStackData })
      });
      const data = await res.json();
      await runPrologAnalysis(data.facts || '');
    } catch (e) {
      console.error(e);
    }

    const pollStatus = async () => {
      try {
        const res = await fetch('/api/molecules-status');
        const data = await res.json();
        setPharmState({
          molTotal: data.loaded || 0,
          prewarmDone: data.prewarm?.done || 0,
          prewarmTotal: data.prewarm?.total || 0,
          prewarmRunning: !!data.prewarm?.running
        });
      } catch (e) { /* transient */ }
    };
    pollStatus();
    const interval = setInterval(pollStatus, 4000);
    onCleanup(() => clearInterval(interval));
  });

  const searchMolecules = (q) => {
    setPharmState('molQuery', q);
    clearTimeout(molDebounce);
    molDebounce = setTimeout(async () => {
      try {
        const res = await fetch(`/api/molecules?q=${encodeURIComponent(q)}`);
        const data = await res.json();
        setPharmState({ molResults: data.results || [], molTotal: data.total || 0 });
      } catch (e) { console.error(e); }
    }, 250);
  };

  const addMolecule = (name) => {
    setPharmState('stack', [...pharmState.stack, {
      name, dose: 100, unit: 'mg', route: 'PO',
      ka: 1.5, ke: 0.2, vd: 50, kd: 1.0, hillN: 1.0
    }]);
    runPrologAnalysis('');
  };

  const generateLomns = async () => {
    try {
      const res = await fetch('/api/generate-lomns', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ drugs: pharmState.stack })
      });
      const data = await res.json();
      setPharmState('lomns', data.lomns || []);
    } catch (e) {
      console.error(e);
    }
  };

  const generateMealPlan = async () => {
    setMealState('loading', true);
    try {
      const res = await fetch('/api/meal-plan', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          gender: mealState.gender,
          mass: mealState.mass,
          days: mealState.days
        })
      });
      const data = await res.json();
      if (data.success) {
        setMealState('report', data.report);
      } else {
        setMealState('report', 'Error generating meal plan report.');
      }
    } catch (e) {
      setMealState('report', `Error: ${e.message}`);
    } finally {
      setMealState('loading', false);
    }
  };

  const runPrologAnalysis = async (gemmaFacts) => {
    if (!pl) return;
    const stackTerms = pharmState.stack.map(s =>
      `drug('${s.name}', ${s.dose}, ${s.ka}, ${s.ke}, ${s.vd}, ${s.kd}, ${s.hillN})`
    ).join(', ');

    const prologCode = `
      organ(blood, [erythrocyte-0.9, neutrophil-0.05, t_lymphocyte-0.03]).
      organ(liver, [hepatocyte-0.8, macrophage-0.1]).
      organ(brain, [pyramidal_neuron-0.6]).
      hill(C, Kd, N, O) :- ( C =< 0 -> O = 0 ; Cn is C ** N, Kdn is Kd ** N, O is (Cn / (Cn + Kdn)) * 100 ).
      conc(D, Ka, Ke, V, T, C) :- T >= 0, ( abs(Ka - Ke) < 1e-5 -> K1 is Ka + 1e-4 ; K1 is Ka ), C is (D * K1 / (V * abs(K1 - Ke))) * (exp(-Ke * T) - exp(-K1 * T)).
      eval([], []).
      eval([drug(N, D, Ka, Ke, V, Kd, N2) | R], Res) :-
          conc(D, Ka, Ke, V, 12, C),
          findall(impact(N, Org, Cell, CPI), (organ(Org, Cells), member(Cell - Frac, Cells), hill(C, Kd, N2, O), CPI is O * Frac), Di),
          eval(R, Rr), append(Di, Rr, Res).
      sim(S, R) :- eval(S, R).
    `;

    try {
      await pl.queryOnce(prologCode);
      const queryRes = await pl.queryOnce(`sim([${stackTerms}], R).`);
      if (queryRes && queryRes.answer && queryRes.answer.R) {
        const impacts = queryRes.answer.R.map(x => ({
          drug: x.args[0], organ: x.args[1], cell: x.args[2], cpi: (+x.args[3]).toFixed(2)
        }));
        setPharmState('analysis', { impacts });
      }
    } catch (err) {
      console.error("Prolog execution error:", err);
    }
  };

  // Real-time Paint Physics Simulation Loop
  createEffect(() => {
    if (activeTab() !== 'paint_lab' || !paintSimCanvasRef) return;
    const canvas = paintSimCanvasRef;
    const ctx = canvas.getContext('2d');
    let animationFrameId;
    let particles = [];

    for (let i = 0; i < 40; i++) {
      particles.push({
        x: canvas.width / 2 + (Math.random() - 0.5) * 100,
        y: canvas.height / 2 + (Math.random() - 0.5) * 100,
        vx: (Math.random() - 0.5) * (20 / paintState.viscosity),
        vy: (Math.random() - 0.5) * (20 / paintState.viscosity),
        radius: Math.random() * 12 + 4
      });
    }

    const renderLoop = () => {
      ctx.fillStyle = 'rgba(255, 255, 255, 0.15)';
      ctx.fillRect(0, 0, canvas.width, canvas.height);

      ctx.fillStyle = paintState.hexColor;
      particles.forEach(p => {
        p.x += p.vx;
        p.y += p.vy;
        if (p.x < 0 || p.x > canvas.width) p.vx *= -1;
        if (p.y < 0 || p.y > canvas.height) p.vy *= -1;

        ctx.beginPath();
        ctx.arc(p.x, p.y, p.radius, 0, Math.PI * 2);
        ctx.fill();
      });

      if (paintState.simulationRunning) {
        animationFrameId = requestAnimationFrame(renderLoop);
      }
    };

    renderLoop();
    return () => cancelAnimationFrame(animationFrameId);
  });

  const getDisplayTemp = () => {
    const k = state.temp;
    return tempUnit() === 'C' ? (k - 273.15).toFixed(1) :
           tempUnit() === 'F' ? ((k - 273.15) * 9/5 + 32).toFixed(1) : k.toFixed(1);
  };

  const handleTempInput = (val) => {
    let num = Number(val);
    if (tempUnit() === 'C') num += 273.15;
    else if (tempUnit() === 'F') num = (num - 32) * 5/9 + 273.15;
    setState('temp', num);
  };

  const isParametersModified = () => {
    const last = state.lastRenderedParams;
    if (!last) return false;
    return last.seconds !== state.seconds || last.fps !== state.fps || last.velocity !== state.velocity || last.temp !== state.temp || last.humidity !== state.humidity;
  };

  const copyFormulaToClipboard = () => {
    const text = state.selectedIngredients.map(i => {
      const tags = getFlavorTags(i.name).join(', ');
      return `${i.name} (${i.cas}) [Tags: ${tags}]`;
    }).join('; ');
    navigator.clipboard.writeText(text);
    setCopyStatus('Copied formula with tags!');
    setTimeout(() => setCopyStatus(''), 2000);
  };

  createEffect(async () => {
    try {
      const res = await fetch('/api/ingredients');
      setState('ingredients', await res.json());
    } catch (e) { console.error(e); }

    const saved = localStorage.getItem('perfume_render_history');
    if (saved) setState('history', JSON.parse(saved));
  });

  const moveLayerOrder = (index, direction) => {
    const newLayers = [...state.layers];
    const targetIdx = index + direction;
    if (targetIdx < 0 || targetIdx >= newLayers.length) return;
    const temp = newLayers[index];
    newLayers[index] = newLayers[targetIdx];
    newLayers[targetIdx] = temp;
    newLayers.forEach((l, idx) => l.zIndex = idx + 1);
    setState('layers', newLayers);
  };

  const updateHistory = (newItem) => {
    const updated = [newItem, ...state.history].slice(0, 15);
    setState('history', updated);
    localStorage.setItem('perfume_render_history', JSON.stringify(updated));
  };

  const filteredIngredients = () => {
    const q = state.searchQuery.toLowerCase().trim();
    return q ? state.ingredients.filter(i => i.name.toLowerCase().includes(q) || i.cas.includes(q)).slice(0, 15) : [];
  };

  const addIngredient = (ing) => {
    if (state.selectedIngredients.length >= 25) return alert('Maximum 25 ingredients.');
    if (!state.selectedIngredients.some(i => i.cas === ing.cas)) {
      setState('selectedIngredients', [...state.selectedIngredients, { ...ing, color: COLORS[0] }]);
      setState('searchQuery', '');
    }
  };

  const randomizePerfume = () => {
    const all = state.ingredients;
    if (!all.length) return;
    const count = Math.min(all.length, Math.floor(Math.random() * 8) + 3);
    const shuffled = [...all].sort(() => 0.5 - Math.random()).slice(0, count);
    setState('selectedIngredients', shuffled.map((ing, idx) => ({ ...ing, color: COLORS[idx % COLORS.length] })));
  };

  const triggerRender = async () => {
    setState({ 
      loading: true, 
      statusMessage: 'Normalizing density palette & simulating 4 layers...',
      lastRenderedParams: { seconds: state.seconds, fps: state.fps, velocity: state.velocity, temp: state.temp, humidity: state.humidity }
    });
    try {
      const res = await fetch('/api/render-stream', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...state, ingredients: state.selectedIngredients, layers: state.layers })
      });
      const reader = res.body.getReader();
      const decoder = new TextDecoder();
      let buffer = '';
      while (true) {
        const { value, done } = await reader.read();
        if (done) break;
        buffer += decoder.decode(value, { stream: true });
        const lines = buffer.split('\n');
        buffer = lines.pop();
        for (const line of lines) {
          if (line.startsWith('data:')) {
            const data = JSON.parse(line.replace('data:', '').trim());
            if (data.progress !== undefined) setState('statusMessage', `Rendering: ${data.progress}%`);
            if (data.filename) {
              setState({ videoUrl: data.filename, statusMessage: 'Complete!', currentFrame: 0 });
              updateHistory({
                id: Date.now(), url: data.filename,
                timestamp: new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' }),
                params: { seconds: state.seconds, velocity: state.velocity },
                ingredientsCount: state.selectedIngredients.length
              });
            }
          }
        }
      }
    } catch (e) {
      setState('statusMessage', 'Error');
    } finally {
      setState('loading', false);
    }
  };

  let isDrawing = false;
  const startDrawing = (e) => { isDrawing = true; draw(e); };
  const stopDrawing = () => { isDrawing = false; if (canvasRef) canvasRef.getContext('2d').beginPath(); };
  const draw = (e) => {
    if (!isDrawing || !canvasRef) return;
    const ctx = canvasRef.getContext('2d');
    const rect = canvasRef.getBoundingClientRect();
    const x = e.clientX - rect.left;
    const y = e.clientY - rect.top;

    ctx.lineWidth = state.brushSize;
    ctx.lineCap = 'round';
    if (state.activeTool === 'eraser') {
      ctx.globalCompositeOperation = 'destination-out';
      ctx.strokeStyle = 'rgba(0,0,0,1)';
    } else if (state.activeTool === 'marker') {
      ctx.globalCompositeOperation = 'source-over';
      ctx.strokeStyle = state.brushColor;
      ctx.globalAlpha = 0.4;
    } else {
      ctx.globalCompositeOperation = 'source-over';
      ctx.strokeStyle = state.brushColor;
      ctx.globalAlpha = 1.0;
    }

    ctx.lineTo(x, y);
    ctx.stroke();
    ctx.beginPath();
    ctx.moveTo(x, y);
  };

  return (
    <div class="h-screen w-screen bg-white text-black font-sans flex flex-col justify-between py-[3vh] px-4 overflow-hidden box-border">
      <div class="max-w-[95rem] w-full mx-auto h-[94vh] flex flex-col justify-between gap-3">
        <header class="bg-white px-5 py-2.5 rounded-xl border border-neutral-200 flex justify-between items-center shrink-0">
          <div class="flex items-baseline gap-2">
            <h1 class="text-sm font-black tracking-tight text-black">onion.glass</h1>
          </div>
          <div class="flex gap-1.5">
            <button onClick={() => setActiveTab('dispersion')} class={`text-[10px] font-bold px-3.5 py-1.5 rounded-lg cursor-pointer transition ${activeTab() === 'dispersion' ? 'bg-black text-white shadow-xs' : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'}`} title="Dispersion Simulator">Dispersion</button>
            <button onClick={() => setActiveTab('paint_lab')} class={`text-[10px] font-bold px-3.5 py-1.5 rounded-lg cursor-pointer transition ${activeTab() === 'paint_lab' ? 'bg-black text-white shadow-xs' : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'}`} title="Paint Synthesis Lab">Paint Lab</button>
            <button onClick={() => setActiveTab('pharmacology')} class={`text-[10px] font-bold px-3.5 py-1.5 rounded-lg cursor-pointer transition ${activeTab() === 'pharmacology' ? 'bg-black text-white shadow-xs' : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'}`} title="Systems Pharmacology">Pharmacology</button>
            <button onClick={() => setActiveTab('meal_plan')} class={`text-[10px] font-bold px-3.5 py-1.5 rounded-lg cursor-pointer transition ${activeTab() === 'meal_plan' ? 'bg-black text-white shadow-xs' : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'}`} title="Meal Plan Generator">Meal Plan</button>
          </div>
        </header>

        <Show when={activeTab() === 'paint_lab'}>
          <div class="grid grid-cols-1 md:grid-cols-12 gap-3 flex-1 min-h-0">
            <div class="md:col-span-4 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col gap-3">
              <h2 class="text-[10px] font-bold text-black uppercase tracking-wider">Paint Batch Parameters</h2>
              <div class="space-y-2.5 text-[10px]">
                <div>
                  <label class="block font-semibold mb-1">Target Color Hex:</label>
                  <div class="flex items-center gap-2">
                    <input type="color" value={paintState.hexColor} onInput={(e) => setPaintState('hexColor', e.currentTarget.value)} class="w-8 h-8 rounded border border-neutral-300 cursor-pointer" title="Pick paint color" />
                    <input type="text" value={paintState.hexColor} onInput={(e) => setPaintState('hexColor', e.currentTarget.value)} class="flex-1 bg-neutral-50 border border-neutral-200 rounded px-2.5 py-1.5 font-mono" />
                  </div>
                </div>
                <div>
                  <label class="block font-semibold mb-1">Viscosity (Poise): {paintState.viscosity}</label>
                  <input type="range" min="2" max="40" step="0.5" value={paintState.viscosity} onInput={(e) => setPaintState('viscosity', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                </div>
                <div>
                  <label class="block font-semibold mb-1">Surface Tension: {paintState.surfaceTension}</label>
                  <input type="range" min="0.1" max="1.0" step="0.05" value={paintState.surfaceTension} onInput={(e) => setPaintState('surfaceTension', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                </div>
              </div>
              <div class="pt-3 flex-1 flex flex-col min-h-0">
                <h3 class="text-[9px] font-bold text-black uppercase tracking-wider mb-1">Formulation Output</h3>
                <div class="flex-1 bg-neutral-900 text-neutral-100 font-mono text-[9px] p-2.5 rounded-lg overflow-y-auto">
                  {`Target Hex: ${paintState.hexColor}\nViscosity Index: ${paintState.viscosity} Poise\nSurface Tension: ${paintState.surfaceTension} N/m\nPigment Match: Rutile White / Iron Oxide\nBinder System: Alkyd Polyester Unit`}
                </div>
              </div>
            </div>

            <div class="md:col-span-8 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col items-center justify-center relative overflow-hidden min-h-0">
              <h3 class="text-[10px] font-bold text-black uppercase tracking-wider mb-2 self-start">Real-Time Paint Physics & Viscosity Simulation</h3>
              <div class="border border-neutral-200 rounded-lg overflow-hidden bg-white flex items-center justify-center flex-1 w-full p-2 min-h-0 relative">
                <canvas ref={paintSimCanvasRef} width="640" height="640" class="w-full h-full object-contain" />
              </div>
            </div>
          </div>
        </Show>

        <Show when={activeTab() === 'pharmacology'}>
          <div class="grid grid-cols-1 md:grid-cols-12 gap-3 flex-1 min-h-0 overflow-y-auto">
            <div class="md:col-span-5 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col gap-3">
              <div class="flex justify-between items-center">
                <h2 class="text-[10px] font-bold text-black uppercase tracking-wider">Active Drug Stack & Orange Book</h2>
                <div class="inline-flex items-center gap-1.5 text-[9px] font-medium bg-neutral-100 rounded-full px-2.5 py-0.5 text-neutral-700">
                  <span class={`w-2 h-2 rounded-full ${pharmState.prewarmTotal === 0 ? 'bg-neutral-400 animate-pulse' : pharmState.prewarmRunning ? 'bg-blue-500 animate-pulse' : 'bg-emerald-500'}`}></span>
                  <span>Orange Book: {pharmState.prewarmDone}/{pharmState.prewarmTotal}</span>
                </div>
              </div>

              <div class="flex items-center gap-2">
                <input type="number" min="1" max="10" value={pharmState.stackSize} onInput={(e) => setPharmState('stackSize', parseInt(e.target.value) || 4)} class="w-16 px-2.5 py-1.5 text-xs rounded border border-neutral-200 bg-neutral-50" />
                <button onClick={async () => {
                  const res = await fetch(`/api/random-stack?n=${pharmState.stackSize}`);
                  const newStack = await res.json();
                  setPharmState('stack', newStack);
                  const resFacts = await fetch('/api/generate-facts', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({ drugs: newStack }) });
                  const data = await resFacts.json();
                  await runPrologAnalysis(data.facts || '');
                }} class="bg-black text-white text-xs px-3.5 py-1.5 rounded font-bold cursor-pointer hover:bg-neutral-800">Random Stack</button>
                <button onClick={generateLomns} class="bg-emerald-700 hover:bg-emerald-800 text-white text-xs px-3.5 py-1.5 rounded font-bold cursor-pointer">Generate LOMNs</button>
              </div>

              <div class="space-y-1">
                <label class="text-[9px] font-bold uppercase tracking-wider text-neutral-600">Add from FDA Orange Book ({pharmState.molTotal} molecules)</label>
                <input type="text" placeholder="Search drug e.g. metformin..." value={pharmState.molQuery} onInput={(e) => searchMolecules(e.target.value)} class="w-full bg-neutral-50 border border-neutral-200 rounded px-2.5 py-1.5 text-xs" />
                <Show when={pharmState.molResults.length > 0}>
                  <ul class="rounded border border-neutral-200 max-h-32 overflow-y-auto bg-neutral-50 text-xs divide-y divide-neutral-200">
                    <For each={pharmState.molResults}>
                      {(m) => (
                        <li class="flex justify-between items-center px-2.5 py-1.5">
                          <span>{m}</span>
                          <button onClick={() => addMolecule(m)} class="font-bold underline cursor-pointer text-blue-700">Add</button>
                        </li>
                      )}
                    </For>
                  </ul>
                </Show>
              </div>

              <div class="flex-1 overflow-y-auto space-y-1.5">
                <For each={pharmState.stack}>
                  {(item) => (
                    <div class="bg-neutral-50 border border-neutral-200 p-2 rounded flex justify-between items-center text-xs">
                      <span class="font-bold">{item.name}</span>
                      <span class="font-mono">{item.dose}{item.unit} ({item.route})</span>
                    </div>
                  )}
                </For>
              </div>
            </div>

            <div class="md:col-span-7 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col gap-3 min-h-0 overflow-y-auto">
              <h2 class="text-[10px] font-bold text-black uppercase tracking-wider">Cellular Perturbation Index (CPI) Matrix</h2>
              <div class="overflow-x-auto rounded border border-neutral-200 bg-white flex-1">
                <table class="w-full text-left text-xs">
                  <thead class="bg-neutral-100 font-bold uppercase text-[9px]">
                    <tr>
                      <th class="p-2.5">Agent</th>
                      <th class="p-2.5">Organ</th>
                      <th class="p-2.5">Cell</th>
                      <th class="p-2.5">CPI</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-neutral-200">
                    <For each={pharmState.analysis.impacts}>
                      {(row) => (
                        <tr class="hover:bg-neutral-50">
                          <td class="p-2.5 font-bold">{row.drug}</td>
                          <td class="p-2.5">{row.organ}</td>
                          <td class="p-2.5">{row.cell}</td>
                          <td class="p-2.5 font-mono">{row.cpi}%</td>
                        </tr>
                      )}
                    </For>
                  </tbody>
                </table>
              </div>

              <Show when={pharmState.lomns.length > 0}>
                <div>
                  <h2 class="text-[10px] font-bold text-black uppercase tracking-wider mb-1.5">Letters of Medical Necessity (LOMN)</h2>
                  <div class="space-y-2 max-h-48 overflow-y-auto pr-1">
                    <For each={pharmState.lomns}>
                      {(lomnItem) => (
                        <div class="bg-neutral-50 border border-neutral-200 p-3 rounded-lg text-xs">
                          <h3 class="font-bold text-black mb-1">{lomnItem.drug}</h3>
                          <pre class="whitespace-pre-wrap text-[10px] bg-white p-2.5 rounded border border-neutral-200 text-neutral-800 font-sans leading-relaxed">{lomnItem.lomn}</pre>
                        </div>
                      )}
                    </For>
                  </div>
                </div>
              </Show>
            </div>
          </div>
        </Show>

        <Show when={activeTab() === 'meal_plan'}>
          <div class="grid grid-cols-1 md:grid-cols-12 gap-3 flex-1 min-h-0">
            <div class="md:col-span-4 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col gap-3">
              <h2 class="text-[10px] font-bold text-black uppercase tracking-wider">Growth & Metabolic Parameters</h2>
              <div class="space-y-2.5 text-[10px]">
                <div>
                  <label class="block font-semibold mb-1">Subject Gender:</label>
                  <select value={mealState.gender} onChange={(e) => setMealState('gender', e.currentTarget.value)} class="w-full bg-neutral-50 rounded px-2.5 py-1.5 border border-neutral-200">
                    <option value="m">Male (m)</option>
                    <option value="f">Female (f)</option>
                  </select>
                </div>
                <div>
                  <label class="block font-semibold mb-1">Target Growth Mass (kg): {mealState.mass} kg</label>
                  <input type="range" min="30" max="150" step="1" value={mealState.mass} onInput={(e) => setMealState('mass', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                </div>
                <div>
                  <label class="block font-semibold mb-1">Duration (Days): {mealState.days} days</label>
                  <input type="range" min="365" max="14610" step="365" value={mealState.days} onInput={(e) => setMealState('days', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                </div>
                <button onClick={generateMealPlan} disabled={mealState.loading} class="w-full bg-black hover:bg-neutral-800 disabled:opacity-50 text-white py-2 rounded-lg font-bold transition cursor-pointer text-[10px] uppercase tracking-wider mt-4">
                  {mealState.loading ? 'Solving Requirements...' : 'Generate Dietary Portfolio'}
                </button>
              </div>
            </div>

            <div class="md:col-span-8 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col justify-between relative overflow-hidden min-h-0">
              <h3 class="text-[10px] font-bold text-black uppercase tracking-wider mb-2">Metabolic Synthesis & Dietary Portfolio Report</h3>
              <div class="flex-1 bg-neutral-900 text-neutral-100 font-mono text-[10px] p-3.5 rounded-lg overflow-y-auto flex flex-col">
                <Show when={mealState.loading} fallback={<pre class="whitespace-pre-wrap">{mealState.report || 'Configure parameters and click generate to compute nutrient allocation and meal portfolio.'}</pre>}>
                  <div class="m-auto text-center space-y-2">
                    <div class="inline-block w-6 h-6 border-2 border-white border-t-transparent rounded-full animate-spin"></div>
                    <p class="animate-pulse">Evaluating Trealla Prolog growth models...</p>
                  </div>
                </Show>
              </div>
            </div>
          </div>
        </Show>

        <Show when={activeTab() === 'dispersion'}>
          <div class="grid grid-cols-1 md:grid-cols-12 gap-3 flex-1 min-h-0">
            <div class="md:col-span-3 flex flex-col gap-3 min-h-0">
              <section class="bg-white p-4 rounded-xl border border-neutral-200 flex-1 flex flex-col justify-between min-h-0">
                <div class="space-y-2 overflow-hidden flex flex-col h-full">
                  <h2 class="text-[9px] font-bold text-black uppercase tracking-wider">Formula ({state.selectedIngredients.length}/25)</h2>
                  
                  <div class="flex flex-col gap-1.5 max-h-44 overflow-y-auto bg-neutral-50 p-2 rounded-lg border border-neutral-200 shrink-0">
                    <Show when={state.selectedIngredients.length > 0} fallback={<span class="text-[9px] text-neutral-400 italic">No items selected.</span>}>
                      <For each={state.selectedIngredients}>
                        {(item) => (
                          <div class="bg-white border border-neutral-200 text-[10px] p-1.5 rounded space-y-1">
                            <div class="flex items-center justify-between font-medium">
                              <div class="flex items-center gap-1.5 min-w-0 pr-1">
                                <input type="color" value={item.color} onInput={(e) => setState('selectedIngredients', i => i.cas === item.cas, 'color', e.currentTarget.value)} class="w-3 h-3 rounded border border-neutral-300 cursor-pointer p-0 bg-transparent shrink-0" title="Select color" />
                                <span class="break-words leading-tight font-bold" title={item.name}>{item.name}</span>
                              </div>
                              <button onClick={() => setState('selectedIngredients', state.selectedIngredients.filter(i => i.cas !== item.cas))} class="text-neutral-400 hover:text-black font-bold shrink-0 ml-1 cursor-pointer">×</button>
                            </div>
                            <div class="flex flex-wrap gap-1">
                              <For each={getFlavorTags(item.name)}>
                                {(tag) => (
                                  <span class="bg-neutral-100 text-[7px] px-1 py-0.2 rounded font-mono uppercase text-neutral-600">{tag}</span>
                                )}
                              </For>
                            </div>
                          </div>
                        )}
                      </For>
                    </Show>
                  </div>
                  <div class="relative shrink-0">
                    <input type="text" placeholder="Search ingredients..." value={state.searchQuery} onInput={(e) => setState('searchQuery', e.currentTarget.value)} class="w-full bg-neutral-50 border border-neutral-200 rounded px-2.5 py-1.5 text-[10px] focus:outline-none focus:ring-1 focus:ring-black pr-5" />
                    <Show when={state.searchQuery}>
                      <button onClick={() => setState('searchQuery', '')} class="absolute right-2 top-1/2 -translate-y-1/2 text-neutral-400 hover:text-black text-[9px] font-bold cursor-pointer">✕</button>
                    </Show>
                  </div>
                  <div class="flex-1 overflow-y-auto space-y-1 min-h-0">
                    <For each={filteredIngredients()}>
                      {(ing) => (
                        <div onClick={() => addIngredient(ing)} class="bg-neutral-50 hover:bg-black hover:text-white px-2.5 py-1.5 rounded border border-neutral-200 cursor-pointer text-[10px] transition" title={`Add ${ing.name}`}>
                          <div class="font-medium leading-tight">{ing.name}</div>
                        </div>
                      )}
                    </For>
                  </div>
                </div>

                <div class="space-y-2 mt-3 shrink-0">
                  <button onClick={randomizePerfume} class="w-full bg-neutral-100 hover:bg-black hover:text-white text-black text-[10px] font-semibold py-2 rounded-lg transition cursor-pointer">🎲 Random Formula</button>
                  <Show when={state.selectedIngredients.length > 0}>
                    <div class="flex flex-col gap-1">
                      <span class="text-[8px] text-emerald-700 font-semibold text-center">{copyStatus()}</span>
                      <button onClick={copyFormulaToClipboard} class="w-full bg-neutral-50 border border-neutral-200 hover:bg-neutral-100 text-black text-[10px] font-semibold py-1.5 rounded-lg cursor-pointer">📋 Copy Formula & Tags</button>
                    </div>
                  </Show>
                  <button onClick={triggerRender} disabled={state.loading || !state.selectedIngredients.length} class="w-full bg-black hover:bg-neutral-800 disabled:opacity-50 text-white py-2.5 rounded-lg font-bold transition cursor-pointer text-[10px] uppercase tracking-wider">{state.loading ? 'Rendering...' : 'Generate GIF'}</button>
                </div>
              </section>
            </div>

            <section class="md:col-span-6 bg-white p-4 rounded-xl border border-neutral-200 flex flex-col justify-between relative overflow-hidden min-h-0">
              <div class="absolute top-5 right-5 z-30 flex items-center">
                <Show when={isParametersModified()}>
                  <span class="bg-amber-50 text-amber-900 border border-amber-300 text-[9px] font-bold px-2.5 py-1 rounded-lg animate-pulse">
                    ⚠️ Parameters Modified
                  </span>
                </Show>
              </div>

              <div class="flex-1 flex flex-col items-center justify-center relative overflow-hidden min-h-0 w-full">
                <Show when={state.loading}>
                  <div class="space-y-2 text-center py-10">
                    <div class="inline-block w-8 h-8 border-3 border-black border-t-transparent rounded-full animate-spin"></div>
                    <p class="text-xs font-semibold text-black animate-pulse">{state.statusMessage}</p>
                  </div>
                </Show>

                <Show when={state.videoUrl && !state.loading}>
                  <div class="space-y-1 w-full h-full flex flex-col items-center justify-center relative">
                    <div class="border border-neutral-200 rounded-lg overflow-hidden bg-black flex items-center justify-center flex-1 w-full p-2 min-h-0 relative">
                      <For each={[...state.layers].sort((a, b) => a.zIndex - b.zIndex)}>
                        {(layer) => (
                          <Show when={layer.visible}>
                            <img 
                              src={state.videoUrl} 
                              alt={layer.name} 
                              class="absolute inset-0 w-full h-full object-contain pointer-events-none" 
                              style={{ 'z-index': layer.zIndex, 'opacity': layer.opacity }} 
                            />
                          </Show>
                        )}
                      </For>
                      <canvas 
                        ref={canvasRef} 
                        width="640" 
                        height="640" 
                        onMouseDown={startDrawing} 
                        onMouseUp={stopDrawing} 
                        onMouseMove={draw} 
                        class="absolute inset-0 w-full h-full cursor-crosshair z-50"
                      />
                    </div>
                  </div>
                </Show>

                <Show when={!state.loading && !state.videoUrl}>
                  <div class="text-neutral-400 space-y-2 text-center py-12 relative w-full h-full flex flex-col items-center justify-center bg-neutral-50 border border-dashed border-neutral-200 rounded-lg">
                    <p class="text-2xl">🧪</p>
                    <p class="text-xs font-medium text-neutral-600">Configure formula and generate dispersion simulation.</p>
                    <canvas 
                      ref={canvasRef} 
                      width="640" 
                      height="640" 
                      onMouseDown={startDrawing} 
                      onMouseUp={stopDrawing} 
                      onMouseMove={draw} 
                      class="absolute inset-0 w-full h-full cursor-crosshair z-50 pointer-events-auto"
                    />
                  </div>
                </Show>
              </div>

              <div class="mt-3 pt-3 bg-neutral-50 border border-neutral-200 p-3 rounded-xl shrink-0 space-y-2">
                <div class="grid grid-cols-5 gap-2.5 text-[9px]">
                  <div>
                    <label class="block text-black font-semibold mb-1">Duration: {state.seconds}s</label>
                    <input type="range" min="5" max="60" value={state.seconds} onInput={(e) => setState('seconds', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <label class="block text-black font-semibold mb-1">FPS: {state.fps}</label>
                    <input type="range" min="15" max="60" step="15" value={state.fps} onInput={(e) => setState('fps', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <label class="block text-black font-semibold mb-1">Velocity: {state.velocity}m/s</label>
                    <input type="range" min="10" max="50" step="0.5" value={state.velocity} onInput={(e) => setState('velocity', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <div class="flex justify-between items-center mb-1">
                      <label class="text-black font-semibold">Temp: {getDisplayTemp()}°{tempUnit()}</label>
                      <button onClick={() => setTempUnit(u => u === 'K' ? 'C' : u === 'C' ? 'F' : 'K')} class="text-[8px] bg-white border border-neutral-200 text-black px-1 rounded font-bold cursor-pointer hover:bg-neutral-100">Switch</button>
                    </div>
                    <input type="range" min={tempUnit() === 'F' ? 10 : tempUnit() === 'C' ? -15 : 260} max={tempUnit() === 'F' ? 130 : tempUnit() === 'C' ? 55 : 330} step="1" value={tempUnit() === 'C' ? state.temp - 273.15 : tempUnit() === 'F' ? (state.temp - 273.15) * 9/5 + 32 : state.temp} onInput={(e) => handleTempInput(e.currentTarget.value)} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <label class="block text-black font-semibold mb-1">Humidity: {(state.humidity * 100).toFixed(0)}%</label>
                    <input type="range" min="0" max="1" step="0.05" value={state.humidity} onInput={(e) => setState('humidity', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                </div>

                <div class="flex items-center gap-2 pt-1">
                  <span class="text-[9px] text-neutral-600 font-mono shrink-0">Frame: {state.currentFrame}/{totalFrames()}</span>
                  <input 
                    type="range" 
                    min="0" 
                    max={totalFrames()} 
                    value={state.currentFrame} 
                    onInput={(e) => setState('currentFrame', Number(e.currentTarget.value))} 
                    class="w-full accent-black h-1.5 cursor-pointer" 
                  />
                </div>
              </div>
            </section>

            <div class="md:col-span-3 flex flex-col gap-3 min-h-0">
              <section class="bg-white p-4 rounded-xl border border-neutral-200 flex flex-col shrink-0 max-h-44">
                <h2 class="text-[9px] font-bold text-black uppercase tracking-wider mb-2">Rendering Layers</h2>
                <div class="space-y-1.5 overflow-y-auto pr-1 flex-1">
                  <For each={state.layers}>
                    {(layer, idx) => (
                      <div class="bg-neutral-50 border border-neutral-200 p-1.5 rounded flex items-center justify-between text-[10px]">
                        <div class="flex items-center gap-1.5 truncate">
                          <input type="checkbox" checked={layer.visible} onChange={(e) => setState('layers', idx(), 'visible', e.currentTarget.checked)} class="cursor-pointer accent-black" />
                          <span class="truncate font-semibold text-black">{layer.name}</span>
                        </div>
                        <div class="flex items-center gap-1 shrink-0">
                          <input type="range" min="0" max="1" step="0.05" value={layer.opacity} onInput={(e) => setState('layers', idx(), 'opacity', Number(e.currentTarget.value))} class="w-10 accent-black h-1 cursor-pointer" />
                          <button onClick={() => moveLayerOrder(idx(), -1)} disabled={idx() === 0} class="text-neutral-500 hover:text-black font-bold disabled:opacity-20 px-0.5 cursor-pointer">▲</button>
                          <button onClick={() => moveLayerOrder(idx(), 1)} disabled={idx() === state.layers.length - 1} class="text-neutral-500 hover:text-black font-bold disabled:opacity-20 px-0.5 cursor-pointer">▼</button>
                        </div>
                      </div>
                    )}
                  </For>
                </div>
              </section>

              <section class="bg-white p-4 rounded-xl border border-neutral-200 shrink-0 space-y-2">
                <h2 class="text-[9px] font-bold text-black uppercase tracking-wider">Annotation Tools</h2>
                <div class="grid grid-cols-3 gap-1.5">
                  <button onClick={() => setState('activeTool', 'brush')} class={`text-[9px] py-1.5 rounded font-semibold cursor-pointer transition ${state.activeTool === 'brush' ? 'bg-black text-white' : 'bg-neutral-100 text-black hover:bg-neutral-200'}`}>Brush</button>
                  <button onClick={() => setState('activeTool', 'marker')} class={`text-[9px] py-1.5 rounded font-semibold cursor-pointer transition ${state.activeTool === 'marker' ? 'bg-black text-white' : 'bg-neutral-100 text-black hover:bg-neutral-200'}`}>Marker</button>
                  <button onClick={() => setState('activeTool', 'eraser')} class={`text-[9px] py-1.5 rounded font-semibold cursor-pointer transition ${state.activeTool === 'eraser' ? 'bg-black text-white' : 'bg-neutral-100 text-black hover:bg-neutral-200'}`}>Eraser</button>
                </div>
                <div class="flex items-center justify-between pt-1">
                  <div class="flex items-center gap-2">
                    <span class="text-[9px] text-black font-semibold">Color:</span>
                    <input type="color" value={state.brushColor} onInput={(e) => setState('brushColor', e.currentTarget.value)} class="w-5 h-5 rounded border border-neutral-300 cursor-pointer p-0 bg-transparent" />
                  </div>
                  <div class="flex items-center gap-2">
                    <span class="text-[9px] text-black font-semibold">Size: {state.brushSize}px</span>
                    <input type="range" min="1" max="25" value={state.brushSize} onInput={(e) => setState('brushSize', Number(e.currentTarget.value))} class="w-20 accent-black h-1 cursor-pointer" />
                  </div>
                </div>
              </section>

              <section class="bg-white p-4 rounded-xl border border-neutral-200 flex-1 flex flex-col min-h-0">
                <div class="flex justify-between items-center mb-1.5 pb-1 border-b border-neutral-100 shrink-0">
                  <h2 class="text-[9px] font-bold text-black uppercase tracking-wider">History</h2>
                  <Show when={state.history.length > 0}>
                    <button onClick={() => { setState('history', []); localStorage.removeItem('perfume_render_history'); }} class="text-[9px] text-neutral-400 hover:text-black font-medium cursor-pointer">Clear</button>
                  </Show>
                </div>
                <div class="flex-1 overflow-y-auto space-y-1 pr-1 min-h-0">
                  <Show when={state.history.length > 0} fallback={<p class="text-[10px] text-neutral-400 italic text-center py-8">No past generations.</p>}>
                    <For each={state.history}>
                      {(item) => (
                        <div onClick={() => setState('videoUrl', item.url)} class={`p-2 rounded border border-neutral-200 cursor-pointer transition text-[10px] flex items-center justify-between ${state.videoUrl === item.url ? 'bg-neutral-100 font-semibold' : 'bg-neutral-50 hover:bg-neutral-100'}`}>
                          <div class="truncate pr-1">
                            <div class="font-bold text-black flex items-center gap-1.5 text-[9px]">
                              <span>{item.timestamp}</span>
                              <span class="bg-neutral-200 px-1 py-0.2 rounded font-normal text-[8px]">{item.ingredientsCount} ing.</span>
                            </div>
                            <div class="text-[8px] text-neutral-500">{item.params.seconds}s • {item.params.velocity}m/s</div>
                          </div>
                          <a href={item.url} download class="text-neutral-500 hover:text-black p-0.5 text-[10px]">⬇️</a>
                        </div>
                      )}
                    </For>
                  </Show>
                </div>
              </section>
            </div>
          </div>
        </Show>
      </div>
    </div>
  );
}
