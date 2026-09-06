% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 4: Adhesion, Proteases, UPS & Growth Factor Receptors)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. INTEGRINS AND CELL ADHESION MOLECULES
% ---------------------------------------------------------------------

druggable_target(itga4, 'ITGA4', receptor, integrin_alpha).
biological_resource(itga4, [leukocytes, lymphocytes, endothelial_cells], vla_4_integrin_signaling_pathway, plasma_membrane).
pharmacological_effect(itga4, monoclonal_antibody_antagonist, vcam_1_binding_blockade, prevention_of_leukocyte_migration_across_blood_brain_barrier).

druggable_target(itgam, 'ITGAM', receptor, integrin_alpha_m).
biological_resource(itgam, [neutrophils, monocytes, macrophages], leukocyte_adhesion_and_migration, plasma_membrane).
pharmacological_effect(itgam, antagonist, mac_1_receptor_blockade, suppression_of_neutrophil_mediated_inflammation).

druggable_target(icam1, 'ICAM1', receptor, adhesion_molecule).
biological_resource(icam1, [vascular_endothelium, epithelial_cells, immune_cells], leukocyte_extravasation_pathway, plasma_membrane).
pharmacological_effect(icam1, monoclonal_antibody_inhibitor, ligand_receptor_interaction_blockade, mitigation_of_allergic_and_inflammatory_cell_infiltration).

druggable_target(vcam1, 'VCAM1', receptor, adhesion_molecule).
biological_resource(vcam1, [activated_endothelium, bone_marrow_stroma], lymphocyte_homing_and_adhesion, plasma_membrane).
pharmacological_effect(vcam1, antagonist, blocking_vla_4_interaction, anti_inflammatory_immunomodulation).

druggable_target(pecam1, 'PECAM1', receptor, adhesion_molecule).
biological_resource(pecam1, [endothelial_junctions, platelets, leukocytes], endothelial_cell_junction_signaling, plasma_membrane).
pharmacological_effect(pecam1, modulator, homophilic_binding_modulation, vascular_permeability_and_angiogenesis_control).

% ---------------------------------------------------------------------
% 2. PROTEASES, CASPASES & LYSOSOMAL ENZYMES
% ---------------------------------------------------------------------

druggable_target(mmp1, 'MMP1', enzyme, matrix_metalloproteinase).
biological_resource(mmp1, [fibroblasts, endothelial_cells, chondrocytes], interstitial_collagen_degradation, extracellular_matrix).
pharmacological_effect(mmp1, inhibitor, zinc_active_site_chelation, prevention_of_cartilage_matrix_destruction).

druggable_target(mmp2, 'MMP2', enzyme, matrix_metalloproteinase).
biological_resource(mmp2, [fibroblasts, tumor_cells, vascular_smooth_muscle], basement_membrane_remodeling, extracellular_matrix).
pharmacological_effect(mmp2, inhibitor, catalytic_site_blockade, anti_metastatic_tumor_invasion_suppression).

druggable_target(mmp3, 'MMP3', enzyme, matrix_metalloproteinase).
biological_resource(mmp3, [fibroblasts, synovial_cells, macrophages], stromelysin_matrix_degradation, extracellular_matrix).
pharmacological_effect(mmp3, inhibitor, zinc_binding_domain_blockade, reduction_of_joint_destruction_in_arthritis).

druggable_target(ctsB, 'CTSB', enzyme, lysosomal_cysteine_protease).
biological_resource(ctsB, [lysosomes_ubiquitous, tumor_cells, macrophages], protein_turnover_and_antigen_processing, lysosome_extracellular).
pharmacological_effect(ctsB, inhibitor, active_site_thiol_alkylation, reduction_of_tumor_invasion_and_lysosomal_leakage).

druggable_target(casp1, 'CASP1', enzyme, inflammatory_caspase).
biological_resource(casp1, [macrophages, monocytes, dendritic_cells], nlrp3_inflammasome_activation, cytoplasm).
pharmacological_effect(casp1, inhibitor, catalytic_cysteine_blockade, suppression_of_il_1beta_and_il_18_maturation).

druggable_target(casp3, 'CASP3', enzyme, executioner_caspase).
biological_resource(casp3, [ubiquitous_apoptotic_cells], apoptotic_execution_pathway, cytoplasm_nucleus).
pharmacological_effect(casp3, modulator, activity_modulation_or_protection, neuroprotection_ischemic_injury_mitigation).

druggable_target(casp8, 'CASP8', enzyme, initiator_caspase).
biological_resource(casp8, [lymphocytes, ubiquitous_cells], extrinsic_apoptosis_signaling, cytoplasm).
pharmacological_effect(casp8, inhibitor, catalytic_blockade, prevention_of_excessive_cell_death).

% ---------------------------------------------------------------------
% 3. UBIQUITIN-PROTEASOME SYSTEM & APOPTOSIS REGULATORS
% ---------------------------------------------------------------------

druggable_target(psmb5, 'PSMB5', proteasome_subunit, catalytic_core).
biological_resource(psmb5, [ubiquitous_cytoplasmic_compartments, multiple_myeloma_cells], 20s_proteasome_chymotrypsin_like_activity, cytoplasm_nucleus).
pharmacological_effect(psmb5, covalent_inhibitor, boron_or_epoxy_ketone_active_site_alkylation, induction_of_endoplasmic_reticulum_stress_and_myeloma_apoptosis).

druggable_target(mdm2, 'MDM2', ubiquitin_ligase, e3_ligase).
biological_resource(mdm2, [ubiquitous_cells, tumor_cells_with_wild_type_p53], p53_negative_regulation_pathway, nucleus_cytoplasm).
pharmacological_effect(mdm2, small_molecule_inhibitor, p53_binding_pocket_blockade, stabilization_of_p53_tumor_suppressor_induced_apoptosis).

druggable_target(bcl2, 'BCL2', regulator, apoptosis_regulator).
biological_resource(bcl2, [mitochondrial_outer_membrane, lymphocytes, hematopoietic_cells], intrinsic_apoptosis_control, mitochondrial_membrane).
pharmacological_effect(bcl2, bh3_mimetic_inhibitor, hydrophobic_groove_binding_blockade, restoration_of_apoptosis_in_cancer_cells).

druggable_target(bclxl, 'BCL2L1', regulator, apoptosis_regulator).
biological_resource(bclxl, [platelets, memory_t_cells, tumor_cells], anti_apoptotic_survival_signaling, mitochondrial_membrane).
pharmacological_effect(bclxl, inhibitor, bh3_mimetic_blockade, induction_of_apoptosis_in_malignant_cells).

druggable_target(mcl1, 'MCL1', regulator, apoptosis_regulator).
biological_resource(mcl1, [myeloid_cells, various_tumor_cells], short_lived_survival_regulation, mitochondrial_membrane).
pharmacological_effect(mcl1, inhibitor, binding_groove_antagonism, overcoming_resistance_to_apoptosis_in_cancer).

% ---------------------------------------------------------------------
% 4. GROWTH FACTOR RECEPTORS
% ---------------------------------------------------------------------

druggable_target(insr, 'INSR', receptor, tyrosine_kinase_receptor).
biological_resource(insr, [skeletal_muscle, liver, adipose_tissue], insulin_metabolic_signaling_pathway, plasma_membrane).
pharmacological_effect(insr, agonist, receptor_autophosphorylation_stimulation, glucose_uptake_and_metabolic_regulation).

druggable_target(igf1r, 'IGF1R', receptor, tyrosine_kinase_receptor).
biological_resource(igf1r, [ubiquitous_tissues, tumor_cells], insulin_like_growth_factor_signaling, plasma_membrane).
pharmacological_effect(igf1r, monoclonal_antibody_inhibitor, receptor_downregulation_and_blockade, anti_proliferative_tumor_suppression).

druggable_target(fgfr1, 'FGFR1', receptor, tyrosine_kinase_receptor).
biological_resource(fgfr1, [fibroblasts, endothelial_cells, chondrocytes], fibroblast_growth_factor_pathway, plasma_membrane).
pharmacological_effect(fgfr1, inhibitor, kinase_domain_atp_competition, anti_angiogenic_and_anti_tumor_action).

druggable_target(fgfr2, 'FGFR2', receptor, tyrosine_kinase_receptor).
biological_resource(fgfr2, [epithelial_tissues, gastric_cancers, breast_tissue], fgfr_signaling_cascade, plasma_membrane).
pharmacological_effect(fgfr2, inhibitor, selective_kinase_blockade, inhibition_of_fgfr2_amplified_malignancies).

druggable_target(fgfr3, 'FGFR3', receptor, tyrosine_kinase_receptor).
biological_resource(fgfr3, [chondrocytes, urothelial_cells, multiple_myeloma], skeletal_development_and_proliferation, plasma_membrane).
pharmacological_effect(fgfr3, inhibitor, tyrosine_kinase_inhibition, treatment_of_achondroplasia_and_bladder_carcinoma).

druggable_target(fgfr4, 'FGFR4', receptor, tyrosine_kinase_receptor).
biological_resource(fgfr4, [hepatocytes, skeletal_muscle], bile_acid_homeostasis_and_tumor_growth, plasma_membrane).
pharmacological_effect(fgfr4, inhibitor, kinase_domain_blockade, suppression_of_hepatocellular_carcinoma_proliferation).

% ---------------------------------------------------------------------
% 5. COMPLEMENT CASCADE TARGETS
% --------------------------------0-------------------------------------

druggable_target(c5, 'C5', complement_protein, complement_component).
biological_resource(c5, [plasma, liver_derived_serum_proteins], terminal_complement_cascade, extracellular_plasma).
pharmacological_effect(c5, monoclonal_antibody_neutralizer, cleavage_prevention_into_c5a_and_c5b, inhibition_of_membrane_attack_complex_and_inflammation).

druggable_target(c3, 'C3', complement_protein, complement_component).
biological_resource(c3, [liver, systemic_circulation, local_tissues], central_complement_amplification, extracellular_plasma).
pharmacological_effect(c3, peptide_inhibitor, c3_convertase_interference, broad_complement_inhibition_in_autoimmune_diseases).

druggable_target(c1s, 'C1S', enzyme, serine_protease).
biological_resource(c1s, [plasma, immune_complexes], classical_complement_pathway_activation, extracellular_plasma).
pharmacological_effect(c1s, monoclonal_antibody_inhibitor, catalytic_site_blockade, prevention_of_classical_complement_initiation).
