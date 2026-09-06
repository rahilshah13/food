% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 1: ~1,000 Facts)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. EXTENDED G-PROTEIN COUPLED RECEPTORS (GPCRs)
% ---------------------------------------------------------------------

druggable_target(adrb1, 'ADRB1', gpcr, adrenergic).
biological_resource(adrb1, [myocardium, cardiac_conduction_system, kidney_juxtaglomerular_cells], sympathetic_cyclic_amp_pathway, plasma_membrane).
pharmacological_effect(adrb1, agonist_antagonist, g_s_coupled_camp_increase_or_blockade, positive_inotropy_chronotropy_or_rate_reduction).

druggable_target(adrb2, 'ADRB2', gpcr, adrenergic).
biological_resource(adrb2, [smooth_muscle_airways, vascular_smooth_muscle, skeletal_muscle], sympathetic_cyclic_amp_pathway, plasma_membrane).
pharmacological_effect(adrb2, agonist, g_s_coupled_camp_increase, bronchodilation_vasodilation).

druggable_target(adrb3, 'ADRB3', gpcr, adrenergic).
biological_resource(adrb3, [adipose_tissue, urinary_bladder_detrusor], sympathetic_lipolysis_pathway, plasma_membrane).
pharmacological_effect(adrb3, agonist, g_s_coupled_camp_increase, lipolysis_detrusor_relaxation).

druggable_target(adra1a, 'ADRA1A', gpcr, adrenergic).
biological_resource(adra1a, [prostate_smooth_muscle, vascular_smooth_muscle, central_nervous_system], g_q_phospholipase_c_pathway, plasma_membrane).
pharmacological_effect(adra1a, antagonist, g_q_inhibition, smooth_muscle_relaxation_in_prostate).

druggable_target(adra1b, 'ADRA1B', gpcr, adrenergic).
biological_resource(adra1b, [vascular_smooth_muscle, cerebral_cortex], g_q_phospholipase_c_pathway, plasma_membrane).
pharmacological_effect(adra1b, antagonist, g_q_inhibition, vasodilation_blood_pressure_reduction).

druggable_target(adra1d, 'ADRA1D', gpcr, adrenergic).
biological_resource(adra1d, [large_arteries, hippocampus], g_q_phospholipase_c_pathway, plasma_membrane).
pharmacological_effect(adra1d, antagonist, g_q_inhibition, vascular_tone_modulation).

druggable_target(adra2a, 'ADRA2A', gpcr, adrenergic).
biological_resource(adra2a, [central_nervous_system_locus_coeruleus, peripheral_sympathetic_terminals], g_i_coupled_camp_decrease, plasma_membrane).
pharmacological_effect(adra2a, agonist, g_i_coupled_inhibition_of_norepinephrine_release, sedation_analgesia_sympatholytic).

druggable_target(adra2b, 'ADRA2B', gpcr, adrenergic).
biological_resource(adra2b, [vascular_smooth_muscle, kidney], g_i_coupled_camp_decrease, plasma_membrane).
pharmacological_effect(adra2b, agonist, vasoconstriction_modulation, blood_pressure_regulation).

druggable_target(adra2c, 'ADRA2C', gpcr, adrenergic).
biological_resource(adra2c, [basal_ganglia, adrenal_medulla], g_i_coupled_camp_decrease, plasma_membrane).
pharmacological_effect(adra2c, modulator, catecholamine_release_modulation, neuroendocrine_regulation).

druggable_target(oprm1, 'OPRM1', gpcr, opioid).
biological_resource(oprm1, [central_nervous_system, peripheral_sensory_neurons, enteric_nervous_system], endogenous_opioid_pathway, plasma_membrane).
pharmacological_effect(oprm1, agonist, g_i_coupled_calcium_channel_inhibition_potassium_activation, analgesia_euphoria_respiratory_depression).

druggable_target(oprk1, 'OPRK1', gpcr, opioid).
biological_resource(oprk1, [spinal_cord, hypothalamus, limbic_system], dynorphin_signaling_pathway, plasma_membrane).
pharmacological_effect(oprk1, agonist, g_i_coupled_neuronal_inhibition, spinal_analgesia_dysphoria).

druggable_target(oprd1, 'OPRD1', gpcr, opioid).
biological_resource(oprd1, [brain_limbic_system, olfactory_bulb], enkephalin_signaling_pathway, plasma_membrane).
pharmacological_effect(oprd1, agonist, g_i_coupled_neuronal_inhibition, antinociception_mood_modulation).

druggable_target(oprl1, 'OPRL1', gpcr, opioid).
biological_resource(oprl1, [spinal_cord, forebrain, pain_modulatory_pathways], nociceptin_pathway, plasma_membrane).
pharmacological_effect(oprl1, agonist, g_i_coupled_neuronal_inhibition, hyperalgesia_anxiety_modulation).

druggable_target(agtr1, 'AGTR1', gpcr, angiotensin).
biological_resource(agtr1, [vascular_smooth_muscle, kidney_proximal_tubule, adrenal_zona_glomerulosa], renin_angiotensin_system, plasma_membrane).
pharmacological_effect(agtr1, antagonist, g_q_phospholipase_c_blockade, vasodilation_aldosterone_suppression_natriuresis).

druggable_target(agtr2, 'AGTR2', gpcr, angiotensin).
biological_resource(agtr2, [fetal_tissues, myometrium, brain, endothelium], counter_regulatory_renin_angiotensin, plasma_membrane).
pharmacological_effect(agtr2, agonist, g_i_nitric_oxide_pathway_activation, vasodilation_anti_proliferative).

druggable_target(hrh1, 'HRH1', gpcr, histamine).
biological_resource(hrh1, [smooth_muscle_bronchi, vascular_endothelium, central_nervous_system_neurons], inflammatory_allergic_signaling, plasma_membrane).
pharmacological_effect(hrh1, inverse_agonist, g_q_phospholipase_c_inhibition, anti_allergic_sedation_vasoconstriction).

druggable_target(hrh2, 'HRH2', gpcr, histamine).
biological_resource(hrh2, [gastric_parietal_cells, heart_atria, immune_cells], gastric_acid_secretion_pathway, plasma_membrane).
pharmacological_effect(hrh2, antagonist, g_s_adenylyl_cyclase_inhibition, reduction_of_gastric_acid_secretion).

druggable_target(hrh3, 'HRH3', gpcr, histamine).
biological_resource(hrh3, [central_nervous_system_histaminergic_neurons], presynaptic_autoreceptor_pathway, plasma_membrane).
pharmacological_effect(hrh3, inverse_agonist, g_i_coupled_histamine_release_increase, wakefulness_cognitive_enhancement).

druggable_target(hrh4, 'HRH4', gpcr, histamine).
biological_resource(hrh4, [eosinophils, mast_cells, dendritic_cells, bone_marrow], hematopoietic_immunological_pathway, plasma_membrane).
pharmacological_effect(hrh4, antagonist, calcium_mobilization_inhibition, anti_inflammatory_pruritus_reduction).

druggable_target(drd1, 'DRD1', gpcr, dopamine).
biological_resource(drd1, [striatum, cerebral_cortex, renal_vasculature], mesolimbic_dopaminergic_pathway, plasma_membrane).
pharmacological_effect(drd1, agonist, g_s_adenylyl_cyclase_stimulation, motor_stimulation_renal_vasodilation).

druggable_target(drd2, 'DRD2', gpcr, dopamine).
biological_resource(drd2, [pituitary_gland, striatum, nucleus_accumbens], nigrostriatal_mesolimbic_pathway, plasma_membrane).
pharmacological_effect(drd2, antagonist, g_i_adenylyl_cyclase_inhibition_prolactin_reduction, antipsychotic_antiemetic).

druggable_target(drd3, 'DRD3', gpcr, dopamine).
biological_resource(drd3, [limbic_forebrain, islands_of_calcala], mesolimbic_pathway, plasma_membrane).
pharmacological_effect(drd3, partial_agonist, g_i_coupled_signaling_modulation, antipsychotic_mood_stabilization).

druggable_target(drd4, 'DRD4', gpcr, dopamine).
biological_resource(drd4, [frontal_cortex, amygdala, hippocampus], cognitive_processing_pathway, plasma_membrane).
pharmacological_effect(drd4, antagonist, g_i_signaling_blockade, cognition_modulation).

druggable_target(drd5, 'DRD5', gpcr, dopamine).
biological_resource(drd5, [substant_nigra, hypothalamus, kidney], dopaminergic_signaling, plasma_membrane).
pharmacological_effect(drd5, agonist, g_s_adenylyl_cyclase_stimulation, blood_pressure_regulation).

druggable_target(htr1a, 'HTR1A', gpcr, serotonin).
biological_resource(htr1a, [raphe_nuclei, hippocampus, amygdala], serotonergic_inhibitory_pathway, plasma_membrane).
pharmacological_effect(htr1a, partial_agonist, g_i_potassium_channel_activation_camp_decrease, anxiolytic_antidepressant).

druggable_target(htr1b, 'HTR1B', gpcr, serotonin).
biological_resource(htr1b, [basal_ganglia, vascular_endothelium_cranial], cranial_vasoconstriction_pathway, plasma_membrane).
pharmacological_effect(htr1b, agonist, presynaptic_serotonin_inhibition_vasoconstriction, antimigraine_vasoconstriction).

druggable_target(htr2a, 'HTR2A', gpcr, serotonin).
biological_resource(htr2a, [cerebral_cortex, platelets, vascular_smooth_muscle], g_q_phospholipase_c_pathway, plasma_membrane).
pharmacological_effect(htr2a, inverse_agonist, g_q_inhibition_platelet_aggregation_blockade, atypical_antipsychotic_platelet_inhibition).

druggable_target(htr2c, 'HTR2C', gpcr, serotonin).
biological_resource(htr2c, [choroid_plexus, cerebral_cortex, limbic_system], feeding_behavior_pathway, plasma_membrane).
pharmacological_effect(htr2c, agonist, g_q_signaling_activation, appetite_suppression_weight_regulation).

druggable_target(htr4, 'HTR4', gpcr, serotonin).
biological_resource(htr4, [gastrointestinal_tract_myenteric_plexus, brain], enteric_prokinetic_pathway, plasma_membrane).
pharmacological_effect(htr4, agonist, g_s_adenylyl_cyclase_activation, gastrointestinal_motility_enhancement).

druggable_target(htr6, 'HTR6', gpcr, serotonin).
biological_resource(htr6, [striatum, cortex, hippocampus, olfactory_tubercle], central_cholinergic_modulation, plasma_membrane).
pharmacological_effect(htr6, antagonist, g_s_signaling_blockade, cognition_enhancement_alzheimers_treatment).

druggable_target(htr7, 'HTR7', gpcr, serotonin).
biological_resource(htr7, [hypothalamus, thalamus, blood_vessels], thermoregulation_circadian_pathway, plasma_membrane).
pharmacological_effect(htr7, antagonist, g_s_signaling_blockade, antidepressant_sleep_modulation).

druggable_target(chrm1, 'CHRM1', gpcr, muscarinic).
biological_resource(chrm1, [cerebral_cortex, hippocampus, exocrine_glands], central_cholinergic_pathway, plasma_membrane).
pharmacological_effect(chrm1, antagonist, g_q_phospholipase_c_blockade, cognition_modulation_anticholinergic).

druggable_target(chrm2, 'CHRM2', gpcr, muscarinic).
biological_resource(chrm2, [myocardium, cardiac_pacemaker_nodes, brain], parasympathetic_cardiac_pathway, plasma_membrane).
pharmacological_effect(chrm2, antagonist, g_i_adenylyl_cyclase_inhibition_blockade, increased_heart_rate_tachycardia).

druggable_target(chrm3, 'CHRM3', gpcr, muscarinic).
biological_resource(chrm3, [smooth_muscle_airways_gastrointestinal_bladder, exocrine_glands], parasympathetic_effector_pathway, plasma_membrane).
pharmacological_effect(chrm3, antagonist, g_q_phospholipase_c_blockade, bronchodilation_secretory_reduction).

druggable_target(chrm4, 'CHRM4', gpcr, muscarinic).
biological_resource(chrm4, [striatum, cortex], dopaminergic_modulation_pathway, plasma_membrane).
pharmacological_effect(chrm4, agonist, g_i_coupled_neuronal_inhibition, schizophrenia_symptom_reduction).

druggable_target(chrm5, 'CHRM5', gpcr, muscarinic).
biological_resource(chrm5, [substant_nigra, cerebral_vasculature], mesolimbic_dopamine_regulation, plasma_membrane).
pharmacological_effect(chrm5, antagonist, g_q_signaling_blockade, cerebral_vasodilation_modulation).

druggable_target(p2ry1, 'P2RY1', gpcr, purinergic).
biological_resource(p2ry1, [platelets, endothelial_cells, brain], ADP_induced_platelet_aggregation, plasma_membrane).
pharmacological_effect(p2ry1, antagonist, g_q_pathway_blockade, antiplatelet_thrombosis_prevention).

druggable_target(p2ry12, 'P2RY12', gpcr, purinergic).
biological_resource(p2ry12, [platelets, microglia], adp_receptor_signaling, plasma_membrane).
pharmacological_effect(p2ry12, antagonist, g_i_coupled_camp_increase_inhibition_of_aggregation, antiplatelet_therapy).

druggable_target(adora1, 'ADORA1', gpcr, adenosine).
biological_resource(adora1, [brain, heart_atria_avn, kidney], purinergic_adenosine_pathway, plasma_membrane).
pharmacological_effect(adora1, agonist, g_i_adenylyl_cyclase_inhibition_av_nodal_delay, bradycardia_neuroprotection).

druggable_target(adora2a, 'ADORA2A', gpcr, adenosine).
biological_resource(adora2a, [striatum, coronary_arteries, immune_cells], basal_ganglia_adenosine_pathway, plasma_membrane).
pharmacological_effect(adora2a, agonist_antagonist, g_s_adenylyl_cyclase_stimulation_or_blockade, coronary_vasodilation_parkinsons_treatment).

druggable_target(glp1r, 'GLP1R', gpcr, peptide_hormone).
biological_resource(glp1r, [pancreatic_beta_cells, hypothalamus, stomach, vagus_nerve], incretin_insulin_secretion_pathway, plasma_membrane).
pharmacological_effect(glp1r, agonist, g_s_camp_pka_epac_activation, glucose_dependent_insulin_secretion_weight_loss).

druggable_target(gipr, 'GIPR', gpcr, peptide_hormone).
biological_resource(gipr, [pancreatic_beta_cells, adipose_tissue, bone], incretin_system, plasma_membrane).
pharmacological_effect(gipr, agonist, g_s_camp_activation, insulinotropic_metabolic_regulation).

druggable_target(gcgr, 'GCGR', gpcr, peptide_hormone).
biological_resource(gcgr, [liver, adipose_tissue], glycogenolysis_gluconeogenesis_pathway, plasma_membrane).
pharmacological_effect(gcgr, antagonist, g_s_signaling_blockade, blood_glucose_reduction_in_type2_diabetes).

druggable_target(s1pr1, 'S1PR1', gpcr, sphingolipid).
biological_resource(s1pr1, [lymph_nodes, endothelial_cells, central_nervous_system], lymphocyte_trafficking_pathway, plasma_membrane).
pharmacological_effect(s1pr1, functional_antagonist, receptor_internalization_and_downregulation, sequestration_of_lymphocytes_in_lymph_nodes).

druggable_target(casr, 'CASR', gpcr, inorganic_ion).
biological_resource(casr, [parathyroid_gland, kidney_thick_ascending_limb], calcium_homeostasis_pathway, plasma_membrane).
pharmacological_effect(casr, allosteric_modulator, calcium_sensing_activation_or_suppression, parathyroid_hormone_reduction_calcimimetic).

% ---------------------------------------------------------------------
% 2. EXTENDED KINASE FAMILY
% ---------------------------------------------------------------------

druggable_target(egfr, 'EGFR', kinase, receptor_tyrosine_kinase).
biological_resource(egfr, [epithelial_tissues, keratinocytes, hepatocytes], egf_mapk_pi3k_pathway, plasma_membrane).
pharmacological_effect(egfr, inhibitor, tyrosine_kinase_domain_blockade, cell_cycle_arrest_apoptosis_in_tumor_cells).

druggable_target(erbb2, 'ERBB2', kinase, receptor_tyrosine_kinase).
biological_resource(erbb2, [myocardium, breast_epithelium, lung_epithelium], her2_neu_signaling_pathway, plasma_membrane).
pharmacological_effect(erbb2, monoclonal_antibody_inhibitor, extracellular_domain_dimerization_blockade, growth_inhibition_antibody_dependent_cellular_cytotoxicity).

druggable_target(kdr, 'KDR', kinase, receptor_tyrosine_kinase).
biological_resource(kdr, [vascular_endothelial_cells, placenta, monocytes], vegf_angiogenesis_pathway, plasma_membrane).
pharmacological_effect(kdr, inhibitor, atp_competitive_kinase_blockade, anti_angiogenesis_tumor_vessel_regression).

druggable_target(kit, 'KIT', kinase, receptor_tyrosine_kinase).
biological_resource(kit, [mast_cells, melanocytes, interstitial_cells_of_cajal, hematopoietic_stem_cells], stem_cell_factor_pathway, plasma_membrane).
pharmacological_effect(kit, inhibitor, kinase_inhibition_gastrointestinal_stromal_tumor_suppression, suppression_of_mast_cell_activation_gist_apoptosis).

druggable_target(flt3, 'FLT3', kinase, receptor_tyrosine_kinase).
biological_resource(flt3, [bone_marrow_hematopoietic_progenitors, dendritic_cells], hematopoiesis_proliferation_pathway, plasma_membrane).
pharmacological_effect(flt3, inhibitor, internal_tandem_duplication_kinase_blockade, induction_of_apoptosis_in_aml_blasts).

druggable_target(met, 'MET', kinase, receptor_tyrosine_kinase).
biological_resource(met, [epithelial_cells, endothelial_cells, hepatocytes], hg_scatter_factor_pathway, plasma_membrane).
pharmacological_effect(met, inhibitor, atp_competitive_inhibition, anti_invasive_anti_tumor_effect).

druggable_target(ret, 'RET', kinase, receptor_tyrosine_kinase).
biological_resource(ret, [neural_crest_cells, thyroid_c_cells, enteric_neurons], glial_cell_line_derived_neurotrophic_factor_pathway, plasma_membrane).
pharmacological_effect(ret, inhibitor, kinase_blockade_medullary_thyroid_carcinoma_suppression, anti_oncogenic_activity).

druggable_target(alk, 'ALK', kinase, receptor_tyrosine_kinase).
biological_resource(alk, [central_nervous_system_neurons, nsclc_mutant_cells], anaplastic_lymphoma_pathway, plasma_membrane).
pharmacological_effect(alk, inhibitor, fusion_protein_kinase_inhibition, induction_of_apoptosis_in_alk_positive_cancers).

druggable_target(bcr_abl1, 'BCR-ABL1', kinase, non_receptor_tyrosine_kinase).
biological_resource(bcr_abl1, [bone_marrow, peripheral_blood_myeloid_cells], bcr_abl_stat5_pathway, cytoplasm).
pharmacological_effect(bcr_abl1, inhibitor, atp_competitive_active_site_blockade, inhibition_of_myeloid_proliferation_cml_remission).

druggable_target(btk, 'BTK', kinase, non_receptor_tyrosine_kinase).
biological_resource(btk, [b_lymphocytes, mast_cells, myeloid_cells], b_cell_receptor_signaling_pathway, cytoplasm_to_membrane).
pharmacological_effect(btk, covalent_inhibitor, irreversible_cys481_alkylation, inhibition_of_b_cell_malignancy_proliferation).

druggable_target(jak1, 'JAK1', kinase, non_receptor_tyrosine_kinase).
biological_resource(jak1, [immune_cells, hematopoietic_cells, lymphoid_tissues], jak_stat_cytokine_signaling, cytoplasm).
pharmacological_effect(jak1, inhibitor, atp_competitive_inhibition, suppression_of_inflammatory_cytokine_signaling).

druggable_target(jak2, 'JAK2', kinase, non_receptor_tyrosine_kinase).
biological_resource(jak2, [bone_marrow, erythroblasts, megakaryocytes], erythropoietin_thrombopoietin_signaling, cytoplasm).
pharmacological_effect(jak2, inhibitor, catalytic_inhibition, reduction_of_myeloproliferative_erythrocytosis).

druggable_target(jak3, 'JAK3', kinase, non_receptor_tyrosine_kinase).
biological_resource(jak3, [natural_killer_cells, t_lymphocytes], common_gamma_chain_cytokine_pathway, cytoplasm).
pharmacological_effect(jak3, inhibitor, selective_inhibition, immunosuppression_allograft_rejection_prevention).

druggable_target(tyk2, 'TYK2', kinase, non_receptor_tyrosine_kinase).
biological_resource(tyk2, [immune_cells, peripheral_tissues], type_i_interferon_il_12_il_23_pathway, cytoplasm).
pharmacological_effect(tyk2, allosteric_inhibitor, pseudokinase_domain_binding, anti_inflammatory_autoimmune_disease_mitigation).

druggable_target(braf, 'BRAF', kinase, serine_threonine_kinase).
biological_resource(braf, [melanocytes, colonic_epithelium, neural_tissues], mapk_erk_cascade, cytoplasm).
pharmacological_effect(braf, inhibitor, mutant_v600e_atp_competitive_blockade, cell_cycle_arrest_in_melanoma).

druggable_target(map2k1, 'MEK1', kinase, serine_threonine_kinase).
biological_resource(map2k1, [ubiquitous_cellular_tissues], mapk_cascade_dual_specificity, cytoplasm).
pharmacological_effect(map2k1, allosteric_inhibitor, non_atp_competitive_conformational_lock, suppression_of_downstream_erk_phosphorylation).

druggable_target(mtor, 'MTOR', kinase, serine_threonine_kinase).
biological_resource(mtor, [ubiquitous_metabolic_tissues, brain, immune_cells], mtorc1_mtorc2_nutrient_sensing, cytoplasm_lysosome).
pharmacological_effect(mtor, inhibitor, fkbp12_rapamycin_complex_binding_catalytic_blockade, immunosuppression_autophagy_induction_anti_proliferative).

druggable_target(cdk4, 'CDK4', kinase, serine_threonine_kinase).
biological_resource(cdk4, [proliferating_cells, lymphocytes, epithelial_crypts], cell_cycle_g1_s_transition, nucleus).
pharmacological_effect(cdk4, inhibitor, atp_competitive_cyclin_d_binding_blockade, g1_phase_cell_cycle_arrest).

druggable_target(cdk6, 'CDK6', kinase, serine_threonine_kinase).
biological_resource(cdk6, [hematopoietic_cells, lymphoid_tissue, breast_epithelium], cell_cycle_g1_s_transition, nucleus).
pharmacological_effect(cdk6, inhibitor, atp_competitive_blockade, suppression_of_tumor_cell_proliferation).

druggable_target(pik3ca, 'PIK3CA', kinase, lipid_kinase).
biological_resource(pik3ca, [ubiquitous_metabolic_tissues, endocrine_organs], pi3k_akt_mtor_signaling, inner_plasma_membrane).
pharmacological_effect(pik3ca, inhibitor, class_i_pi3k_alpha_catalytic_subunit_blockade, reduction_of_pip3_production_tumor_suppression).

% ---------------------------------------------------------------------
% 3. NUCLEAR RECEPTORS & E3 LIGASES
% ---------------------------------------------------------------------

druggable_target(nr3c1, 'NR3C1', nuclear_receptor, steroid_receptor).
biological_resource(nr3c1, [ubiquitous_immune_cells, liver, skeletal_muscle, adipose_tissue], hypothalamic_pituitary_adrenal_axis, cytoplasm_to_nucleus).
pharmacological_effect(nr3c1, agonist, glucocorticoid_response_element_activation, anti_inflammatory_immunosuppression).

druggable_target(nr3c2, 'NR3C2', nuclear_receptor, steroid_receptor).
biological_resource(nr3c2, [kidney_distal_tubule, colon, salivary_glands, myocardium], mineralocorticoid_pathway, cytoplasm_to_nucleus).
pharmacological_effect(nr3c2, antagonist, mineralocorticoid_receptor_blockade, potassium_sparing_diuresis_blood_pressure_reduction).

druggable_target(esr1, 'ESR1', nuclear_receptor, hormone_receptor).
biological_resource(esr1, [mammary_gland, uterus, ovary, bone_tissue, cardiovascular_system], estrogen_signaling_pathway, nucleus_cytosol).
pharmacological_effect(esr1, selective_modulator, receptor_conformation_alteration, estrogenic_or_anti_estrogenic_tissue_specific_regulation).

druggable_target(ar, 'AR', nuclear_receptor, hormone_receptor).
biological_resource(ar, [prostate, skeletal_muscle, hair_follicles, liver, brain], androgen_signaling_pathway, cytoplasm_to_nucleus).
pharmacological_effect(ar, antagonist, competitive_binding_blockade, suppression_of_androgen_dependent_prostate_proliferation).

druggable_target(ppara, 'PPARA', nuclear_receptor, lipid_sensor).
biological_resource(ppara, [liver, brown_adipose_tissue, heart, skeletal_muscle], fatty_acid_oxidation_pathway, nucleus).
pharmacological_effect(ppara, agonist, rxr_heterodimerization_upregulation_of_lipoprotein_lipase, trigyceride_reduction_hdl_elevation).

druggable_target(pparg, 'PPARG', nuclear_receptor, lipid_sensor).
biological_resource(pparg, [adipose_tissue, macrophages, vascular_endothelium], peroxisome_proliferator_pathway, nucleus).
pharmacological_effect(pparg, agonist, rxr_heterodimerization_and_transcription_activation, insulin_sensitization_adipogenesis).

druggable_target(vdr, 'VDR', nuclear_receptor, vitamin_receptor).
biological_resource(vdr, [small_intestine, bone, kidney, immune_cells], calcium_phosphate_homeostasis, nucleus).
pharmacological_effect(vdr, agonist, intestinal_calcium_absorption_upregulation, bone_mineralization_immunomodulation).

druggable_target(fxr, 'NR1H4', nuclear_receptor, bile_acid_sensor).
biological_resource(fxr, [liver, ileum, kidney], bile_acid_homeostasis_pathway, nucleus).
pharmacological_effect(fxr, agonist, reduction_of_hepatic_bile_acid_synthesis, anti_fibrotic_cholestatic_treatment).

druggable_target(crbn, 'CRBN', e3_ligase, cereblon_cullin_ring_ligase).
biological_resource(crbn, [ubiquitous_tissues, lymphocytes, bone_marrow], protein_ubiquitination_pathway, cytoplasm_nucleus).
pharmacological_effect(crbn, molecular_glue_receptor, immunomodulatory_drug_binding_neo_substrate_recruitment, targeted_protein_degradation_of_ikzf1_ikzf3).

druggable_target(vhl, 'VHL', e3_ligase, von_hippel_lindau_crl2_complex).
biological_resource(vhl, [kidney, liver, ubiquitous_cells], hypoxia_inducible_factor_regulation, cytoplasm_nucleus).
pharmacological_effect(vhl, protac_recruit_target, ubiquitin_ligase_recruitment_via_hydroxyproline_mimetic, targeted_protein_degradation_chimera_activation).
