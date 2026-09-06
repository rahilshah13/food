% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. EXTENDED G-PROTEIN COUPLED RECEPTORS (GPCR SUBFAMILIES)
% ---------------------------------------------------------------------

druggable_target(gpr1, 'GPR1', gpcr, orphan_gpcr).
biological_resource(gpr1, [placenta, central_nervous_system, skeletal_muscle], chemerin_like_signaling_pathway, plasma_membrane).
pharmacological_effect(gpr1, agonist_or_antagonist, g_i_coupled_signaling_modulation, metabolic_and_inflammatory_regulation).

druggable_target(gpr3, 'GPR3', gpcr, orphan_gpcr).
biological_resource(gpr3, [brain_striatum, Oocytes], constitutive_camp_elevation_pathway, plasma_membrane).
pharmacological_effect(gpr3, inverse_agonist, g_s_constitutive_activity_blockade, modulation_of_neurodegeneration_and_meiosis).

druggable_target(gpr4, 'GPR4', gpcr, proton_sensing_gpcr).
biological_resource(gpr4, [endothelial_cells, kidney, lung], extracellular_acidosis_signaling, plasma_membrane).
pharmacological_effect(gpr4, antagonist, extracellular_ph_response_blockade, reduction_of_inflammation_and_tumor_angiogenesis).

druggable_target(gpr6, 'GPR6', gpcr, orphan_gpcr).
biological_resource(gpr6, [brain_striatum, Nucleus_accumbens], sphingosylphosphorylcholine_signaling, plasma_membrane).
pharmacological_effect(gpr6, inverse_agonist, constitutive_camp_reduction, motor_activity_modulation_in_parkinsons).

druggable_target(gpr12, 'GPR12', gpcr, orphan_gpcr).
biological_resource(gpr12, [brain, ovary, testis], lipid_mediator_signaling_pathway, plasma_membrane).
pharmacological_effect(gpr12, antagonist, receptor_occupancy_blockade, neurological_disorder_pathway_modulation).

druggable_target(gpr15, 'GPR15', gpcr, chemokine_receptor_like).
biological_resource(gpr15, [colon_t_lymphocytes, dendritic_cells], mucosal_homing_pathway, plasma_membrane).
pharmacological_effect(gpr15, antagonist, lymphocyte_homing_blockade, suppression_of_colitis_and_bowel_inflammation).

druggable_target(gpr17, 'GPR17', gpcr, purinergic_cysteinyl_leukotriene_receptor).
biological_resource(gpr17, [oligodendrocyte_precursors, brain_white_matter], myelination_and_injury_response, plasma_membrane).
pharmacological_effect(gpr17, antagonist, leukotriene_d4_receptor_blockade, promotion_of_remyelination_in_multiple_sclerosis).

druggable_target(gpr18, 'GPR18', gpcr, cannabinoid_related_receptor).
biological_resource(gpr18, [microglia, spleen, testis, colon], n_arachidonoyldopamine_signaling, plasma_membrane).
pharmacological_effect(gpr18, agonist_or_antagonist, g_i_coupled_signaling_modulation, immunomodulation_and_intraocular_pressure_control).

druggable_target(gpr19, 'GPR19', gpcr, orphan_gpcr).
biological_resource(gpr19, [brain, lung, prostate_cancer_cells], embryonic_neural_development_pathway, plasma_membrane).
pharmacological_effect(gpr19, antagonist, receptor_inhibition, suppression_of_cancer_cell_proliferation).

druggable_target(gpr21, 'GPR21', gpcr, orphan_gpcr).
biological_resource(gpr21, [brain, white_adipose_tissue, macrophages], inflammatory_metabolic_signaling, plasma_membrane).
pharmacological_effect(gpr21, antagonist, g_q_signaling_blockade, attenuation_of_high_fat_diet_induced_insulin_resistance).

druggable_target(gpr22, 'GPR22', gpcr, orphan_gpcr).
biological_resource(gpr22, [myocardium, brain], cardiac_stress_response_pathway, plasma_membrane).
pharmacological_effect(gpr22, agonist, cardioprotective_signaling_stimulation, prevention_of_heart_failure_progression).

druggable_target(gpr25, 'GPR25', gpcr, orphan_gpcr).
biological_resource(gpr25, [brain_cortex, lymphocytes], immunological_and_neuronal_signaling, plasma_membrane).
pharmacological_effect(gpr25, antagonist, receptor_blockade, neuropsychiatric_pathway_modulation).

druggable_target(gpr26, 'GPR26', gpcr, orphan_gpcr).
biological_resource(gpr26, [hypothalamus, amygdala, limbic_system], energy_balance_and_depression_pathway, plasma_membrane).
pharmacological_effect(gpr26, agonist, camp_pathway_activation, antidepressant_and_anti_obesity_action).

druggable_target(gpr27, 'GPR27', gpcr, orphan_gpcr).
biological_resource(gpr27, [brain_hypothalamus, Islets_of_langerhans], metabolic_homeostasis_pathway, plasma_membrane).
pharmacological_effect(gpr27, agonist, insulin_secretion_modulation, type_2_diabetes_pathway_regulation).

druggable_target(gpr31, 'GPR31', gpcr, orphan_gpcr).
biological_resource(gpr31, [skin, gastrointestinal_tract, cancer_cells], 12_hote_lipid_mediator_signaling, plasma_membrane).
pharmacological_effect(gpr31, antagonist, receptor_occupancy_blockade, anti_inflammatory_and_anti_metastatic_action).

druggable_target(gpr32, 'GPR32', gpcr, orphan_gpcr).
biological_resource(gpr32, [leukocytes, endothelial_cells, spleen], resolvins_signaling_pathway, plasma_membrane).
pharmacological_effect(gpr32, agonist, resolution_of_inflammation_signaling, promotion_of_tissue_repair).

druggable_target(gpr34, 'GPR34', gpcr, lysophosphatidylserine_receptor).
biological_resource(gpr34, [microglia, mast_cells, immune_tissues], lysophosphatidylserine_signaling, plasma_membrane).
pharmacological_effect(gpr34, agonist_or_antagonist, g_i_coupled_signaling_modulation, neuroinflammation_and_mast_cell_stabilization).

druggable_target(gpr37, 'GPR37', gpcr, parkin_associated_endothelin_receptor_like).
biological_resource(gpr37, [brain_substant_nigra, oligodendrocytes, testis], prosaptide_signaling_pathway, plasma_membrane).
pharmacological_effect(gpr37, agonist, neuroprotective_signaling_activation, parkinsons_disease_neuroprotection).

druggable_target(gpr39, 'GPR39', gpcr, zinc_sensing_receptor).
biological_resource(gpr39, [stomach, intestine, brain, pancreas], extracellular_zinc_ion_sensing, plasma_membrane).
pharmacological_effect(gpr39, agonist, g_q_g_s_coupled_signaling, gastrointestinal_protection_and_antidepressant_action).

druggable_target(gpr42, 'GPR42', gpcr, short_chain_fatty_acid_receptor).
biological_resource(gpr42, [gut_epithelium, adipose_tissue], microbial_metabolite_sensing, plasma_membrane).
pharmacological_effect(gpr42, agonist, metabolic_signaling_stimulation, regulation_of_energy_balance).

druggable_target(gpr45, 'GPR45', gpcr, orphan_gpcr).
biological_resource(gpr45, [hypothalamus, brainstem], neural_development_and_feeding_control, plasma_membrane).
pharmacological_effect(gpr45, antagonist, receptor_blockade, appetite_suppression_and_weight_management).

druggable_target(gpr50, 'GPR50', gpcr, melatonin_related_receptor).
biological_resource(gpr50, [hypothalamus, pituitary, brain], circadian_rhythm_and_metabolism, plasma_membrane).
pharmacological_effect(gpr50, modulator, melatonin_signaling_modulation, sleep_and_thermoregulation_control).

druggable_target(gpr52, 'GPR52', gpcr, orphan_gpcr).
biological_resource(gpr52, [striatum, frontal_cortex], dopamine_d2_circuitry_modulation, plasma_membrane).
pharmacological_effect(gpr52, agonist, g_s_coupled_camp_increase, antipsychotic_action_without_extrapyramidal_side_effects).

druggable_target(gpr61, 'GPR61', gpcr, orphan_gpcr).
biological_resource(gpr61, [brain_cortex, hippocampus, striatum], central_nervous_system_signaling, plasma_membrane).
pharmacological_effect(gpr61, antagonist, receptor_occupancy_blockade, neuropsychiatric_disorder_mitigation).

druggable_target(gpr62, 'GPR62', gpcr, orphan_gpcr).
biological_resource(gpr62, [brain, testis, peripheral_tissues], constitutive_camp_production, plasma_membrane).
pharmacological_effect(gpr62, inverse_agonist, constitutive_signaling_inhibition, neurological_signaling_modulation).

druggable_target(gpr63, 'GPR63', gpcr, orphan_gpcr).
biological_resource(gpr63, [brain, placenta, prostate], neural_and_endocrine_pathways, plasma_membrane).
pharmacological_effect(gpr63, antagonist, receptor_blockade, oncogenic_signaling_suppression).

druggable_target(gpr65, 'GPR65', gpcr, proton_sensing_tdr4).
biological_resource(gpr65, [macrophages, t_cells, neutrophils, intestine], acid_sensing_inflammatory_pathway, plasma_membrane).
pharmacological_effect(gpr65, antagonist, proton_activation_blockade, attenuation_of_inflammatory_bowel_disease).

druggable_target(gpr75, 'GPR75', gpcr, orphan_gpcr).
biological_resource(gpr75, [brain, retina, adipocytes], RANTES_receptor_related_signaling, plasma_membrane).
pharmacological_effect(gpr75, antagonist, receptor_blockade, protection_against_obesity_and_metabolic_syndrome).

druggable_target(gpr78, 'GPR78', gpcr, orphan_gpcr).
biological_resource(gpr78, [pituitary, hypothalamus, breast_cancers], endocrine_and_tumor_growth_pathway, plasma_membrane).
pharmacological_effect(gpr78, antagonist, receptor_occupancy_blockade, suppression_of_hormone_dependent_tumor_survival).

druggable_target(gpr82, 'GPR82', gpcr, orphan_gpcr).
biological_resource(gpr82, [brain_hypothalamus, liver], energy_homeostasis_pathway, plasma_membrane).
pharmacological_effect(gpr82, agonist_or_antagonist, metabolic_signaling_modulation, regulation_of_body_weight).

druggable_target(gpr83, 'GPR83', gpcr, orphan_gpcr).
biological_resource(gpr83, [limbic_system, hypothalamus, T_regulatory_cells], neuropeptide_b_w_signaling_pathway, plasma_membrane).
pharmacological_effect(gpr83, antagonist, receptor_blockade, regulation_of_immunotolerance_and_feeding).

druggable_target(gpr85, 'GPR85', gpcr, super_orphan_receptor).
biological_resource(gpr85, [brain_cortex, hippocampus, neural_progenitors], brain_size_and_neural_development, plasma_membrane).
pharmacological_effect(gpr85, antagonist, receptor_occupancy_blockade, neurodevelopmental_disorder_pathway_modulation).

druggable_target(gpr87, 'GPR87', gpcr, lysophosphatidic_acid_receptor_related).
biological_resource(gpr87, [squamous_cell_carcinomas, breast_cancer, thymus], tumor_survival_pathway, plasma_membrane).
pharmacological_effect(gpr87, antagonist, ligand_binding_blockade, induction_of_apoptosis_in_cancer_cells).

druggable_target(gpr88, 'GPR88', gpcr, striatal_orphan_receptor).
biological_resource(gpr88, [striatum, nucleus_accumbens, cortex], motor_coordination_and_reward_pathways, plasma_membrane).
pharmacological_effect(gpr88, agonist, g_i_coupled_neuronal_inhibition, treatment_of_addiction_and_huntingtons_disease).

druggable_target(gpr101, 'GPR101', gpcr, orphan_gpcr).
biological_resource(gpr101, [hypothalamus_pituitary, brain], growth_hormone_regulation_pathway, plasma_membrane).
pharmacological_effect(gpr101, antagonist, constitutive_signaling_inhibition, treatment_of_acromegaly_and_pituitary_gigantism).

druggable_target(gpr119_v, 'GPR119_V', gpcr, metabolic_receptor).
biological_resource(gpr119_v, [pancreas, intestine], lipid_amide_signaling, plasma_membrane).
pharmacological_effect(gpr119_v, agonist, g_s_camp_elevation, insulinotropic_metabolic_action).

druggable_target(gpr139, 'GPR139', gpcr, orphan_gpcr).
biological_resource(gpr139, [habenula, striatum, hypothalamus], l_phenylalanine_and_l_tryptophan_sensing, plasma_membrane).
pharmacological_effect(gpr139, agonist, g_q_signaling_activation, modulation_of_reward_and_neurotransmission).

druggable_target(gpr141, 'GPR141', gpcr, orphan_gpcr).
biological_resource(gpr141, [liver, kidney, adrenal_gland], stress_response_pathway, plasma_membrane).
pharmacological_effect(gpr141, antagonist, receptor_blockade, endocrine_regulation).

druggable_target(gpr142, 'GPR142', gpcr, amino_acid_sensing_gpcr).
biological_resource(gpr142, [pancreatic_islets, intestine], aromatic_amino_acid_sensing, plasma_membrane).
pharmacological_effect(gpr142, agonist, g_q_calcium_signaling_stimulation, glucose_dependent_insulin_secretion).

druggable_target(gpr143, 'GPR143', gpcr, ocular_melanin_receptor).
biological_resource(gpr143, [retinal_pigment_epithelium, melanocytes], intracellular_signal_transduction, plasma_membrane).
pharmacological_effect(gpr143, agonist_or_antagonist, receptor_modulation, ocular_pathway_and_melanin_synthesis_control).

druggable_target(gpr146, 'GPR146', gpcr, lipid_sensing_orphan).
biological_resource(gpr146, [liver_hepatocytes, plasma], serum_cholesterol_regulation_pathway, plasma_membrane).
pharmacological_effect(gpr146, antagonist, receptor_occupancy_blockade, lowering_of_plasma_ldl_cholesterol).

druggable_target(gpr149, 'GPR149', gpcr, orphan_gpcr).
biological_resource(gpr149, [brain_cortex, spinal_cord], sensory_processing_pathway, plasma_membrane).
pharmacological_effect(gpr149, antagonist, receptor_blockade, analgesia_and_neuropathic_pain_relief).

druggable_target(gpr150, 'GPR150', gpcr, orphan_gpcr).
biological_resource(gpr150, [brain, lymphoid_tissues, intestine], neuroimmune_signaling, plasma_membrane).
pharmacological_effect(gpr150, antagonist, receptor_inhibition, immunomodulation).

druggable_target(gpr151, 'GPR151', gpcr, habenula_specific_receptor).
biological_resource(gpr151, [habenula, pain_pathways, axonal_tracts], axonal_projection_and_pain_signaling, plasma_membrane).
pharmacological_effect(gpr151, antagonist, g_i_signaling_blockade, neuropathic_pain_relief_and_addiction_mitigation).

druggable_target(gpr152, 'GPR152', gpcr, orphan_gpcr).
biological_resource(gpr152, [brain, bone_marrow, spleen], endocrine_signaling, plasma_membrane).
pharmacological_effect(gpr152, antagonist, receptor_blockade, metabolic_regulation).

druggable_target(gpr153, 'GPR153', gpcr, orphan_gpcr).
biological_resource(gpr153, [brain, pituitary, testis], neuronal_development_pathway, plasma_membrane).
pharmacological_effect(gpr153, antagonist, receptor_inhibition, neurological_disorder_mitigation).

druggable_target(gpr156, 'GPR156', gpcr, inhibitory_orphan_gpcr).
biological_resource(gpr156, [brain, inner_ear, kidney], g_i_coupled_neuronal_signaling, plasma_membrane).
pharmacological_effect(gpr156, modulator, signal_transduction_tuning, sensory_pathway_modulation).

druggable_target(gpr158, 'GPR158', gpcr, metabotropic_glycine_receptor).
biological_resource(gpr158, [brain_cortex, hippocampus, prefrontal_cortex], stress_and_depressive_signaling, plasma_membrane).
pharmacological_effect(gpr158, antagonist, osteocalcin_and_glycine_signaling_blockade, rapid_acting_antidepressant_effect).

druggable_target(gpr160, 'GPR160', gpcr, orphan_gpcr).
biological_resource(gpr160, [brain, prostate, breast_cancers], tumor_proliferation_pathway, plasma_membrane).
pharmacological_effect(gpr160, antagonist, receptor_occupancy_blockade, suppression_of_hormone_refractory_cancers).

druggable_target(gpr161, 'GPR161', gpcr, negative_regulator_of_hedgehog).
biological_resource(gpr161, [embryonic_neural_tube, primary_cilia, basal_cell_carcinoma], camp_dependent_hedgehog_repression, primary_cilium).
pharmacological_effect(gpr161, agonist, camp_elevation_hedgehog_suppression, inhibition_of_basal_cell_carcinoma_growth).

druggable_target(gpr162, 'GPR162', gpcr, orphan_gpcr).
biological_resource(gpr162, [brain_hypothalamus, striatum], energy_balance_and_feeding, plasma_membrane).
pharmacological_effect(gpr162, antagonist, receptor_blockade, anti_obesity_and_appetite_suppression).

druggable_target(gpr171, 'GPR171', gpcr, neuropeptide_pen_receptor).
biological_resource(gpr171, [brain_limbic_system, amygdala, hypothalamus], peptide_endocrine_signaling, plasma_membrane).
pharmacological_effect(gpr171, agonist_or_antagonist, g_i_signaling_modulation, anxiolytic_and_antidepressant_action).

druggable_target(gpr173, 'GPR173', gpcr, s1gR_related_receptor).
biological_resource(gpr173, [brain_hypothalamus, pituitary, gonads], urocortin_and_peptide_signaling, plasma_membrane).
pharmacological_effect(gpr173, antagonist, receptor_blockade, neuroendocrine_modulation).

druggable_target(gpr174, 'GPR174', gpcr, lysophosphatidylserine_receptor_3).
biological_resource(gpr174, [t_lymphocytes, spleen, lymph_nodes], lymphocyte_migration_pathway, plasma_membrane).
pharmacological_effect(gpr174, antagonist, g_s_signaling_blockade, enhancement_of_anti_tumor_immune_responses).

druggable_target(gpr176, 'GPR176', gpcr, suprachiasmatic_circadian_receptor).
biological_resource(gpr176, [suprachiasmatic_nucleus, brain], circadian_oscillator_pacemaker, plasma_membrane).
pharmacological_effect(gpr176, antagonist, g_i_coupled_circadian_inhibition, circadian_rhythm_synchronization).

druggable_target(gpr182, 'GPR182', gpcr, adrenomedullin_adhesion_receptor).
biological_resource(gpr182, [vascular_endothelium, hematopoietic_stem_cells], vascular_permeability_and_homing, plasma_membrane).
pharmacological_effect(gpr182, antagonist, receptor_occupancy_blockade, anti_angiogenic_and_anti_tumor_action).

% ---------------------------------------------------------------------
% 2. EXTENDED PROTEIN KINASES (DARK KINOME & SPECIALIZED FAMILIES)
% ---------------------------------------------------------------------

druggable_target(mask1, 'MASK1', kinase, ankyrin_repeat_kinase).
biological_resource(mask1, [brain, proliferating_tissues], hippo_and_wnt_signaling_crosstalk, cytoplasm_nucleus).
pharmacological_effect(mask1, inhibitor, catalytic_site_blockade, suppression_of_oncogenic_transcription).

druggable_target(mask2, 'MASK2', kinase, ankyrin_repeat_kinase).
biological_resource(mask2, [kidney, liver, brain], transcriptional_coactivation_pathway, cytoplasm_nucleus).
pharmacological_effect(mask2, inhibitor, atp_competitive_inhibition, metabolic_and_anti_tumor_modulation).

druggable_target(pkn1, 'PKN1', kinase, serine_threonine_kinase).
biological_resource(pkn1, [brain, heart, neutrophils], rho_gtpase_effector_cytoskeletal_pathway, cytoplasm).
pharmacological_effect(pkn1, inhibitor, catalytic_site_occupancy, neuroprotection_and_reduction_of_inflammation).

druggable_target(pkn2, 'PKN2', kinase, serine_threonine_kinase).
biological_resource(pkn2, [endothelial_cells, fibroblasts, cancer_cells], actin_cytoskeleton_remodeling, cytoplasm).
pharmacological_effect(pkn2, inhibitor, atp_competitive_blockade, suppression_of_tumor_cell_migration_and_invasion).

druggable_target(pkn3, 'PKN3', kinase, serine_threonine_kinase).
biological_resource(pkn3, [endothelium, malignant_epithelium], pi3k_downstream_tumor_angiogenesis, cytoplasm).
pharmacological_effect(pkn3, inhibitor, catalytic_site_inhibition, anti_angiogenic_and_anti_metastatic_action).

druggable_target(prkx, 'PRKX', kinase, serine_threonine_kinase).
biological_resource(prkx, [kidney, brain, hematopoietic_cells], renal_tubulogenesis_pathway, cytoplasm_nucleus).
pharmacological_effect(prkx, activator_or_inhibitor, kinase_domain_modulation, prevention_of_renal_cystic_disease).

druggable_target(prky, 'PRKY', kinase, serine_threonine_kinase).
biological_resource(prky, [testis, germ_cells], spermatogenesis_pathway, cytoplasm).
pharmacological_effect(prky, inhibitor, catalytic_blockade, reproductive_pathway_modulation).

druggable_target(tssk1b, 'TSSK1B', kinase, serine_threonine_kinase).
biological_resource(tssk1b, [testis_germ_cells], sperm_capacitation_and_motility, cytoplasm_flagellum).
pharmacological_effect(tssk1b, inhibitor, catalytic_site_occupancy, non_hormonal_male_contraception).

druggable_target(tssk2, 'TSSK2', kinase, serine_threonine_kinase).
biological_resource(tssk2, [testis_spermatids], spermatogenesis_pathway, cytoplasm).
pharmacological_effect(tssk2, inhibitor, active_site_competition, male_antifertility_agent).

druggable_target(tssk3, 'TSSK3', kinase, serine_threonine_kinase).
biological_resource(tssk3, [testis_developing_germ_cells], flagellar_assembly, cytoplasm).
pharmacological_effect(tssk3, inhibitor, kinase_domain_blockade, targeted_contraceptive_action).

druggable_target(tssk4, 'TSSK4', kinase, serine_threonine_kinase).
biological_resource(tssk4, [testis_mature_spermatozoa], sperm_motility_control, cytoplasm).
pharmacological_effect(tssk4, inhibitor, catalytic_inhibition, antifertility_agent).

druggable_target(brsk1, 'BRSK1', kinase, serine_threonine_kinase).
biological_resource(brsk1, [brain_neurons, polarity_complexes], neuronal_polarity_and_synaptogenesis, cytoplasm).
pharmacological_effect(brsk1, inhibitor, atp_competitive_blockade, neuroprotection_and_epilepsy_mitigation).

druggable_target(brsk2, 'BRSK2', kinase, serine_threonine_kinase).
biological_resource(brsk2, [pancreatic_islets, brain], insulin_secretion_and_neuronal_migration, cytoplasm).
pharmacological_effect(brsk2, inhibitor, catalytic_site_occupancy, management_of_type_2_diabetes_and_neuronal_disorders).

druggable_target(nuak1, 'NUAK1', kinase, serine_threonine_kinase).
biological_resource(nuak1, [brain, skeletal_muscle, cancer_cells], ampk_related_cellular_stress_response, cytoplasm_nucleus).
pharmacological_effect(nuak1, inhibitor, kinase_domain_blockade, synthetic_lethality_in_p53_deficient_cancers).

druggable_target(nuak2, 'NUAK2', kinase, serine_threonine_kinase).
biological_resource(nuak2, [fibroblasts, skin, melanoma_cells], actin_stress_fiber_formation, cytoplasm).
pharmacological_effect(nuak2, inhibitor, atp_competitive_inhibition, suppression_of_melanoma_invasion_and_fibrosis).

druggable_target(ikbke, 'IKBKE', kinase, serine_threonine_kinase).
biological_resource(ikbke, [breast_cancer_cells, immune_cells, macrophages], innate_immune_type_i_interferon_signaling, cytoplasm_nucleus).
pharmacological_effect(ikbke, inhibitor, catalytic_site_blockade, suppression_of_breast_cancer_proliferation_and_inflammation).

druggable_target(tbk1, 'TBK1', kinase, serine_threonine_kinase).
biological_resource(tbk1, [ubiquitous_immune_cells, fibroblasts], sting_autophagy_and_interferon_signaling, cytoplasm).
pharmacological_effect(tbk1, inhibitor, atp_competitive_inhibition, anti_inflammatory_and_antiviral_modulation).

druggable_target(map3k8, 'TPL2', kinase, serine_threonine_kinase).
biological_resource(map3k8, [macrophages, monocytes, T_cells], mapk_mek_erk_inflammatory_pathway, cytoplasm).
pharmacological_effect(map3k8, inhibitor, catalytic_site_occupancy, treatment_of_ulcerative_colitis_and_psoriasis).

druggable_target(map3k9, 'MLK1', kinase, serine_threonine_kinase).
biological_resource(map3k9, [brain, neuronal_synapses], jnk_mapk_signaling_cascade, cytoplasm).
pharmacological_effect(map3k9, inhibitor, kinase_domain_blockade, neuroprotection_in_ischemic_stroke).

druggable_target(map3k10, 'MLK2', kinase, serine_threonine_kinase).
biological_resource(map3k10, [brain, testis, muscle], stress_activated_protein_kinase_pathway, cytoplasm).
pharmacological_effect(map3k10, inhibitor, atp_competitive_blockade, neurodegenerative_disease_mitigation).

druggable_target(map3k11, 'MLK3', kinase, serine_threonine_kinase).
biological_resource(map3k11, [ubiquitous_cells, cancer_cells], mixed_lineage_kinase_apoptosis_signaling, cytoplasm).
pharmacological_effect(map3k11, inhibitor, catalytic_inhibition, suppression_of_cancer_metastasis_and_neuronal_apoptosis).

druggable_target(map3k12, 'DLK', kinase, serine_threonine_kinase).
biological_resource(map3k12, [brain_neurons, axon_terminals], axonal_degeneration_and_jnk_signaling, axon).
pharmacological_effect(map3k12, inhibitor, kinase_domain_occupancy, prevention_of_neurodegeneration_and_axon_die_back).

druggable_target(map3k13, 'LZK', kinase, serine_threonine_kinase).
biological_resource(map3k13, [brain, spinal_cord], axonal_regeneration_pathway, cytoplasm_nucleus).
pharmacological_effect(map3k13, inhibitor, catalytic_site_blockade, neurological_pathway_modulation).

druggable_target(ziPK, 'DAPK3', kinase, serine_threonine_kinase).
biological_resource(ziPK, [smooth_muscle, endothelial_cells, cancer_cells], apoptosis_and_cytoskeletal_dynamics, cytoplasm_nucleus).
pharmacological_effect(ziPK, inhibitor, atp_competitive_inhibition, vasodilation_and_tumor_suppression_modulation).

druggable_target(dapk1, 'DAPK1', kinase, serine_threonine_kinase).
biological_resource(dapk1, [brain_neurons, immune_cells], calcium_calmodulin_regulated_apoptosis, cytoplasm).
pharmacological_effect(dapk1, inhibitor, catalytic_site_occupancy, neuroprotection_in_stroke_and_ischemic_injury).

druggable_target(dapk2, 'DAPK2', kinase, serine_threonine_kinase).
biological_resource(dapk2, [blood_cells, granulocytes], granulocytic_differentiation_and_apoptosis, cytoplasm).
pharmacological_effect(dapk2, inhibitor, kinase_domain_blockade, modulation_of_immune_cell_survival).

druggable_target(ccrk, 'CDK20', kinase, serine_threonine_kinase).
biological_resource(ccrk, [liver_hepatocytes, prostate_cancer_cells], cell_cycle_progression_and_ar_signaling, nucleus).
pharmacological_effect(ccrk, inhibitor, atp_competitive_blockade, suppression_of_hepatocellular_carcinoma_growth).

druggable_target(cdk11a, 'CDK11A', kinase, serine_threonine_kinase).
biological_resource(cdk11a, [ubiquitous_nuclear_compartments], rna_processing_and_mitosis, nucleus).
pharmacological_effect(cdk11a, inhibitor, catalytic_inhibition, cell_cycle_arrest).

druggable_target(cdk12, 'CDK12', kinase, serine_threonine_kinase).
biological_resource(cdk12, [ubiquitous_proliferating_cells], rna_polymerase_ii_ctd_phosphorylation, nucleus).
pharmacological_effect(cdk12, inhibitor, active_site_competition, synthetic_lethality_in_homologous_recombination_deficient_cancers).

druggable_target(cdk13, 'CDK13', kinase, serine_threonine_kinase).
biological_resource(cdk13, [brain, ubiquitous_cells], transcriptional_regulation_and_splicing, nucleus).
pharmacological_effect(cdk13, inhibitor, kinase_domain_occupancy, suppression_of_transcription_in_cancer).

druggable_target(cdk14, 'PFTK1', kinase, serine_threonine_kinase).
biological_resource(cdk14, [brain, testis, gastrointestinal_cancers], cell_cycle_g2_m_transition, nucleus_membrane).
pharmacological_effect(cdk14, inhibitor, atp_competitive_inhibition, anti_proliferative_action_in_tumor_cells).

druggable_target(cdk16, 'PCTAIRE1', kinase, serine_threonine_kinase).
biological_resource(cdk16, [brain, testis, prostate_cancer], neuronal_vesicular_transport_and_mitosis, cytoplasm_membrane).
pharmacological_effect(cdk16, inhibitor, catalytic_site_blockade, suppression_of_neuroendocrine_prostate_cancer).

druggable_target(cdk17, 'PCTAIRE2', kinase, serine_threonine_kinase).
biological_resource(cdk17, [brain_neurons, testis], neuronal_differentiation_pathway, cytoplasm).
pharmacological_effect(cdk17, inhibitor, active_site_competition, neurodevelopmental_pathway_modulation).

druggable_target(cdk18, 'PCTAIRE3', kinase, serine_threonine_kinase).
biological_resource(cdk18, [brain, testis, proliferating_cells], cell_cycle_and_neuronal_function, nucleus_cytoplasm).
pharmacological_effect(cdk18, inhibitor, kinase_domain_blockade, anti_cancer_action).

druggable_target(map3k4, 'MEKK4', kinase, serine_threonine_kinase).
biological_resource(map3k4, [brain, kidney, embryonic_cells], p38_and_jnk_activation_pathway, cytoplasm).
pharmacological_effect(map3k4, inhibitor, atp_competitive_inhibition, attenuation_of_stress_signaling).

druggable_target(map3k6, 'MAP3K6', kinase, serine_threonine_kinase).
biological_resource(map3k6, [heart, lung, pancreas, prostate], stress_activated_protein_kinase_network, cytoplasm).
pharmacological_effect(map3k6, inhibitor, catalytic_site_occupancy, suppression_of_cardiac_fibrosis).

% ---------------------------------------------------------------------
% 3. SOLUTE CARRIER (SLC) TRANSPORTERS (MASSIVE EXPANSION)
% ---------------------------------------------------------------------

druggable_target(slc2a2, 'GLUT2', transporter, glucose_transporter).
biological_resource(slc2a2, [liver, pancreatic_beta_cells, kidney_basolateral, intestine_basolateral], low_affinity_glucose_transport, plasma_membrane).
pharmacological_effect(slc2a2, inhibitor_or_modulator, pore_blockade, modulation_of_hepatic_glucose_sensing_and_insulin_secretion).

druggable_target(slc2a3, 'GLUT3', transporter, glucose_transporter).
biological_resource(slc2a3, [brain_neurons, placenta, sperm], high_affinity_neuronal_glucose_uptake, plasma_membrane).
pharmacological_effect(slc2a3, inhibitor, transport_pore_blockade, suppression_of_neuronal_and_tumor_glucose_metabolism).

druggable_target(slc2a5, 'GLUT5', transporter, fructose_transporter).
biological_resource(slc2a5, [small_intestine_apical, testis, kidney, brain], fructose_absorption_pathway, plasma_membrane).
pharmacological_effect(slc2a5, inhibitor, competitive_transport_blockade, attenuation_of_fructose_induced_metabolic_syndrome).

druggable_target(slc6a6, 'TAUT', transporter, taurine_transporter).
biological_resource(slc6a6, [retina, heart, kidney, brain], sodium_and_chloride_dependent_taurine_transport, plasma_membrane).
pharmacological_effect(slc6a6, inhibitor, transport_blockade, cellular_osmoregulation_and_cytoprotection_modulation).

druggable_target(slc6a8, 'CRT', transporter, creatine_transporter).
biological_resource(slc6a8, [skeletal_muscle, brain, heart, kidney], creatine_uptake_pathway, plasma_membrane).
pharmacological_effect(slc6a8, inhibitor, transport_pore_blockade, depletion_of_cellular_creatine_in_cancer_cells).

druggable_target(slc6a9, 'GLYT1', transporter, glycine_transporter).
biological_resource(slc6a9, [brain_astrocytes, brainstem, spinal_cord], glycine_reuptake_at_nmda_receptors, plasma_membrane).
pharmacological_effect(slc6a9, inhibitor, competitive_reuptake_blockade, elevation_of_synaptic_glycine_for_schizophrenia_cognitive_symptoms).

druggable_target(slc6a11, 'GAT3', transporter, gaba_transporter).
biological_resource(slc6a11, [brain_astrocytes, thalamus], gaba_reuptake_pathway, plasma_membrane).
pharmacological_effect(slc6a11, inhibitor, transport_blockade, enhancement_of_inhibitory_gabaergic_neurotransmission).

druggable_target(slc6a12, 'BGT1', transporter, betaine_transporter).
biological_resource(slc6a12, [kidney_medulla, brain], betaine_and_gaba_transport, plasma_membrane).
pharmacological_effect(slc6a12, inhibitor, transport_occupancy, osmoregulatory_pathway_modulation).

druggable_target(slc6a13, 'GAT2', transporter, gaba_transporter).
biological_resource(slc6a13, [brain, kidney, liver], gaba_and_beta_alanine_transport, plasma_membrane).
pharmacological_effect(slc6a13, inhibitor, transport_blockade, neurological_signaling_modulation).

druggable_target(slc6a14, 'ATB0+', transporter, amino_acid_transporter).
biological_resource(slc6a14, [small_intestine, lung, colon, cervix], broad_neutral_and_basic_amino_acid_transport, plasma_membrane).
pharmacological_effect(slc6a14, inhibitor, competitive_transport_inhibition, starvation_of_pathogens_and_tumor_cells).

druggable_target(slc6a15, 'SBAT1', transporter, amino_acid_transporter).
biological_resource(slc6a15, [brain_neurons, kidney, skeletal_muscle], neutral_amino_acid_transport, plasma_membrane).
pharmacological_effect(slc6a15, inhibitor, transport_blockade, mood_and_depression_pathway_modulation).

druggable_target(slc6a19, 'B0AT1_SLC', transporter, neutral_amino_acid_transporter).
biological_resource(slc6a19, [kidney_proximal_tubule_apical, small_intestine], renal_and_intestinal_amino_acid_reabsorption, brush_border_membrane).
pharmacological_effect(slc6a19, inhibitor, transport_pore_blockade, induction_of_restriction_of_amino_acids_for_metabolic_benefit).

druggable_target(slc7a1, 'CAT1', transporter, cationic_amino_acid_transporter).
biological_resource(slc7a1, [ubiquitous_cells, endothelium, lymphocytes], l_arginine_uptake_for_nitric_oxide_synthesis, plasma_membrane).
pharmacological_effect(slc7a1, inhibitor, competitive_transport_inhibition, reduction_of_nitric_oxide_mediated_inflammation).

druggable_target(slc7a2, 'CAT2', transporter, cationic_amino_acid_transporter).
biological_resource(slc7a2, [macrophages, hepatocytes, activated_immune_cells], inducible_arginine_transport, plasma_membrane).
pharmacological_effect(slc7a2, inhibitor, transport_blockade, attenuation_of_macrophage_inflammatory_responses).

druggable_target(slc7a6, 'Y+LAT2', transporter, amino_acid_transporter).
biological_resource(slc7a6, [kidney, intestine, placenta, spleen], cationic_and_neutral_amino_acid_exchange, basolateral_membrane).
pharmacological_effect(slc7a6, inhibitor, exchange_blockade, amino_acid_homeostasis_modulation).

druggable_target(slc7a7, 'Y+LAT1', transporter, amino_acid_transporter).
biological_resource(slc7a7, [kidney_basolateral, intestine, macrophages], L_arginine_and_leucine_transport, plasma_membrane).
pharmacological_effect(slc7a7, inhibitor, transport_occupancy, metabolic_pathway_regulation).

druggable_target(slc7a8, 'LAT2', transporter, amino_acid_transporter).
biological_resource(slc7a8, [kidney, small_intestine, placenta, brain_capillaries], neutral_amino_acid_exchange, plasma_membrane).
pharmacological_effect(slc7a8, inhibitor, competitive_blockade, drug_and_amino_acid_disposition_modulation).

druggable_target(slc7a11, 'xCT', transporter, cystine_glutamate_antiporter).
biological_resource(slc7a11, [brain_astrocytes, macrophages, cancer_stem_cells], cystine_influx_and_glutamate_efflux, plasma_membrane).
pharmacological_effect(slc7a11, inhibitor, transport_pore_blockade, induction_of_ferroptosis_in_tumor_cells).

druggable_target(slc8a1, 'NCX1', transporter, sodium_calcium_exchanger).
biological_resource(slc8a1, [myocardium, kidney, brain, vascular_smooth_muscle], transsarcolemmal_calcium_extrusion, plasma_membrane).
pharmacological_effect(slc8a1, inhibitor, selective_transporter_blockade, cardioprotection_during_ischemia_reperfusion_injury).

druggable_target(slc8a2, 'NCX2', transporter, sodium_calcium_exchanger).
biological_resource(slc8a2, [brain_neurons, skeletal_muscle], neuronal_calcium_homeostasis, plasma_membrane).
pharmacological_effect(slc8a2, inhibitor, transport_blockade, neuroprotection_against_excitotoxic_calcium_overload).

druggable_target(slc8a3, 'NCX3', transporter, sodium_calcium_exchanger).
biological_resource(slc8a3, [brain, skeletal_muscle, heart], calcium_extrusion_pathway, plasma_membrane).
pharmacological_effect(slc8a3, inhibitor, transporter_occupancy, cardioprotective_and_neuroprotective_modulation).

druggable_target(slc9a1, 'NHE1', transporter, sodium_hydrogen_antiporter).
biological_resource(slc9a1, [ubiquitous_cellular_compartments, myocardium], intracellular_ph_regulation, plasma_membrane).
pharmacological_effect(slc9a1, inhibitor, transport_pore_blockade, prevention_of_myocardial_ischemic_injury_and_tumor_acidosis).

druggable_target(slc9a3, 'NHE3', transporter, sodium_hydrogen_antiporter).
biological_resource(slc9a3, [kidney_proximal_tubule_apical, small_intestine_apical], renal_sodium_and_water_reabsorption, brush_border_membrane).
pharmacological_effect(slc9a3, inhibitor, luminal_transport_blockade, natriuresis_diuresis_and_blood_pressure_reduction).

druggable_target(slc11a2, 'DMT1', transporter, divalent_metal_transporter).
biological_resource(slc11a2, [duodenum_apical_membrane, erythroid_cells, endosomes], iron_uptake_pathway, plasma_endosomal_membrane).
pharmacological_effect(slc11a2, inhibitor, transport_pore_blockade, reduction_of_intestinal_iron_absorption_in_iron_overload).

druggable_target(slc12a4, 'NKCC2', transporter, ion_cotransporter).
biological_resource(slc12a4, [kidney_distal_tubule, brain, red_blood_cells], potassium_chloride_cotransport, plasma_membrane).
pharmacological_effect(slc12a4, inhibitor, transport_inhibition, cell_volume_and_osmotic_regulation).

druggable_target(slc12a5, 'KCC2', transporter, ion_cotransporter).
biological_resource(slc12a5, [mature_central_neurons_dendrites], neuronal_chloride_extrusion_inhibitory_tone, plasma_membrane).
pharmacological_effect(slc12a5, activator, transporter_enhancement, treatment_of_neuropathic_pain_and_epileptic_hyperexcitability).

druggable_target(slc16a2, 'MCT8', transporter, thyroid_hormone_transporter).
biological_resource(slc16a2, [brain_neurons, blood_brain_barrier, testis], triiodothyronine_cellular_uptake, plasma_membrane).
pharmacological_effect(slc16a2, modulator, transport_modulation, treatment_of_allan_herndon_delud_syndrome).

druggable_target(slc16a3, 'MCT4', transporter, monocarboxylate_transporter).
biological_resource(slc16a3, [glycolytic_tissues, white_muscle, hypoxic_tumor_cells], lactate_efflux_from_glycolytic_cells, plasma_membrane).
pharmacological_effect(slc16a3, inhibitor, competitive_pore_blockade, suppression_of_tumor_microenvironment_acidification).

druggable_target(slc22a3, 'OCT3', transporter, organic_cation_transporter).
biological_resource(slc22a3, [liver, placenta, skeletal_muscle, brain], monoamine_neurotransmitter_clearance, plasma_membrane).
pharmacological_effect(slc22a3, inhibitor, transport_blockade, alteration_of_catecholamine_disposition).

druggable_target(slc22a11, 'OAT4', transporter, organic_anion_transporter).
biological_resource(slc22a11, [kidney_proximal_tubule_apical], renal_urate_and_drug_transport, apical_membrane).
pharmacological_effect(slc22a11, inhibitor, transport_inhibition, urate_homeostasis_modulation).

druggable_target(slc26a6, 'PAT1', transporter, anion_exchanger).
biological_resource(slc26a6, [kidney_proximal_tubule, intestine], oxalate_and_chloride_exchange, apical_membrane).
pharmacological_effect(slc26a6, inhibitor, transporter_blockade, prevention_of_renal_calcium_oxalate_stone_formation).

druggable_target(slc28a1, 'CNT1', transporter, concentrative_nucleoside_transporter).
biological_resource(slc28a1, [kidney_proximal_tubule, intestine], pyrimidine_nucleoside_uptake, apical_membrane).
pharmacological_effect(slc28a1, inhibitor, transport_blockade, modulation_of_nucleoside_drug_pharmacokinetics).

druggable_target(slc28a2, 'CNT2', transporter, concentrative_nucleoside_transporter).
biological_resource(slc28a2, [intestine, kidney, liver, heart], purine_nucleoside_transport, apical_membrane).
pharmacological_effect(slc28a2, inhibitor, competitive_inhibition, alteration_of_purine_analogue_uptake).

druggable_target(slc28a3, 'CNT3', transporter, concentrative_nucleoside_transporter).
biological_resource(slc28a3, [intestine, kidney, pancreas, lung], broad_purine_and_pyrimidine_transport, apical_membrane).
pharmacological_effect(slc28a3, inhibitor, transport_pore_blockade, enhancement_of_chemotherapeutic_selectivity).

druggable_target(slc29a1, 'ENT1', transporter, equilibrative_nucleoside_transporter).
biological_resource(slc29a1, [erythrocytes, vascular_endothelium, kidney], adenosine_and_nucleoside_reuptake, plasma_membrane).
pharmacological_effect(slc29a1, inhibitor, transport_pore_blockade, elevation_of_extracellular_adenosine_cardioprotection).

druggable_target(slc29a2, 'ENT2', transporter, equilibrative_nucleoside_transporter).
biological_resource(slc29a2, [skeletal_muscle, placenta, brain, kidney], nucleoside_and_nucleobase_transport, plasma_membrane).
pharmacological_effect(slc29a2, inhibitor, competitive_inhibition, modification_of_anti_cancer_nucleoside_disposition).

druggable_target(slc39a4, 'ZIP4', transporter, zinc_transporter).
biological_resource(slc39a4, [small_intestine_apical, pancreas, cancer_cells], dietary_zinc_uptake_pathway, plasma_membrane).
pharmacological_effect(slc39a4, monoclonal_antibody_inhibitor, receptor_blocking_and_internalization, zinc_starvation_in_pancreatic_cancer).

druggable_target(slc47a2, 'MATE2K', transporter, multi_drug_and_toxin_extrusion).
biological_resource(slc47a2, [kidney_proximal_tubule_apical], apical_organic_cation_extrusion, brush_border_membrane).
pharmacological_effect(slc47a2, inhibitor, transport_blockade, renal_clearance_drug_interaction_modulation).

% ---------------------------------------------------------------------
% 4. EXTENDED NUCLEAR RECEPTORS & TRANSCRIPTION FACTORS
% ---------------------------------------------------------------------

druggable_target(nr2c1, 'TR2', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr2c1, [testis, prostate, hematopoietic_cells], transcriptional_repression_pathway, nucleus).
pharmacological_effect(nr2c1, agonist_or_antagonist, nuclear_receptor_modulation, cancer_cell_differentiation_induction).

druggable_target(nr2c2, 'TR4', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr2c2, [prostate, brain, liver, skeletal_muscle], androgen_receptor_crosstalk_pathway, nucleus).
pharmacological_effect(nr2c2, antagonist, transcriptional_repression, suppression_of_prostate_cancer_progression).

druggable_target(nr2e1, 'TLX', nuclear_receptor, neural_orphan_receptor).
biological_resource(nr2e1, [neural_stem_cells, retina_forebrain], neural_stem_cell_proliferation, nucleus).
pharmacological_effect(nr2e1, inhibitor, ligand_binding_pocket_blockade, elimination_of_glioblastoma_stem_cells).

druggable_target(nr2e3, 'PNR', nuclear_receptor, photoreceptor_specific_receptor).
biological_resource(nr2e3, [retina_photoreceptors], rod_cone_differentiation_pathway, nucleus).
pharmacological_effect(nr2e3, modulator, transcriptional_control, treatment_of_inherited_retinal_degenerations).

druggable_target(nr2f1, 'COUP_TFI', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr2f1, [brain_cortex, retina, developing_embryo], neurogenesis_and_angiogenesis, nucleus).
pharmacological_effect(nr2f1, modulator, transcriptional_regulation, anti_angiogenic_and_neurodevelopmental_modulation).

druggable_target(nr2f2, 'COUP_TFII', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr2f2, [endothelial_cells, mesenchymal_tissues], angiogenesis_and_metabolism, nucleus).
pharmacological_effect(nr2f2, inhibitor, transcriptional_blockade, anti_angiogenic_tumor_therapy).

druggable_target(nr4a2, 'NURR1', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr4a2, [midbrain_dopaminergic_neurons, microglia], dopaminergic_neuron_survival_and_inflammation, nucleus).
pharmacological_effect(nr4a2, agonist, transcriptional_activation, neuroprotection_in_parkinsons_disease).

druggable_target(nr4a3, 'NOR1', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr4a3, [skeletal_muscle, vascular_smooth_muscle, immune_cells], immediate_early_gene_signaling, nucleus).
pharmacological_effect(nr4a3, agonist, transcriptional_stimulation, metabolic_and_anti_inflammatory_action).

druggable_target(nr5a1, 'SF1', nuclear_receptor, steroidogenic_factor_1).
biological_resource(nr5a1, [adrenal_cortex, gonads, ventromedial_hypothalamus], steroidogenesis_pathway, nucleus).
pharmacological_effect(nr5a1, inverse_agonist, ligand_binding_pocket_occupancy, suppression_of_hormone_dependent_adrenal_and_ovarian_cancers).

druggable_target(nr5a2, 'LRH1', nuclear_receptor, liver_receptor_homolog_1).
biological_resource(nr5a2, [liver, intestine, ovary], bile_acid_homeostasis_and_stemness, nucleus).
pharmacological_effect(nr5a2, inverse_agonist, transcriptional_repression, suppression_of_pancreatic_ductal_adenocarcinoma).

druggable_target(nr6a1, 'GCNF', nuclear_receptor, germ_cell_nuclear_factor).
biological_resource(nr6a1, [embryonic_stem_cells, germ_cells], embryonic_development_repression, nucleus).
pharmacological_effect(nr6a1, modulator, transcriptional_modulation, stem_cell_differentiation_control).

% ---------------------------------------------------------------------
% 5. EXTENDED PROTEASES, PEPTIDASES & MATRIX REMODELERS
% ---------------------------------------------------------------------

druggable_target(mmp7, 'MMP7', enzyme, matrilysin).
biological_resource(mmp7, [intestinal_epithelium, glandular_epithelia, tumor_cells], extracellular_matrix_degradation, extracellular_matrix).
pharmacological_effect(mmp7, inhibitor, zinc_active_site_chelation, reduction_of_tumor_invasion_and_metastasis).

druggable_target(mmp8, 'MMP8', enzyme, neutrophil_collagenase).
biological_resource(mmp8, [neutrophils, connective_tissues], interstitial_collagen_cleavage, extracellular_matrix).
pharmacological_effect(mmp8, inhibitor, catalytic_site_blockade, anti_inflammatory_and_tissue_protective_action).

druggable_target(mmp10, 'MMP10', enzyme, stromelysin_2).
biological_resource(mmp10, [fibroblasts, macrophage_infiltrates, cancer_cells], tissue_remodeling_pathway, extracellular_matrix).
pharmacological_effect(mmp10, inhibitor, zinc_binding_domain_blockade, suppression_of_tumor_stroma_remodeling).

druggable_target(mmp11, 'MMP11', enzyme, stromelysin_3).
biological_resource(mmp11, [stromal_fibroblasts, breast_carcinomas], extracellular_matrix_processing, extracellular_matrix).
pharmacological_effect(mmp11, inhibitor, catalytic_inhibition, anti_tumor_stromal_disruption).

druggable_target(mmp12, 'MMP12', enzyme, macrophage_metalloelastase).
biological_resource(mmp12, [macrophages, alveolar_spaces], elastin_degradation_in_emphysema, extracellular_matrix).
pharmacological_effect(mmp12, inhibitor, active_site_competition, prevention_of_chronic_obstructive_pulmonary_disease_progression).

druggable_target(mmp13, 'MMP13', enzyme, collagenase_3).
biological_resource(mmp13, [chondrocytes, osteoarthritic_joints, tumor_cells], type_ii_collagen_degradation, cartilage_matrix).
pharmacological_effect(mmp13, inhibitor, selective_zinc_chelation, prevention_of_cartilage_destruction_in_osteoarthritis).

druggable_target(mmp14, 'MT1_MMP', enzyme, membrane_type_matrix_metalloproteinase).
biological_resource(mmp14, [endothelial_cells, migrating_tumor_cells], pericellular_proteolysis_and_angiogenesis, plasma_membrane).
pharmacological_effect(mmp14, inhibitor, catalytic_site_blockade, halting_cancer_cell_extravasation_and_metastasis).

druggable_target(ctse, 'CTSE', enzyme, aspartic_protease).
biological_resource(ctse, [gastric_mucosa, immune_cells], intracellular_protein_processing, endosome_lysosome).
pharmacological_effect(ctse, inhibitor, active_site_cleft_blockade, immunomodulatory_and_anti_tumor_action).

druggable_target(ctsf, 'CTSF', enzyme, lysosomal_cysteine_protease).
biological_resource(ctsf, [ubiquitous_lysosomes], intracellular_protein_turnover, lysosome).
pharmacological_effect(ctsf, inhibitor, thiol_alkylation_blockade, neuroprotective_pathway_modulation).

druggable_target(ctsk_ext, 'CTSK_X', enzyme, lysosomal_protease).
biological_resource(ctsk_ext, [osteoclasts], bone_resorption_pit, extracellular_resorptive_space).
pharmacological_effect(ctsk_ext, inhibitor, selective_active_site_inhibition, prevention_of_osteoporotic_bone_loss).

druggable_target(ctso, 'CTSO', enzyme, cathepsin_o).
biological_resource(ctso, [ovary, testis, placenta, ubiquitous_cells], protein_processing, lysosome).
pharmacological_effect(ctso, inhibitor, catalytic_blockade, tumor_progression_suppression).

druggable_target(ctss, 'CTSS', enzyme, cathepsin_s).
biological_resource(ctss, [antigen_presenting_cells, macrophages, dendritic_cells], mhc_ii_antigen_presentation_pathway, endosome_lysosome).
pharmacological_effect(ctss, inhibitor, selective_active_site_occupancy, suppression_of_autoimmune_inflammation_and_rejection).

druggable_target(ctsv, 'CTSVR', enzyme, cathepsin_v).
biological_resource(ctsv, [testis, thymus, corneal_epithelium], elastic_fiber_turnover, lysosome).
pharmacological_effect(ctsv, inhibitor, catalytic_blockade, anti_cancer_and_anti_fibrotic_action).

druggable_target(ctsz, 'CTSZ', enzyme, cathepsin_x).
biological_resource(ctsz, [monocytes, macrophages, tumor_cells], cell_adhesion_and_migration_signaling, extracellular_lysosome).
pharmacological_effect(ctsz, inhibitor, active_site_competition, suppression_of_tumor_cell_motility).

% ---------------------------------------------------------------------
% 6. UBIQUITIN LIGASES, E2s & PROTEASOMAL SUBUNITS
% ---------------------------------------------------------------------

druggable_target(psmb1, 'PSMB1', proteasome_subunit, 20s_core).
biological_resource(psmb1, [ubiquitous_cytoplasmic_compartments], proteasomal_protein_degradation, cytoplasm_nucleus).
pharmacological_effect(psmb1, inhibitor, catalytic_core_blockade, induction_of_unfolded_protein_response).

druggable_target(psmb2, 'PSMB2', proteasome_subunit, 20s_core).
biological_resource(psmb2, [ubiquitous_cytoplasmic_compartments], ubiquitin_proteasome_pathway, cytoplasm_nucleus).
pharmacological_effect(psmb2, inhibitor, active_site_occupancy, cancer_cell_apoptosis_induction).

druggable_target(psmb8, 'LMP7', proteasome_subunit, immunoproteasome).
biological_resource(psmb8, [immune_cells, dendritic_cells, cytokine_stimulated_tissues], immunoproteasome_chymotrypsin_like_activity, cytoplasm_nucleus).
pharmacological_effect(psmb8, selective_inhibitor, covalent_active_site_alkylation, suppression_of_autoimmune_inflammation).

druggable_target(psmb9, 'LMP2', proteasome_subunit, immunoproteasome).
biological_resource(psmb9, [hematopoietic_cells, immune_tissues], antigen_processing_for_mhc_i, cytoplasm_nucleus).
pharmacological_effect(psmb9, inhibitor, selective_catalytic_blockade, mitigation_of_immune_mediated_tissue_injury).

druggable_target(psmb10, 'MECL1', proteasome_subunit, immunoproteasome).
biological_resource(psmb10, [lymphoid_tissues, immune_cells], immunoproteasome_assembly, cytoplasm_nucleus).
pharmacological_effect(psmb10, inhibitor, catalytic_inhibition, suppression_of_plasma_cell_survival).

druggable_target(ube2a, 'UBE2A', enzyme, ubiquitin_conjugating_enzyme_e2).
biological_resource(ube2a, [ubiquitous_nuclear_compartments], post_replication_dna_repair_pathway, nucleus).
pharmacological_effect(ube2a, inhibitor, protein_interaction_blockade, modulation_of_genomic_stability).

druggable_target(ube2b, 'UBE2B', enzyme, ubiquitin_conjugating_enzyme_e2).
biological_resource(ube2b, [testis, ubiquitous_cells], spermatogenesis_and_dna_repair, nucleus_cytoplasm).
pharmacological_effect(ube2b, inhibitor, active_site_blockade, anti_cancer_and_antifertility_action).

druggable_target(ube2d1, 'UBE2D1', enzyme, ubiquitin_conjugating_enzyme_e2).
biological_resource(ube2d1, [ubiquitous_cytoplasmic_compartments], p53_and_tumor_suppressor_ubiquitination, cytoplasm).
pharmacological_effect(ube2d1, inhibitor, catalytic_inhibition, stabilization_of_targeted_regulatory_proteins).

druggable_target(ube2i, 'UBC9', enzyme, sumo_conjugating_enzyme).
biological_resource(ube2i, [ubiquitous_nuclear_compartments], sumoylation_pathway_catalytic_core, nucleus).
pharmacological_effect(ube2i, inhibitor, active_site_cysteine_blockade, disruption_of_oncogenic_sumoylation_in_cancer).

druggable_target(anapc2, 'APC2', e3_ligase_subunit, anaphase_promoting_complex).
biological_resource(anapc2, [mitotic_cells, proliferating_tissues], cell_cycle_anaphase_transition_ubiquitination, nucleus).
pharmacological_effect(anapc2, inhibitor, protein_interaction_disruption, mitotic_arrest_and_cell_death).
