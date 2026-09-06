% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 3: Immune Checkpoints, Cytokines & Growth Factor Receptors)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. IMMUNE CHECKPOINTS & COSTIMULATORY RECEPTORS
% ---------------------------------------------------------------------

druggable_target(pdcd1, 'PDCD1', receptor, immune_checkpoint).
biological_resource(pdcd1, [activated_t_cells, b_cells, natural_killer_cells], pd1_pd_l1_inhibitory_signaling, plasma_membrane).
pharmacological_effect(pdcd1, monoclonal_antibody_antagonist, steric_blockade_of_ligand_binding, restoration_of_t_cell_anti_tumor_immunity).

druggable_target(cd274, 'CD274', ligand, immune_checkpoint_ligand).
biological_resource(cd274, [tumor_cells, antigen_presenting_cells, endothelial_cells], immune_evasion_pathway, plasma_membrane).
pharmacological_effect(cd274, monoclonal_antibody_antagonist, neutralization_of_pd_l1, prevention_of_t_cell_exhaustion).

druggable_target(ctla4, 'CTLA4', receptor, immune_checkpoint).
biological_resource(ctla4, [regulatory_t_cells, activated_t_cells], cd28_competitive_inhibitory_pathway, plasma_membrane).
pharmacological_effect(ctla4, monoclonal_antibody_antagonist, receptor_blockade_and_treg_depletion, enhancement_of_t_cell_activation).

druggable_target(havcr2, 'HAVCR2', receptor, immune_checkpoint).
biological_resource(havcr2, [exhausted_t_cells, macrophages, dendritic_cells], tim3_galectin9_pathway, plasma_membrane).
pharmacological_effect(havcr2, monoclonal_antibody_antagonist, receptor_neutralization, reversal_of_immune_exhaustion).

druggable_target(lag3, 'LAG3', receptor, immune_checkpoint).
biological_resource(lag3, [activated_t_cells, natural_killer_cells, tregs], mhc_ii_inhibitory_signaling, plasma_membrane).
pharmacological_effect(lag3, monoclonal_antibody_antagonist, blockade_of_mhc_ii_interaction, synergy_with_pd1_inhibition).

druggable_target(tigit, 'TIGIT', receptor, immune_checkpoint).
biological_resource(tigit, [t_cells, natural_killer_cells], poliovirus_receptor_pathway, plasma_membrane).
pharmacological_effect(tigit, monoclonal_antibody_antagonist, competitive_receptor_blockade, enhancement_of_anti_tumor_cytotoxicity).

druggable_target(cd27, 'CD27', receptor, costimulatory_receptor).
biological_resource(cd27, [naive_and_memory_t_cells], cd70_costimulatory_pathway, plasma_membrane).
pharmacological_effect(cd27, agonist, receptor_clustering_and_nf_kb_activation, stimulation_of_t_cell_proliferation).

druggable_target(tnfrsf4, 'OX40', receptor, costimulatory_receptor).
biological_resource(tnfrsf4, [activated_t_cells], ox40_ox40l_signaling_pathway, plasma_membrane).
pharmacological_effect(tnfrsf4, agonist, costimulatory_receptor_activation, enhancement_of_effector_t_cell_survival).

druggable_target(tnfrsf9, '4-1BB', receptor, costimulatory_receptor).
biological_resource(tnfrsf9, [activated_t_cells, nk_cells], cd137_signaling_cascade, plasma_membrane).
pharmacological_effect(tnfrsf9, agonist, downstream_akt_signaling_activation, sustained_t_cell_survival_and_cytokine_release).

druggable_target(tnfrsf18, 'GITR', receptor, costimulatory_receptor).
biological_resource(tnfrsf18, [regulatory_t_cells, activated_effector_t_cells], gitr_signaling_pathway, plasma_membrane).
pharmacological_effect(tnfrsf18, agonist, costimulatory_activation_and_treg_modulation, anti_tumor_immune_response).

% ---------------------------------------------------------------------
% 2. CYTOKINES AND INTERLEUKIN RECEPTORS
% ---------------------------------------------------------------------

druggable_target(il1b, 'IL1B', cytokine, inflammatory_mediator).
biological_resource(il1b, [macrophages, monocytes, dendritic_cells], inflammasome_activation_pathway, extracellular_secreted).
pharmacological_effect(il1b, monoclonal_antibody_neutralizer, ligand_binding_blockade, reduction_of_systemic_inflammation_in_autoinflammatory_diseases).

druggable_target(il6, 'IL6', cytokine, interleukin).
biological_resource(il6, [macrophages, T_cells, adipocytes, endothelial_cells], jak_stat3_signaling_axis, extracellular_secreted).
pharmacological_effect(il6, monoclonal_antibody_neutralizer, cytokine_neutralization, mitigation_of_cytokine_release_syndrome_and_rheumatoid_arthritis).

druggable_target(il17a, 'IL17A', cytokine, interleukin).
biological_resource(il17a, [th17_cells, mast_cells, neutrophils], psoriasis_and_autoimmune_pathway, extracellular_secreted).
pharmacological_effect(il17a, monoclonal_antibody_neutralizer, direct_ligand_binding_inhibition, clearance_of_psoriatic_plaques_and_ankylosing_spondylitis_relief).

druggable_target(il12b, 'IL12B', cytokine, interleukin_subunit).
biological_resource(il12b, [dendritic_cells, macrophages], th1_th17_differentiation_pathway, extracellular_secreted).
pharmacological_effect(il12b, monoclonal_antibody_neutralizer, p40_subunit_blockade, suppression_of_autoimmune_inflammation).

druggable_target(il23a, 'IL23A', cytokine, interleukin).
biological_resource(il23a, [activated_dendritic_cells, macrophages], th17_maintenance_pathway, extracellular_secreted).
pharmacological_effect(il23a, monoclonal_antibody_neutralizer, selective_p19_subunit_blockade, targeted_inhibition_of_chronic_skin_and_bowel_inflammation).

druggable_target(il4r, 'IL4R', receptor, cytokine_receptor).
biological_resource(il4r, [b_cells, t_cells, myeloid_cells, epithelial_cells], th2_allergic_signaling_pathway, plasma_membrane).
pharmacological_effect(il4r, monoclonal_antibody_antagonist, dual_il4_il13_receptor_blockade, suppression_of_atopic_dermatitis_and_asthma).

druggable_target(il5, 'IL5', cytokine, interleukin).
biological_resource(il5, [th2_cells, type_2_innate_lymphoid_cells], eosinophil_differentiation_pathway, extracellular_secreted).
pharmacological_effect(il5, monoclonal_antibody_neutralizer, ligand_sequestration, depletion_of_blood_and_tissue_eosinophils).

druggable_target(il13, 'IL13', cytokine, interleukin).
biological_resource(il13, [th2_cells, mast_cells, basophils], mucosal_inflammation_pathway, extracellular_secreted).
pharmacological_effect(il13, monoclonal_antibody_neutralizer, cytokine_blockade, reduction_of_airway_hyperresponsiveness).

druggable_target(il2ra, 'CD25', receptor, interleukin_receptor).
biological_resource(il2ra, [activated_t_cells, regulatory_t_cells], high_affinity_il2_signaling, plasma_membrane).
pharmacological_effect(il2ra, monoclonal_antibody_antagonist, competitive_receptor_blockade, prevention_of_organ_transplant_rejection).

druggable_target(tnfa, 'TNF', cytokine, tumor_necrosis_factor).
biological_resource(tnfa, [macrophages, monocytes, T_cells, fibroblasts], systemic_inflammatory_cascade, extracellular_secreted).
pharmacological_effect(tnfa, monoclonal_antibody_neutralizer, trimeric_ligand_binding_blockade, suppression_of_rheumatoid_and_inflammatory_bowel_tissue_damage).

% ---------------------------------------------------------------------
% 3. ADDITIONAL GROWTH FACTOR & CELL SURFACE TARGETS
% ---------------------------------------------------------------------

druggable_target(vegfa, 'VEGFA', growth_factor, angiogenic_factor).
biological_resource(vegfa, [hypoxic_cells, tumor_cells, macrophages], angiogenesis_pathway, extracellular_secreted).
pharmacological_effect(vegfa, monoclonal_antibody_neutralizer, ligand_sequestration, inhibition_of_tumor_vascularization_and_macular_degeneration).

druggable_target(egfr_ext, 'EGFR_EXT', receptor, growth_factor_receptor).
biological_resource(egfr_ext, [epithelial_cells, carcinoma_cells], egf_signaling_axis, extracellular_domain).
pharmacological_effect(egfr_ext, monoclonal_antibody_antagonist, extracellular_domain_steric_blockade, inhibition_of_ligand_induced_receptor_activation).

druggable_target(cd20, 'MS4A1', receptor, B_cell_surface_antigen).
biological_resource(cd20, [pre_b_cells, mature_b_cells, memory_b_cells], b_cell_activation_and_calcium_flux, plasma_membrane).
pharmacological_effect(cd20, monoclonal_antibody_cytotoxic, complement_dependent_and_antibody_dependent_cytotoxicity, selective_depletion_of_b_cell_malignancies_and_autoimmune_cells).

druggable_target(cd3e, 'CD3E', receptor, t_cell_coreceptor).
biological_resource(cd3e, [mature_t_cells, thymocytes], t_cell_receptor_complex_signaling, plasma_membrane).
pharmacological_effect(cd3e, bispecific_antibody_engager, dual_target_bridging_t_cell_to_tumor_antigen, redirected_t_cell_mediated_cytolysis).

druggable_target(cd38, 'CD38', enzyme_receptor, cyclic_ADP_ribose_hydrolase).
biological_resource(cd38, [multiple_myeloma_cells, plasma_cells, activated_t_cells], calcium_signaling_and_adhesion, plasma_membrane).
pharmacological_effect(cd38, monoclonal_antibody_cytotoxic, fc_mediated_lysis_and_apoptosis, eradication_of_plasma_cell_dyscrasias).

druggable_target(cd19, 'CD19', receptor, b_cell_coreceptor).
biological_resource(cd19, [b_lineage_cells], pi3k_akt_b_cell_signaling_amplification, plasma_membrane).
pharmacological_effect(cd19, car_t_or_bispecific_target, cellular_immunotherapy_engagement, targeted_lysis_of_b_cell_malignancies).
