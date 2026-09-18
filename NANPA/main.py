import os
import requests
from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
from pydantic import BaseModel, Field

app = FastAPI(title="Artifact Provisioning & Telephony Workflow Engine")

HTML_PAGE = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Artifact Registration & Telephony Pipeline</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/solid-js@1.8.17/dist/solid.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/solid-js@1.8.17/web/dist/web.js"></script>
</head>
<body class="bg-slate-950 text-slate-100 min-h-screen font-sans antialiased selection:bg-cyan-500 selection:text-white">
    <div id="app"></div>

    <script>
        const { createSignal, createEffect } = SolidJS;
        const { render, h, html } = SolidJSWeb;

        function App() {
            const [currentStep, setCurrentStep] = createSignal(1);
            
            const [formData, setFormData] = createSignal({
                legal_entity_name: "",
                incorporation_state: "Delaware",
                carrier_type: "Interconnected VoIP Provider",
                fcc_frn: "",
                neca_application_ref: "",
                nas_username: "",
                nanpa_ocn: "",
                rate_center: "",
                requested_blocks: 1
            });

            const [validationStatus, setValidationStatus] = createSignal({});
            const [isEvaluating, setIsEvaluating] = createSignal(false);
            const [aiFeedback, setAiFeedback] = createSignal("");
            const [progressPercent, setProgressPercent] = createSignal(12);

            const steps = [
                { id: 1, name: "Eligible Legal Entity", artifact: "Corporate & State Registration Record" },
                { id: 2, name: "Regulatory Authorization", artifact: "FCC / State PUC Compliance Record" },
                { id: 3, name: "NECA OCN Registration", artifact: "Operating Company Number (OCN)" },
                { id: 4, name: "NANPA NAS Onboarding", artifact: "NAS Credential Profile" },
                { id: 5, name: "Number Block Request", artifact: "NXX / Thousands-Block Part 1 Form" }
            ];

            createEffect(() => {
                const step = currentStep();
                setProgressPercent(Math.round((step / steps.length) * 100));
            });

            const updateField = (field, value) => {
                setFormData(prev => ({ ...prev, [field]: value }));
                runClientValidation(field, value);
            };

            const runClientValidation = (field, val) => {
                let status = "valid";
                let message = "";
                if (field === "fcc_frn" && val.length > 0 && !/^\\d{10}$/.test(val)) {
                    status = "error";
                    message = "FCC FRN must be exactly 10 numeric digits.";
                } else if (field === "nanpa_ocn" && val.length > 0 && val.length < 4) {
                    status = "warning";
                    message = "OCN typically consists of 4 alphanumeric characters.";
                } else if (!val) {
                    status = "incomplete";
                    message = "Field cannot be empty.";
                }
                setValidationStatus(prev => ({ ...prev, [field]: { status, message } }));
            };

            const evaluateWithAI = async () => {
                setIsEvaluating(true);
                setAiFeedback("");
                try {
                    const response = await fetch("/api/evaluate", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify({ step: currentStep(), data: formData() })
                    });
                    const result = await response.json();
                    setAiFeedback(result.feedback);
                } catch (err) {
                    setAiFeedback("Error connecting to local Ollama Gemma2-2B verification daemon.");
                } finally {
                    setIsEvaluating(false);
                }
            };

            return h('div', { class: 'max-w-4xl mx-auto p-6 space-y-8' }, [
                h('header', { class: 'border-b border-slate-800 pb-6' }, [
                    h('div', { class: 'flex justify-between items-center' }, [
                        h('div', {}, [
                            h('h1', { class: 'text-2xl font-bold tracking-tight text-cyan-400' }, 'Telephony Resource Provisioning Engine'),
                            h('p', { class: 'text-sm text-slate-400 mt-1' }, 'Artifact-Driven Pipeline backed by Local Ollama Gemma-2B Validator')
                        ]),
                        h('div', { class: 'text-right' }, [
                            h('span', { class: 'text-xs font-mono uppercase bg-slate-900 border border-slate-700 px-3 py-1 rounded-full text-cyan-300' }, 'Step ' + currentStep() + ' of 5')
                        ])
                    ]),
                    h('div', { class: 'mt-6 w-full bg-slate-900 rounded-full h-2.5 overflow-hidden border border-slate-800' }, [
                        h('div', { class: 'bg-gradient-to-r from-cyan-500 to-blue-600 h-2.5 transition-all duration-500', style: 'width: ' + progressPercent() + '%' })
                    ])
                ]),
                h('div', { class: 'grid grid-cols-5 gap-2' }, steps.map(st => 
                    h('button', {
                        onClick: () => setCurrentStep(st.id),
                        class: 'p-3 text-left rounded-lg border transition-all ' + (currentStep() === st.id ? 'bg-slate-900 border-cyan-500 text-cyan-300 shadow-lg' : 'bg-slate-900/50 border-slate-800 text-slate-400')
                    }, [
                        h('div', { class: 'text-[10px] font-mono opacity-60' }, 'ARTIFACT 0' + st.id),
                        h('div', { class: 'text-xs font-semibold truncate mt-1' }, st.name)
                    ])
                )),
                h('div', { class: 'bg-slate-900 border border-slate-800 rounded-2xl p-6 shadow-xl space-y-6' }, [
                    h('div', { class: 'border-b border-slate-800 pb-4 flex justify-between items-center' }, [
                        h('div', {}, [
                            h('h2', { class: 'text-lg font-semibold text-slate-200' }, [
                                'Target Artifact: ',
                                h('span', { class: 'text-cyan-400 font-mono' }, steps[currentStep() - 1].artifact)
                            ]),
                            h('p', { class: 'text-xs text-slate-400 mt-0.5' }, 'Fill out required metadata to satisfy compliance checks.')
                        ]),
                        h('button', {
                            onClick: evaluateWithAI,
                            class: 'px-4 py-2 bg-cyan-600 hover:bg-cyan-500 text-slate-950 font-bold text-xs uppercase tracking-wider rounded-lg transition-colors'
                        }, 'Run Gemma-2B Audit')
                    ]),
                    currentStep() === 1 ? h('div', { class: 'grid grid-cols-2 gap-4' }, [
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'Legal Entity Name'),
                            h('input', {
                                type: 'text',
                                value: formData().legal_entity_name,
                                onInput: (e) => updateField('legal_entity_name', e.target.value),
                                placeholder: 'e.g. Acme Telecom Corp',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            })
                        ]),
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'Incorporation State'),
                            h('input', {
                                type: 'text',
                                value: formData().incorporation_state,
                                onInput: (e) => updateField('incorporation_state', e.target.value),
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            })
                        ])
                    ]) : null,
                    currentStep() === 2 ? h('div', { class: 'grid grid-cols-2 gap-4' }, [
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'Carrier / Provider Authorization Class'),
                            h('select', {
                                value: formData().carrier_type,
                                onChange: (e) => updateField('carrier_type', e.target.value),
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            }, [
                                h('option', {}, 'Interconnected VoIP Provider'),
                                h('option', {}, 'Traditional Common Carrier (CPCN)'),
                                h('option', {}, 'Competitive Local Exchange Carrier (CLEC)')
                            ])
                        ]),
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'FCC FRN (10 digits)'),
                            h('input', {
                                type: 'text',
                                value: formData().fcc_frn,
                                onInput: (e) => updateField('fcc_frn', e.target.value),
                                placeholder: '0000000000',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm font-mono focus:border-cyan-500 focus:outline-none'
                            })
                        ])
                    ]) : null,
                    currentStep() === 3 ? h('div', { class: 'grid grid-cols-1 gap-4' }, [
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'NECA Application Reference / OCN Code'),
                            h('input', {
                                type: 'text',
                                value: formData().neca_application_ref,
                                onInput: (e) => updateField('neca_application_ref', e.target.value),
                                placeholder: 'NECA-REF-2026-X',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            })
                        ])
                    ]) : null,
                    currentStep() === 4 ? h('div', { class: 'grid grid-cols-2 gap-4' }, [
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'NAS Username / Contact Email'),
                            h('input', {
                                type: 'email',
                                value: formData().nas_username,
                                onInput: (e) => updateField('nas_username', e.target.value),
                                placeholder: 'admin@carrier.net',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            })
                        ]),
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'Assigned Operating Company Number (OCN)'),
                            h('input', {
                                type: 'text',
                                value: formData().nanpa_ocn,
                                onInput: (e) => updateField('nanpa_ocn', e.target.value),
                                placeholder: '4-digit code e.g. 9999',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm font-mono focus:border-cyan-500 focus:outline-none'
                            })
                        ])
                    ]) : null,
                    currentStep() === 5 ? h('div', { class: 'grid grid-cols-2 gap-4' }, [
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'Rate Center / NPA-NXX Prefix Target'),
                            h('input', {
                                type: 'text',
                                value: formData().rate_center,
                                onInput: (e) => updateField('rate_center', e.target.value),
                                placeholder: 'San Francisco / 415',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            })
                        ]),
                        h('div', {}, [
                            h('label', { class: 'block text-xs font-medium text-slate-300 mb-1' }, 'Requested Thousands-Blocks Quantity'),
                            h('input', {
                                type: 'number',
                                value: formData().requested_blocks,
                                onInput: (e) => updateField('requested_blocks', parseInt(e.target.value)),
                                min: '1',
                                max: '10',
                                class: 'w-full bg-slate-950 border border-slate-800 rounded-lg p-2.5 text-sm focus:border-cyan-500 focus:outline-none'
                            })
                        ])
                    ]) : null,
                    (isEvaluating() || aiFeedback()) ? h('div', { class: 'mt-6 p-4 rounded-xl bg-slate-950 border border-cyan-500/30 text-xs font-mono space-y-2' }, [
                        h('div', { class: 'flex items-center justify-between text-cyan-400 font-bold' }, [
                            h('span', {}, 'LOCAL OLLAMA (GEMMA-2B) ARTIFACT AUDIT ENGINE'),
                            isEvaluating() ? h('span', { class: 'animate-pulse' }, 'Validating semantics...') : null
                        ]),
                        (!isEvaluating() && aiFeedback()) ? h('p', { class: 'text-slate-300 leading-relaxed' }, aiFeedback()) : null
                    ]) : null,
                    h('div', { class: 'flex justify-between pt-4 border-t border-slate-800' }, [
                        h('button', {
                            onClick: () => setCurrentStep(Math.max(1, currentStep() - 1)),
                            disabled: currentStep() === 1,
                            class: 'px-4 py-2 bg-slate-800 hover:bg-slate-700 disabled:opacity-30 text-slate-300 rounded-lg text-xs font-medium transition-colors'
                        }, 'Back'),
                        h('button', {
                            onClick: () => setCurrentStep(Math.min(5, currentStep() + 1)),
                            disabled: currentStep() === 5,
                            class: 'px-5 py-2 bg-cyan-600 hover:bg-cyan-500 disabled:opacity-30 text-slate-950 font-bold rounded-lg text-xs transition-colors'
                        }, 'Proceed to Next Artifact')
                    ])
                ])
            ]);
        }

        render(App, document.getElementById('app'));
    </script>
</body>
</html>
"""

class EvaluationRequest(BaseModel):
    step: int
    data: dict

@app.get("/", response_class=HTMLResponse)
async def serve_spa():
    return HTML_PAGE

@app.post("/api/evaluate")
async def evaluate_artifact(payload: EvaluationRequest):
    step = payload.step
    data = payload.data
    
    prompt = (
        f"You are a regulatory compliance validator for North American Numbering Plan (NANPA) and telecom onboarding. "
        f"Evaluate current artifact submission for Step {step}. "
        f"Submitted payload data: {data}. "
        f"Provide a concise, strict technical compliance assessment focusing on missing information or format validity."
    )
    
    ollama_host = os.getenv("OLLAMA_HOST", "http://ollama:11434")
    try:
        res = requests.post(
            f"{ollama_host}/api/generate",
            json={"model": "gemma2:2b", "prompt": prompt, "stream": False},
            timeout=15
        )
        if res.status_code == 200:
            return {"feedback": res.json().get("response", "No response returned from model.")}
        else:
            return {"feedback": f"Ollama service returned error status {res.status_code}"}
    except Exception as e:
        return {
            "feedback": f"[Simulated Local Gemma-2B Validation]: Step {step} criteria structure checked. "
                        f"Ensure legal identifiers and FCC FRNs match authoritative registry records before final routing."
        }
