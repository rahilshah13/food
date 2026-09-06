% =====================================================================
% COMPREHENSIVE HUMAN DRUGGABLE PROTEOME DATABASE (Batch 8: DNA Repair Enzymes, GTPases & Deubiquitinases)
% Trealla Prolog Compliant Exhaustive Serialization
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. DNA REPAIR ENZYMES AND GENOMIC STABILITY TARGETS
% ---------------------------------------------------------------------

druggable_target(parp1, 'PARP1', enzyme, dna_repair_enzyme).
biological_resource(parp1, [nucleus_ubiquitous, lymphocytes, proliferating_cells], base_excision_repair_pathway, nucleus).
pharmacological_effect(parp1, catalytic_inhibitor, nad_plus_site_blockade, synthetic_lethality_in_brca_mutated_cancers).

druggable_target(parp2, 'PARP2', enzyme, dna_repair_enzyme).
biological_resource(parp2, [bone_marrow, testis, epithelial_cells], single_strand_break_repair, nucleus).
pharmacological_effect(parp2, inhibitor, active_site_competition, enhancement_of_genomic_instability_in_tumor_cells).

druggable_target(atm, 'ATM', kinase, serine_threonine_kinase).
biological_resource(atm, [cerebellar_neurons, lymphocytes, thymocytes], dna_double_strand_break_response, nucleus).
pharmacological_effect(atm, inhibitor, atp_competitive_blockade, radiosensitization_and_cell_cycle_checkpoint_abrogation).

druggable_target(atr, 'ATR', kinase, serine_threonine_kinase).
biological_resource(atr, [proliferating_cells, germ_cells], replication_stress_response_pathway, nucleus).
pharmacological_effect(atr, inhibitor, kinase_domain_occupancy, induction_of_replication_catastrophe_in_p53_deficient_tumors).

druggable_target(prkdc, 'DNA-PK', kinase, serine_threonine_kinase).
biological_resource(prkdc, [lymphocytes, ubiquitous_nuclear_compartments], non_homologous_end_joining_pathway, nucleus).
pharmacological_effect(prkdc, inhibitor, catalytic_site_blockade, inhibition_of_dna_repair_and_enhancement_of_radiotherapy).

druggable_target(wech1, 'WEE1', kinase, serine_threonine_kinase).
biological_resource(wech1, 'WEE1', cell_cycle_regulator, tyrosine_kinase).
biological_resource(wech1, [thymus, testis, proliferating_tumor_cells], g2_m_cell_cycle_checkpoint_control, nucleus).
pharmacological_effect(wech1, inhibitor, atp_competitive_inhibition, premature_mitotic_entry_and_synthetic_lethality).

druggable_target(pkmyt1, 'PKMYT1', kinase, serine_threonine_kinase).
biological_resource(pkmyt1, [embryonic_tissues, proliferating_cancers], cdc2_cyclin_b_phosphorylation_pathway, nucleus_membrane).
pharmacological_effect(pkmyt1, inhibitor, selective_catalytic_blockade, induction_of_mitotic_catastrophe).

% ---------------------------------------------------------------------
% 2. DEUBIQUITINATING ENZYMES (DUBS) & PROTEASE REGULATORS
% ---------------------------------------------------------------------

druggable_target(usp7, 'USP7', enzyme, deubiquitinase).
biological_resource(usp7, [nucleus_ubiquitous, tumor_cells, neurons], p53_mdm2_homeostasis_pathway, nucleus).
pharmacological_effect(usp7, inhibitor, catalytic_cysteine_alkylation, stabilization_of_p53_and_degradation_of_oncogenic_substrates).

druggable_target(usp1, 'USP1', enzyme, deubiquitinase).
biological_resource(usp1, [bone_marrow, proliferating_cells], fanconi_anemia_dna_repair_pathway, nucleus).
pharmacological_effect(usp1, inhibitor, enzymatic_inhibition, sensitization_of_cancer_cells_to_dna_crosslinking_agents).

druggable_target(uchl1, 'UCHL1', enzyme, deubiquitinase).
biological_resource(uchl1, [central_nervous_system_neurons, testis, ovaries], neuronal_protein_recycling_pathway, cytoplasm).
pharmacological_effect(uchl1, modulator, catalytic_activity_modulation, neuroprotection_or_cancer_cell_proliferation_suppression).

% ---------------------------------------------------------------------
% 3. ONCOGENIC GTPases AND SMALL SIGNALING PROTEINS
% ---------------------------------------------------------------------

druggable_target(kras, 'KRAS', gtpase, small_gtpase).
biological_resource(kras, [ubiquitous_epithelial_cells, pancreatic_duct, colorectal_mucosa], mapk_pi3k_signaling_initiator, inner_plasma_membrane).
pharmacological_effect(kras, covalent_inhibitor, g12c_switch_ii_pocket_alkylation, locking_in_inactive_GDP_bound_state_halting_signaling).

druggable_target(nras, 'NRAS', gtpase, small_gtpase).
biological_resource(nras, [hematopoietic_cells, melanocytes], growth_factor_receptor_transduction, inner_plasma_membrane).
pharmacological_effect(nras, modulator, downstream_effector_blocking, inhibition_of_melanoma_proliferation).

druggable_target(hras, 'HRAS', gtpase, small_gtpase).
biological_resource(hras, [skeletal_muscle, kidney, brain], cellular_proliferation_signaling, inner_plasma_membrane).
pharmacological_effect(hras, inhibitor, farnesyl_transferase_blockade_indirect, prevention_of_membrane_localization).

% ---------------------------------------------------------------------
% 4. EXTENDED PHOSPHODIESTERASES (PDES)
% ---------------------------------------------------------------------

druggable_target(pde1a, 'PDE1A', enzyme, phosphodiesterase).
biological_resource(pde1a, [brain, heart, vascular_smooth_muscle], calcium_calmodulin_dependent_camp_cgmp_hydrolysis, cytoplasm).
pharmacological_effect(pde1a, inhibitor, catalytic_blockade, neuroprotection_and_cardiovascular_modulation).

druggable_target(pde2a, 'PDE2A', enzyme, phosphodiesterase).
biological_resource(pde2a, [brain_cortex, hippocampus, heart_myocytes], dual_cyclic_nucleotide_hydrolysis, cytoplasm).
pharmacological_effect(pde2a, inhibitor, active_site_competition, cognitive_enhancement_and_cardiac_inotropy).

druggable_target(pde7a, 'PDE7A', enzyme, phosphodiesterase).
biological_resource(pde7a, [t_lymphocytes, skeletal_muscle, brain], camp_specific_hydrolysis, cytoplasm).
pharmacological_effect(pde7a, inhibitor, selective_camp_elevation, immunosuppression_and_anti_inflammatory_action).

druggable_target(pde10a, 'PDE10A', enzyme, phosphodiesterase).
biological_resource(pde10a, [striatum_medium_spiny_neurons], basal_ganglia_cyclic_nucleotide_signaling, cytoplasm).
pharmacological_effect(pde10a, inhibitor, catalytic_site_blockade, antipsychotic_action_in_schizophrenia).

% ---------------------------------------------------------------------
% 5. NUCLEAR RECEPTOR CORE REGULATORS & ORPHANS
% ---------------------------------------------------------------------

druggable_target(esrrg, 'ERRG', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(esrrg, [heart, kidney, skeletal_muscle, liver], mitochondrial_energy_metabolism_pathway, nucleus).
pharmacological_effect(esrrg, inverse_agonist, transcriptional_repression_of_metabolic_genes, anti_fibrotic_and_metabolic_regulation).

druggable_target(rora, 'RORA', nuclear_receptor, retinoid_related_orphan_receptor).
biological_resource(rora, [cerebellum, skeletal_muscle, skin, immune_cells], circadian_rhythm_and_lipid_metabolism, nucleus).
pharmacological_effect(rora, agonist_or_antagonist, transcriptional_modulation, anti_inflammatory_and_autoimmune_disease_mitigation).
