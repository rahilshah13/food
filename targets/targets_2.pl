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
