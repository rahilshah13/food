% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 9: Chromatin Remodelers, MAPKs & Neuropeptide Receptors)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. HISTONE ACETYLTRANSFERASES & CHROMATIN REMODELERS
% ---------------------------------------------------------------------

druggable_target(ep300, 'EP300', enzyme, histone_acetyltransferase).
biological_resource(ep300, [ubiquitous_nuclear_compartments, proliferating_cells], transcriptional_coactivation_pathway, nucleus).
pharmacological_effect(ep300, small_molecule_inhibitor, catalytic_site_blockade, downregulation_of_oncogenic_transcription).

druggable_target(crebbp, 'CREBBP', enzyme, histone_acetyltransferase).
biological_resource(crebbp, [lymphocytes, brain_neurons, stem_cells], camp_response_element_binding_pathway, nucleus).
pharmacological_effect(crebbp, inhibitor, acetyl_coa_binding_pocket_competition, epigenetic_modulation_in_cancer).

druggable_target(smarca4, 'BRG1', enzyme, swi_snf_chromatin_remodeler).
biological_resource(smarca4, [ubiquitous_chromatin_complexes, cancer_cells], ATP_dependent_chromatin_remodeling, nucleus).
pharmacological_effect(smarca4, synthetic_lethal_target, atpase_domain_inhibition, disruption_of_tumor_transcriptional_dependency).

druggable_target(arid1a, 'ARID1A', enzyme, swi_snf_complex_subunit).
biological_resource(arid1a, [ovarian_epithelium, colorectal_mucosa, lymphocytes], chromatin_remodeling_assembly, nucleus).
pharmacological_effect(arid1a, synthetic_lethal_target, epigenetic_vulnerability_exploitation, PARP_inhibitor_synergy_in_deficient_cancers).

% ---------------------------------------------------------------------
% 2. ADDITIONAL MITOGEN-ACTIVATED & IMMUNE KINASES
% ---------------------------------------------------------------------

druggable_target(mapk14, 'p38_MAPK', kinase, serine_threonine_kinase).
biological_resource(mapk14, [macrophages, neutrophils, fibroblasts, immune_tissues], stress_activated_protein_kinase_pathway, cytoplasm_nucleus).
pharmacological_effect(mapk14, inhibitor, atp_competitive_active_site_blockade, suppression_of_pro_inflammatory_cytokine_biosynthesis).

druggable_target(mapk8, 'JNK1', kinase, serine_threonine_kinase).
biological_resource(mapk8, [brain, heart, liver, immune_cells], c_jun_n_terminal_kinase_pathway, cytoplasm_nucleus).
pharmacological_effect(mapk8, inhibitor, catalytic_site_occupancy, neuroprotection_and_reduction_of_apoptotic_signaling).

druggable_target(lck, 'LCK', kinase, non_receptor_tyrosine_kinase).
biological_resource(lck, [t_lymphocytes, natural_killer_cells], t_cell_receptor_proximal_signaling, inner_plasma_membrane).
pharmacological_effect(lck, inhibitor, atp_competitive_blockade, immunosuppression_in_autoimmune_disease).

druggable_target(zap70, 'ZAP70', kinase, non_receptor_tyrosine_kinase).
biological_resource(zap70, [t_cells, natural_killer_cells], immunoreceptor_tyrosine_based_activation_signaling, cytoplasm).
pharmacological_effect(zap70, inhibitor, kinase_domain_blockade, prevention_of_t_cell_activation).

druggable_target(pak1, 'PAK1', kinase, serine_threonine_kinase).
biological_resource(pak1, [brain, muscle, spleen, proliferating_tumor_cells], rho_gtpase_effector_pathway, cytoplasm_membrane).
pharmacological_effect(pak1, inhibitor, catalytic_site_inhibition, suppression_of_cancer_cell_motility_and_invasion).

% ---------------------------------------------------------------------
% 3. NEUROPEPTIDE AND HORMONE RECEPTORS (EXTENDED)
% ---------------------------------------------------------------------

druggable_target(crhr1, 'CRHR1', gpcr, neuropeptide_receptor).
biological_resource(crhr1, [pituitary_gland, amygdala, cerebral_cortex, immune_cells], hypothalamic_pituitary_adrenal_axis, plasma_membrane).
pharmacological_effect(crhr1, antagonist, g_s_signaling_blockade, anxiolytic_and_antidepressant_action).

druggable_target(gnrhr, 'GNRHR', gpcr, gonadotropin_receptor).
biological_resource(gnrhr, [pituitary_gonadotrophs], hypothalamic_pituitary_gonadal_axis, plasma_membrane).
pharmacological_effect(gnrhr, agonist_or_antagonist, desensitization_or_competitive_blockade, suppression_of_sex_hormone_production_in_oncology).

druggable_target(mchr1, 'MCHR1', gpcr, melanin_concentrating_hormone_receptor).
biological_resource(mchr1, [hypothalamus, limbic_system], energy_homeostasis_and_mood_regulation, plasma_membrane).
pharmacological_effect(mchr1, antagonist, g_i_coupled_pathway_inhibition, anti_obesity_and_antidepressant_modulation).

druggable_target(mc1r, 'MC1R', gpcr, melanocortin_receptor).
biological_resource(mc1r, [melanocytes, hair_follicles, immune_cells], pigmentation_and_anti_inflammatory_pathway, plasma_membrane).
pharmacological_effect(mc1r, agonist, g_s_camp_activation, UV_independent_pigmentation_and_immunomodulation).

% ---------------------------------------------------------------------
% 4. SOLUTE CARRIERS (SLC) & METABOLIC TRANSPORTERS (EXTENDED)
% ---------------------------------------------------------------------

druggable_target(slc19a1, 'RFC1', transporter, folate_transporter).
biological_resource(slc19a1, [placenta, liver, small_intestine, tumor_cells], reduced_folate_uptake_pathway, plasma_membrane).
pharmacological_effect(slc19a1, inhibitor, competitive_transport_blockade, modulation_of_antifolate_cytotoxicity).

druggable_target(slc47a1, 'MATE1', transporter, multi_drug_and_toxin_extrusion_protein).
biological_resource(slc47a1, [kidney_proximal_tubule_apical, liver_canalicular], renal_and_biliary_cation_efflux, plasma_membrane).
pharmacological_effect(slc47a1, inhibitor, transporter_occupancy_inhibition, alteration_of_metformin_renal_clearance).

druggable_target(slc22a5, 'OCTN2', transporter, organic_cation_transporter).
biological_resource(slc22a5, [skeletal_muscle, heart, kidney, intestine], carnitine_transporter_pathway, plasma_membrane).
pharmacological_effect(slc22a5, inhibitor, transport_blockade, alteration_of_cellular_fatty_acid_oxidation).
