import { For, Show } from 'solid-js';
import { useAppState } from './state.jsx';

export default function App() {
  const {
    activeTab, setActiveTab,
    state, setState,
    pharmState, setPharmState,
    flavorTagsMap,
    tempUnit, setTempUnit,
    copyStatus, isFullScreenGrid, setIsFullScreenGrid,
    totalFrames,
    searchMolecules, addMolecule, generateRandomStack, generateGrowthSchedule, getCellColorCode,
    getDisplayTemp, handleTempInput, isParametersModified, copyFormulaToClipboard,
    filteredIngredients, addIngredient, randomizePerfume, triggerRender,
    runPrologAnalysis
  } = useAppState();

  return (
    <div class="h-screen w-screen bg-white text-black font-sans flex flex-col justify-between py-1.5 px-2 overflow-hidden box-border text-[9px]">
      <div class="max-w-[98rem] w-full mx-auto h-[99vh] flex flex-col justify-between gap-1.5">
        <header class="px-3 py-1 flex justify-between items-center shrink-0">
          <div class="flex items-baseline gap-1">
            <h1 class="text-[10px] font-black tracking-tight text-black">onion.glass</h1>
          </div>
          <div class="flex gap-1">
            <button onClick={() => setActiveTab('dispersion')} class={`font-bold px-2.5 py-0.5 rounded cursor-pointer transition ${activeTab() === 'dispersion' ? 'bg-black text-white' : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'}`} title="Dispersion Simulator">Dispersion</button>
            <button onClick={() => setActiveTab('pharmacology')} class={`font-bold px-2.5 py-0.5 rounded cursor-pointer transition ${activeTab() === 'pharmacology' ? 'bg-black text-white' : 'bg-neutral-100 text-neutral-700 hover:bg-neutral-200'}`} title="Systems Pharmacology & Growth">Pharmacology & Growth</button>
          </div>
        </header>

        <Show when={activeTab() === 'pharmacology'}>
          <div class="grid grid-cols-1 md:grid-cols-12 gap-1.5 flex-1 min-h-0 overflow-y-auto">
            <div class="md:col-span-4 p-2.5 flex flex-col gap-2">
              <h2 class="font-bold text-black uppercase tracking-wider text-[9px]">Growth & Metabolic Parameters</h2>
              <div class="space-y-1.5">
                <div>
                  <label class="block font-semibold mb-0.5">Subject Gender:</label>
                  <select value={pharmState.gender} onChange={(e) => setPharmState('gender', e.currentTarget.value)} class="w-full bg-neutral-50 rounded px-1.5 py-0.5">
                    <option value="m">Male</option>
                    <option value="f">Female</option>
                  </select>
                </div>
                <div>
                  <label class="block font-semibold mb-0.5">Target Growth Mass (kg): {pharmState.mass} kg</label>
                  <input type="range" min="30" max="150" step="1" value={pharmState.mass} onInput={(e) => { setPharmState('mass', Number(e.currentTarget.value)); runPrologAnalysis(); }} class="w-full accent-black h-1 cursor-pointer" />
                </div>
                <div>
                  <label class="block font-semibold mb-0.5">Duration (Days): {pharmState.days} days</label>
                  <input type="range" min="30" max="14610" step="30" value={pharmState.days} onInput={(e) => { setPharmState('days', Number(e.currentTarget.value)); runPrologAnalysis(); }} class="w-full accent-black h-1 cursor-pointer" />
                </div>
              </div>

              <div class="pt-1.5 flex flex-col gap-1.5">
                <div class="flex justify-between items-center">
                  <h3 class="font-bold text-black uppercase tracking-wider text-[9px]">Active Drug Stack</h3>
                  <div class="flex items-center gap-1">
                    <input type="number" min="1" max="10" value={pharmState.stackSize} onInput={(e) => setPharmState('stackSize', parseInt(e.target.value) || 4)} class="w-8 px-1 py-0.5 rounded bg-neutral-50" />
                    <button onClick={generateRandomStack} class="bg-black text-white text-[8px] px-2 py-0.5 rounded font-bold cursor-pointer">Random</button>
                  </div>
                </div>
                <input type="text" placeholder="Search FDA Orange Book..." value={pharmState.molQuery} onInput={(e) => searchMolecules(e.target.value)} class="w-full bg-neutral-50 rounded px-1.5 py-0.5" />
                <Show when={pharmState.molResults.length > 0}>
                  <ul class="rounded max-h-20 overflow-y-auto bg-neutral-50 divide-y divide-neutral-200">
                    <For each={pharmState.molResults}>
                      {(m) => (
                        <li class="flex justify-between items-center px-1.5 py-0.5">
                          <span>{m}</span>
                          <button onClick={() => addMolecule(m)} class="font-bold underline cursor-pointer text-blue-700">Add</button>
                        </li>
                      )}
                    </For>
                  </ul>
                </Show>
                <div class="max-h-24 overflow-y-auto space-y-0.5">
                  <For each={pharmState.stack}>
                    {(item) => (
                      <div class="bg-neutral-50 p-1 rounded flex justify-between items-center">
                        <span class="font-bold">{item.name}</span>
                        <span class="font-mono">{item.dose}{item.unit}</span>
                      </div>
                    )}
                  </For>
                </div>
              </div>

              <button onClick={generateGrowthSchedule} disabled={pharmState.loading} class="w-full bg-black hover:bg-neutral-800 disabled:opacity-50 text-white py-1.5 rounded font-bold transition cursor-pointer uppercase tracking-wider mt-1">
                {pharmState.loading ? 'Solving Schedule...' : 'Generate Flame Grid Schedule'}
              </button>
            </div>

            <div class="md:col-span-8 p-2.5 flex flex-col gap-2 min-h-0 overflow-y-auto">
              <div class="flex justify-between items-center">
                <h2 class="font-bold text-black uppercase tracking-wider text-[9px]">Scheduled Flame Grid Calendar & Nutrient Matrix</h2>
                <Show when={pharmState.flameGrid.length > 0}>
                  <button onClick={() => setIsFullScreenGrid(true)} class="bg-black text-white px-2 py-0.5 rounded font-bold hover:bg-neutral-800 cursor-pointer text-[8px]">
                    Full Screen Mode ⛶
                  </button>
                </Show>
              </div>
              
              <Show when={pharmState.flameGrid.length > 0} fallback={
                <div class="bg-neutral-50 p-4 rounded text-center text-neutral-500">
                  Click <strong>Generate Flame Grid Schedule</strong> to render calendar matrix.
                </div>
              }>
                <div class="flex flex-col gap-2">
                  <div class="bg-neutral-50 p-2 rounded flex flex-col gap-1 max-h-48 overflow-y-auto">
                    <div class="flex justify-between items-center">
                      <h3 class="font-bold uppercase tracking-wider text-black text-[8px]">Calendar Grid ({pharmState.days} Days)</h3>
                      <div class="flex items-center gap-1.5 text-[7px] text-neutral-500">
                        <span class="flex items-center gap-0.5"><span class="w-1.5 h-1.5 rounded bg-emerald-200"></span>Optimal</span>
                        <span class="flex items-center gap-0.5"><span class="w-1.5 h-1.5 rounded bg-sky-200"></span>Moderate</span>
                        <span class="flex items-center gap-0.5"><span class="w-1.5 h-1.5 rounded bg-amber-200"></span>Elevated</span>
                        <span class="flex items-center gap-0.5"><span class="w-1.5 h-1.5 rounded bg-rose-300"></span>High Stress</span>
                      </div>
                    </div>
                    <div class="grid grid-cols-12 sm:grid-cols-20 md:grid-cols-24 gap-0.5 p-0.5 bg-white rounded">
                      <For each={pharmState.flameGrid}>
                        {(cell) => {
                          const isSelected = pharmState.selectedDayData?.dayIndex === cell.dayIndex;
                          return (
                            <div 
                              onMouseEnter={() => setPharmState('selectedDayData', cell)}
                              onClick={() => setPharmState('selectedDayData', cell)}
                              class={`h-3.5 rounded cursor-pointer transition-all ${getCellColorCode(cell.load)} ${isSelected ? 'ring-1 ring-black scale-110 z-10' : 'hover:opacity-80'}`}
                              title={`Day ${cell.dayIndex} (${cell.dateStr}): Load ${cell.load}% | Target Mass: ${cell.massTarget}kg`}
                            ></div>
                          );
                        }}
                      </For>
                    </div>
                  </div>

                  <Show when={pharmState.selectedDayData}>
                    <div class="bg-neutral-50 p-2 rounded flex flex-col gap-1.5">
                      <div class="flex justify-between items-center pb-1 border-b border-neutral-200">
                        <span class="font-bold uppercase tracking-wider text-black">
                          Inspection — {pharmState.selectedDayData.dateStr} (Day {pharmState.selectedDayData.dayIndex})
                        </span>
                        <div class="flex items-center gap-1.5">
                          <span class="font-mono bg-neutral-200 text-neutral-800 px-1.5 py-0.2 rounded">Mass: {pharmState.selectedDayData.massTarget} kg</span>
                          <span class="font-mono bg-black text-white px-1.5 py-0.2 rounded">Load: {pharmState.selectedDayData.load}%</span>
                        </div>
                      </div>
                      <div class="grid grid-cols-2 md:grid-cols-4 gap-1.5 font-mono text-[8px]">
                        <div class="bg-white p-1 rounded">
                          <span class="text-neutral-500 block uppercase">Calories</span>
                          <span class="font-bold text-black">{pharmState.selectedDayData.calories} kcal</span>
                        </div>
                        <div class="bg-white p-1 rounded">
                          <span class="text-neutral-500 block uppercase">Protein</span>
                          <span class="font-bold text-black">{pharmState.selectedDayData.protein}g</span>
                        </div>
                        <div class="bg-white p-1 rounded">
                          <span class="text-neutral-500 block uppercase">Carbohydrates</span>
                          <span class="font-bold text-black">{pharmState.selectedDayData.carbs}g</span>
                        </div>
                        <div class="bg-white p-1 rounded">
                          <span class="text-neutral-500 block uppercase">Fats</span>
                          <span class="font-bold text-black">{pharmState.selectedDayData.fat}g</span>
                        </div>
                      </div>
                      <div class="grid grid-cols-1 md:grid-cols-2 gap-1.5 pt-0.5">
                        <div class="bg-white p-1 rounded">
                          <span class="font-bold block uppercase text-[8px] text-neutral-500">Consumed Foods</span>
                          <span>{pharmState.selectedDayData.food}</span>
                        </div>
                        <div class="bg-white p-1 rounded">
                          <span class="font-bold block uppercase text-[8px] text-neutral-500">Active Drugs / Stack</span>
                          <span class="font-mono">{pharmState.selectedDayData.drugs.join(', ')}</span>
                        </div>
                      </div>
                    </div>
                  </Show>
                </div>
              </Show>

              <div class="overflow-x-auto rounded bg-white p-2 border border-neutral-200 flex flex-col gap-1.5">
                <div class="flex justify-between items-center">
                  <h3 class="font-bold text-black uppercase tracking-wider text-[8px]">
                    Generated Meal Portions {pharmState.selectedDayData ? `— Day ${pharmState.selectedDayData.dayIndex}` : ''}
                  </h3>
                  <span class="font-mono text-[8px] text-neutral-500">
                    {pharmState.selectedDayData?.meals?.length || 0} Portions
                  </span>
                </div>
                <table class="w-full text-left">
                  <thead class="bg-neutral-100 font-bold uppercase text-[8px]">
                    <tr>
                      <th class="p-1">Portion</th>
                      <th class="p-1">Food Item</th>
                      <th class="p-1">Quantity (g)</th>
                      <th class="p-1">Bioavailability Score</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-neutral-100 text-[8px]">
                    <Show when={pharmState.selectedDayData?.meals?.length > 0} fallback={
                      <tr>
                        <td colspan="4" class="p-3 text-center text-neutral-400 italic">Select a day on the flame grid above to inspect solved meal portions.</td>
                      </tr>
                    }>
                      <For each={pharmState.selectedDayData.meals}>
                        {(meal, mIdx) => (
                          <tr class="hover:bg-neutral-50">
                            <td class="p-1 font-mono">#{mIdx() + 1}</td>
                            <td class="p-1 font-bold">{meal.ingredient || meal.name}</td>
                            <td class="p-1 font-mono">{meal.grams || meal.quantity}g</td>
                            <td class="p-1 font-mono text-amber-600">{meal.score || meal.bioavailability}</td>
                          </tr>
                        )}
                      </For>
                    </Show>
                  </tbody>
                </table>
              </div>

              <div class="overflow-x-auto rounded bg-white flex-1 min-h-[140px]">
                <table class="w-full text-left">
                  <thead class="bg-neutral-100 font-bold uppercase text-[8px]">
                    <tr>
                      <th class="p-1.5">Agent</th>
                      <th class="p-1.5">Organ</th>
                      <th class="p-1.5">Cell</th>
                      <th class="p-1.5">CPI</th>
                    </tr>
                  </thead>
                  <tbody class="divide-y divide-neutral-100">
                    <Show when={pharmState.analysis.impacts.length > 0} fallback={
                      <tr>
                        <td colspan="4" class="p-3 text-center text-neutral-400 italic">Evaluating Prolog solver effects for current stack...</td>
                      </tr>
                    }>
                      <For each={pharmState.analysis.impacts}>
                        {(row) => (
                          <tr class="hover:bg-neutral-50">
                            <td class="p-1.5 font-bold">{row.drug}</td>
                            <td class="p-1.5">{row.organ}</td>
                            <td class="p-1.5">{row.cell}</td>
                            <td class="p-1.5 font-mono">{row.cpi}%</td>
                          </tr>
                        )}
                      </For>
                    </Show>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </Show>

        <Show when={activeTab() === 'dispersion'}>
          <div class="grid grid-cols-1 md:grid-cols-12 gap-1.5 flex-1 min-h-0">
            <div class="md:col-span-3 flex flex-col gap-1.5 min-h-0 overflow-y-auto pr-0.5">
              <section class="bg-white p-2 rounded flex flex-col gap-1 shrink-0">
                <div class="flex justify-between items-center">
                  <h2 class="font-bold text-black uppercase tracking-wider text-[8px]">Simulation Parameters</h2>
                  <button onClick={() => setTempUnit(u => u === 'K' ? 'C' : u === 'C' ? 'F' : 'K')} class="text-[7px] bg-neutral-100 px-1 py-0.2 rounded font-bold cursor-pointer">{tempUnit()}</button>
                </div>
                <div class="grid grid-cols-2 gap-1 text-[8px]">
                  <div>
                    <label class="block text-neutral-600 font-semibold">Duration: {state.seconds}s</label>
                    <input type="range" min="5" max="60" value={state.seconds} onInput={(e) => setState('seconds', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <label class="block text-neutral-600 font-semibold">FPS: {state.fps}</label>
                    <input type="range" min="15" max="60" step="15" value={state.fps} onInput={(e) => setState('fps', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <label class="block text-neutral-600 font-semibold">Velocity: {state.velocity}m/s</label>
                    <input type="range" min="10" max="50" step="0.5" value={state.velocity} onInput={(e) => setState('velocity', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div>
                    <label class="block text-neutral-600 font-semibold">Temp: {getDisplayTemp()}°</label>
                    <input type="range" min={tempUnit() === 'F' ? 10 : tempUnit() === 'C' ? -15 : 260} max={tempUnit() === 'F' ? 130 : tempUnit() === 'C' ? 55 : 330} step="1" value={tempUnit() === 'C' ? state.temp - 273.15 : tempUnit() === 'F' ? (state.temp - 273.15) * 9/5 + 32 : state.temp} onInput={(e) => handleTempInput(e.currentTarget.value)} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                  <div class="col-span-2">
                    <label class="block text-neutral-600 font-semibold">Humidity: {(state.humidity * 100).toFixed(0)}%</label>
                    <input type="range" min="0" max="1" step="0.05" value={state.humidity} onInput={(e) => setState('humidity', Number(e.currentTarget.value))} class="w-full accent-black h-1 cursor-pointer" />
                  </div>
                </div>
              </section>

              <section class="bg-white p-2 rounded flex flex-col shrink-0 gap-0.5">
                <div class="flex justify-between items-center text-[8px]">
                  <span class="text-neutral-500 font-mono">Frame Scrub</span>
                  <span class="text-neutral-700 font-mono font-bold">{state.currentFrame}/{totalFrames()}</span>
                </div>
                <input 
                  type="range" 
                  min="0" 
                  max={totalFrames()} 
                  value={state.currentFrame} 
                  onInput={(e) => setState('currentFrame', Number(e.currentTarget.value))} 
                  class="w-full accent-black h-1 cursor-pointer" 
                />
              </section>

              <section class="bg-white p-2.5 rounded flex-1 flex flex-col justify-between min-h-0">
                <div class="space-y-1 overflow-hidden flex flex-col h-full">
                  <h2 class="font-bold text-black uppercase tracking-wider text-[8px]">Formula ({state.selectedIngredients.length}/25)</h2>
                  
                  <div class="flex flex-col gap-1 max-h-24 overflow-y-auto bg-neutral-50 p-1 rounded shrink-0">
                    <Show when={state.selectedIngredients.length > 0} fallback={<span class="text-[8px] text-neutral-400 italic">No items selected.</span>}>
                      <For each={state.selectedIngredients}>
                        {(item) => (
                          <div class="bg-white p-1 rounded space-y-0.5">
                            <div class="flex items-center justify-between font-medium">
                              <div class="flex items-center gap-1 min-w-0 pr-1">
                                <input type="color" value={item.color} onInput={(e) => setState('selectedIngredients', i => i.cas === item.cas, 'color', e.currentTarget.value)} class="w-2.5 h-2.5 rounded border border-neutral-300 cursor-pointer p-0 bg-transparent shrink-0" title="Select color" />
                                <span class="break-words leading-tight font-bold" title={item.name}>{item.name}</span>
                              </div>
                              <button onClick={() => setState('selectedIngredients', state.selectedIngredients.filter(i => i.cas !== item.cas))} class="text-neutral-400 hover:text-black font-bold shrink-0 ml-1 cursor-pointer">×</button>
                            </div>
                            <div class="flex flex-wrap gap-0.5">
                              <For each={flavorTagsMap[item.name] || ['analyzing...']}>
                                {(tag) => (
                                  <span class="bg-neutral-100 text-[6px] px-1 py-0.1 rounded font-mono uppercase text-neutral-600">{tag}</span>
                                )}
                              </For>
                            </div>
                          </div>
                        )}
                      </For>
                    </Show>
                  </div>
                  <div class="relative shrink-0">
                    <input type="text" placeholder="Search ingredients..." value={state.searchQuery} onInput={(e) => setState('searchQuery', e.currentTarget.value)} class="w-full bg-neutral-50 rounded px-1.5 py-0.5 pr-4" />
                    <Show when={state.searchQuery}>
                      <button onClick={() => setState('searchQuery', '')} class="absolute right-1.5 top-1/2 -translate-y-1/2 text-neutral-400 hover:text-black text-[8px] font-bold cursor-pointer">✕</button>
                    </Show>
                  </div>
                  <div class="flex-1 overflow-y-auto space-y-0.5 min-h-0">
                    <For each={filteredIngredients()}>
                      {(ing) => (
                        <div onClick={() => addIngredient(ing)} class="bg-neutral-50 hover:bg-black hover:text-white px-1.5 py-0.5 rounded cursor-pointer transition" title={`Add ${ing.name}`}>
                          <div class="font-medium leading-tight">{ing.name}</div>
                        </div>
                      )}
                    </For>
                  </div>
                </div>

                <div class="space-y-1 mt-1 shrink-0">
                  <button onClick={randomizePerfume} class="w-full bg-neutral-100 hover:bg-black hover:text-white text-black font-semibold py-1 rounded transition cursor-pointer">🎲 Random Formula</button>
                  <Show when={state.selectedIngredients.length > 0}>
                    <div class="flex flex-col gap-0.5">
                      <span class="text-[7px] text-emerald-700 font-semibold text-center">{copyStatus()}</span>
                      <button onClick={copyFormulaToClipboard} class="w-full bg-neutral-50 hover:bg-neutral-100 text-black font-semibold py-0.5 rounded cursor-pointer">📋 Copy Formula & Tags</button>
                    </div>
                  </Show>
                  <button onClick={triggerRender} disabled={state.loading || !state.selectedIngredients.length} class="w-full bg-black hover:bg-neutral-800 disabled:opacity-50 text-white py-1.5 rounded font-bold transition cursor-pointer uppercase tracking-wider">{state.loading ? 'Rendering...' : 'Generate GIF'}</button>
                </div>
              </section>
            </div>

            <section class="md:col-span-6 bg-white p-2.5 rounded flex flex-col justify-between relative overflow-hidden min-h-0 border border-neutral-200">
              <div class="absolute top-3 right-3 z-30 flex items-center">
                <Show when={isParametersModified()}>
                  <span class="bg-amber-50 text-amber-900 border border-amber-300 text-[8px] font-bold px-2 py-0.5 rounded animate-pulse">
                    ⚠️ Parameters Modified
                  </span>
                </Show>
              </div>

              <div class="flex-1 flex flex-col items-center justify-center relative overflow-hidden min-h-0 w-full">
                <Show when={state.loading}>
                  <div class="space-y-1 text-center py-6">
                    <div class="inline-block w-5 h-5 border-2 border-black border-t-transparent rounded-full animate-spin"></div>
                    <p class="font-semibold text-black animate-pulse">{state.statusMessage}</p>
                  </div>
                </Show>

                <Show when={state.videoUrl && !state.loading}>
                  <div class="space-y-1 w-full h-full flex flex-col items-center justify-center relative">
                    <div class="rounded overflow-hidden bg-white flex items-center justify-center flex-1 w-full p-1 min-h-0 relative">
                      <img 
                        src={state.videoUrl} 
                        alt="Dispersion Simulation" 
                        class="absolute inset-0 w-full h-full object-contain pointer-events-none" 
                      />
                    </div>
                  </div>
                </Show>

                <Show when={!state.loading && !state.videoUrl}>
                  <div class="text-neutral-400 space-y-1 text-center py-8 relative w-full h-full flex flex-col items-center justify-center bg-neutral-50 rounded border border-neutral-200">
                    <p class="text-lg">🧪</p>
                    <p class="font-medium text-neutral-600">Configure formula and generate dispersion simulation.</p>
                  </div>
                </Show>
              </div>

              <Show when={state.selectedIngredients.length > 0}>
                <div class="mt-1 p-1.5 bg-neutral-50 border border-neutral-200 rounded flex flex-wrap gap-2 items-center justify-center shrink-0">
                  <span class="text-[7px] font-bold text-neutral-500 uppercase">Active Formula Legend:</span>
                  <For each={state.selectedIngredients}>
                    {(item, idx) => (
                      <div class="flex items-center gap-1 bg-white px-1.5 py-0.5 rounded border border-neutral-200">
                        <span class="w-2 h-2 rounded-full shrink-0" style={{ 'background-color': item.color || '#000' }}></span>
                        <span class="font-semibold text-neutral-800 text-[8px] truncate max-w-[100px]" title={item.name}>{item.name}</span>
                      </div>
                    )}
                  </For>
                </div>
              </Show>
            </section>

            <div class="md:col-span-3 flex flex-col gap-1.5 min-h-0">
              <section class="bg-white p-2.5 rounded flex-1 flex flex-col min-h-0">
                <div class="flex justify-between items-center mb-1 pb-0.5 border-b border-neutral-100 shrink-0">
                  <h2 class="font-bold text-black uppercase tracking-wider text-[8px]">History</h2>
                  <Show when={state.history.length > 0}>
                    <button onClick={() => { setState('history', []); localStorage.removeItem('perfume_render_history'); }} class="text-neutral-400 hover:text-black font-medium cursor-pointer text-[7px]">Clear</button>
                  </Show>
                </div>
                <div class="flex-1 overflow-y-auto space-y-0.5 pr-0.5 min-h-0">
                  <Show when={state.history.length > 0} fallback={<p class="text-neutral-400 italic text-center py-6">No past generations.</p>}>
                    <For each={state.history}>
                      {(item) => (
                        <div onClick={() => setState('videoUrl', item.url)} class={`p-1 rounded cursor-pointer transition flex items-center justify-between ${state.videoUrl === item.url ? 'bg-neutral-100 font-semibold' : 'bg-neutral-50 hover:bg-neutral-100'}`}>
                          <div class="truncate pr-1">
                            <div class="font-bold text-black flex items-center gap-1 text-[8px]">
                              <span>{item.timestamp}</span>
                              <span class="bg-neutral-200 px-1 py-0.1 rounded font-normal text-[7px]">{item.ingredientsCount} ing.</span>
                            </div>
                            <div class="text-[7px] text-neutral-500">{item.params.seconds}s • {item.params.velocity}m/s</div>
                          </div>
                          <a href={item.url} download class="text-neutral-500 hover:text-black p-0.5 text-[8px]">⬇️</a>
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

      <Show when={isFullScreenGrid()}>
        <div class="fixed inset-0 z-50 bg-white p-3 flex flex-col gap-2 overflow-y-auto">
          <div class="flex justify-between items-center pb-2 border-b border-neutral-200">
            <div>
              <h2 class="text-xs font-black uppercase tracking-wider text-black">Full-Screen Flame Grid Growth & Nutrition Matrix</h2>
              <p class="text-[8px] text-neutral-500 font-mono">Total Duration: {pharmState.days} Days | Target Mass: {pharmState.mass} kg | Active Stack Size: {pharmState.stack.length}</p>
            </div>
            <button onClick={() => setIsFullScreenGrid(false)} class="bg-black text-white px-3 py-1 rounded font-bold hover:bg-neutral-800 cursor-pointer text-[8px]">
              Exit Full Screen ✕
            </button>
          </div>

          <div class="flex flex-wrap gap-2 bg-neutral-50 p-2 rounded text-[8px] font-mono">
            <div><strong>Total Days:</strong> {pharmState.flameGrid.length}</div>
            <div><strong>Avg Calories:</strong> {Math.round(pharmState.flameGrid.reduce((a, c) => a + c.calories, 0) / Math.max(1, pharmState.flameGrid.length))} kcal</div>
            <div><strong>Avg Mass Target:</strong> {(pharmState.flameGrid.reduce((a, c) => a + c.massTarget, 0) / Math.max(1, pharmState.flameGrid.length)).toFixed(1)} kg</div>
          </div>

          <div class="flex-1 bg-neutral-50 p-2 rounded flex flex-col gap-2 overflow-y-auto">
            <div class="grid grid-cols-12 sm:grid-cols-24 md:grid-cols-32 lg:grid-cols-40 gap-0.5 p-1 bg-white rounded">
              <For each={pharmState.flameGrid}>
                {(cell) => {
                  const isSelected = pharmState.selectedDayData?.dayIndex === cell.dayIndex;
                  return (
                    <div 
                      onMouseEnter={() => setPharmState('selectedDayData', cell)}
                      onClick={() => setPharmState('selectedDayData', cell)}
                      class={`h-4 rounded cursor-pointer transition-all ${getCellColorCode(cell.load)} ${isSelected ? 'ring-1 ring-black scale-110 z-10' : 'hover:opacity-80'}`}
                      title={`Day ${cell.dayIndex} (${cell.dateStr}): Load ${cell.load}% | Target Mass: ${cell.massTarget}kg`}
                    ></div>
                  );
                }}
              </For>
            </div>

            <Show when={pharmState.selectedDayData}>
              <div class="bg-white p-2.5 rounded flex flex-col gap-1.5">
                <div class="flex justify-between items-center pb-1 border-b border-neutral-200">
                  <span class="font-bold uppercase tracking-wider text-black">
                    Inspection — {pharmState.selectedDayData.dateStr} (Day {pharmState.selectedDayData.dayIndex})
                  </span>
                  <div class="flex items-center gap-1.5">
                    <span class="font-mono bg-neutral-200 text-neutral-800 px-1.5 py-0.2 rounded">Mass Target: {pharmState.selectedDayData.massTarget} kg</span>
                    <span class="font-mono bg-black text-white px-1.5 py-0.2 rounded">Load Index: {pharmState.selectedDayData.load}%</span>
                  </div>
                </div>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-2 font-mono text-[8px]">
                  <div class="bg-neutral-50 p-1.5 rounded">
                    <span class="text-neutral-500 block uppercase">Calories</span>
                    <span class="font-bold text-black">{pharmState.selectedDayData.calories} kcal</span>
                  </div>
                  <div class="bg-neutral-50 p-1.5 rounded">
                    <span class="text-neutral-500 block uppercase">Protein</span>
                    <span class="font-bold text-black">{pharmState.selectedDayData.protein}g</span>
                  </div>
                  <div class="bg-neutral-50 p-1 rounded">
                    <span class="text-neutral-500 block uppercase">Carbohydrates</span>
                    <span class="font-bold text-black">{pharmState.selectedDayData.carbs}g</span>
                  </div>
                  <div class="bg-neutral-50 p-1 rounded">
                    <span class="text-neutral-500 block uppercase">Fats</span>
                    <span class="font-bold text-black">{pharmState.selectedDayData.fat}g</span>
                  </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-2 pt-0.5">
                  <div class="bg-neutral-50 p-1.5 rounded">
                    <span class="font-bold block uppercase text-[8px] text-neutral-500">Consumed Foods</span>
                    <span>{pharmState.selectedDayData.food}</span>
                  </div>
                  <div class="bg-neutral-50 p-1.5 rounded">
                    <span class="font-bold block uppercase text-[8px] text-neutral-500">Active Drugs / Stack</span>
                    <span class="font-mono">{pharmState.selectedDayData.drugs.join(', ')}</span>
                  </div>
                </div>
              </div>
            </Show>
          </div>
        </div>
      </Show>
    </div>
  );
}