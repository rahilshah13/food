% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. THE DARK KINOME & EXTENDED KINASES (BATCH 11)
% ---------------------------------------------------------------------

druggable_target(aak1, 'AAK1', kinase, serine_threonine_kinase).
biological_resource(aak1, [brain, heart, skeletal_muscle], ap2_clathrin_mediated_endocytosis_pathway, cytoplasm).
pharmacological_effect(aak1, inhibitor, atp_competitive_active_site_blockade, neuropathic_pain_mitigation_and_viral_entry_inhibition).

druggable_target(bmpr1a, 'BMPR1A', kinase, serine_threonine_kinase).
biological_resource(bmpr1a, [bone_tissue, cartilage, smooth_muscle, vascular_endothelium], bone_morphogenetic_protein_signaling, plasma_membrane).
pharmacological_effect(bmpr1a, inhibitor, kinase_domain_blockade, suppression_of_heterotopic_ossification).

druggable_target(acvr1, 'ACVR1', kinase, serine_threonine_kinase).
biological_resource(acvr1, [skeletal_muscle, cartilage, connective_tissue], activin_receptor_type_i_pathway, plasma_membrane).
pharmacological_effect(acvr1, inhibitor, mutant_active_site_inhibition, halting_fibrodysplasia_ossificans_progressiva).

druggable_target(tgfbr1, 'TGFBR1', kinase, serine_threonine_kinase).
biological_resource(tgfbr1, [ubiquitous_fibroblasts, epithelial_cells, immune_cells], tgf_beta_smad2_3_signaling_pathway, plasma_membrane).
pharmacological_effect(tgfbr1, inhibitor, atp_competitive_inhibition, anti_fibrotic_and_anti_metastatic_action).

druggable_target(map3k5, 'ASK1', kinase, serine_threonine_kinase).
biological_resource(map3k5, [brain, heart, kidney, immune_cells], ros_mediated_apoptosis_pathway, cytoplasm_to_mitochondria).
pharmacological_effect(map3k5, inhibitor, catalytic_site_occupancy, cellular_cytoprotection_in_neurodegeneration_and_isemia).

druggable_target(ripk1, 'RIPK1', kinase, serine_threonine_kinase).
biological_resource(ripk1, [ubiquitous_cells, macrophages, endothelial_cells], necroptosis_and_tnf_signaling_pathway, cytoplasm).
pharmacological_effect(ripk1, inhibitor, allosteric_or_atp_competitive_blockade, inhibition_of_necroptosis_and_neuroinflammation).

druggable_target(ripk2, 'RIPK2', kinase, serine_threonine_kinase).
biological_resource(ripk2, [leukocytes, intestinal_epithelium], nod1_nod2_peptidoglycan_signaling, cytoplasm).
pharmacological_effect(ripk2, inhibitor, kinase_domain_blockade, suppression_of_inflammatory_bowel_disease_pathways).

druggable_target(tec, 'TEC', kinase, non_receptor_tyrosine_kinase).
biological_resource(tec, [platelets, hematopoietic_cells, macrophages], fc_gamma_receptor_signaling, cytoplasm_membrane).
pharmacological_effect(tec, inhibitor, covalent_or_reversible_blockade, suppression_of_platelet_activation_and_immune_signaling).

druggable_target(itk, 'ITK', kinase, non_receptor_tyrosine_kinase).
biological_resource(itk, [t_lymphocytes, natural_killer_cells], t_cell_receptor_phospholipase_c_gamma_pathway, cytoplasm).
pharmacological_effect(itk, inhibitor, catalytic_site_inhibition, targeted_immunosuppression_in_allergic_asthma).

druggable_target(hck, 'HCK', kinase, non_receptor_tyrosine_kinase).
biological_resource(hck, [neutrophils, macrophages, B_cells], myeloid_cell_migration_and_phagocytosis, cytoplasm_membrane).
pharmacological_effect(hck, inhibitor, multi_kinase_active_site_blockade, anti_inflammatory_and_anti_leukemic_action).

druggable_target(lyn, 'LYN', kinase, non_receptor_tyrosine_kinase).
biological_resource(lyn, [b_cells, myeloid_cells, platelets], immunoreceptor_tyrosine_activation_and_inhibition, inner_plasma_membrane).
pharmacological_effect(lyn, inhibitor, catalytic_site_blockade, suppression_of_b_cell_malignancy_survival).

druggable_target(ptk2, 'FAK', kinase, non_receptor_tyrosine_kinase).
biological_resource(ptk2, [fibroblasts, endothelial_cells, cancer_cells], focal_adhesion_and_integrin_signaling, focal_adhesions).
pharmacological_effect(ptk2, inhibitor, kinase_domain_occupancy, inhibition_of_tumor_metastasis_and_fibrotic_remodeling).

druggable_target(stk33, 'STK33', kinase, serine_threonine_kinase).
biological_resource(stk33, [testis, KRAS_mutant_cancer_cells], tumor_cell_survival_dependency_pathway, cytoplasm_nucleus).
pharmacological_effect(stk33, inhibitor, catalytic_inhibition, induction_of_synthetic_lethality_in_kras_dependent_cancers).

druggable_target(nek2, 'NEK2', kinase, serine_threonine_kinase).
biological_resource(nek2, [centrosomes, proliferating_tissues, cancer_cells], centrosome_separation_and_mitotic_spindle_pathway, centrosome).
pharmacological_effect(nek2, inhibitor, atp_competitive_blockade, induction_of_multipolar_mitosis_and_tumor_apoptosis).

druggable_target(plk4, 'PLK4', kinase, serine_threonine_kinase).
biological_resource(plk4, [centrioles, proliferating_cells], centriole_duplication_control, centrosome).
pharmacological_effect(plk4, inhibitor, kinase_domain_occupancy, induction_of_centrosome_amplification_failure_and_cell_death).

druggable_target(chk2, 'CHEK2', kinase, serine_threonine_kinase).
biological_resource(chk2, [ubiquitous_nuclear_compartments], dna_damage_checkpoint_signaling, nucleus).
pharmacological_effect(chk2, inhibitor, catalytic_site_blockade, abrogation_of_cell_cycle_arrest_in_chemotherapy).

druggable_target(bub1, 'BUB1', kinase, serine_threonine_kinase).
biological_resource(bub1, [kinetochores, mitotic_cells], spindle_assembly_checkpoint_pathway, kinetochore).
pharmacological_effect(bub1, inhibitor, kinase_domain_occupancy, induction_of_chromosome_missegregation_and_tumor_cell_death).

druggable_target(pim2, 'PIM2', kinase, serine_threonine_kinase).
biological_resource(pim2, [hematopoietic_cells, lymphoid_malignancies], translational_control_and_cell_survival, cytoplasm).
pharmacological_effect(pim2, inhibitor, atp_competitive_blockade, suppression_of_multiple_myeloma_proliferation).

% ---------------------------------------------------------------------
% 2. ORPHAN AND EXTENDED GPCRS (BATCH 11)
% ---------------------------------------------------------------------

druggable_target(gpr35, 'GPR35', gpcr, orphan_gpcr).
biological_resource(gpr35, [gastrointestinal_tract, immune_cells, dorsal_root_ganglia], kynurenic_acid_sensing_pathway, plasma_membrane).
pharmacological_effect(gpr35, agonist_or_antagonist, g_i_coupled_signaling_modulation, anti_inflammatory_and_pain_modulation).

druggable_target(gpr55, 'GPR55', gpcr, cannabinoid_related_receptor).
biological_resource(gpr55, [brain, endothelial_cells, osteoclasts, immune_cells], lysophosphatidylinositol_signaling, plasma_membrane).
pharmacological_effect(gpr55, antagonist, g_protein_coupled_blockade, inhibition_of_cancer_cell_proliferation_and_bone_resorption).

druggable_target(gpr68, 'OGR1', gpcr, proton_sensing_gpcr).
biological_resource(gpr68, [smooth_muscle, macrophages, cancer_cells, bone], extracellular_acidosis_sensing, plasma_membrane).
pharmacological_effect(gpr68, antagonist, extracellular_ph_signaling_blockade, reduction_of_inflammation_and_tumor_growth).

druggable_target(gpr84, 'GPR84', gpcr, medium_chain_fatty_acid_receptor).
biological_resource(gpr84, [neutrophils, macrophages, microglia], immune_cell_activation_pathway, plasma_membrane).
pharmacological_effect(gpr84, antagonist, g_i_pathway_inhibition, attenuation_of_chronic_neuroinflammation_and_fibrosis).

druggable_target(gpr119_ext, 'GPR119', gpcr, metabolic_gpcr).
biological_resource(gpr119_ext, [pancreatic_beta_cells, intestinal_mucosa], fatty_acid_amide_signaling, plasma_membrane).
pharmacological_effect(gpr119_ext, agonist, g_s_coupled_camp_increase, stimulation_of_glucose_dependent_insulin_secretion).

druggable_target(lgr5, 'LGR5', gpcr, stem_cell_marker_receptor).
biological_resource(lgr5, [intestinal_crypts, hair_follicles, cancer_stem_cells], wnt_signaling_potentiation, plasma_membrane).
pharmacological_effect(lgr5, antibody_drug_conjugate_target, receptor_mediated_internalization_and_cytotoxicity, eradication_of_lgr5_positive_cancer_stem_cells).

% ---------------------------------------------------------------------
% 3. EPIGENETIC WRITERS: HISTONE METHYLTRANSFERASES & PRMTS (BATCH 11)
% ---------------------------------------------------------------------

druggable_target(kmt2a, 'MLL1', enzyme, histone_methyltransferase).
biological_resource(kmt2a, [hematopoietic_stem_cells, leukemia_cells], histone_h3k4_methylation_pathway, nucleus).
pharmacological_effect(kmt2a, inhibitor, menin_mll_interaction_blockade, suppression_of_mll_rearranged_leukemia).

druggable_target(ezh1, 'EZH1', enzyme, histone_methyltransferase).
biological_resource(ezh1, [hematopoietic_cells, skeletal_muscle, stem_cells], polycomb_repressive_complex_2, nucleus).
pharmacological_effect(ezh1, inhibitor, catalytic_site_blockade, compensation_for_ezh2_inhibitor_resistance).

druggable_target(nsd2, 'WHSC1', enzyme, histone_methyltransferase).
biological_resource(nsd2, [multiple_myeloma_cells, developing_tissues], histone_h3k36_dimethylation, nucleus).
pharmacological_effect(nsd2, inhibitor, s_adenosylmethionine_competition, reduction_of_oncogenic_gene_expression).

druggable_target(prmt1, 'PRMT1', enzyme, protein_arginine_methyltransferase).
biological_resource(prmt1, [ubiquitous_nuclear_and_cytoplasmic_compartments], type_i_arginine_methylation, nucleus_cytoplasm).
pharmacological_effect(prmt1, inhibitor, catalytic_site_blockade, suppression_of_rna_processing_and_tumor_survival).

druggable_target(prmt5, 'PRMT5', enzyme, protein_arginine_methyltransferase).
biological_resource(prmt5, [lymphocytes, proliferating_cancers], symmetrical_dimethylation_pathway, nucleus_cytoplasm).
pharmacological_effect(prmt5, inhibitor, active_site_occupancy, synthetic_lethality_in_mtap_deleted_tumors).

% ---------------------------------------------------------------------
% 4. UBIQUITIN-CONJUGATING ENZYMES (E2S) & CULLIN-RING COMPONENTS (BATCH 11)
% ---------------------------------------------------------------------

druggable_target(ube2c, 'UBE2C', enzyme, e2_ubiquitin_conjugating_enzyme).
biological_resource(ube2c, [mitotic_cells, various_cancers], anaphase_promoting_complex_ubiquitination, nucleus).
pharmacological_effect(ube2c, inhibitor, protein_protein_interaction_blockade, mitotic_arrest_and_tumor_growth_suppression).

druggable_target(ube2n, 'UBE2N', enzyme, e2_ubiquitin_conjugating_enzyme).
biological_resource(ube2n, [ubiquitous_cells, diffuse_large_b_cell_lymphoma], k63_linked_ubiquitination_nf_kb_signaling, cytoplasm_nucleus).
pharmacological_effect(ube2n, inhibitor, active_site_blocking_small_molecule, downregulation_of_survival_signaling_in_lymphoma).

druggable_target(rbx1, 'RBX1', e3_ligase_subunit, cullin_ring_ligase).
biological_resource(rbx1, [ubiquitous_cytoplasmic_compartments], culling_ring_ubiquitin_ligase_core, cytoplasm_nucleus).
pharmacological_effect(rbx1, inhibitor, neddylation_or_direct_blockade, disruption_of_targeted_protein_degradation_machinery).

% ---------------------------------------------------------------------
% 5. RECEPTOR PROTEIN TYROSINE PHOSPHATASES (BATCH 11)
% ---------------------------------------------------------------------

druggable_target(ptpn2, 'TC_PTP', enzyme, protein_tyrosine_phosphatase).
biological_resource(ptpn2, [t_cells, hematopoietic_cells, various_tissues], jak_stat_dephosphorylation_pathway, nucleus_endoplasmic_reticulum).
pharmacological_effect(ptpn2, inhibitor, catalytic_site_blockade, enhancement_of_t_cell_anti_tumor_immunity).

druggable_target(ptpn6, 'SHP1', enzyme, protein_tyrosine_phosphatase).
biological_resource(ptpn6, [hematopoietic_cells, immune_cells], inhibitory_immune_receptor_signaling, cytoplasm).
pharmacological_effect(ptpn6, inhibitor, catalytic_domain_inhibition, reversal_of_immune_checkpoint_suppression).

druggable_target(ptprc, 'CD45', enzyme, receptor_protein_tyrosine_phosphatase).
biological_resource(ptprc, [all_hematopoietic_cells, lymphocytes], t_and_b_cell_receptor_signaling_threshold, plasma_membrane).
pharmacological_effect(ptprc, modulator, phosphatase_activity_modulation, tuning_of_immune_activation_thresholds).

% ---------------------------------------------------------------------
% 6. MASSIVE GPCR EXPANSION (BATCH 12)
% ---------------------------------------------------------------------

druggable_target(cckbr, 'CCKBR', gpcr, cholecystokinin_receptor).
biological_resource(cckbr, [stomach_parietal_cells, brain_cortex, gastrointestinal_tract], gastric_acid_secretion_pathway, plasma_membrane).
pharmacological_effect(cckbr, antagonist, g_q_signaling_blockade, reduction_of_gastric_acid_secretion_and_anxiety_modulation).

druggable_target(ednra, 'EDNRA', gpcr, endothelin_receptor).
biological_resource(ednra, [vascular_smooth_muscle, myocardium, fibroblasts], endothelin_vasoconstriction_pathway, plasma_membrane).
pharmacological_effect(ednra, antagonist, g_q_phospholipase_c_blockade, vasodilation_and_pulmonary_arterial_hypertension_treatment).

druggable_target(ednrb, 'EDNRB', gpcr, endothelin_receptor).
biological_resource(ednrb, [endothelial_cells, melanocytes, kidney_collecting_duct], endothelin_clearance_pathway, plasma_membrane).
pharmacological_effect(ednrb, antagonist, receptor_occupancy_blockade, reduction_of_vascular_resistance_and_fluid_retention).

druggable_target(oprd1_ext, 'OPRD1_X', gpcr, opioid_receptor).
biological_resource(oprd1_ext, [brain_limbic_structures, peripheral_nerves], delta_opioid_signaling, plasma_membrane).
pharmacological_effect(oprd1_ext, agonist, g_i_coupled_neuronal_inhibition, analgesia_and_antidepressant_action).

druggable_target(tacr1, 'TACR1', gpcr, tachykinin_receptor).
biological_resource(tacr1, [spinal_cord_dorsal_horn, central_nervous_system, gut], substance_p_pain_signaling_pathway, plasma_membrane).
pharmacological_effect(tacr1, antagonist, g_q_signaling_blockade, prevention_of_chemotherapy_induced_nausea_and_analgesia).

druggable_target(tacr2, 'TACR2', gpcr, tachykinin_receptor).
biological_resource(tacr2, [smooth_muscle_airways, gastrointestinal_tract], neurokinin_a_signaling, plasma_membrane).
pharmacological_effect(tacr2, antagonist, competitive_receptor_blockade, bronchodilation_and_gut_motility_modulation).

druggable_target(ntsr1, 'NTSR1', gpcr, neurotensin_receptor).
biological_resource(ntsr1, [brain_striatum, hypothalamus, colon_cancers], neurotensin_signaling_pathway, plasma_membrane).
pharmacological_effect(ntsr1, antagonist, g_q_signaling_blockade, antipsychotic_action_and_tumor_growth_suppression).

druggable_target(kiss1r, 'KISS1R', gpcr, kisspeptin_receptor).
biological_resource(kiss1r, [hypothalamus_gnrh_neurons, pituitary, placenta], gonadotropin_releasing_pathway, plasma_membrane).
pharmacological_effect(kiss1r, agonist_or_antagonist, g_q_coupled_signaling_modulation, initiation_of_puberty_or_sex_hormone_suppression).

druggable_target(hrh3_ext, 'HRH3_X', gpcr, histamine_receptor).
biological_resource(hrh3_ext, [cerebral_cortex, basal_ganglia], presynaptic_histamine_autoreceptor, plasma_membrane).
pharmacological_effect(hrh3_ext, inverse_agonist, g_i_coupled_inhibitory_blockade, wakefulness_enhancement_and_cognition_improvement).

druggable_target(mchr1_ext, 'MCHR1_X', gpcr, melanin_concentrating_hormone).
biological_resource(mchr1_ext, [hypothalamus, olfactory_tubercle], feeding_behavior_pathway, plasma_membrane).
pharmacological_effect(mchr1_ext, antagonist, g_i_signaling_inhibition, anti_obesity_and_anxiolytic_modulation).

druggable_target(ccr1, 'CCR1', gpcr, chemokine_receptor).
biological_resource(ccr1, [monocytes, t_cells, neutrophils], inflammatory_chemokine_recruitment, plasma_membrane).
pharmacological_effect(ccr1, antagonist, g_i_coupled_chemotaxis_inhibition, suppression_of_rheumatoid_arthritis_inflammation).

druggable_target(ccr3, 'CCR3', gpcr, chemokine_receptor).
biological_resource(ccr3, [eosinophils, basophils, th2_cells], eotaxin_signaling_pathway, plasma_membrane).
pharmacological_effect(ccr3, antagonist, receptor_occupancy_blockade, anti_asthmatic_and_anti_allergic_action).

druggable_target(ccr9, 'CCR9', gpcr, chemokine_receptor).
biological_resource(ccr9, [thymocytes, gut_homing_t_cells], intestinal_lymphocyte_homing, plasma_membrane).
pharmacological_effect(ccr9, antagonist, chemokine_binding_blockade, treatment_of_inflammatory_bowel_disease).

druggable_target(cx3cr1, 'CX3CR1', gpcr, chemokine_receptor).
biological_resource(cx3cr1, [microglia, monocytes, natural_killer_cells], fractalkine_signaling_pathway, plasma_membrane).
pharmacological_effect(cx3cr1, antagonist, g_i_pathway_blockade, neuroprotection_in_neurodegenerative_conditions).

druggable_target(avpr1b, 'AVPR1B', gpcr, vasopressin_receptor).
biological_resource(avpr1b, [anterior_pituitary, brain_limbic_system], adrenocorticotropic_hormone_release, plasma_membrane).
pharmacological_effect(avpr1b, antagonist, g_q_signaling_blockade, reduction_of_stress_induced_anxiety_and_depression).

druggable_target(oxtr_ext, 'OXTR_X', gpcr, oxytocin_receptor).
biological_resource(oxtr_ext, [myometrium, brain_amygdala], social_bonding_and_uterine_contraction, plasma_membrane).
pharmacological_effect(oxtr_ext, agonist, g_q_phospholipase_c_activation, labor_induction_and_autism_spectrum_modulation).

druggable_target(galr3, 'GALR3', gpcr, galanin_receptor).
biological_resource(galr3, [hypothalamus, pituitary, heart], inhibitory_neuropeptide_signaling, plasma_membrane).
pharmacological_effect(galr3, antagonist, g_i_coupled_blockade, mood_regulation_and_depression_mitigation).

druggable_target(ghsr, 'GHSR', gpcr, ghrelin_receptor).
biological_resource(ghsr, [pituitary, hypothalamus, vagal_afferents], appetite_and_growth_hormone_secretagogue, plasma_membrane).
pharmacological_effect(ghsr, inverse_agonist_or_antagonist, constitutive_activity_suppression, anti_obesity_and_appetite_suppression).

druggable_target(npr1, 'NPR1', guanylyl_cyclase_receptor, natriuretic_receptor).
biological_resource(npr1, [vascular_smooth_muscle, kidney, heart], atrial_natriuretic_peptide_signaling, plasma_membrane).
pharmacological_effect(npr1, agonist, cgmp_elevation_vasodilation_natriuresis, reduction_of_blood_pressure_and_heart_failure_mitigation).

druggable_target(npr2, 'NPR2', guanylyl_cyclase_receptor, natriuretic_receptor).
biological_resource(npr2, [chondrocytes, brain, vascular_tissues], c_type_natriuretic_peptide_pathway, plasma_membrane).
pharmacological_effect(npr2, agonist, cyclic_gmp_activation, stimulation_of_bone_growth_in_skeletal_dysplasias).

% ---------------------------------------------------------------------
% 7. COMPREHENSIVE KINASE EXPANSION (BATCH 12)
% ---------------------------------------------------------------------

druggable_target(map3k1, 'MEKK1', kinase, serine_threonine_kinase).
biological_resource(map3k1, [ubiquitous_tissues, epithelial_cells], mapk_jnk_p38_signaling_cascade, cytoplasm).
pharmacological_effect(map3k1, inhibitor, kinase_domain_blockade, suppression_of_stress_induced_apoptosis).

druggable_target(map3k2, 'MEKK2', kinase, serine_threonine_kinase).
biological_resource(map3k2, [leukocytes, epithelial_tissues], erk5_and_jnk_signaling_pathway, cytoplasm).
pharmacological_effect(map3k2, inhibitor, catalytic_site_occupancy, anti_inflammatory_and_anti_proliferative_action).

druggable_target(map3k3, 'MEKK3', kinase, serine_threonine_kinase).
biological_resource(map3k3, [endothelial_cells, immune_cells], nf_kb_and_p38_activation_pathway, cytoplasm).
pharmacological_effect(map3k3, inhibitor, active_site_competition, reduction_of_vascular_inflammation).

druggable_target(map3k7, 'TAK1', kinase, serine_threonine_kinase).
biological_resource(map3k7, [ubiquitous_immune_cells, fibroblasts], tgf_beta_and_il_1_signaling_network, cytoplasm).
pharmacological_effect(map3k7, inhibitor, atp_competitive_inhibition, potent_anti_inflammatory_and_immunosuppressive_action).

druggable_target(map3k14, 'NIK', kinase, serine_threonine_kinase).
biological_resource(map3k14, [lymphoid_tissues, dendritic_cells], non_canonical_nf_kb_signaling_pathway, cytoplasm).
pharmacological_effect(map3k14, inhibitor, kinase_domain_blockade, suppression_of_multiple_myeloma_and_autoimmunity).

druggable_target(mapkapk2, 'MK2', kinase, serine_threonine_kinase).
biological_resource(mapkapk2, [leukocytes, fibroblasts], p38_mapk_downstream_signaling, cytoplasm_nucleus).
pharmacological_effect(mapkapk2, inhibitor, catalytic_site_occupancy, suppression_of_tnf_alpha_biosynthesis).

druggable_target(pim3, 'PIM3', kinase, serine_threonine_kinase).
biological_resource(pim3, [liver, gastrointestinal_tract, cancer_cells], cell_cycle_progression_and_survival, cytoplasm_nucleus).
pharmacological_effect(pim3, inhibitor, atp_competitive_blockade, inhibition_of_hepatocellular_carcinoma_growth).

druggable_target(sgk1, 'SGK1', kinase, serine_threonine_kinase).
biological_resource(sgk1, [kidney_collecting_duct, brain, tumor_cells], epithelial_sodium_channel_regulation, cytoplasm).
pharmacological_effect(sgk1, inhibitor, catalytic_site_inhibition, diuretic_synergy_and_anti_tumor_action).

druggable_target(pdpk1, 'PDK1', kinase, serine_threonine_kinase).
biological_resource(pdpk1, [ubiquitous_metabolic_tissues], pi3k_downstream_akt_activation_pathway, cytoplasm_membrane).
pharmacological_effect(pdpk1, inhibitor, atp_competitive_blockade, suppression_of_cancer_cell_survival_signaling).

druggable_target(prkca, 'PKCA', kinase, serine_threonine_kinase).
biological_resource(prkca, [brain, myocardium, platelets, endothelium], calcium_dependent_protein_kinase_c, cytoplasm_membrane).
pharmacological_effect(prkca, inhibitor, catalytic_site_competition, anti_apoptotic_and_cardioprotective_modulation).

druggable_target(prkcb, 'PKCB', kinase, serine_threonine_kinase).
biological_resource(prkcb, [platelets, lymphocytes, vascular_tissues], pkc_beta_signaling_pathway, cytoplasm_membrane).
pharmacological_effect(prkcb, inhibitor, selective_atp_competition, reduction_of_diabetic_retinopathy_and_vascular_complications).

druggable_target(prkcd, 'PKCD', kinase, serine_threonine_kinase).
biological_resource(prkcd, [hematopoietic_cells, neurons, endocrine_cells], apoptosis_and_differentiation_signaling, cytoplasm_nucleus).
pharmacological_effect(prkcd, inhibitor, kinase_domain_occupancy, neuroprotection_and_anti_inflammatory_action).

druggable_target(prkcq, 'PKCQ', kinase, serine_threonine_kinase).
biological_resource(prkcq, [t_lymphocytes, platelets], t_cell_receptor_activation_pathway, immunological_synapse).
pharmacological_effect(prkcq, inhibitor, selective_catalytic_blockade, selective_immunosuppression_in_allograft_rejection).

druggable_target(tkk, 'TTK', kinase, dual_specificity_kinase).
biological_resource(tkk, [proliferating_cells, testis, cancer_cells], spindle_assembly_checkpoint_kinetics, kinetochore).
pharmacological_effect(tkk, inhibitor, atp_competitive_blockade, mitotic_catastrophe_in_aneuploid_cancers).

druggable_target(plk2, 'PLK2', kinase, serine_threonine_kinase).
biological_resource(plk2, [brain, fibroblasts, proliferating_cells], cell_cycle_and_synaptic_plasticity, centrosome_synapse).
pharmacological_effect(plk2, inhibitor, catalytic_site_inhibition, neuroprotection_and_cell_cycle_arrest).

druggable_target(plk3, 'PLK3', kinase, serine_threonine_kinase).
biological_resource(plk3, [ubiquitous_cells, stress_response_tissues], dna_damage_response_and_cytokinesis, cytoplasm_nucleus).
pharmacological_effect(plk3, inhibitor, kinase_domain_occupancy, modulation_of_stress_induced_apoptosis).

druggable_target(csnk1a1, 'CK1A', kinase, serine_threonine_kinase).
biological_resource(csnk1a1, [ubiquitous_cellular_compartments], wnt_beta_catenin_degradation_pathway, cytoplasm_nucleus).
pharmacological_effect(csnk1a1, inhibitor, catalytic_site_blockade, activation_or_suppression_of_wnt_signaling_in_cancer).

druggable_target(csnk1e, 'CK1E', kinase, serine_threonine_kinase).
biological_resource(csnk1e, [suprachiasmatic_nucleus, brain, peripheral_tissues], circadian_rhythm_regulation, cytoplasm).
pharmacological_effect(csnk1e, inhibitor, active_site_competition, phase_shifting_of_circadian_clock_rhythms).

druggable_target(snrk, 'SNRK', kinase, serine_threonine_kinase).
biological_resource(snrk, [brain, hematopoietic_cells, testis], metabolic_and_inflammatory_regulation, cytoplasm).
pharmacological_effect(snrk, inhibitor, kinase_domain_occupancy, suppression_of_inflammatory_macrophage_activation).

druggable_target(stk11, 'LKB1', kinase, serine_threonine_kinase).
biological_resource(stk11, [ubiquitous_tumor_suppressor_tissues], ampk_activation_and_energy_homeostasis, cytoplasm_nucleus).
pharmacological_effect(stk11, activator_or_target, upstream_kinase_modulation, metabolic_regulation_in_type_2_diabetes).

% ---------------------------------------------------------------------
% 8. EXTENDED SOLUTE CARRIER (SLC) TRANSPORTERS & PUMPS (BATCH 12)
% ---------------------------------------------------------------------

druggable_target(slc1a1, 'EAAT3', transporter, amino_acid_transporter).
biological_resource(slc1a1, [kidney_proximal_tubule, neurons], glutamate_and_cysteine_transport, plasma_membrane).
pharmacological_effect(slc1a1, inhibitor, transport_pore_blockade, reduction_of_excitotoxicity).

druggable_target(slc7a9, 'B0AT1', transporter, amino_acid_transporter).
biological_resource(slc7a9, [kidney_proximal_tubule_apical], neutral_amino_acid_reabsorption, brush_border_membrane).
pharmacological_effect(slc7a9, inhibitor, competitive_transport_inhibition, amino_acid_disposition_modulation).

druggable_target(slc12a2_ext, 'NKCC1_X', transporter, ion_cotransporter).
biological_resource(slc12a2_ext, [brain, secretory_glands, inner_ear], chloride_ion_accumulation, basolateral_membrane).
pharmacological_effect(slc12a2_ext, inhibitor, loop_diuretic_blockade, reduction_of_neuronal_excitability_and_edema).

druggable_target(slc26a3, 'DRA', transporter, anion_exchanger).
biological_resource(slc26a3, [colon_epithelium], chloride_bicarbonate_exchange_pathway, apical_membrane).
pharmacological_effect(slc26a3, inhibitor, transport_blockade, fluid_secretion_modulation_in_diarrheal_illness).

druggable_target(slc26a4, 'PENDRIN', transporter, anion_exchanger).
biological_resource(slc26a4, [thyroid_follicles, inner_ear_endolymph_sac], iodide_and_chloride_transport, apical_membrane).
pharmacological_effect(slc26a4, inhibitor, transporter_occupancy, prevention_of_endolymphatic_hydrops).

druggable_target(slc34a1, 'NaPi-IIa', transporter, sodium_phosphate_cotransporter).
biological_resource(slc34a1, [kidney_proximal_tubule], renal_phosphate_reabsorption, brush_border_membrane).
pharmacological_effect(slc34a1, inhibitor, transport_pore_blockade, reduction_of_serum_phosphate_in_chronic_kidney_disease).

druggable_target(slc34a2, 'NaPi-IIb', transporter, sodium_phosphate_cotransporter).
biological_resource(slc34a2, [small_intestine_epithelium, lung], dietary_phosphate_absorption, apical_membrane).
pharmacological_effect(slc34a2, inhibitor, luminal_transport_blockade, binding_dietary_phosphate_to_control_hyperphosphatemia).

druggable_target(slc34a3, 'NaPi-IIc', transporter, sodium_phosphate_cotransporter).
biological_resource(slc34a3, [kidney_proximal_tubule], pediatric_renal_phosphate_transport, apical_membrane).
pharmacological_effect(slc34a3, inhibitor, transport_occupancy, phosphate_homeostasis_modulation).

druggable_target(slc38a3, 'SNAT3', transporter, amino_acid_transporter).
biological_resource(slc38a3, [liver_perivenous_hepatocytes, brain_astrocytes], glutamine_transport_pathway, plasma_membrane).
pharmacological_effect(slc38a3, inhibitor, transport_blockade, metabolic_nitrogen_disposition_modulation).

druggable_target(slc4a4, 'NBCe1', transporter, sodium_bicarbonate_cotransporter).
biological_resource(slc4a4, [kidney_proximal_tubule, pancreas, corneal_endothelium], acid_base_regulation, basolateral_membrane).
pharmacological_effect(slc4a4, inhibitor, transport_pore_blockade, treatment_of_proximal_renal_tubular_acidosis).

% ---------------------------------------------------------------------
% 9. EXTENDED EPIGENETIC READERS, WRITERS & DEMETHYLASES (BATCH 12)
% ---------------------------------------------------------------------

druggable_target(brd1, 'BRD1', epigenetic_reader, bromodomain_protein).
biological_resource(brd1, [brain_cortex, lymphocytes], histone_acetylation_reading_complex, nucleus).
pharmacological_effect(brd1, inhibitor, bromodomain_pocket_competition, transcriptional_repression_in_neuropsychiatric_disorders).

druggable_target(brd7, 'BRD7', epigenetic_reader, bromodomain_protein).
biological_resource(brd7, [ubiquitous_nuclear_compartments, tumor_suppressor_networks], p53_and_ar_transcriptional_cofactor, nucleus).
pharmacological_effect(brd7, small_molecule_modulator, bromodomain_interaction_modulation, tumor_suppression_enhancement).

druggable_target(brd9, 'BRD9', epigenetic_reader, bromodomain_protein).
biological_resource(brd9, [swi_snf_chromatin_remodeling_complex, cancer_cells], chromatin_binding_domain, nucleus).
pharmacological_effect(brd9, selective_inhibitor, acetyl_lysine_pocket_blockade, synthetic_lethality_in_synovial_sarcoma).

druggable_target(kdm2a, 'KDM2A', enzyme, lysine_demethylase).
biological_resource(kdm2a, [ubiquitous_nuclear_compartments], histone_h3k36_demethylation, nucleus).
pharmacological_effect(kdm2a, inhibitor, iron_cofactor_active_site_chelation, epigenetic_modulation_of_cancer_cell_growth).

druggable_target(kdm3a, 'JMJD1A', enzyme, lysine_demethylase).
biological_resource(kdm3a, [testis, liver, hypoxic_tumor_cells], histone_h3k9_demethylation_hypoxic_response, nucleus).
pharmacological_effect(kdm3a, inhibitor, catalytic_site_occupancy, suppression_of_hypoxia_induced_tumor_angiogenesis).

druggable_target(kdm5a, 'JARID1A', enzyme, lysine_demethylase).
biological_resource(kdm5a, [ubiquitous_nuclear_compartments, drug_tolerant_cancer_cells], histone_h3k4_demethylation, nucleus).
pharmacological_effect(kdm5a, inhibitor, active_site_competition, prevention_of_drug_tolerance_and_tumor_resistance).

druggable_target(kdm6a, 'UTX', enzyme, lysine_demethylase).
biological_resource(kdm6a, [embryonic_stem_cells, lymphocytes, urological_cancers], histone_h3k27_demethylation, nucleus).
pharmacological_effect(kdm6a, modulator, enzymatic_activation_or_inhibition, epigenetic_reprogramming_in_cancer).

druggable_target(kdm6b, 'JMJD3', enzyme, lysine_demethylase).
biological_resource(kdm6b, [activated_macrophages, neural_cells], inflammatory_gene_demethylation, nucleus).
pharmacological_effect(kdm6b, inhibitor, catalytic_site_blockade, suppression_of_neuroinflammation_and_autoimmune_responses).

druggable_target(kat2a, 'GCN5', enzyme, histone_acetyltransferase).
biological_resource(kat2a, [ubiquitous_nuclear_compartments], histone_h3_acetylation, nucleus).
pharmacological_effect(kat2a, inhibitor, acetyl_coa_binding_pocket_competition, epigenetic_silencing_of_pro_inflammatory_genes).

druggable_target(kat2b, 'PCAF', enzyme, histone_acetyltransferase).
biological_resource(kat2b, [ubiquitous_nuclear_compartments], transcriptional_coactivation_pathway, nucleus).
pharmacological_effect(kat2b, inhibitor, catalytic_inhibition, suppression_of_oncogenic_transcription).

% ---------------------------------------------------------------------
% 10. EXTENDED PROTEASES, PEPTIDASES & DEUBIQUITINASES (BATCH 12)
% ---------------------------------------------------------------------

druggable_target(mep1a, 'MEP1A', enzyme, metalloprotease).
biological_resource(mep1a, [kidney_proximal_tubule_apical, intestinal_brush_border], extracellular_matrix_turnover, apical_membrane).
pharmacological_effect(mep1a, inhibitor, zinc_active_site_chelation, prevention_of_ischemic_acute_kidney_injury).

druggable_target(mep1b, 'MEP1B', enzyme, metalloprotease).
biological_resource(mep1b, [intestinal_brush_border, kidney], protein_digestion_pathway, apical_membrane).
pharmacological_effect(mep1b, inhibitor, catalytic_blockade, protection_against_intestinal_inflammation).

druggable_target(nep, 'NEP', enzyme, neutral_endopeptidase).
biological_resource(nep, [kidney_brush_border, vascular_endothelium, brain], natriuretic_peptide_degradation, plasma_membrane).
pharmacological_effect(nep, inhibitor, active_site_cleft_blockade, potentiation_of_endogenous_natriuretic_peptides_in_heart_failure).

druggable_target(ece1, 'ECE1', enzyme, metalloprotease).
biological_resource(ece1, [endothelial_cells, neural_tissues], big_endothelin_conversion_to_endothelin_1, intracellular_vesicles).
pharmacological_effect(ece1, inhibitor, catalytic_site_inhibition, reduction_of_vasoconstrictor_peptide_production).

druggable_target(ubp6, 'USP14', enzyme, deubiquitinase).
biological_resource(ubp6, [proteasome_associated_ubiquitous], proteasomal_protein_degradation_editing, cytoplasm_nucleus).
pharmacological_effect(ubp6, inhibitor, active_site_cysteine_alkylation, enhancement_of_proteasomal_degradation_of_misfolded_proteins).

druggable_target(uchl3, 'UCHL3', enzyme, deubiquitinase).
biological_resource(uchl3, [ubiquitous_cytoplasmic_compartments], ubiquitin_carboxyl_terminal_hydrolysis, cytoplasm).
pharmacological_effect(uchl3, inhibitor, catalytic_pocket_blockade, metabolic_and_neurodegenerative_pathway_modulation).

druggable_target(otub1, 'OTUB1', enzyme, deubiquitinase).
biological_resource(otub1, [ubiquitous_cells, immune_cells], non_canonical_deubiquitination_pathway, cytoplasm_nucleus).
pharmacological_effect(otub1, inhibitor, active_site_inhibition, suppression_of_dna_damage_repair_in_cancer_cells).

% ---------------------------------------------------------------------
% 11. ADDITIONAL CYTOCHROMES, METABOLIC ENZYMES & NUCLEAR RECEPTORS (BATCH 12)
% ---------------------------------------------------------------------

druggable_target(cyp2b6, 'CYP2B6', enzyme, cytochrome_p450).
biological_resource(cyp2b6, [liver_hepatocytes, brain], antiretroviral_and_anesthetic_metabolism, endoplasmic_reticulum).
pharmacological_effect(cyp2b6, inhibitor_or_inducer, catalytic_site_competition, alteration_of_efavirenz_clearance).

druggable_target(cyp2a6, 'CYP2A6', enzyme, cytochrome_p450).
biological_resource(cyp2a6, [liver_hepatocytes], nicotine_c_oxidation_pathway, endoplasmic_reticulum).
pharmacological_effect(cyp2a6, inhibitor, selective_active_site_blockade, reduction_of_nicotine_metabolism_to_aid_smoking_cessation).

druggable_target(cyp2j2, 'CYP2J2', enzyme, cytochrome_p450).
biological_resource(cyp2j2, [cardiovascular_system, extrahepatic_tissues], epoxyeicosatrienoic_acid_synthesis, endoplasmic_reticulum).
pharmacological_effect(cyp2j2, activator_or_inhibitor, enzymatic_modulation, cardioprotection_and_anti_arrhythmic_action).

druggable_target(cyp4f2, 'CYP4F2', enzyme, cytochrome_p450).
biological_resource(cyp4f2, [liver, kidney], 20_hydroxyeicosatetraenoic_acid_synthesis, endoplasmic_reticulum).
pharmacological_effect(cyp4f2, inhibitor, catalytic_site_blockade, blood_pressure_regulation).

druggable_target(nr1h2_ext, 'LXRB_X', nuclear_receptor, oxysterol_sensor).
biological_resource(nr1h2_ext, [brain, macrophages, intestine], cholesterol_and_lipid_homeostasis, nucleus).
pharmacological_effect(nr1h2_ext, agonist, transcriptional_activation_of_efflux_transporters, reverse_cholesterol_transport_enhancement).

druggable_target(nr1i3_ext, 'CAR_X', nuclear_receptor, xenobiotic_sensor).
biological_resource(nr1i3_ext, [liver, intestine], constitutive_androstane_receptor_pathway, cytoplasm_to_nucleus).
pharmacological_effect(nr1i3_ext, inverse_agonist_or_agonist, transcriptional_modulation_of_drug_clearance, xenobiotic_metabolism_control).
