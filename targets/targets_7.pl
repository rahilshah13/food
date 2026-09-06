% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 7: Toll-Like Receptors, Extended SLCs & Proteases)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. TOLL-LIKE RECEPTORS & PATTERN RECOGNITION RECEPTORS
% ---------------------------------------------------------------------

druggable_target(tlr2, 'TLR2', pattern_recognition_receptor, toll_like_receptor).
biological_resource(tlr2, [macrophages, dendritic_cells, mast_cells, epithelial_cells], microbial_lipopeptide_signaling_pathway, plasma_membrane).
pharmacological_effect(tlr2, antagonist, competitive_receptor_occupancy_blockade, suppression_of_pro_inflammatory_cytokine_storms).

druggable_target(tlr3, 'TLR3', pattern_recognition_receptor, toll_like_receptor).
biological_resource(tlr3, [dendritic_cells, airway_epithelial_cells, microglia], double_stranded_rna_sensing_pathway, endosomal_membrane).
pharmacological_effect(tlr3, agonist_or_antagonist, signaling_modulation, antiviral_immunization_or_reduction_of_neuroinflammation).

druggable_target(tlr4, 'TLR4', pattern_recognition_receptor, toll_like_receptor).
biological_resource(tlr4, [myeloid_cells, vascular_endothelium, hepatocytes], lipopolysaccharide_myd88_trif_pathway, plasma_membrane).
pharmacological_effect(tlr4, antagonist, lipid_a_binding_site_blockade, mitigation_of_septic_shock_and_acute_lung_injury).

druggable_target(tlr7, 'TLR7', pattern_recognition_receptor, toll_like_receptor).
biological_resource(tlr7, [plasmacytoid_dendritic_cells, B_lymphocytes], single_stranded_rna_sensing_pathway, endosomal_membrane).
pharmacological_effect(tlr7, agonist, pyrimidines_activation_interferon_induction, viral_clearance_and_oncology_immunotherapy).

druggable_target(tlr8, 'TLR8', pattern_recognition_receptor, toll_like_receptor).
biological_resource(tlr8, [myeloid_dendritic_cells, monocytes], single_stranded_rna_signaling, endosomal_membrane).
pharmacological_effect(tlr8, agonist, receptor_stimulation_il_12_induction, enhancement_of_cell_mediated_immunity).

druggable_target(tlr9, 'TLR9', pattern_recognition_receptor, toll_like_receptor).
biological_resource(tlr9, [plasmacytoid_dendritic_cells, b_cells], unmethylated_cpg_dna_sensing_pathway, endosomal_membrane).
pharmacological_effect(tlr9, agonist_or_antagonist, dna_motif_binding_modulation, vaccine_adjuvant_action_or_autoimmune_suppression).

% ---------------------------------------------------------------------
% 2. EXTENDED SOLUTE CARRIER (SLC) TRANSPORTERS
% ---------------------------------------------------------------------

druggable_target(slc1a3, 'GLAST', transporter, amino_acid_transporter).
biological_resource(slc1a3, [astrocytes, retinal_muller_cells], glutamate_high_affinity_uptake_pathway, plasma_membrane).
pharmacological_effect(slc1a3, modulator, transporter_enhancement, reduction_of_extracellular_glutamate_excitotoxicity).

druggable_target(slc3a2, 'CD98HC', transporter, amino_acid_transporter_chaperone).
biological_resource(slc3a2, [lymphocytes, renal_tubules, tumor_cells], large_neutral_amino_acid_transport_complex, plasma_membrane).
pharmacological_effect(slc3a2, monoclonal_antibody_inhibitor, cell_surface_interaction_blockade, suppression_of_tumor_proliferation_and_immunoactivation).

druggable_target(slc7a5, 'LAT1', transporter, amino_acid_transporter).
biological_resource(slc7a5, [blood_brain_barrier, activated_t_cells, cancer_cells], essential_amino_acid_influx, plasma_membrane).
pharmacological_effect(slc7a5, inhibitor, competitive_pore_blockade, starvation_of_proliferating_tumor_cells_and_t_cells).

druggable_target(slc16a1, 'MCT1', transporter, monocarboxylate_transporter).
biological_resource(slc16a1, [erythrocytes, skeletal_muscle, astrocytes, tumor_cells], lactate_and_pyruvate_efflux_pathway, plasma_membrane).
pharmacological_effect(slc16a1, inhibitor, catalytic_transport_blockade, disruption_of_cancer_cell_glycolytic_metabolism).

druggable_target(slc2a1, 'GLUT1', transporter, glucose_transporter).
biological_resource(slc2a1, [erythrocytes, blood_brain_barrier_endothelium, cancer_cells], basal_glucose_uptake_pathway, plasma_membrane).
pharmacological_effect(slc2a1, inhibitor, transport_pore_blockade, suppression_of_glycolytic_energy_flux_in_malignancies).

druggable_target(slc2a4, 'GLUT4', transporter, glucose_transporter).
biological_resource(slc2a4, [skeletal_muscle, adipose_tissue], insulin_regulated_glucose_translocation, intracellular_vesicles_to_membrane).
pharmacological_effect(slc2a4, activator, insulin_signaling_dependent_translocation, lowering_of_blood_glucose_levels).

% ---------------------------------------------------------------------
% 3. EXTENDED LYSOSOMAL AND CELLULAR PROTEASES
% ---------------------------------------------------------------------

druggable_target(ctsk, 'CTSK', enzyme, lysosomal_cysteine_protease).
biological_resource(ctsk, [osteoclasts, chondrocytes, synovial_fibroblasts], bone_matrix_collagen_degradation, extracellular_resorptive_pit).
pharmacological_effect(ctsk, inhibitor, active_site_cysteine_alkylation, prevention_of_bone_resorption_in_osteoporosis).

druggable_target(ctsd, 'CTSD', enzyme, lysosomal_aspartic_protease).
biological_resource(ctsd, [lysosomes_ubiquitous, breast_cancer_cells], intracellular_protein_turnover, lysosome).
pharmacological_effect(ctsd, inhibitor, active_site_cleft_blockade, reduction_of_tumor_metastatic_potential).

druggable_target(furin, 'FURIN', enzyme, proprotein_convertase).
biological_resource(furin, [trans_golgi_network, plasma_membrane], proteolytic_maturation_of_secretory_proteins, golgi_membrane).
pharmacological_effect(furin, inhibitor, active_site_blocking_peptide, prevention_of_pathogen_protein_priming_and_tumor_progression).

druggable_target(masp2, 'MASP2', enzyme, serine_protease).
biological_resource(masp2, [plasma, lectin_complement_pathway_complexes], complement_lectin_activation_cascade, extracellular_plasma).
pharmacological_effect(masp2, monoclonal_antibody_inhibitor, catalytic_domain_blockade, suppression_of_lectin_pathway_mediated_tissue_injury).

% ---------------------------------------------------------------------
% 4. INTEGRIN RECEPTORS (EXTENDED)
% ---------------------------------------------------------------------

druggable_target(itga4beta1, 'VLA4', receptor, integrin_heterodimer).
biological_resource(itga4beta1, [leukocytes, hematopoietic_stem_cells], cell_matrix_and_cell_cell_adhesion, plasma_membrane).
pharmacological_effect(itga4beta1, monoclonal_antibody_antagonist, binding_site_steric_hindrance, blocking_lymphocyte_trafficking_into_inflammation_sites).

druggable_target(itgavbeta3, 'ITGAVB3', receptor, integrin_heterodimer).
biological_resource(itgavbeta3, [angiogenic_endothelial_cells, osteoclasts, tumor_cells], vitronectin_receptor_signaling, plasma_membrane).
pharmacological_effect(itgavbeta3, antagonist, peptidomimetic_blockade, anti_angiogenic_and_anti_metastatic_action).

druggable_target(itgb1, 'ITGB1', receptor, integrin_beta_subunit).
biological_resource(itgb1, [ubiquitous_fibroblasts, epithelial_cells], extracellular_matrix_transduction, plasma_membrane).
pharmacological_effect(itgb1, monoclonal_antibody_antagonist, heterodimer_signaling_blockade, inhibition_of_fibrosis_and_tumor_growth).
