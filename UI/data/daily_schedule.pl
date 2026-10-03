% =====================================================================
% `tpl -g "daily_biological_pathways_schedule([]), halt." daily_schedule.pl`
% =====================================================================

:- forall(between(1, 12, I), (
    atom_concat('./targets_', I, P1),
    atom_concat(P1, '.pl', File),
    consult(File)
)).
:- consult('./pathways.pl').

:- dynamic(biological_process/3).
:- dynamic(process_pathway/2).
:- dynamic(process_lambda/3).
:- dynamic(arriving_signal/4).
:- dynamic(active_drug_concentration/3).

% ---------------------------------------------------------------------
% 1. SMILES PARSER & ISOMER ENGINE (E/Z Supported)
% ---------------------------------------------------------------------

is_upper(C) :- atom_codes(C, [Code]), Code >= 65, Code <= 90.
is_lower(C) :- atom_codes(C, [Code]), Code >= 97, Code <= 122.
is_digit(C) :- atom_codes(C, [Code]), Code >= 48, Code <= 57.

element(h, 1.008). element(c, 12.011). element(n, 14.007). element(o, 15.999).
element(f, 18.998). element(cl, 35.450). element(mg, 24.305).
aromatic(c). aromatic(n). aromatic(o). aromatic(s).

smiles_parse(S, graph(Atoms, Bonds)) :-
    string_chars(S, Cs), parse_stream(Cs, none, [], Atoms, Bonds).

parse_stream([], none, _, [], []) :- !.
parse_stream(Cs, Current, Pending, Atoms, Bonds) :-
    bond_prefix(Cs, Pending1, R1),
    atom_token(R1, Atom, R2),
    Atoms = [node(Next, Atom) | RestAtoms],
    Next = 1, % Simplified node mapping for structural validation
    (Current \= none -> Bonds = [edge(Current, Next, Pending1) | RestBonds] ; Bonds = RestBonds),
    parse_stream(R2, Next, none, RestAtoms, RestBonds).
parse_stream(_, _, _, [], []).

bond_prefix(['-'|R], single, R) :- !.
bond_prefix(['='|R], double, R) :- !.
bond_prefix(['#'|R], triple, R) :- !.
bond_prefix([':'|R], aromatic, R) :- !.
bond_prefix(['/'|R], up, R) :- !.     % E/Z Isomer representation (trans/cis)
bond_prefix(['\\'|R], down, R) :- !.  % E/Z Isomer representation (trans/cis)
bond_prefix(['~'|R], any, R) :- !.
bond_prefix(R, none, R).

atom_token(['['|R], atom(bracketed), Rest) :- append(_, [']'|Rest], R), !.
atom_token([A,B|R], atom(E), R) :- is_upper(A), is_lower(B), atom_chars(E, [A,B]), !.
atom_token([A|R], atom(E), R) :- is_upper(A), downcase_atom(A, E), !.
atom_token([A|R], atom(E), R) :- is_lower(A), atom_chars(E, [A]), !.
atom_token([C|R], atom(C), R).

% ---------------------------------------------------------------------
% 2. PHARMACOLOGICAL KNOWLEDGE BASE & CASCADE GRAPH
% ---------------------------------------------------------------------

% molecule_target(SMILES, TargetID, Mechanism, Params).
molecule_target('CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2', adra2a, orthosteric_agonist, [kd(0.5), emax(2.0)]).
molecule_target('CN1C(=O)CN=C(C2=C1C=CC(=C2)Cl)C3=CC=CC=C3', gaba_a_system, allosteric_pam, [kb(0.2), alpha(3.0), beta(1.5)]).
molecule_target('CC1=NN(C(=C1C(=O)NC2CCCCC2)C3=CC=C(C=C3)Cl)C4=CC(=CC(=C4)Cl)Cl', cb1_receptor, orthosteric_inverse_agonist, [kd(1.2), emax(-1.5)]).

% target_process(TargetID, HighLevelSystemID)
target_process(adra2a, hpa_stress_axis).
target_process(gaba_a_system, central_nervous_system).
target_process(cb1_receptor, appetite_satiety_axis).

% cascade_edge(SourceSystem, DestSystem, Mechanism, Params, DelayHours).
cascade_edge(hpa_stress_axis, immune_system, orthosteric_inverse_agonist, [kd(1.0), emax(-0.8)], 2).
cascade_edge(central_nervous_system, respiratory_system, orthosteric_inverse_agonist, [kd(0.5), emax(-0.4)], 1).
cascade_edge(appetite_satiety_axis, lipid_energy_mobilization, orthosteric_agonist, [kd(0.8), emax(1.0)], 3).

% ---------------------------------------------------------------------
% 3. PHARMACOKINETICS (PK) & PHARMACODYNAMICS (PD)
% ---------------------------------------------------------------------

estimate_pk_params(po, 1.2, 0.3, 50). 
estimate_pk_params(iv, 10.0, 0.8, 20). 

calculate_concentration(Dose, Route, AdminTime, EvalHour, Conc) :-
    estimate_pk_params(Route, Ka, Ke, Vd),
    Elapsed is (EvalHour - AdminTime + 24) mod 24,
    Conc is (Dose * Ka / (Vd * abs(Ka - Ke))) * (exp(-Ke * Elapsed) - exp(-Ka * Elapsed)).

calculate_mechanism_effect(Mechanism, Conc, Params, _Tone, Modifier) :-
    member(Mechanism, [orthosteric_agonist, orthosteric_inverse_agonist]),
    member(kd(Kd), Params),
    member(emax(Emax), Params),
    Modifier is (Emax * Conc) / (Conc + Kd).

calculate_mechanism_effect(allosteric_pam, Conc, Params, Tone, Modifier) :-
    member(kb(Kb), Params), member(alpha(Alpha), Params), member(beta(Beta), Params),
    BRatio is Conc / Kb,
    (Tone =< 0.1 -> Modifier = 0 ; 
        Numerator is Tone * (1 + Beta * BRatio),
        Denominator is Tone * (1 + Alpha * BRatio) + 1 * (1 + BRatio),
        Baseline is Tone / (Tone + 1),
        ModulatedState is Numerator / Denominator,
        Modifier is ModulatedState - Baseline
    ).

% ---------------------------------------------------------------------
% 4. TEMPORAL CASCADE ROUTING
% ---------------------------------------------------------------------

trigger_cascade(PrimaryTarget, Hour, InitialSignal) :-
    propagate_signal(PrimaryTarget, Hour, InitialSignal, [PrimaryTarget]).

propagate_signal(CurrentNode, CurrentHour, CurrentSignal, Visited) :-
    cascade_edge(CurrentNode, NextNode, _Mechanism, _Params, TimeDelay),
    \+ member(NextNode, Visited),
    NextHour is (CurrentHour + TimeDelay) mod 24,
    AttenuatedSignal is CurrentSignal * 0.6,
    abs(AttenuatedSignal) > 0.05,
    assertz(arriving_signal(CurrentNode, NextNode, NextHour, AttenuatedSignal)),
    propagate_signal(NextNode, NextHour, AttenuatedSignal, [NextNode | Visited]).

aggregate_cascades(DestNode, Hour, Tone, NetMod) :-
    findall(Mod,
        (
            arriving_signal(Source, DestNode, Hour, Signal),
            cascade_edge(Source, DestNode, Mech, Params, _),
            calculate_mechanism_effect(Mech, Signal, Params, Tone, Mod)
        ),
        ModList),
    sum_list(ModList, NetMod).

sum_list([], 0).
sum_list([H|T], Sum) :- sum_list(T, Rest), Sum is H + Rest.

% ---------------------------------------------------------------------
% 5. HIGH-LEVEL HUMAN BIOLOGICAL PROCESSES & SYSTEMS 
% ---------------------------------------------------------------------

biological_process(cardiovascular_system, 'Cardiovascular Hemodynamics & Vascular Tone', universal).
biological_process(respiratory_system, 'Respiratory Gas Exchange & Ventilation Control', universal).
biological_process(central_nervous_system, 'CNS Synaptic Plasticity & Neurotransmission', universal).
biological_process(endocrine_system, 'Endocrine Metabolic Homeostasis & Glycemic Control', universal).
biological_process(immune_system, 'Adaptive & Innate Immune Surveillance & Inflammation', universal).
biological_process(renal_urinary_system, 'Renal Filtration, Electrolyte & Fluid Balance', universal).
biological_process(gastrointestinal_system, 'Gastrointestinal Nutrient Processing & Motility', universal).
biological_process(musculoskeletal_system, 'Musculoskeletal Contraction, Repair & Mechanics', universal).
biological_process(integumentary_system, 'Integumentary Barrier, Repair & Thermoregulation', universal).
biological_process(male_reproductive_axis, 'Male Reproductive, Spermatogenic & Androgen Axis', male).
biological_process(female_reproductive_axis, 'Female Ovarian Cycle, Ovulation & Gestational Axis', female).
biological_process(hepatic_detox_system, 'Hepatic Xenobiotic Detoxification & P450 Metabolism', universal).
biological_process(lymphatic_system, 'Lymphatic Fluid Homeostasis & Immune Transport', universal).
biological_process(sensory_transduction_axis, 'Sensory Transduction (Visual, Auditory, Olfactory)', universal).
biological_process(cell_cycle_checkpoint_system, 'Cell Cycle, Proliferation & DNA Repair Checkpoints', universal).
biological_process(hpa_stress_axis, 'Hypothalamic-Pituitary-Adrenal (HPA) Stress Axis', universal).
biological_process(bone_remodeling_axis, 'Bone Remodeling & Mineral Homeostasis', universal).
biological_process(coagulation_hemostasis, 'Blood Coagulation & Hemostasis Cascade', universal).
biological_process(appetite_satiety_axis, 'Hypothalamic Appetite & Satiety Regulation', universal).
biological_process(iron_homeostasis_axis, 'Systemic Iron Homeostasis & Erythropoiesis', universal).
biological_process(autophagic_turnover, 'Autophagic Protein Quality Control & Turnover', universal).
biological_process(thermoregulation_axis, 'Autonomic Thermoregulation & Vasomotor Control', universal).
biological_process(matrix_remodeling_axis, 'Extracellular Matrix Remodeling & Fibrogenesis', universal).
biological_process(lipid_energy_mobilization, 'Systemic Lipid Mobilization & Beta-Oxidation', universal).
biological_process(epigenetic_regulation_axis, 'Epigenetic Chromatin Remodeling & Histone Dynamics', universal).
biological_process(mitochondrial_dynamics_axis, 'Mitochondrial Fission, Fusion & Quality Control', universal).
biological_process(unfolded_protein_response_axis, 'Endoplasmic Reticulum Stress & UPR Signaling', universal).
biological_process(ocular_aqueous_humor_axis, 'Ocular Aqueous Humor Dynamics & IOP Control', universal).
biological_process(mucosal_barrier_defense, 'Intestinal Mucosal Barrier & Tight Junction Maintenance', universal).
biological_process(adrenal_mineralocorticoid_axis, 'Adrenal Cortical Mineralocorticoid & Electrolyte Axis', universal).
biological_process(platelet_fibrinolysis_axis, 'Vascular Fibrinolysis & Clot Dissolution Cascade', universal).
biological_process(somatosensory_nociceptive_axis, 'Somatosensory Nociception & Pain Signaling Axis', universal).
biological_process(endothelial_nitric_oxide_axis, 'Endothelial Nitric Oxide & Vasodilatory Tone', universal).
biological_process(stem_cell_niche_maintenance, 'Stem Cell Niche Maintenance & Progenitor Renewal', universal).
biological_process(brown_adipose_thermogenesis, 'Brown Adipose Tissue Non-Shivering Thermogenesis', universal).
biological_process(hepatic_gluconeogenesis, 'Hepatic Gluconeogenesis & Glycogenolysis Axis', universal).
biological_process(salivary_mucosal_defense, 'Salivary Antimicrobial & Mucosal Defense', universal).
biological_process(pulmonary_surfactant_synthesis, 'Alveolar Surfactant Synthesis & Secretion', universal).
biological_process(intestinal_peristalsis_axis, 'Enteric Nervous System Peristalsis & Motility', universal).
biological_process(corneal_epithelial_turnover, 'Corneal Epithelial Renewal & Wound Healing', universal).
biological_process(testicular_leydig_steroidogenesis, 'Testicular Leydig Cell Steroidogenesis', male).
biological_process(ovarian_luteal_phase_axis, 'Ovarian Corpus Luteum Progesterone Axis', female).
biological_process(placental_gas_nutrient_transport, 'Placental Nutrient Transfer & Gas Exchange', female).
biological_process(megakaryopoiesis_platelet_shedding, 'Megakaryocyte Maturation & Platelet Shedding', universal).
biological_process(gastric_mucosal_cytoprotection, 'Gastric Mucosal Prostaglandin Cytoprotection', universal).
biological_process(renal_medullary_osmotic_gradient, 'Renal Medullary Osmotic Gradient Maintenance', universal).
biological_process(hippocampal_memory_consolidation, 'Hippocampal Synaptic Consolidation & Encoding', universal).
biological_process(melanogenesis_photoprotection, 'Epidermal Melanogenesis & UV Photoprotection', universal).
biological_process(keratinocyte_barrier_differentiation, 'Epidermal Keratinocyte Terminal Differentiation', universal).
biological_process(adrenal_catecholamine_surge, 'Adrenal Medullary Catecholamine Stress Surge', universal).
biological_process(thyroid_hormone_axis, 'Thyroid Axis & Basal Metabolic Rate Regulation', universal).
biological_process(prolactin_mammary_priming, 'Prolactin-Mediated Mammary Alveolar Priming', female).

% Mapping High-Level Processes to Canonical Pathways
process_pathway(cardiovascular_system, adrenergic_cardiomyocytes).
process_pathway(cardiovascular_system, vascular_smooth_muscle_contract).
process_pathway(cardiovascular_system, cardiac_muscle_contraction).
process_pathway(respiratory_system, hif_hypoxia).
process_pathway(respiratory_system, cellular_senescence).
process_pathway(central_nervous_system, long_term_potentiation).
process_pathway(central_nervous_system, camp_pka).
process_pathway(central_nervous_system, mapt_signaling).
process_pathway(endocrine_system, insulin_signaling).
process_pathway(endocrine_system, glucagon_signaling).
process_pathway(endocrine_system, type2_diabetes_mellitus).
process_pathway(immune_system, tlr4).
process_pathway(immune_system, nf_kb_signaling).
process_pathway(immune_system, th1_th2_differentiation).
process_pathway(renal_urinary_system, aldosterone_reabsorption).
process_pathway(renal_urinary_system, collecting_duct_water_reabs).
process_pathway(renal_urinary_system, proximal_tubule_bicarb).
process_pathway(gastrointestinal_system, salivary_secretion_pathway).
process_pathway(gastrointestinal_system, gastric_acid_secretion).
process_pathway(gastrointestinal_system, pancreatic_secretion_pathway).
process_pathway(musculoskeletal_system, fcal_adhesion).
process_pathway(musculoskeletal_system, calcium_signaling).
process_pathway(integumentary_system, msh_signaling).
process_pathway(integumentary_system, egfr).
process_pathway(male_reproductive_axis, prostate_cancer_pathway).
process_pathway(male_reproductive_axis, steroid_biosynthesis).
process_pathway(female_reproductive_axis, estrogen_signaling).
process_pathway(female_reproductive_axis, oxytocin_signaling).
process_pathway(hepatic_detox_system, cyp2b6).
process_pathway(hepatic_detox_system, cyp2a6).
process_pathway(hepatic_detox_system, abcb1).
process_pathway(lymphatic_system, leukocyte_migration).
process_pathway(lymphatic_system, complement_cascade).
process_pathway(sensory_transduction_axis, olfactory_transduction).
process_pathway(sensory_transduction_axis, phototransduction).
process_pathway(sensory_transduction_axis, taste_transduction).
process_pathway(cell_cycle_checkpoint_system, cell_cycle_checkpoint).
process_pathway(cell_cycle_checkpoint_system, p53_signaling_network).
process_pathway(cell_cycle_checkpoint_system, homologous_recombination).
process_pathway(hpa_stress_axis, camp_pka).
process_pathway(hpa_stress_axis, hif_hypoxia).
process_pathway(bone_remodeling_axis, calcium_signaling).
process_pathway(bone_remodeling_axis, parathyroid_hormone_synthesis).
process_pathway(coagulation_hemostasis, complement_coagulation).
process_pathway(coagulation_hemostasis, platelet_activation_pathway).
process_pathway(appetite_satiety_axis, ghrelin_metabolic_axis).
process_pathway(appetite_satiety_axis, adipocytokine_signaling).
process_pathway(iron_homeostasis_axis, hif_hypoxia).
process_pathway(iron_homeostasis_axis, porphyrin_metabolism).
process_pathway(autophagic_turnover, autophagy_pathway).
process_pathway(autophagic_turnover, ubiquitin_proteasome).
process_pathway(thermoregulation_axis, adipocytokine_signaling).
process_pathway(thermoregulation_axis, ppar_signaling).
process_pathway(matrix_remodeling_axis, fcal_adhesion).
process_pathway(matrix_remodeling_axis, mmp7).
process_pathway(lipid_energy_mobilization, fatty_acid_degradation).
process_pathway(lipid_energy_mobilization, ketone_body_metabolism).
process_pathway(epigenetic_regulation_axis, cell_cycle_checkpoint).
process_pathway(epigenetic_regulation_axis, pathways_in_cancer).
process_pathway(mitochondrial_dynamics_axis, oxidative_phosphorylation).
process_pathway(mitochondrial_dynamics_axis, tca_cycle).
process_pathway(unfolded_protein_response_axis, upr_signaling).
process_pathway(unfolded_protein_response_axis, ubiquitin_proteasome).
process_pathway(ocular_aqueous_humor_axis, calcium_signaling).
process_pathway(ocular_aqueous_humor_axis, cag_pathway).
process_pathway(mucosal_barrier_defense, tlr_signaling).
process_pathway(mucosal_barrier_defense, nf_kb_signaling).
process_pathway(adrenal_mineralocorticoid_axis, aldosterone_reabsorption).
process_pathway(adrenal_mineralocorticoid_axis, renin_angiotensin_system).
process_pathway(platelet_fibrinolysis_axis, complement_coagulation).
process_pathway(platelet_fibrinolysis_axis, platelet_activation_pathway).
process_pathway(somatosensory_nociceptive_axis, calcium_signaling).
process_pathway(somatosensory_nociceptive_axis, camp_pka).
process_pathway(endothelial_nitric_oxide_axis, vegf_signaling).
process_pathway(endothelial_nitric_oxide_axis, vascular_smooth_muscle_contract).
process_pathway(stem_cell_niche_maintenance, wnt_beta_catenin).
process_pathway(stem_cell_niche_maintenance, notch_signaling).
process_pathway(brown_adipose_thermogenesis, ppar_signaling).
process_pathway(brown_adipose_thermogenesis, adipocytokine_signaling).
process_pathway(hepatic_gluconeogenesis, glycolysis_gluconeogenesis).
process_pathway(hepatic_gluconeogenesis, glucagon_signaling).
process_pathway(salivary_mucosal_defense, salivary_secretion_pathway).
process_pathway(salivary_mucosal_defense, complement_cascade).
process_pathway(pulmonary_surfactant_synthesis, lipid_energy_mobilization).
process_pathway(pulmonary_surfactant_synthesis, fatty_acid_biosynthesis).
process_pathway(intestinal_peristalsis_axis, calcium_signaling).
process_pathway(corneal_epithelial_turnover, egfr).
process_pathway(corneal_epithelial_turnover, cell_cycle_checkpoint).
process_pathway(testicular_leydig_steroidogenesis, steroid_biosynthesis).
process_pathway(testicular_leydig_steroidogenesis, prostate_cancer_pathway).
process_pathway(ovarian_luteal_phase_axis, estrogen_signaling).
process_pathway(placental_gas_nutrient_transport, hif_hypoxia).
process_pathway(placental_gas_nutrient_transport, insulin_signaling).
process_pathway(megakaryopoiesis_platelet_shedding, platelet_activation_pathway).
process_pathway(megakaryopoiesis_platelet_shedding, hematopoietic_lineage).
process_pathway(gastric_mucosal_cytoprotection, arachidonic_acid).
process_pathway(gastric_mucosal_cytoprotection, gastric_acid_secretion).
process_pathway(renal_medullary_osmotic_gradient, collecting_duct_water_reabs).
process_pathway(renal_medullary_osmotic_gradient, aldosterone_reabsorption).
process_pathway(hippocampal_memory_consolidation, long_term_potentiation).
process_pathway(hippocampal_memory_consolidation, camp_pka).
process_pathway(melanogenesis_photoprotection, msh_signaling).
process_pathway(melanogenesis_photoprotection, egfr).
process_pathway(keratinocyte_barrier_differentiation, cell_cycle_checkpoint).
process_pathway(keratinocyte_barrier_differentiation, cellular_senescence).
process_pathway(adrenal_catecholamine_surge, camp_pka).
process_pathway(adrenal_catecholamine_surge, adrenergic_cardiomyocytes).
process_pathway(thyroid_hormone_axis, thyroid_signaling).
process_pathway(thyroid_hormone_axis, oxidative_phosphorylation).
process_pathway(prolactin_mammary_priming, prolactin_signaling).
process_pathway(prolactin_mammary_priming, oxytocin_signaling).

% Poisson rate parameterization (Peak Hour and Amplitude Lambda)
process_lambda(cardiovascular_system, 10, 8.5).
process_lambda(respiratory_system, 15, 6.0).
process_lambda(central_nervous_system, 21, 9.0).
process_lambda(endocrine_system, 8, 7.5).
process_lambda(immune_system, 13, 7.0).
process_lambda(renal_urinary_system, 5, 5.5).
process_lambda(gastrointestinal_system, 12, 8.0).
process_lambda(musculoskeletal_system, 16, 7.0).
process_lambda(integumentary_system, 11, 4.5).
process_lambda(male_reproductive_axis, 6, 5.0).
process_lambda(female_reproductive_axis, 14, 6.5).
process_lambda(hepatic_detox_system, 2, 8.5).
process_lambda(lymphatic_system, 12, 5.0).
process_lambda(sensory_transduction_axis, 14, 6.0).
process_lambda(cell_cycle_checkpoint_system, 3, 7.5).
process_lambda(hpa_stress_axis, 8, 8.0).
process_lambda(bone_remodeling_axis, 4, 4.5).
process_lambda(coagulation_hemostasis, 11, 6.5).
process_lambda(appetite_satiety_axis, 19, 7.0).
process_lambda(iron_homeostasis_axis, 6, 5.5).
process_lambda(autophagic_turnover, 3, 6.0).
process_lambda(thermoregulation_axis, 16, 5.0).
process_lambda(matrix_remodeling_axis, 13, 4.0).
process_lambda(lipid_energy_mobilization, 5, 7.5).
process_lambda(epigenetic_regulation_axis, 2, 6.5).
process_lambda(mitochondrial_dynamics_axis, 4, 7.0).
process_lambda(unfolded_protein_response_axis, 3, 6.0).
process_lambda(ocular_aqueous_humor_axis, 10, 4.5).
process_lambda(mucosal_barrier_defense, 12, 5.5).
process_lambda(adrenal_mineralocorticoid_axis, 8, 6.0).
process_lambda(platelet_fibrinolysis_axis, 14, 5.0).
process_lambda(somatosensory_nociceptive_axis, 16, 5.5).
process_lambda(endothelial_nitric_oxide_axis, 11, 7.0).
process_lambda(stem_cell_niche_maintenance, 1, 6.0).
process_lambda(brown_adipose_thermogenesis, 6, 6.5).
process_lambda(hepatic_gluconeogenesis, 4, 8.0).
process_lambda(salivary_mucosal_defense, 12, 5.0).
process_lambda(pulmonary_surfactant_synthesis, 7, 5.5).
process_lambda(intestinal_peristalsis_axis, 13, 6.5).
process_lambda(corneal_epithelial_turnover, 2, 4.0).
process_lambda(testicular_leydig_steroidogenesis, 6, 5.5).
process_lambda(ovarian_luteal_phase_axis, 14, 6.0).
process_lambda(placental_gas_nutrient_transport, 2, 7.0).
process_lambda(megakaryopoiesis_platelet_shedding, 11, 5.0).
process_lambda(gastric_mucosal_cytoprotection, 12, 6.0).
process_lambda(renal_medullary_osmotic_gradient, 5, 5.5).
process_lambda(hippocampal_memory_consolidation, 23, 7.5).
process_lambda(melanogenesis_photoprotection, 12, 4.5).
process_lambda(keratinocyte_barrier_differentiation, 1, 5.0).
process_lambda(adrenal_catecholamine_surge, 9, 8.5).
process_lambda(thyroid_hormone_axis, 8, 7.0).
process_lambda(prolactin_mammary_priming, 3, 6.0).

% ---------------------------------------------------------------------
% 6. POISSON INTENSITY, PK/PD MODULATION & ASCII FLAME GRAPH
% ---------------------------------------------------------------------

base_intensity(Lambda, Hour, BaseMag) :-
    PeakDist is abs(Hour - Lambda),
    WrappedDist is min(PeakDist, 24 - PeakDist),
    BaseMag is exp(-0.2 * WrappedDist) * Lambda.

% The new 4-arity poisson intensity engine that modulates baseline tone 
% using PK curves and temporal cascade routing.
poisson_intensity(ProcessID, Lambda, Hour, FinalMag) :-
    base_intensity(Lambda, Hour, BaseMag),
    
    % Get Direct PK/PD effects
    (active_drug_concentration(ProcessID, Hour, Conc) ->
        molecule_target(_, Target, Mech, Params),
        target_process(Target, ProcessID),
        calculate_mechanism_effect(Mech, Conc, Params, BaseMag, DirectMod)
    ;   DirectMod = 0
    ),
    
    % Get Arriving Cascading Network effects
    aggregate_cascades(ProcessID, Hour, BaseMag, CascadeMod),
    
    FinalMag is max(0, BaseMag + DirectMod + CascadeMod).

magnitude_to_char(Mag, Char) :-
    ( Mag < 0.5 -> Char = ' '
    ; Mag < 2.5 -> Char = '.'
    ; Mag < 5.0 -> Char = '-'
    ; Mag < 7.5 -> Char = '#'
    ; Char = '█'
    ).

% ---------------------------------------------------------------------
% 7. INPUT PROCESSOR & SCHEDULE SERIALIZATION
% ---------------------------------------------------------------------

process_drug_input(Smiles, DoseMass, Route, AdminTime) :-
    smiles_parse(Smiles, _Graph), 
    (molecule_target(Smiles, Target, Mech, Params) ->
        target_process(Target, Process),
        forall(between(0, 23, Hour), (
            calculate_concentration(DoseMass, Route, AdminTime, Hour, Conc),
            assertz(active_drug_concentration(Process, Hour, Conc)),
            
            % Use baseline median (e.g. Lambda = 8) to calculate initial trigger threshold
            base_intensity(8, Hour, BaseTone), 
            calculate_mechanism_effect(Mech, Conc, Params, BaseTone, Signal), 
            trigger_cascade(Process, Hour, Signal)
        ))
    ;   format('Warning: ~w not found in receptor DB.~n', [Smiles])
    ).

% Support execution via pure arity zero if called bare
daily_biological_pathways_schedule :- 
    daily_biological_pathways_schedule([]).

% Main execution engine: Tuple structure -> (SMILES, DoseMass, AdminRoute, AdminTime)
daily_biological_pathways_schedule(MoleculesList) :-
    retractall(arriving_signal(_,_,_,_)),
    retractall(active_drug_concentration(_,_,_)),
    
    forall(member((S, M, R, T), MoleculesList), process_drug_input(S, M, R, T)),

    write('====================================================================='), nl,
    write(' 24-HOUR POISSON-PARAMETERIZED HUMAN PHYSIOLOGY & FLAME GRAPH REPORT'), nl,
    write('====================================================================='), nl, nl,
    
    write('TIME WINDOWS: 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23'), nl,
    write('-------------------------------------------------------------------------------------'), nl,
    
    forall(
        biological_process(ProcessID, ProcessName, ProcSex),
        (
            process_lambda(ProcessID, _, Lambda),
            write('[ '), write(ProcSex), write(' ] '), write(ProcessName), nl,
            write('FLAME: ['),
            forall(between(0, 23, H), (
                poisson_intensity(ProcessID, Lambda, H, Mag),
                magnitude_to_char(Mag, C),
                write(C)
            )),
            write(']'), nl,
            forall(
                (
                    between(0, 23, Hour),
                    poisson_intensity(ProcessID, Lambda, Hour, RawMag),
                    RawMag > 3.0,
                    format(atom(MagStr), '~2f', [RawMag]),
                    process_pathway(ProcessID, PathwayID),
                    pathway(PathwayID, PathwayName),
                    (   pathway_edge(PathwayID, TargetID, _, Effect)
                    ;   pathway_edge(PathwayID, _, TargetID, Effect)
                    ),
                    druggable_target(TargetID, TargetName, _, _)
                ),
                format('  -> Hour ~|~`0t~d~2+ UTC | Pathway: ~w | Target: ~w (~w) | Effect: ~w | Intensity: ~w~n',
                       [Hour, PathwayName, TargetName, TargetID, Effect, MagStr])
            ),
            nl
        )
    ),
    write('====================================================================='), nl,
    write(' END OF FLAME GRAPH SCHEDULE SERIALIZATION'), nl,
    write('====================================================================='), nl.
