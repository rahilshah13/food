% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% 1. EXTENDED G-PROTEIN COUPLED RECEPTORS (GPCRs)
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
% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 10: Rho Kinases, Ion Channels, Orphan Receptors & Transcription Factors)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. RHO-ASSOCIATED KINASES & SERINE/THREONINE KINASES (EXTENDED)
% ---------------------------------------------------------------------

druggable_target(rock1, 'ROCK1', kinase, serine_threonine_kinase).
biological_resource(rock1, [vascular_smooth_muscle, endothelium, platelets, brain], rho_signaling_cytoskeletal_remodeling, cytoplasm).
pharmacological_effect(rock1, inhibitor, atp_competitive_active_site_blockade, vasodilation_reduction_of_intraocular_pressure_anti_fibrotic).

druggable_target(rock2, 'ROCK2', kinase, serine_threonine_kinase).
biological_resource(rock2, [brain, vascular_smooth_muscle, microglia, immune_cells], actin_cytoskeleton_dynamics, cytoplasm_membrane).
pharmacological_effect(rock2, inhibitor, catalytic_site_occupancy, neuroprotection_and_vascular_tone_modulation).

druggable_target(pim1, 'PIM1', kinase, serine_threonine_kinase).
biological_resource(pim1, [hematopoietic_cells, prostate_epithelium, tumor_cells], cell_survival_and_proliferation_pathway, cytoplasm_nucleus).
pharmacological_effect(pim1, inhibitor, atp_competitive_blockade, suppression_of_myeloid_and_lymphoid_malignancies).

druggable_target(csnk2a1, 'CK2A1', kinase, serine_threonine_kinase).
biological_resource(csnk2a1, [ubiquitous_nuclear_and_cytoplasmic_compartments], pi3k_akt_and_wnt_signaling_modulation, nucleus_cytoplasm).
pharmacological_effect(csnk2a1, inhibitor, active_site_blocking, induction_of_tumor_cell_apoptosis).

druggable_target(map2k3, 'MEK3', kinase, serine_threonine_kinase).
biological_resource(map2k3, [skeletal_muscle, heart, immune_cells], p38_mapk_signaling_cascade, cytoplasm).
pharmacological_effect(map2k3, inhibitor, dual_specificity_kinase_blockade, anti_inflammatory_response_modulation).

druggable_target(map2k6, 'MEK6', kinase, serine_threonine_kinase).
biological_resource(map2k6, [ubiquitous_tissues, leukocytes], stress_activated_protein_kinase_signaling, cytoplasm).
pharmacological_effect(map2k6, inhibitor, catalytic_site_inhibition, suppression_of_stress_mediated_cytokine_release).

% ---------------------------------------------------------------------
% 2. EXTENDED ION CHANNELS & MEMBRANE TRANSPORTERS
% ---------------------------------------------------------------------

druggable_target(kcnma1, 'BKCa', ion_channel, calcium_activated_potassium_channel).
biological_resource(kcnma1, [smooth_muscle, neurons, skeletal_muscle], membrane_hyperpolarization_pathway, plasma_membrane).
pharmacological_effect(kcnma1, opener_or_blocker, channel_conductance_modulation, smooth_muscle_relaxation_or_neuronal_excitability_tuning).

druggable_target(trpm4, 'TRPM4', ion_channel, trp_channel).
biological_resource(trpm4, [heart, prostate, immune_cells, brain], calcium_activated_sodium_current, plasma_membrane).
pharmacological_effect(trpm4, inhibitor, pore_blockade, cardioprotection_and_suppression_of_immune_activation).

druggable_target(trpv4, 'TRPV4', ion_channel, trp_channel).
biological_resource(trpm4, [endothelium, kidney_tubules, sensory_neurons], osmosensing_and_mechanotransduction, plasma_membrane).
pharmacological_effect(trpv4, antagonist, channel_inhibition, mitigation_of_pulmonary_edema_and_pain_signaling).

druggable_target(clcn1, 'CLCN1', ion_channel, voltage_gated_chloride_channel).
biological_resource(clcn1, [skeletal_muscle_sarcolemma], muscle_membrane_stabilization, plasma_membrane).
pharmacological_effect(clcn1, blocker, pore_occupancy, induction_of_myotonia_as_pharmacological_model).

druggable_target(slc12a2, 'NKCC1', transporter, ion_cotransporter).
biological_resource(slc12a2, [choroid_plexus, secretory_epithelia, vascular_smooth_muscle], sodium_potassium_2chloride_cotransport, basolateral_membrane).
pharmacological_effect(slc12a2, inhibitor, loop_diuretic_binding_blockade, reduction_of_neuronal_chloride_accumulation_and_edema).

% ---------------------------------------------------------------------
% 3. ADDITIONAL GPCRS & NEUROTRANSMITTER RECEPTORS
% ---------------------------------------------------------------------

druggable_target(galr1, 'GALR1', gpcr, galanin_receptor).
biological_resource(galr1, [central_nervous_system, dorsal_root_ganglia, intestine], inhibitory_neuropeptide_signaling, plasma_membrane).
pharmacological_effect(galr1, agonist, g_i_coupled_neuronal_inhibition, antinociception_and_seizure_suppression).

druggable_target(galr2, 'GALR2', gpcr, galanin_receptor).
biological_resource(galr2, [brain_hippocampus, hypothalamus, sympathetic_ganglia], trophic_and_excitatory_galanin_pathway, plasma_membrane).
pharmacological_effect(galr2, agonist, g_q_phospholipase_c_activation, neuroprotection_and_mood_regulation).

druggable_target(htr1f, 'HTR1F', gpcr, serotonin_receptor).
biological_resource(htr1f, [trigeminal_ganglia, cerebral_cortex], cranial_vasodilation_inhibition, plasma_membrane).
pharmacological_effect(htr1f, agonist, g_i_coupled_presynaptic_inhibition, acute_migraine_treatment_without_vasoconstriction).

druggable_target(mchr2, 'MCHR2', gpcr, melanin_concentrating_hormone_receptor).
biological_resource(mchr2, [frontal_cortex, amygdala, nucleus_accumbens], human_energy_balance_circuitry, plasma_membrane).
pharmacological_effect(mchr2, antagonist, g_protein_signaling_blockade, anti_obesity_and_anxiolytic_action).

% ---------------------------------------------------------------------
% 4. TRANSCRIPTION FACTORS & NUCLEAR ORPHANS
% ---------------------------------------------------------------------

druggable_target(nr4a1, 'NUR77', nuclear_receptor, orphan_nuclear_receptor).
biological_resource(nr4a1, [ubiquitous_induced_tissues, macrophages, cancer_cells], apoptosis_and_inflammation_modulation, nucleus_mitochondria).
pharmacological_effect(nr4a1, agonist_or_modulator, nuclear_translocation_and_transcription_activation, induction_of_cancer_cell_apoptosis).

druggable_target(stat3, 'STAT3', transcription_factor, signal_transducer).
biological_resource(stat3, [ubiquitous_cytoplasmic_compartments, tumor_cells], jak_stat_oncogenic_signaling, cytoplasm_to_nucleus).
pharmacological_effect(stat3, small_molecule_inhibitor, sh2_domain_dimerization_blockade, suppression_of_tumor_survival_and_immune_evasion).
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
% =====================================================================
% HUMAN DRUGGABLE PROTEOME DATABASE (Batch 2: Extended Ion Channels, Enzymes & Transporters)
% =====================================================================

:- dynamic(druggable_target/4).
:- dynamic(biological_resource/4).
:- dynamic(pharmacological_effect/4).

% ---------------------------------------------------------------------
% 1. EXTENDED ION CHANNELS (Voltage & Ligand-Gated)
% ---------------------------------------------------------------------

druggable_target(scn1a, 'SCN1A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn1a, [central_nervous_system_neurons, inhibitory_interneurons], neuronal_action_potential_generation, plasma_membrane).
pharmacological_effect(scn1a, blocker, channel_inactivation_stabilization, anticonvulsant_antiepileptic).

druggable_target(scn2a, 'SCN2A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn2a, [brain_axons, excitatory_neurons], neuronal_depolarization_pathway, plasma_membrane).
pharmacological_effect(scn2a, blocker, state_dependent_pore_blockade, suppression_of_neuronal_hyperexcitability).

druggable_target(scn4a, 'SCN4A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn4a, [skeletal_muscle_sarcolemma], neuromuscular_excitation_contraction, plasma_membrane).
pharmacological_effect(scn4a, blocker, sodium_current_reduction, muscle_relaxation_myotonia_suppression).

druggable_target(scn5a, 'SCN5A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn5a, [myocardium, cardiac_conduction_system], cardiac_action_potential_phase_0, plasma_membrane).
pharmacological_effect(scn5a, blocker, class_i_antiarrhythmic_pore_blockade, prolongation_of_repolarization_suppression_of_ectopic_pacemakers).

druggable_target(scn9a, 'SCN9A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn9a, [peripheral_sensory_neurons, dorsal_root_ganglia, sympathetic_ganglia], nociceptive_signaling_pathway, plasma_membrane).
pharmacological_effect(scn9a, blocker, state_dependent_sodium_channel_inhibition, analgesia_neuropathic_pain_suppression).

druggable_target(scn10a, 'SCN10A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn10a, [nociceptors, primary_afferent_fibers], visceral_and_somatic_pain_transmission, plasma_membrane).
pharmacological_effect(scn10a, blocker, selective_tetrodotoxin_resistant_blockade, peripheral_analgesia).

druggable_target(scn11a, 'SCN11A', ion_channel, voltage_gated_sodium_channel).
biological_resource(scn11a, [unmyelinated_c_fibers, dorsal_root_ganglia], subthreshold_pain_signaling, plasma_membrane).
pharmacological_effect(scn11a, blocker, channel_inhibition, chronic_pain_mitigation).

druggable_target(kcnh2, 'KCNH2', ion_channel, voltage_gated_potassium_channel).
biological_resource(kcnh2, [cardiac_myocytes, cardiac_conduction_system, central_neurons], cardiac_action_potential_repolarization, plasma_membrane).
pharmacological_effect(kcnh2, blocker, hERG_channel_pore_blockade, QT_interval_prolongation_arrhythmia_risk).

druggable_target(kcnq1, 'KCNQ1', ion_channel, voltage_gated_potassium_channel).
biological_resource(kcnq1, [cardiac_ventricles, inner_ear_stria_vacularis, kidney], slow_delayed_rectifier_potassium_current, plasma_membrane).
pharmacological_effect(kcnq1, activator_or_blocker, channel_conductance_modulation, cardiac_repolarization_adjustment).

druggable_target(kcnq2, 'KCNQ2', ion_channel, voltage_gated_potassium_channel).
biological_resource(kcnq2, [brain_cortex, hippocampus, peripheral_neurons], m_current_neuronal_excitability_control, plasma_membrane).
pharmacological_effect(kcnq2, opener, potassium_current_enhancement, neuronal_hyperpolarization_anticonvulsant).

druggable_target(kcnq3, 'KCNQ3', ion_channel, voltage_gated_potassium_channel).
biological_resource(kcnq3, [brain, sympathetic_neurons], m_current_heteromer_formation, plasma_membrane).
pharmacological_effect(kcnq3, opener, channel_opening_facilitation, reduction_of_neuronal_firing).

druggable_target(kcnq5, 'KCNQ5', ion_channel, voltage_gated_potassium_channel).
biological_resource(kcnq5, [skeletal_muscle, brain, vascular_smooth_muscle], vascular_tone_and_neuronal_regulation, plasma_membrane).
pharmacological_effect(kcnq5, opener, channel_activation, vasodilation_neuroprotection).

druggable_target(cacna1c, 'CACNA1C', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1c, [vascular_smooth_muscle, myocardium, nodal_tissue, brain], l_type_calcium_current_pathway, plasma_membrane).
pharmacological_effect(cacna1c, blocker, l_type_pore_blockade, vasodilation_negative_inotropy_blood_pressure_reduction).

druggable_target(cacna1d, 'CACNA1D', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1d, [endocrine_pancreas, zona_glomerulosa_adrenal, cochlea], l_type_calcium_signaling, plasma_membrane).
pharmacological_effect(cacna1d, blocker, channel_inhibition, endocrine_modulation_aldosterone_reduction).

druggable_target(cacna1g, 'CACNA1G', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1g, [thalamic_neurons, cardiac_pacemaker_cells], t_type_low_threshold_calcium_current, plasma_membrane).
pharmacological_effect(cacna1g, blocker, t_type_channel_inhibition, absence_seizure_suppression).

druggable_target(cacna1h, 'CACNA1H', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1h, [kidney, thalamus, heart_pacemaker], t_type_calcium_signaling, plasma_membrane).
pharmacological_effect(cacna1h, blocker, channel_blockade, anti_epileptic_action).

druggable_target(cacna1a, 'CACNA1A', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1a, [cerebellar_purkinje_cells, presynaptic_nerve_terminals], p_q_type_calcium_influx_neurotransmitter_release, plasma_membrane).
pharmacological_effect(cacna1a, modulator, channel_conductance_modulation, migraine_and_ataxia_pathway_modulation).

druggable_target(cacna1b, 'CACNA1B', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1b, [spinal_cord_dorsal_horn, sympathetic_ganglia], n_type_presynaptic_neurotransmitter_release, plasma_membrane).
pharmacological_effect(cacna1b, blocker, selective_n_type_blockade, spinal_analgesia).

druggable_target(cacna1e, 'CACNA1E', ion_channel, voltage_gated_calcium_channel).
biological_resource(cacna1e, [amygdala, granule_cells, endocrine_cells], r_type_calcium_current, plasma_membrane).
pharmacological_effect(cacna1e, blocker, calcium_influx_inhibition, neuroprotective_signaling).

druggable_target(gabra1, 'GABRA1', ion_channel, ligand_gated_ion_channel).
biological_resource(gabra1, [central_nervous_system, cerebral_cortex, hippocampus], gabaergic_inhibitory_neurotransmission, postsynaptic_membrane).
pharmacological_effect(gabra1, positive_allosteric_modulator, chloride_ion_conductance_enhancement, sedative_anxiolytic_anticonvulsant).

druggable_target(gabra2, 'GABRA2', ion_channel, ligand_gated_ion_channel).
biological_resource(gabra2, [limbic_system, nucleus_accumbens], anxiety_and_reward_circuitry, postsynaptic_membrane).
pharmacological_effect(gabra2, positive_allosteric_modulator, chloride_channel_potentiation, anxiolytic_muscle_relaxation).

druggable_target(gabra3, 'GABRA3', ion_channel, ligand_gated_ion_channel).
biological_resource(gabra3, [amygdala, cerebral_cortex], emotional_processing_circuitry, postsynaptic_membrane).
pharmacological_effect(gabra3, modulator, chloride_conductance_modulation, sedative_action).

druggable_target(gabra5, 'GABRA5', ion_channel, ligand_gated_ion_channel).
biological_resource(gabra5, [hippocampus, deep_cortical_layers], tonic_inhibition_memory_pathways, postsynaptic_membrane).
pharmacological_effect(gabra5, inverse_agonist_or_modulator, tonic_current_inhibition, cognitive_enhancement_anxiogenic_or_sedative).

druggable_target(gabrb2, 'GABRB2', ion_channel, ligand_gated_ion_channel).
biological_resource(gabrb2, [ubiquitous_central_nervous_system], gaba_a_beta_subunit_complex, postsynaptic_membrane).
pharmacological_effect(gabrb2, positive_allosteric_modulator, anesthetic_binding_site_activation, general_anesthesia_induction).

druggable_target(grin1, 'GRIN1', ion_channel, ligand_gated_ion_channel).
biological_resource(grin1, [central_nervous_system_synapses, cerebral_cortex, hippocampus], nmda_receptor_complex_glycine_site, postsynaptic_membrane).
pharmacological_effect(grin1, antagonist_or_modulator, ionotropic_pore_blockade_or_site_competition, neuroprotection_dissociative_anesthesia_antidepressant).

druggable_target(grin2a, 'GRIN2A', ion_channel, ligand_gated_ion_channel).
biological_resource(grin2a, [forebrain, postsynaptic_densities], glutamate_excitotoxicity_pathway, postsynaptic_membrane).
pharmacological_effect(grin2a, antagonist, subunit_selective_blockade, neuroprotection_stroke_mitigation).

druggable_target(grin2b, 'GRIN2B', ion_channel, ligand_gated_ion_channel).
biological_resource(grin2b, [forebrain_neurons, synaptic_junctions], learning_memory_excitotoxicity, postsynaptic_membrane).
pharmacological_effect(grin2b, negative_allosteric_modulator, selective_nr2b_blockade, rapid_antidepressant_neuroprotective).

druggable_target(gria1, 'GRIA1', ion_channel, ligand_gated_ion_channel).
biological_resource(gria1, [cerebral_cortex, hippocampus, thalamus], ampa_receptor_fast_excitatory_transmission, postsynaptic_membrane).
pharmacological_effect(gria1, antagonist, non_competitive_ampa_blockade, anti_epileptic_neuroprotective).

druggable_target(gria2, 'GRIA2', ion_channel, ligand_gated_ion_channel).
biological_resource(gria2, [ubiquitous_brain_neurons], calcium_impermeable_ampa_assembly, postsynaptic_membrane).
pharmacological_effect(gria2, modulator, receptor_stabilization, synaptic_plasticity_modulation).

druggable_target(chrna1, 'CHRNA1', ion_channel, ligand_gated_ion_channel).
biological_resource(chrna1, [neuromuscular_junction_postsynaptic_membrane], skeletal_muscle_contraction, motor_end_plate).
pharmacological_effect(chrna1, antagonist, competitive_neuromuscular_blockade, skeletal_muscle_relaxation_paralysis_for_surgery).

druggable_target(chrna4, 'CHRNA4', ion_channel, ligand_gated_ion_channel).
biological_resource(chrna4, [central_nervous_system_thalamus_cortex], neuronal_nicotinic_signaling, postsynaptic_membrane).
pharmacological_effect(chrna4, partial_agonist, alpha4beta2_receptor_stimulation, smoking_cessation_aid_craving_reduction).

druggable_target(chrnb2, 'CHRNB2', ion_channel, ligand_gated_ion_channel).
biological_resource(chrnb2, [central_nervous_system, autonomic_ganglia], nicotinic_cholinergic_pathway, plasma_membrane).
pharmacological_effect(chrnb2, agonist, channel_activation_and_desensitization, neuroprotection_addiction_mitigation).

druggable_target(htr3a, 'HTR3A', ion_channel, ligand_gated_ion_channel).
biological_resource(htr3a, [area_postrema, vagal_afferents, enteric_nervous_system], chemoreceptor_trigger_zone_emesis, plasma_membrane).
pharmacological_effect(htr3a, antagonist, ionotropic_serotonin_channel_blockade, antiemetic_chemotherapy_induced_nausea_prevention).

druggable_target(trpv1, 'TRPV1', ion_channel, trp_channel).
biological_resource(trpv1, [primary_afferent_nociceptors, dorsal_root_ganglia, urinary_bladder], thermal_and_chemical_nociception, plasma_membrane).
pharmacological_effect(trpv1, agonist_desensitizer_or_antagonist, channel_desensitization_or_pore_blockade, neuropathic_pain_relief_analgesia).

druggable_target(trpm8, 'TRPM8', ion_channel, trp_channel).
biological_resource(trpm8, [sensory_neurons, cold_thermoreceptors, prostate], cold_sensation_pathway, plasma_membrane).
pharmacological_effect(trpm8, antagonist, cold_pain_and_migraine_blockade, visceral_pain_relief).

druggable_target(trpa1, 'TRPA1', ion_channel, trp_channel).
biological_resource(trpa1, [sensory_nerve_endings, airway_epithelium], chemical_irritant_and_pain_sensor, plasma_membrane).
pharmacological_effect(trpa1, antagonist, channel_inhibition, anti_inflammatory_antitussive_pain_reduction).

druggable_target(p2rx3, 'P2RX3', ion_channel, purinergic_ion_channel).
biological_resource(p2rx3, [sensory_nerve_fibers, urinary_bladder_afferents], ATP_mediated_pain_and_sensory_signaling, plasma_membrane).
pharmacological_effect(p2rx3, antagonist, homomeric_p2x3_blockade, treatment_of_refractory_chronic_cough).

% ---------------------------------------------------------------------
% 2. EXTENDED ENZYMES & EPIGENETIC REGULATORS
% ---------------------------------------------------------------------

druggable_target(ace, 'ACE', enzyme, metalloprotease).
biological_resource(ace, [lung_endothelium, kidney_proximal_tubule, vascular_tissues], renin_angiotensin_system, plasma_membrane_extracellular).
pharmacological_effect(ace, inhibitor, zinc_binding_active_site_blockade, conversion_of_angiotensin_i_to_ii_prevention_vasodilation).

druggable_target(dpp4, 'DPP4', enzyme, serine_protease).
biological_resource(dpp4, [kidney, small_intestine, liver, immune_cells, endothelial_cells], incretin_degradation_pathway, plasma_membrane).
pharmacological_effect(dpp4, inhibitor, catalytic_site_inhibition, stabilization_of_glp1_and_gip_insulin_secretion).

druggable_target(bace1, 'BACE1', enzyme, aspartyl_protease).
biological_resource(bace1, [neurons, astrocytes, pancreatic_beta_cells], amyloid_precursor_protein_processing, endosome_membrane).
pharmacological_effect(bace1, inhibitor, catalytic_cleft_blockade, reduction_of_beta_amyloid_peptide_generation).

druggable_target(f2, 'F2', enzyme, serine_protease).
biological_resource(f2, [liver, plasma, coagulation_cascade], blood_coagulation_pathway, extracellular_plasma).
pharmacological_effect(f2, direct_inhibitor, active_site_blocking_thrombin, anticoagulation_thromboembolism_prevention).

druggable_target(f10, 'FX0', enzyme, serine_protease).
biological_resource(f10, [liver, plasma], common_coagulation_pathway, extracellular_plasma).
pharmacological_effect(f10, inhibitor, factor_xa_active_site_blockade, inhibition_of_thrombin_generation).

druggable_target(mmp9, 'MMP9', enzyme, matrix_metalloproteinase).
biological_resource(mmp9, [neutrophils, macrophages, endothelial_cells, tumor_stroma], extracellular_matrix_remodeling, extracellular_matrix).
pharmacological_effect(mmp9, inhibitor, zinc_chelation_active_site_blockade, anti_inflammatory_anti_metastatic_action).

druggable_target(pde3a, 'PDE3A', enzyme, phosphodiesterase).
biological_resource(pde3a, [myocardium, platelets, vascular_smooth_muscle], cyclic_amp_cgmp_hydrolysis_pathway, cytoplasm).
pharmacological_effect(pde3a, inhibitor, camp_degredation_blockade, positive_inotropy_vasodilation_antiplatelet).

druggable_target(pde4d, 'PDE4D', enzyme, phosphodiesterase).
biological_resource(pde4d, [airway_smooth_muscle, immune_cells, brain], camp_signaling_pathway, cytoplasm).
pharmacological_effect(pde4d, inhibitor, catalytic_site_blockade, anti_inflammatory_bronchodilation).

druggable_target(pde5a, 'PDE5A', enzyme, phosphodiesterase).
biological_resource(pde5a, [corpus_cavernosum, pulmonary_vasculature, platelets], cgmp_hydrolysis_pathway, cytoplasm).
pharmacological_effect(pde5a, inhibitor, cgmp_degradation_prevention, vasodilation_erectile_dysfunction_treatment).

druggable_target(hdac1, 'HDAC1', enzyme, histone_deacetylase).
biological_resource(hdac1, [ubiquitous_nuclear_compartments, proliferating_tissues], transcriptional_repression_pathway, nucleus).
pharmacological_effect(hdac1, inhibitor, zinc_binding_domain_chelation, chromatin_hyperacetylation_tumor_cell_apoptosis).

druggable_target(hdac2, 'HDAC2', enzyme, histone_deacetylase).
biological_resource(hdac2, [brain, heart, lung, skeletal_muscle], transcriptional_regulation, nucleus).
pharmacological_effect(hdac2, inhibitor, enzymatic_blockade, anti_inflammatory_gene_reactivation).

druggable_target(hdac3, 'HDAC3', enzyme, histone_deacetylase).
biological_resource(hdac3, [liver, heart, immune_cells], metabolic_and_inflammatory_regulation, nucleus).
pharmacological_effect(hdac3, inhibitor, catalytic_inhibition, cell_cycle_arrest).

druggable_target(ezh2, 'EZH2', enzyme, methyltransferase).
biological_resource(ezh2, [germinal_center_b_cells, prostate_epithelium, lymph_nodes], polycomb_repressive_complex_2, nucleus).
pharmacological_effect(ezh2, inhibitor, s_adenosylmethionine_competitive_blockade, epigenetic_derepression_lymphoma_suppression).

druggable_target(dnmt1, 'DNMT1', enzyme, DNA_methyltransferase).
biological_resource(dnmt1, [proliferating_cells, bone_marrow], maintenance_dna_methylation, nucleus).
pharmacological_effect(dnmt1, covalent_inhibitor, cytosine_analog_incorporation_and_trapping, hypomethylation_reactivation_of_silenced_tumor_suppressors).

druggable_target(maoa, 'MAOA', enzyme, oxidoreductase).
biological_resource(maoa, [catecholaminergic_neurons, gastrointestinal_tract, liver, placenta], monoamine_catabolism, mitochondrial_outer_membrane).
pharmacological_effect(maoa, irreversible_inhibitor, covalent_flavin_adenine_dinucleotide_binding, elevation_of_synaptic_serotonin_norepinephrine_dopamine).

druggable_target(maob, 'MAOB', enzyme, oxidoreductase).
biological_resource(maob, [astrocytes, brain, blood_platelets], dopamine_catabolism, mitochondrial_outer_membrane).
pharmacological_effect(maob, inhibitor, selective_catalytic_blockade, preservation_of_striatal_dopamine_in_parkinsons_disease).

druggable_target(ache, 'ACHE', enzyme, hydrolase).
biological_resource(ache, [cholinergic_synapses, neuromuscular_junction, erythrocytes], cholinergic_neurotransmission, synaptic_cleft_membrane_bound).
pharmacological_effect(ache, inhibitor, catalytic_esteratic_site_blockade, accumulation_of_acetylcholine_enhancement_of_cholinergic_signaling).

druggable_target(bche, 'BCHE', enzyme, hydrolase).
biological_resource(bche, [liver, serum, central_nervous_system], non_specific_cholesterol_and_drug_ester_hydrolysis, plasma_cytoplasm).
pharmacological_effect(bche, inhibitor, catalytic_blockade, acetyl_and_butyrylcholine_prolongation).

druggable_target(hmgcr, 'HMGCR', enzyme, oxidoreductase).
biological_resource(hmgcr, [hepatocytes, intestinal_mucosa, systemic_tissues], mevalonate_cholesterol_biosynthesis_pathway, endoplasmic_reticulum).
pharmacological_effect(hmgcr, inhibitor, competitive_active_site_blockade, lowering_hepatic_cholesterol_synthesis_ldl_reduction).

druggable_target(pcsk9, 'PCSK9', enzyme, serine_protease).
biological_resource(pcsk9, [liver, intestine, kidney], ldl_receptor_degradation_pathway, extracellular_secretion).
pharmacological_effect(pcsk9, monoclonal_antibody_inhibitor, binding_and_prevention_of_ldl_receptor_downregulation, clearance_of_plasma_ldl_cholesterol).

druggable_target(ptgs1, 'PTGS1', enzyme, cyclooxygenase).
biological_resource(ptgs1, [gastric_mucosa, platelets, vascular_endothelium, renal_cortex], constitutive_prostaglandin_synthesis, endoplasmic_reticulum).
pharmacological_effect(ptgs1, inhibitor, active_site_acetylation_or_competition, antiplatelet_action_gastric_irritation_risk).

druggable_target(ptgs2, 'PTGS2', enzyme, cyclooxygenase).
biological_resource(ptgs2, [endothelium, inflamed_tissues, central_nervous_system, renal_medulla], arachidonic_acid_metabolism, endoplasmic_reticulum_nuclear_envelope).
pharmacological_effect(ptgs2, inhibitor, selective_active_site_competition, anti_inflammatory_analgesic_antipyretic).

druggable_target(alox5, 'ALOX5', enzyme, oxidoreductase).
biological_resource(alox5, [leukocytes, neutrophils, macrophages, mast_cells], leukotriene_biosynthesis_pathway, cytoplasm_nuclear_membrane).
pharmacological_effect(alox5, inhibitor, iron_chelation_or_active_site_blockade, anti_asthmatic_anti_inflammatory).

druggable_target(xdh, 'XDH', enzyme, oxidoreductase).
biological_resource(xdh, [liver, intestinal_mucosa, endothelial_cells], purine_catabolism_uric_acid_production, cytoplasm).
pharmacological_effect(xdh, inhibitor, xanthine_oxidase_active_site_blockade, reduction_of_uric_acid_synthesis_gout_treatment).

druggable_target(impdh2, 'IMPDH2', enzyme, oxidoreductase).
biological_resource(impdh2, [proliferating_lymphocytes, activated_immune_cells], guanosine_nucleotide_biosynthesis, cytoplasm).
pharmacological_effect(impdh2, inhibitor, uncompetitive_active_site_blockade, suppression_of_t_and_b_lymphocyte_proliferation).

druggable_target(ca2, 'CA2', enzyme, lyase).
biological_resource(ca2, [erythrocytes, kidney_proximal_tubule, eye_ciliary_body, brain], acid_base_homeostasis, cytoplasm).
pharmacological_effect(ca2, inhibitor, sulfonamide_zinc_coordination_blockade, diuresis_reduction_of_intraocular_pressure).

druggable_target(ca9, 'CA9', enzyme, lyase).
biological_resource(ca9, [hypoxic_tumor_cells, gastric_epithelium], tumor_microenvironment_acidification, plasma_membrane).
pharmacological_effect(ca9, inhibitor, catalytic_site_blockade, anti_tumor_hypoxic_metabolic_disruption).

% ---------------------------------------------------------------------
% 3. EXTENDED TRANSPORTERS & PUMPS
% ---------------------------------------------------------------------

druggable_target(slc6a2, 'SLC6A2', transporter, monoamine_transporter).
biological_resource(slc6a2, [central_nervous_system_noradrenergic_neurons, sympathetic_terminals], norepinephrine_reuptake_pathway, plasma_membrane).
pharmacological_effect(slc6a2, inhibitor, reuptake_transporter_blockade, synaptic_norepinephrine_concentration_increase).

druggable_target(slc6a3, 'SLC6A3', transporter, monoamine_transporter).
biological_resource(slc6a3, [central_nervous_system_dopaminergic_neurons, striatum], dopamine_reuptake_pathway, plasma_membrane).
pharmacological_effect(slc6a3, inhibitor, transporter_pore_blockade, synaptic_dopamine_elevation_psychomotor_stimulation).

druggable_target(slc6a4, 'SLC6A4', transporter, monoamine_transporter).
biological_resource(slc6a4, [central_nervous_system_serotonergic_neurons, platelets, gastrointestinal_tract], serotonin_reuptake_pathway, plasma_membrane).
pharmacological_effect(slc6a4, inhibitor, reuptake_transporter_blockade, synaptic_serotonin_concentration_increase_antidepressant).

druggable_target(slc5a2, 'SLC5A2', transporter, sodium_glucose_cotransporter).
biological_resource(slc5a2, [kidney_proximal_tubule], renal_glucose_reabsorption_pathway, brush_border_membrane).
pharmacological_effect(slc5a2, inhibitor, cotransporter_inhibition, glucosuria_blood_glucose_reduction).

druggable_target(slc12a1, 'SLC12A1', transporter, ion_cotransporter).
biological_resource(slc12a1, [kidney_thick_ascending_limb], loop_of_henle_sodium_potassium_2chloride_cotransport, apical_membrane).
pharmacological_effect(slc12a1, inhibitor, loop_diuretic_binding_site_blockade, profound_natriuresis_diuresis_blood_pressure_reduction).

druggable_target(slc12a3, 'SLC12A3', transporter, ion_cotransporter).
biological_resource(slc12a3, [kidney_distal_convoluted_tubule], sodium_chloride_cotransport_pathway, apical_membrane).
pharmacological_effect(slc12a3, inhibitor, thiazide_diuretic_blockade, moderate_natriuresis_vasodilation).

druggable_target(slc22a12, 'SLC22A12', transporter, organic_ion_transporter).
biological_resource(slc22a12, [kidney_proximal_tubule], renal_uric_acid_reabsorption, basolateral_and_apical_membrane).
pharmacological_effect(slc22a12, inhibitor, uricosuric_blockade, enhanced_renal_uric_acid_excretion_gout_treatment).

druggable_target(abcb1, 'ABCB1', transporter, abc_efflux_pump).
biological_resource(abcb1, [blood_brain_barrier, intestinal_epithelium, hepatocytes, renal_tubules], multidrug_efflux_defense_pathway, plasma_membrane).
pharmacological_effect(abcb1, inhibitor, efflux_pump_blockade, increased_drug_bioavailability_and_brain_penetration).

druggable_target(abcc7, 'ABCC7', transporter, chloride_channel_pump).
biological_resource(abcc7, [epithelium_of_lungs, pancreas, sweat_glands, gastrointestinal_tract], chloride_ion_secretion_pathway, apical_plasma_membrane).
pharmacological_effect(abcc7, corrector_potentiator, protein_folding_rescue_and_gating_enhancement, restoration_of_chloride_transport_in_cystic_fibrosis).

druggable_target(abcg2, 'ABCg2', transporter, abc_efflux_pump).
biological_resource(abcg2, [placenta, intestine, liver, breast_epithelium, stem_cells], xenobiotic_and_uric_acid_efflux, plasma_membrane).
pharmacological_effect(abcg2, inhibitor, efflux_inhibition, modification_of_pharmacokinetics_and_uric_acid_clearance).

druggable_target(atp4a, 'ATP4A', pump, gastric_proton_pump).
biological_resource(atp4a, [gastric_parietal_cells], acid_secretion_pathway, canalicular_membrane).
pharmacological_effect(atp4a, covalent_inhibitor, irreversible_cysteine_alkylation_proton_pump_blockade, suppression_of_gastric_acid_secretion_ulcer_treatment).

druggable_target(atp1a1, 'ATP1A1', pump, sodium_potassium_pump).
biological_resource(atp1a1, [myocardium, neurons, kidney_tubules], na_k_atpase_electrogenic_gradient, plasma_membrane).
pharmacological_effect(atp1a1, inhibitor, cardiac_glycoside_binding_site_blockade, positive_inotropy_intracellular_calcium_accumulation).

druggable_target(il6r, 'IL6R', receptor, cytokine_receptor).
biological_resource(il6r, [hepatocytes, immune_cells, macrophages], interleukin_6_signaling_pathway, plasma_membrane).
pharmacological_effect(il6r, monoclonal_antibody_inhibitor, receptor_dimerization_blockade, suppression_of_pro_inflammatory_signaling_in_arthritis).

druggable_target(tnfrsf1a, 'TNFRSF1A', receptor, tnf_receptor_family).
biological_resource(tnfrsf1a, [ubiquitous_immune_cells, fibroblasts, endothelium], tnf_alpha_inflammatory_pathway, plasma_membrane).
pharmacological_effect(tnfrsf1a, biological_antagonist, ligand_neutralization_and_receptor_blockade, mitigation_of_autoimmune_tissue_destruction).

druggable_target(itga2b, 'ITGA2B', receptor, integrin_receptor).
biological_resource(itga2b, [platelets, megakaryocytes], gp_iib_iiia_platelet_aggregation_pathway, plasma_membrane).
pharmacological_effect(itga2b, antagonist, fibrinogen_binding_site_blockade, prevention_of_acute_platelet_thrombus_formation).

druggable_target(itgb3, 'ITGB3', receptor, integrin_receptor).
biological_resource(itgb3, [platelets, endothelial_cells, osteoclasts], cell_adhesion_and_matrix_interaction, plasma_membrane).
pharmacological_effect(itgb3, monoclonal_antibody_inhibitor, steric_blocking_of_integrin_complex, inhibition_of_platelet_aggregation).
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
