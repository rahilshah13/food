% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 10: Rho Kinases, Ion Channels, Orphan Receptors & Transcription Factors)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. RHO-ASSOCIATED KINASES & SERINE/THREONINE KINASES (EXTENDED)
% ---------------------------------------------------------------------

druggable_target(rock1, 'ROCK1', kinase, serine_threonine_kinase).
biological_resource(rock1, [vascular_smooth_muscle, endothelium, platelets, brain], rho_signaling_cytoskeletal_remodeling, cytoplasm).
pharmacological_effect(rock1, inhibitor, atp_competitive_active_site_blockade, vasodilation_reduction_of_intraocular_pressure_anti_fibrotic).

druggable_target(rock2, 'ROCK2', kinase, serine_threonine_kinase).
biological_resource(rock2, [brain, vascular_smooth_muscle, microglia, immune_cells], actin_cytoskeleton_dynamics, cytoplasm_membrane).
pharmacological_effect(rock2, inhibitor, catalytic_site_occupancy, neuroprotection_and_vascular_tone_modulation).

druggable_target(pim1, 'PIM1', kinase, serine_threonine_kinase).
biological_resource(pim1, [hematopoietic_cells, prostate_epithelium, tumor_cells], cell_survival_and_proliferation_pathway, cytoplasm_nucleus).
pharmacological_effect(pim1, inhibitor, atp_competitive_blockade, suppression_of_myeloid_and_lymphoid_malignancies).

druggable_target(csnk2a1, 'CK2A1', kinase, serine_threonine_kinase).
biological_resource(csnk2a1, [ubiquitous_nuclear_and_cytoplasmic_compartments], pi3k_akt_and_wnt_signaling_modulation, nucleus_cytoplasm).
pharmacological_effect(csnk2a1, inhibitor, active_site_blocking, induction_of_tumor_cell_apoptosis).

druggable_target(map2k3, 'MEK3', kinase, serine_threonine_kinase).
biological_resource(map2k3, [skeletal_muscle, heart, immune_cells], p38_mapk_signaling_cascade, cytoplasm).
pharmacological_effect(map2k3, inhibitor, dual_specificity_kinase_blockade, anti_inflammatory_response_modulation).

druggable_target(map2k6, 'MEK6', kinase, serine_threonine_kinase).
biological_resource(map2k6, [ubiquitous_tissues, leukocytes], stress_activated_protein_kinase_signaling, cytoplasm).
pharmacological_effect(map2k6, inhibitor, catalytic_site_inhibition, suppression_of_stress_mediated_cytokine_release).

% ---------------------------------------------------------------------
% 2. EXTENDED ION CHANNELS & MEMBRANE TRANSPORTERS
% ---------------------------------------------------------------------

druggable_target(kcnma1, 'BKCa', ion_channel, calcium_activated_potassium_channel).
biological_resource(kcnma1, [smooth_muscle, neurons, skeletal_muscle], membrane_hyperpolarization_pathway, plasma_membrane).
pharmacological_effect(kcnma1, opener_or_blocker, channel_conductance_modulation, smooth_muscle_relaxation_or_neuronal_excitability_tuning).

druggable_target(trpm4, 'TRPM4', ion_channel, trp_channel).
biological_resource(trpm4, [heart, prostate, immune_cells, brain], calcium_activated_sodium_current, plasma_membrane).
pharmacological_effect(trpm4, inhibitor, pore_blockade, cardioprotection_and_suppression_of_immune_activation).

druggable_target(trpv4, 'TRPV4', ion_channel, trp_channel).
biological_resource(trpm4, [endothelium, kidney_tubules, sensory_neurons], osmosensing_and_mechanotransduction, plasma_membrane).
pharmacological_effect(trpv4, antagonist, channel_inhibition, mitigation_of_pulmonary_edema_and_pain_signaling).

druggable_target(clcn1, 'CLCN1', ion_channel, voltage_gated_chloride_channel).
biological_resource(clcn1, [skeletal_muscle_sarcolemma], muscle_membrane_stabilization, plasma_membrane).
pharmacological_effect(clcn1, blocker, pore_occupancy, induction_of_myotonia_as_pharmacological_model).

druggable_target(slc12a2, 'NKCC1', transporter, ion_cotransporter).
biological_resource(slc12a2, [choroid_plexus, secretory_epithelia, vascular_smooth_muscle], sodium_potassium_2chloride_cotransport, basolateral_membrane).
pharmacological_effect(slc12a2, inhibitor, loop_diuretic_binding_blockade, reduction_of_neuronal_chloride_accumulation_and_edema).

% ---------------------------------------------------------------------
% 3. ADDITIONAL GPCRS & NEUROTRANSMITTER RECEPTORS
% ---------------------------------------------------------------------

druggable_target(galr1, 'GALR1', gpcr, galanin_receptor).
biological_resource(galr1, [central_nervous_system, dorsal_root_ganglia, intestine], inhibitory_neuropeptide_signaling, plasma_membrane).
pharmacological_effect(galr1, agonist, g_i_coupled_neuronal_inhibition, antinociception_and_seizure_suppression).

druggable_target(galr2, 'GALR2', gpcr, galanin_receptor).
biological_resource(galr2, [brain_hippocampus, hypothalamus, sympathetic_ganglia], trophic_and_excitatory_galanin_pathway, plasma_membrane).
pharmacological_effect(galr2, agonist, g_q_phospholipase_c_activation, neuroprotection_and_mood_regulation).

druggable_target(htr1f, 'HTR1F', gpcr, serotonin_receptor).
biological_resource(htr1f, [trigeminal_ganglia, cerebral_cortex], cranial_vasodilation_inhibition, plasma_membrane).
pharmacological_effect(htr1f, agonist, g_i_coupled_presynaptic_inhibition, acute_migraine_treatment_without_vasoconstriction).

druggable_target(mchr2, 'MCHR2', gpcr, melanin_concentrating_hormone_receptor).
biological_resource(mchr2, [frontal_cortex, amygdala, nucleus_accumbens], human_energy_balance_circuitry, plasma_membrane).
pharmacological_effect(mchr2, antagonist, g_protein_signaling_blockade, anti_obesity_and_anxiolytic_action).

% ---------------------------------------------------------------------
% 4. TRANSCRIPTION FACTORS & NUCLEAR ORPHANS
% ---------------------------------------------------------------------

druggable_target(nr4a1, 'NUR77', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr4a1, [ubiquitous_induced_tissues, macrophages, cancer_cells], apoptosis_and_inflammation_modulation, nucleus_mitochondria).
pharmacological_effect(nr4a1, agonist_or_modulator, nuclear_translocation_and_transcription_activation, induction_of_cancer_cell_apoptosis).

druggable_target(stat3, 'STAT3', transcription_factor, signal_transducer).
biological_resource(stat3, [ubiquitous_cytoplasmic_compartments, tumor_cells], jak_stat_oncogenic_signaling, cytoplasm_to_nucleus).
pharmacological_effect(stat3, small_molecule_inhibitor, sh2_domain_dimerization_blockade, suppression_of_tumor_survival_and_immune_evasion).
