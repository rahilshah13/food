% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 6: Chemokine Receptors, Epigenetic Readers & Phosphatases)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. CHEMOKINE RECEPTORS
% ---------------------------------------------------------------------

druggable_target(ccr2, 'CCR2', gpcr, chemokine_receptor).
biological_resource(ccr2, [monocytes, macrophages, t_cells, smooth_muscle], monocyte_chemoattractant_protein_pathway, plasma_membrane).
pharmacological_effect(ccr2, antagonist, g_i_coupled_chemotaxis_blockade, anti_inflammatory_reduction_of_macrophage_infiltration).

druggable_target(ccr5, 'CCR5', gpcr, chemokine_receptor).
biological_resource(ccr5, [memory_t_cells, macrophages, dendritic_cells], inflammatory_chemokine_signaling_and_hiv_coreceptor, plasma_membrane).
pharmacological_effect(ccr5, antagonist_or_blocker, allosteric_receptor_occupancy, hiv_entry_prevention_and_immuno_modulation).

druggable_target(cxcr1, 'CXCR1', gpcr, chemokine_receptor).
biological_resource(cxcr1, [neutrophils, tumor_microenvironment], interleukin_8_signaling_pathway, plasma_membrane).
pharmacological_effect(cxcr1, antagonist, g_i_signaling_inhibition, suppression_of_neutrophil_recruitment_and_tumor_metastasis).

druggable_target(cxcr2, 'CXCR2', gpcr, chemokine_receptor).
biological_resource(cxcr2, [neutrophils, endothelial_cells, myeloid_suppressor_cells], angiogenesis_and_neutrophil_chemotaxis, plasma_membrane).
pharmacological_effect(cxcr2, antagonist, receptor_occupancy_blockade, reduction_of_inflammation_and_tumor_angiogenesis).

druggable_target(cxcr4, 'CXCR4', gpcr, chemokine_receptor).
biological_resource(cxcr4, [hematopoietic_stem_cells, lymphocytes, cancer_cells], sdf_1_cxcl12_homing_pathway, plasma_membrane).
pharmacological_effect(cxcr4, antagonist, competitive_binding_blockade, mobilization_of_stem_cells_and_inhibition_of_tumor_metastasis).

druggable_target(ccr4, 'CCR4', gpcr, chemokine_receptor).
biological_resource(ccr4, [regulatory_t_cells, th2_cells, cutaneous_t_cell_lymphoma], skin_homing_chemokine_pathway, plasma_membrane).
pharmacological_effect(ccr4, monoclonal_antibody_antagonist, fc_mediated_depletion_or_blockade, depletion_of_malignant_t_cells_and_tregs).

% ---------------------------------------------------------------------
% 2. NEUROPEPTIDE AND HORMONE GPCRS
% ---------------------------------------------------------------------

druggable_target(npy1r, 'NPY1R', gpcr, neuropeptide_receptor).
biological_resource(npy1r, [hypothalamus, cerebral_cortex, vascular_smooth_muscle], neuropeptide_y_feeding_pathway, plasma_membrane).
pharmacological_effect(npy1r, antagonist, g_i_signaling_blockade, appetite_suppression_vasoconstriction_modulation).

druggable_target(npy5r, 'NPY5R', gpcr, neuropeptide_receptor).
biological_resource(npy5r, [hypothalamus, limbic_system], energy_homeostasis_pathway, plasma_membrane).
pharmacological_effect(npy5r, antagonist, receptor_occupancy_blockade, reduction_of_food_intake_and_body_weight).

druggable_target(mc4r, 'MC4R', gpcr, melanocortin_receptor).
biological_resource(mc4r, [hypothalamus_paraventricular_nucleus, brainstem], leptin_melanocortin_energy_balance_pathway, plasma_membrane).
pharmacological_effect(mc4r, agonist, g_s_camp_signaling_activation, suppression_of_appetite_and_weight_loss_induction).

druggable_target(sst1, 'SSTR2', gpcr, somatostatin_receptor).
biological_resource(sst1, [pituitary_gland, neuroendocrine_tumors, gastrointestinal_tract], somatostatin_inhibitory_pathway, plasma_membrane).
pharmacological_effect(sst1, agonist, g_i_adenylyl_cyclase_inhibition_growth_hormone_suppression, reduction_of_endocrine_tumor_hormone_secretion).

druggable_target(pth1r, 'PTH1R', gpcr, parathyroid_hormone_receptor).
biological_resource(pth1r, [bone_osteoblasts, kidney_distal_tubule], calcium_and_phosphate_homeostasis, plasma_membrane).
pharmacological_effect(pth1r, agonist, g_s_g_q_dual_signaling_activation, bone_formation_or_resorption_depending_on_pulsatility).

% ---------------------------------------------------------------------
% 3. EPIGENETIC READERS AND LYSINE DEMETHYLASES
% ---------------------------------------------------------------------

druggable_target(brd2, 'BRD2', epigenetic_reader, bromodomain_protein).
biological_resource(brd2, [ubiquitous_nuclear_chromatin, hematopoietic_cells], transcriptional_coactivation_pathway, nucleus).
pharmacological_effect(brd2, small_molecule_inhibitor, acetyl_lysine_recognition_pocket_competition, downregulation_of_myc_and_inflammatory_genes).

druggable_target(brd3, 'BRD3', epigenetic_reader, bromodomain_protein).
biological_resource(brd3, [chromatin_complexes, bone_marrow], gene_transcription_regulation, nucleus).
pharmacological_effect(brd3, small_molecule_inhibitor, bromodomain_displacement, transcriptional_repression_in_cancer).

druggable_target(brd4, 'BRD4', epigenetic_reader, bromodomain_protein).
biological_resource(brd4, [super_enhancer_regions, proliferating_cells], transcriptional_elongation_control, nucleus).
pharmacological_effect(brd4, small_molecule_inhibitor, competitive_binding_at_acetyl_histone_sites, cell_cycle_arrest_and_tumor_apoptosis).

druggable_target(kdm1a, 'LSD1', enzyme, lysine_demethylase).
biological_resource(kdm1a, [nucleus_chromatin, stem_cells, cancer_cells], histone_h3k4_demethylation_pathway, nucleus).
pharmacological_effect(kdm1a, covalent_inhibitor, flavin_adenine_dinucleotide_adduct_formation, reactivation_of_silenced_differentiation_genes).

druggable_target(kdm4c, 'KDM4C', enzyme, jmjc_demethylase).
biological_resource(kdm4c, [chromatin, squamous_cell_carcinomas], histone_h3k9_demethylation, nucleus).
pharmacological_effect(kdm4c, inhibitor, iron_cofactor_active_site_chelation, epigenetic_modulation_of_tumor_growth).

% ---------------------------------------------------------------------
% 4. RECEPTOR PROTEIN TYROSINE PHOSPHATASES
% ---------------------------------------------------------------------

druggable_target(ptpn1, 'PTP1B', enzyme, protein_tyrosine_phosphatase).
biological_resource(ptpn1, [endoplasmic_reticulum_cytoplasmic_face, skeletal_muscle, liver], insulin_and_leptin_receptor_dephosphorylation, endoplasmic_reticulum).
pharmacological_effect(ptpn1, allosteric_inhibitor, catalytic_site_or_back_pocket_blockade, enhancement_of_insulin_and_leptin_sensitivity).

druggable_target(ptpn11, 'SHP2', enzyme, tyrosine_phosphatase).
biological_resource(ptpn11, [cytoplasm, ubiquitous_signal_transduction], ras_mapk_pathway_positive_regulation, cytoplasm).
pharmacological_effect(ptpn11, allosteric_inhibitor, closed_conformation_locking, suppression_of_oncogenic_mapk_signaling_pathways).
