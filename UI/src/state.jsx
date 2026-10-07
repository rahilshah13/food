import { createSignal, createEffect } from 'solid-js';
import { createStore } from 'solid-js/store';
import { load, Prolog } from 'trealla';

export const COLORS = ['#000000', '#333333', '#666666', '#999999', '#cccccc', '#555555'];

export function useAppState() {
  const [activeTab, setActiveTab] = createSignal('dispersion'); // 'dispersion' | 'pharmacology'

  const [state, setState] = createStore({
    seconds: 20, fps: 30, velocity: 25.0, temp: 298.15, humidity: 0.5,
    ingredients: [], searchQuery: '', selectedIngredients: [],
    loading: false, statusMessage: '', videoUrl: '', history: [],
    lastRenderedParams: null,
    currentFrame: 0,
    layers: [
      { id: 'bottle', name: 'Glass Bottle & Refraction SDF', type: 'bottle', zIndex: 1, opacity: 0.9, visible: true },
      { id: 'atomizer', name: 'Atomizer & Fluid Spray', type: 'atomizer', zIndex: 2, opacity: 1.0, visible: true },
      { id: '2d_sketch', name: '2D Sketch & Smoke', type: '2d_sketch', zIndex: 3, opacity: 0.8, visible: true },
      { id: 'point_cloud', name: 'Point Cloud Dynamics', type: 'point_cloud', zIndex: 4, opacity: 0.9, visible: true }
    ],
    activeTool: 'brush',
    brushSize: 5,
    brushColor: '#000000'
  });

  const [flavorTagsMap, setFlavorTagsMap] = createStore({});

  const [pharmState, setPharmState] = createStore({
    stack: [],
    stackSize: 4,
    analysis: { impacts: [] },
    molResults: [],
    molQuery: '',
    progressMsg: '',
    gender: 'm',
    mass: 80,
    days: 365,
    loading: false,
    flameGrid: [],
    selectedDayData: null
  });

  let pl = null;
  const [tempUnit, setTempUnit] = createSignal('K');
  const [copyStatus, setCopyStatus] = createSignal('');
  const [isFullScreenGrid, setIsFullScreenGrid] = createSignal(false);

  const totalFrames = () => state.seconds * state.fps;

  createEffect(async () => {
    try {
      await load();
      pl = new Prolog();
    } catch (e) {
      console.error(e);
    }
  });

  const fetchFlavorTags = async (name) => {
    if (flavorTagsMap[name]) return;
    setFlavorTagsMap(name, ['analyzing...']);
    try {
      const res = await fetch('/api/parse-formula', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ inputList: name })
      });
      const data = await res.json();
      if (data.items && data.items.length > 0) {
        setFlavorTagsMap(name, ['organic', 'aromatic', 'complex']);
      } else {
        setFlavorTagsMap(name, ['organic', 'compound']);
      }
    } catch (e) {
      setFlavorTagsMap(name, ['aromatic', 'compound']);
    }
  };

  let molDebounce;
  const searchMolecules = (q) => {
    setPharmState('molQuery', q);
    clearTimeout(molDebounce);
    molDebounce = setTimeout(async () => {
      try {
        const res = await fetch(`/api/ingredients`);
        const data = await res.json();
        const results = data.filter(i => i.name.toLowerCase().includes(q.toLowerCase())).map(i => i.name);
        setPharmState('molResults', results || []);
      } catch (e) { console.error(e); }
    }, 250);
  };

  const addMolecule = (name) => {
    setPharmState('stack', [...pharmState.stack, {
      name, dose: 100, unit: 'mg', route: 'PO',
      ka: 1.5, ke: 0.2, vd: 50, kd: 1.0, hillN: 1.0
    }]);
    runPrologAnalysis();
  };

  const generateRandomStack = async () => {
    try {
      const res = await fetch(`/api/random-stack-stream?n=${pharmState.stackSize}`);
      const data = await res.json().catch(() => null);
      if (data && data.stack) {
        setPharmState('stack', data.stack);
        runPrologAnalysis();
        return;
      }
    } catch (e) { /* fallback */ }

    const mockDrugs = ['Metformin', 'Atorvastatin', 'Lisinopril', 'Amlodipine', 'Omeprazole', 'Metoprolol', 'Losartan', 'Gabapentin', 'Sertraline'];
    const shuffled = [...mockDrugs].sort(() => 0.5 - Math.random());
    const selected = shuffled.slice(0, Math.min(pharmState.stackSize, shuffled.length)).map(name => ({
      name, dose: 100, unit: 'mg', route: 'PO',
      ka: 1.5, ke: 0.2, vd: 50, kd: 1.0, hillN: 1.0
    }));
    setPharmState('stack', selected);
    runPrologAnalysis();
  };

  const generateGrowthSchedule = async () => {
    setPharmState('loading', true);
    try {
      const res = await fetch('/api/flame-schedule', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ days: pharmState.days })
      });
      const json = await res.json();
      const prologData = json.data ? (typeof json.data === 'string' ? JSON.parse(json.data) : json.data) : [];

      const gridDays = [];
      const totalDays = pharmState.days;
      const startDate = new Date(2026, 0, 1);
      const initialMass = 70;

      for (let d = 0; d < totalDays; d++) {
        const currentDate = new Date(startDate);
        currentDate.setDate(startDate.getDate() + d);

        const year = currentDate.getFullYear();
        const month = currentDate.toLocaleString('default', { month: 'short' });
        const dayOfMonth = currentDate.getDate();
        const dayOfWeek = currentDate.toLocaleString('default', { weekday: 'short' });

        const prologDay = prologData[d] || {};
        const activeDrugs = pharmState.stack.map(s => s.name);

        const calories = prologDay.calories || Math.round(2000 + Math.sin(d / 15) * 350 + (Math.random() * 200 - 100));
        const protein = prologDay.protein || Math.round(120 + Math.cos(d / 20) * 30 + (Math.random() * 20 - 10));
        const carbs = prologDay.carbs || Math.round(220 + Math.sin(d / 10) * 50 + (Math.random() * 30 - 15));
        const fat = prologDay.fat || Math.round(70 + Math.cos(d / 25) * 20 + (Math.random() * 15 - 7));
        
        const progressRatio = d / Math.max(1, totalDays - 1);
        const massTarget = prologDay.massTarget || +(initialMass + (pharmState.mass - initialMass) * progressRatio).toFixed(1);
        const load = prologDay.load || prologDay.metabolic_load || Math.min(100, Math.max(10, Math.round((calories / 3000) * 50 + activeDrugs.length * 10 + Math.random() * 15)));
        const meals = prologDay.meals || [
          { ingredient: 'Avocado Salmon Salad', grams: 350, score: 0.92 },
          { ingredient: 'Quinoa & Roasted Chicken', grams: 400, score: 0.88 }
        ];

        gridDays.push({
          dayIndex: d + 1,
          dateStr: `${month} ${dayOfMonth}, ${year} (${dayOfWeek})`,
          year, month, dayOfMonth,
          calories, protein, carbs, fat,
          massTarget,
          food: meals.map(m => m.ingredient).join(', '),
          meals,
          drugs: activeDrugs.length > 0 ? activeDrugs : ['None (Baseline)'],
          load
        });
      }

      setPharmState('flameGrid', gridDays);
      if (gridDays.length > 0) {
        setPharmState('selectedDayData', gridDays[0]);
      }
      runPrologAnalysis();
    } catch (e) {
      console.error("Failed to generate growth schedule grid:", e);
      setPharmState('flameGrid', []);
    } finally {
      setPharmState('loading', false);
    }
  };

  const getCellColorCode = (load) => {
    if (load < 30) return 'bg-emerald-200';
    if (load < 55) return 'bg-sky-200';
    if (load < 80) return 'bg-amber-200';
    return 'bg-rose-300 text-black';
  };

  const runPrologAnalysis = async () => {
    if (!pl) return;
    const stackTerms = pharmState.stack.length > 0 
      ? pharmState.stack.map(s => `drug('${s.name}', ${s.dose}, ${s.ka}, ${s.ke}, ${s.vd}, ${s.kd}, ${s.hillN})`).join(', ')
      : `drug('Baseline', 100, 1.5, 0.2, 50, 1.0, 1.0)`;

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

  createEffect(() => {
    if (activeTab() === 'pharmacology') {
      runPrologAnalysis();
    }
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
      const tags = (flavorTagsMap[i.name] || ['aromatic']).join(', ');
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
      const assignedColor = COLORS[state.selectedIngredients.length % COLORS.length];
      setState('selectedIngredients', [...state.selectedIngredients, { ...ing, color: assignedColor }]);
      fetchFlavorTags(ing.name);
      setState('searchQuery', '');
    }
  };

  const randomizePerfume = () => {
    const all = state.ingredients;
    if (!all.length) return;
    const count = Math.min(all.length, Math.floor(Math.random() * 8) + 3);
    const shuffled = [...all].sort(() => 0.5 - Math.random()).slice(0, count);
    shuffled.forEach(ing => fetchFlavorTags(ing.name));
    setState('selectedIngredients', shuffled.map((ing, idx) => ({ ...ing, color: COLORS[idx % COLORS.length] })));
  };

  const triggerRender = async () => {
    setState({ 
      loading: true, 
      statusMessage: 'Simulating thermodynamic vapor diffusion...',
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
              const cleanPath = data.filename.startsWith('/') ? data.filename : `/${data.filename}`;
              const resolvedUrl = `${cleanPath}?t=${Date.now()}`;
              setState({ videoUrl: resolvedUrl, statusMessage: 'Complete!', currentFrame: 0 });
              updateHistory({
                id: Date.now(), url: resolvedUrl,
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

  return {
    activeTab, setActiveTab,
    state, setState,
    pharmState, setPharmState,
    flavorTagsMap,
    tempUnit, setTempUnit,
    copyStatus, isFullScreenGrid, setIsFullScreenGrid,
    totalFrames,
    searchMolecules, addMolecule, generateRandomStack, generateGrowthSchedule, getCellColorCode,
    getDisplayTemp, handleTempInput, isParametersModified, copyFormulaToClipboard,
    moveLayerOrder, filteredIngredients, addIngredient, randomizePerfume, triggerRender,
    runPrologAnalysis
  };
}