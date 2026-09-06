% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 5: Cytochromes, Transporters & Orphan GPCRs)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. CYTOCHROME P450 ENZYMES & DRUG METABOLISM TARGETS
% ---------------------------------------------------------------------

druggable_target(cyp1a2, 'CYP1A2', enzyme, cytochrome_p450).
biological_resource(cyp1a2, [liver_hepatocytes, gastrointestinal_mucosa], xenobiotic_and_caffeine_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp1a2, inhibitor_or_inducer, catalytic_site_competition_or_transcription_upregulation, alteration_of_drug_clearance_and_toxicity).

druggable_target(cyp2c9, 'CYP2C9', enzyme, cytochrome_p450).
biological_resource(cyp2c9, [liver_hepatocytes], warfarin_and_nsaid_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp2c9, inhibitor, active_site_blockade, prolongation_of_anticoagulant_effect_and_drug_interactions).

druggable_target(cyp2c19, 'CYP2C19', enzyme, cytochrome_p450).
biological_resource(cyp2c19, [liver, small_intestine], proton_pump_inhibitor_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp2c19, inhibitor, catalytic_inhibition, enhanced_antiplatelet_efficacy_of_clopidogrel_or_metabolic_alteration).

druggable_target(cyp2d6, 'CYP2D6', enzyme, cytochrome_p450).
biological_resource(cyp2d6, [liver, brain_neurons], neuroactive_drug_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp2d6, inhibitor, competitive_active_site_occupancy, prevention_of_prodrug_activation_or_antidepressant_accumulation).

druggable_target(cyp3a4, 'CYP3A4', enzyme, cytochrome_p450).
biological_resource(cyp3a4, [liver_hepatocytes, enterocytes_of_small_intestine], major_xenobiotic_metabolism_pathway, endoplasmic_reticulum).
pharmacological_effect(cyp3a4, inhibitor_or_inducer, active_site_competition_or_receptor_mediated_induction, dramatic_alteration_of_oral_drug_bioavailability).

druggable_target(cyp3a5, 'CYP3A5', enzyme, cytochrome_p450).
biological_resource(cyp3a5, [liver, kidney, prostate], drug_and_steroid_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp3a5, inhibitor, enzymatic_blockade, modulation_of_immunosuppressant_clearance).

druggable_target(cyp2e1, 'CYP2E1', enzyme, cytochrome_p450).
biological_resource(cyp2e1, [liver, kidney, brain], ethanol_and_toxicant_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp2e1, inhibitor, catalytic_site_blocking, reduction_of_reactive_oxygen_species_and_hepatotoxicity).

druggable_target(cyp11b1, 'CYP11B1', enzyme, steroid_hydroxylase).
biological_resource(cyp11b1, [adrenal_cortex_zona_fasciculata], cortisol_biosynthesis_pathway, mitochondrial_inner_membrane).
pharmacological_effect(cyp11b1, inhibitor, enzymatic_blockade, suppression_of_cortisol_production_in_cushings_syndrome).

druggable_target(cyp11b2, 'CYP11B2', enzyme, steroid_hydroxylase).
biological_resource(cyp11b2, [adrenal_cortex_zona_glomerulosa], aldosterone_synthase_pathway, mitochondrial_inner_membrane).
pharmacological_effect(cyp11b2, inhibitor, selective_active_site_inhibition, reduction_of_aldosterone_synthesis_for_hypertension).

druggable_target(cyp17a1, 'CYP17a1', enzyme, steroid_hydroxylase).
biological_resource(cyp17a1, [adrenal_cortex, testes, ovaries], androgen_biosynthesis_pathway, endoplasmic_reticulum).
pharmacological_effect(cyp17a1, inhibitor, dual_hydroxylase_and_lyase_blockade, castrate_level_androgen_suppression_in_prostate_cancer).

% ---------------------------------------------------------------------
% 2. EXTENDED SOLUTE CARRIERS (SLCs) & DRUG TRANSPORTERS
% ---------------------------------------------------------------------

druggable_target(slc22a1, 'OCT1', transporter, organic_cation_transporter).
biological_resource(slc22a1, [liver_sinusoidal_membrane, enterocytes], hepatic_drug_uptake_pathway, plasma_membrane).
pharmacological_effect(slc22a1, inhibitor, transport_blockade, alteration_of_metformin_and_cationic_drug_disposition).

druggable_target(slc22a2, 'OCT2', transporter, organic_cation_transporter).
biological_resource(slc22a2, [kidney_proximal_tubule_basolateral], renal_cation_secretion, plasma_membrane).
pharmacological_effect(slc22a2, inhibitor, competitive_transporter_blockade, reduction_of_renal_clearance_of_cationic_drugs).

druggable_target(slc22a6, 'OAT1', transporter, organic_anion_transporter).
biological_resource(slc22a6, [kidney_proximal_tubule_basolateral], renal_organic_anion_secretion, plasma_membrane).
pharmacological_effect(slc22a6, inhibitor, transport_inhibition, decreased_renal_clearance_of_antivirals_and_diuretics).

druggable_target(slc22a8, 'OAT3', transporter, organic_anion_transporter).
biological_resource(slc22a8, [kidney_proximal_tubule, brain_choroid_plexus], organic_anion_transport, plasma_membrane).
pharmacological_effect(slc22a8, inhibitor, transport_blockade, drug_interaction_mitigation).

druggable_target(slco1b1, 'OATP1B1', transporter, organic_anion_transporting_polypeptide).
biological_resource(slco1b1, [liver_hepatocytes_sinusoidal], hepatic_statin_uptake_pathway, plasma_membrane).
pharmacological_effect(slco1b1, inhibitor, transporter_occupancy_blockade, elevated_plasma_statin_levels_and_myopathy_risk).

druggable_target(slco1b3, 'OATP1B3', transporter, organic_anion_transporting_polypeptide).
biological_resource(slco1b3, [liver_hepatocytes_basolateral], hepatic_uptake_of_endogenous_and_xenobiotic_compounds, plasma_membrane).
pharmacological_effect(slco1b3, inhibitor, transporter_inhibition, alteration_of_pharmacokinetics).

% ---------------------------------------------------------------------
% 3. METABOLIC CONJUGATION ENZYMES (UGTs)
% ---------------------------------------------------------------------

druggable_target(ugt1a1, 'UGT1A1', enzyme, glucuronosyltransferase).
biological_resource(ugt1a1, [liver_hepatocytes, intestinal_mucosa], bilirubin_and_drug_glucuronidation, endoplasmic_reticulum).
pharmacological_effect(ugt1a1, inhibitor, catalytic_conjugation_blockade, risk_of_irinotecan_toxicity_or_hyperbilirubinemia).

druggable_target(ugt2b7, 'UGT2B7', enzyme, glucuronosyltransferase).
biological_resource(ugt2b7, [liver, kidney], opioid_and_nsaid_glucuronidation, endoplasmic_reticulum).
pharmacological_effect(ugt2b7, inhibitor, enzymatic_inhibition, alteration_of_morphine_and_metabolite_clearance).

% ---------------------------------------------------------------------
% 4. METABOLIC SENSORS & ORPHAN GPCRS
% ---------------------------------------------------------------------

druggable_target(ffar1, 'GPR40', gpcr, free_fatty_acid_receptor).
biological_resource(ffar1, [pancreatic_beta_cells, enteroendocrine_cells], long_chain_free_fatty_acid_sensing, plasma_membrane).
pharmacological_effect(ffar1, agonist, g_q_coupled_calcium_influx_insulin_secretion, glucose_dependent_insulin_secretagogue_action).

druggable_target(ffar4, 'GPR120', gpcr, free_fatty_acid_receptor).
biological_resource(ffar4, [adipose_tissue, macrophages, gut_epithelium], anti_inflammatory_metabolic_signaling, plasma_membrane).
pharmacological_effect(ffar4, agonist, g_q_signaling_activation, anti_inflammatory_and_insulin_sensitizing_effect).

druggable_target(gpr119, 'GPR119', gpcr, lipid_metabolism_receptor).
biological_resource(gpr119, [pancreatic_beta_cells, intestinal_l_cells], oleoylethanolamide_signaling_pathway, plasma_membrane).
pharmacological_effect(gpr119, agonist, g_s_camp_elevation_incretin_release, stimulation_of_insulin_and_glp_1_secretion).

druggable_target(oxtr, 'OXTR', gpcr, oxytocin_receptor).
biological_resource(oxtr, [myometrium, myoepithelial_cells_of_breast, brain_limbic_system], uterine_contraction_pathway, plasma_membrane).
pharmacological_effect(oxtr, agonist_or_antagonist, g_q_phospholipase_c_modulation, labor_induction_or_tocolysis).

druggable_target(avpr1a, 'AVPR1A', gpcr, vasopressin_receptor).
biological_resource(avpr1a, [vascular_smooth_muscle, liver, brain, platelets], vasopressin_vascular_pathway, plasma_membrane).
pharmacological_effect(avpr1a, antagonist, g_q_pathway_blockade, vasodilation_blood_pressure_reduction).

druggable_target(avpr2, 'AVPR2', gpcr, vasopressin_receptor).
biological_resource(avpr2, [kidney_collecting_duct], antidiuretic_hormone_response_pathway, basolateral_plasma_membrane).
pharmacological_effect(avpr2, antagonist, g_s_adenylyl_cyclase_blockade, aquaresis_free_water_excretion_hyponatremia_treatment).
