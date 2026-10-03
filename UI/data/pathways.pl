% =====================================================================
% HUMAN PATHWAY TOPOLOGY
% =====================================================================

:- dynamic(pathway/2).
:- dynamic(pathway_trigger/3).
:- dynamic(pathway_edge/4).

% ---------------------------------------------------------------------
% 1. CANONICAL PATHWAY DEFINITIONS
% ---------------------------------------------------------------------

pathway(pi3k_akt_mtor, 'PI3K/AKT/mTOR Signaling Pathway').
pathway(mapk_erk, 'MAPK/ERK Signaling Cascade').
pathway(camp_pka, 'GPCR/cAMP/PKA Signaling Pathway').
pathway(intrinsic_apoptosis, 'Intrinsic Apoptosis Pathway').
pathway(wnt_beta_catenin, 'Wnt/Beta-Catenin Signaling Pathway').
pathway(nf_kb_signaling, 'NF-kappaB Inflammatory Pathway').
pathway(hif_hypoxia, 'HIF Hypoxia Response Pathway').
pathway(jak_stat, 'JAK/STAT Cytokine Signaling Pathway').
pathway(notch_signaling, 'Notch Signaling Pathway').
pathway(hedgehog_signaling, 'Hedgehog Signaling Pathway').
pathway(tgf_beta, 'TGF-Beta Receptor Signaling Pathway').
pathway(tlr_signaling, 'Toll-Like Receptor Signaling Pathway').
pathway(cell_cycle_checkpoint, 'ATM/ATR Cell Cycle Checkpoint Pathway').
pathway(insulin_signaling, 'Insulin Receptor Signaling Pathway').
pathway(extrinsic_apoptosis, 'Extrinsic (Death Receptor) Apoptosis Pathway').
pathway(erbb_signaling, 'ErbB Receptor Signaling Network').
pathway(fcal_adhesion, 'Focal Adhesion Kinase (FAK) Signaling Pathway').
pathway(tcr_signaling, 'T-Cell Receptor Signaling Pathway').
pathway(bcr_signaling, 'B-Cell Receptor Signaling Pathway').
pathway(mTOR_autophagy, 'mTOR-Regulated Autophagy Pathway').

% ---------------------------------------------------------------------
% 2. PATHWAY TRIGGER ENTRYPOINTS
% ---------------------------------------------------------------------

pathway_trigger(pi3k_akt_mtor, egfr, ligand_binding_egf_or_insulin).
pathway_trigger(mapk_erk, egfr, growth_factor_receptor_dimerization).
pathway_trigger(camp_pka, adrb2, catecholamine_agonist_binding).
pathway_trigger(intrinsic_apoptosis, bcl2, cellular_stress_or_dna_damage).
pathway_trigger(wnt_beta_catenin, fzd1, wnt_protein_extracellular_ligand_binding).
pathway_trigger(nf_kb_signaling, tlr4, lipopolysaccharide_lps_recognition).
pathway_trigger(hif_hypoxia, egln1, low_intracellular_oxygen_tension).
pathway_trigger(jak_stat, il6r, interleukin_6_cytokine_dimerization).
pathway_trigger(notch_signaling, notch1, ligand_delta_like_binding).
pathway_trigger(hedgehog_signaling, smo, sonic_hedgehog_ligand_binding).
pathway_trigger(tgf_beta, tgfbr1, tgf_beta_dimer_binding).
pathway_trigger(tlr_signaling, tlr2, microbial_lipopeptide_recognition).
pathway_trigger(cell_cycle_checkpoint, atm, double_strand_dna_break).
pathway_trigger(insulin_signaling, insr, insulin_peptide_binding).
pathway_trigger(extrinsic_apoptosis, fas, fas_ligand_multimerization).
pathway_trigger(erbb_signaling, her2, erbb2_heterodimerization).
pathway_trigger(fcal_adhesion, ptk2, integrin_clustering_at_extracellular_matrix).
pathway_trigger(tcr_signaling, lck, antigen_mhc_complex_binding).
pathway_trigger(bcr_signaling, lyn, antigen_crosslinking_of_b_cell_receptor).
pathway_trigger(mTOR_autophagy, ulk1, nutrient_deprivation_stress).

% ---------------------------------------------------------------------
% 3. EXHAUSTIVE SERIALIZED PATHWAY EDGES (Directed Graph with Cycles)
% ---------------------------------------------------------------------

% --- PI3K/AKT/mTOR Pathway Edges ---
pathway_edge(pi3k_akt_mtor, egfr, pik3ca, activates).
pathway_edge(pi3k_akt_mtor, pik3ca, pip3, produces).
pathway_edge(pi3k_akt_mtor, pip3, akt1, recruits_and_activates).
pathway_edge(pi3k_akt_mtor, akt1, mtor, activates_mtorc1).
pathway_edge(pi3k_akt_mtor, mtor, p70s6k, phosphorylates).
pathway_edge(pi3k_akt_mtor, mtor, irs1, inhibits_feedback).
pathway_edge(pi3k_akt_mtor, irs1, pik3ca, activates_cycle).

% --- MAPK/ERK Cascade Edges ---
pathway_edge(mapk_erk, egfr, kras, activates).
pathway_edge(mapk_erk, kras, braf, activates).
pathway_edge(mapk_erk, braf, map2k1, phosphorylates).
pathway_edge(mapk_erk, map2k1, mapk1, phosphorylates).
pathway_edge(mapk_erk, mapk1, sos1, phosphorylates_feedback).
pathway_edge(mapk_erk, sos1, kras, activates_cycle).

% --- GPCR / cAMP / PKA Pathway Edges ---
pathway_edge(camp_pka, adrb2, g_s_protein, activates).
pathway_edge(camp_pka, g_s_protein, adenylyl_cyclase, stimulates).
pathway_edge(camp_pka, adenylyl_cyclase, camp, produces).
pathway_edge(camp_pka, camp, pka, activates).
pathway_edge(camp_pka, pka, pde4d, activates_feedback).
pathway_edge(camp_pka, pde4d, camp, degrades_cycle).

% --- Intrinsic Apoptosis Pathway Edges ---
pathway_edge(intrinsic_apoptosis, bcl2, bax, inhibits).
pathway_edge(intrinsic_apoptosis, bax, momp, promotes).
pathway_edge(intrinsic_apoptosis, momp, cytochrome_c, releases).
pathway_edge(intrinsic_apoptosis, cytochrome_c, apaf1, binds).
pathway_edge(intrinsic_apoptosis, apaf1, casp9, activates).
pathway_edge(intrinsic_apoptosis, casp9, casp3, cleaves_and_activates).
pathway_edge(intrinsic_apoptosis, casp3, bcl2, cleaves_and_inactivates_feedback).

% --- Wnt / Beta-Catenin Pathway Edges ---
pathway_edge(wnt_beta_catenin, fzd1, dishevelled, activates).
pathway_edge(wnt_beta_catenin, dishevelled, gsk3b, inhibits).
pathway_edge(wnt_beta_catenin, gsk3b, beta_catenin, inhibits_degradation).
pathway_edge(wnt_beta_catenin, beta_catenin, tcf_lef_transcription, activates).
pathway_edge(wnt_beta_catenin, tcf_lef_transcription, axin2, upregulates_feedback).
pathway_edge(wnt_beta_catenin, axin2, gsk3b, binds_and_represses_cycle).

% --- NF-kappaB Inflammatory Pathway Edges ---
pathway_edge(nf_kb_signaling, tlr4, myd88, recruits).
pathway_edge(nf_kb_signaling, myd88, ikk_complex, activates).
pathway_edge(nf_kb_signaling, ikk_complex, ikb_alpha, phosphorylates).
pathway_edge(nf_kb_signaling, ikb_alpha, nf_kb_p65, releases).
pathway_edge(nf_kb_signaling, nf_kb_p65, nfkbia_transcription, upregulates_feedback).
pathway_edge(nf_kb_signaling, nfkbia_transcription, ikb_alpha, replenishes_cycle).

% --- HIF Hypoxia Response Pathway Edges ---
pathway_edge(hif_hypoxia, egln1, hif1a, hydroxylates_and_degrades_under_normoxia).
pathway_edge(hif_hypoxia, hif1a, vegfa, transcribes_under_hypoxia).
pathway_edge(hif_hypoxia, vegfa, epo, coregulates).

% --- JAK/STAT Cytokine Signaling Pathway Edges ---
pathway_edge(jak_stat, il6r, jak1, activates).
pathway_edge(jak_stat, jak1, stat3, phosphorylates).
pathway_edge(jak_stat, stat3, socs3, upregulates_feedback).
pathway_edge(jak_stat, socs3, jak1, inhibits_cycle).

% --- Notch Signaling Pathway Edges ---
pathway_edge(notch_signaling, notch1, nicd_cleavage, initiates_proteolysis).
pathway_edge(notch_signaling, nicd_cleavage, hes1_transcription, activates).
pathway_edge(notch_signaling, hes1_transcription, notch1, represses_feedback).

% --- Hedgehog Signaling Pathway Edges ---
pathway_edge(hedgehog_signaling, smo, sufu, dissociates).
pathway_edge(hedgehog_signaling, sufu, gli1, activates).
pathway_edge(hedgehog_signaling, gli1, ptc1_transcription, upregulates_feedback).
pathway_edge(hedgehog_signaling, ptc1_transcription, smo, inhibits_cycle).

% --- TGF-Beta Signaling Pathway Edges ---
pathway_edge(tgf_beta, tgfbr1, smad2, phosphorylates).
pathway_edge(tgf_beta, smad2, smad4, complexes_with).
pathway_edge(tgf_beta, smad4, smad7_transcription, activates).
pathway_edge(tgf_beta, smad7_transcription, tgfbr1, inhibits_feedback).

% --- Toll-Like Receptor Signaling Pathway Edges ---
pathway_edge(tlr_signaling, tlr2, tirap, recruits).
pathway_edge(tlr_signaling, tirap, myd88, activates).
pathway_edge(tlr_signaling, myd88, irak4, phosphorylates).
pathway_edge(tlr_signaling, irak4, traf6, activates).

% --- Cell Cycle Checkpoint Pathway Edges ---
pathway_edge(cell_cycle_checkpoint, atm, chk2, phosphorylates).
pathway_edge(cell_cycle_checkpoint, chk2, tp53, stabilizes).
pathway_edge(cell_cycle_checkpoint, tp53, cdkn1a, transcribes).
pathway_edge(cell_cycle_checkpoint, cdkn1a, atm, inhibits_feedback).

% --- Insulin Receptor Signaling Pathway Edges ---
pathway_edge(insulin_signaling, insr, irs1, phosphorylates).
pathway_edge(insulin_signaling, irs1, pik3ca, activates).
pathway_edge(insulin_signaling, pik3ca, akt1, activates).
pathway_edge(insulin_signaling, akt1, slc2a4, translocates_membrane).

% --- Extrinsic Apoptosis Pathway Edges ---
pathway_edge(extrinsic_apoptosis, fas, fas_associated_death_domain, recruits).
pathway_edge(extrinsic_apoptosis, fas_associated_death_domain, casp8, activates).
pathway_edge(extrinsic_apoptosis, casp8, casp3, cleaves_and_activates).
pathway_edge(extrinsic_apoptosis, casp3, fas, cleaves_feedback).

% --- ErbB Receptor Signaling Network Edges ---
pathway_edge(erbb_signaling, her2, src, activates).
pathway_edge(erbb_signaling, src, focal_adhesion_kinases, phosphorylates).
pathway_edge(erbb_signaling, focal_adhesion_kinases, erk, stimulates).

% --- Focal Adhesion Kinase Signaling Edges ---
pathway_edge(fcal_adhesion, ptk2, src, binds_and_activates).
pathway_edge(fcal_adhesion, src, paxillin, phosphorylates).
pathway_edge(fcal_adhesion, paxillin, rho_gtpases, modulates).

% --- T-Cell Receptor Signaling Edges ---
pathway_edge(tcr_signaling, lck, zap70, phosphorylates).
pathway_edge(tcr_signaling, zap70, lat, recruits).
pathway_edge(tcr_signaling, lat, plc_gamma1, activates).

% --- B-Cell Receptor Signaling Edges ---
pathway_edge(bcr_signaling, lyn, syk, phosphorylates).
pathway_edge(bcr_signaling, syk, btk, activates).
pathway_edge(bcr_signaling, btk, plcg2, activates).

% --- mTOR-Regulated Autophagy Pathway Edges ---
pathway_edge(mTOR_autophagy, ulk1, atg13, phosphorylates).
pathway_edge(mTOR_autophagy, atg13, autophagosome_membrane, nucleates).
pathway_edge(mTOR_autophagy, autophagosome_membrane, mtor, inhibits_feedback).

% =====================================================================

pathway(fc_epsilon_ri_signaling, 'Fc Epsilon RI Signaling Pathway').
pathway(chemokine_signaling, 'Chemokine Signaling Pathway').
pathway(vegf_signaling, 'VEGF Signaling Pathway').
pathway(mismatch_repair, 'DNA Mismatch Repair Pathway').
pathway(base_excision_repair, 'Base Excision Repair Pathway').
pathway(homologous_recombination, 'Homologous Recombination DNA Repair Pathway').
pathway(complement_cascade, 'Complement Cascade Pathway').
pathway(fc_gamma_r_phagocytosis, 'Fc Gamma R-mediated Phagocytosis Pathway').
pathway(axon_guidance, 'Axon Guidance Signaling Pathway').
pathway(ppar_signaling, 'PPAR Signaling Pathway').
pathway(adipocytokine_signaling, 'Adipocytokine Signaling Pathway').
pathway(oxytocin_signaling, 'Oxytocin Signaling Pathway').
pathway(relaxin_signaling, 'Relaxin Signaling Pathway').
pathway(estrogen_signaling, 'Estrogen Signaling Pathway').
pathway(thyroid_signaling, 'Thyroid Hormone Signaling Pathway').
pathway(glucagon_signaling, 'Glucagon Signaling Pathway').
pathway(aldosterone_reabsorption, 'Aldosterone-Regulated Sodium Reabsorption Pathway').
pathway(calcium_signaling, 'Calcium Signaling Pathway').
pathway(cag_pathway, 'cGMP-PKG Signaling Pathway').
pathway(mapt_signaling, 'Tau/MAPT Neurofibrillary Signaling Pathway').

% ---------------------------------------------------------------------
% 2. PATHWAY TRIGGER ENTRYPOINTS
% ---------------------------------------------------------------------

pathway_trigger(fc_epsilon_ri_signaling, lck, ige_antigen_crosslinking).
pathway_trigger(chemokine_signaling, ccr5, chemokine_ligand_binding).
pathway_trigger(vegf_signaling, kdr, vegfa_dimer_binding).
pathway_trigger(mismatch_repair, msh2, replication_base_mismatch).
pathway_trigger(base_excision_repair, ogg1, oxidative_base_damage).
pathway_trigger(homologous_recombination, brca1, double_strand_dna_break).
pathway_trigger(complement_cascade, masp2, pathogen_surface_pattern_recognition).
pathway_trigger(fc_gamma_r_phagocytosis, tec, antibody_coated_immune_complex).
pathway_trigger(axon_guidance, ntn1, netrin_receptor_binding).
pathway_trigger(ppar_signaling, pparg, fatty_acid_or_thiazolidinedione_binding).
pathway_trigger(adipocytokine_signaling, adipoq, adiponectin_receptor_binding).
pathway_trigger(oxytocin_signaling, oxtr, oxytocin_neuropeptide_binding).
pathway_trigger(relaxin_signaling, rxfp1, relaxin_peptide_binding).
pathway_trigger(estrogen_signaling, esr1, 17_beta_estradiol_binding).
pathway_trigger(thyroid_signaling, tshr, thyroid_stimulating_hormone_binding).
pathway_trigger(glucagon_signaling, gcgr, glucagon_peptide_binding).
pathway_trigger(aldosterone_reabsorption, nr3c2, mineralocorticoid_receptor_binding).
pathway_trigger(calcium_signaling, itpr1, ip3_generation_at_er_membrane).
pathway_trigger(cag_pathway, npr1, natriuretic_peptide_activation).
pathway_trigger(mapt_signaling, gsk3b, hyperphosphorylation_trigger).

% ---------------------------------------------------------------------
% 3. EXHAUSTIVE SERIALIZED PATHWAY EDGES (Directed Graph with Cycles)
% ---------------------------------------------------------------------

% --- Fc Epsilon RI Signaling Pathway Edges ---
pathway_edge(fc_epsilon_ri_signaling, lck, fyn, phosphorylates).
pathway_edge(fc_epsilon_ri_signaling, fyn, syk, activates).
pathway_edge(fc_epsilon_ri_signaling, syk, plcg1, hydrolyzes_pip2).
pathway_edge(fc_epsilon_ri_signaling, plcg1, pip3, produces).
pathway_edge(fc_epsilon_ri_signaling, pip3, fyn, feedback_activation).

% --- Chemokine Signaling Pathway Edges ---
pathway_edge(chemokine_signaling, ccr5, g_i_protein, activates).
pathway_edge(chemokine_signaling, g_i_protein, pi3k_akt_mtor, stimulates).
pathway_edge(chemokine_signaling, pi3k_akt_mtor, rock1, activates_cytoskeleton).
pathway_edge(chemokine_signaling, rock1, ccr5, desensitizes_feedback).

% --- VEGF Signaling Pathway Edges ---
pathway_edge(vegf_signaling, kdr, plcg1, phosphorylates).
pathway_edge(vegf_signaling, plcg1, pkca, activates).
pathway_edge(vegf_signaling, pkca, mapk_erk, stimulates).
pathway_edge(vegf_signaling, mapk_erk, kdr, transcriptional_upregulation_feedback).

% --- DNA Mismatch Repair Pathway Edges ---
pathway_edge(mismatch_repair, msh2, msh6, heterodimerizes).
pathway_edge(mismatch_repair, msh6, mlh1, recruits).
pathway_edge(mismatch_repair, mlh1, pms2, complexes_with).
pathway_edge(mismatch_repair, pms2, msh2, resets_repair_cycle).

% --- Base Excision Repair Pathway Edges ---
pathway_edge(base_excision_repair, ogg1, ap_endonuclease, recruits).
pathway_edge(base_excision_repair, ap_endonuclease, pol_beta, replaces_nucleotide).
pathway_edge(base_excision_repair, pol_beta, ligase_iii, seals_nick).
pathway_edge(base_excision_repair, ligase_iii, ogg1, restores_chromatin_state).

% --- Homologous Recombination DNA Repair Pathway Edges ---
pathway_edge(homologous_recombination, brca1, brca2, binds).
pathway_edge(homologous_recombination, brca2, rad51, loads_onto_dna).
pathway_edge(homologous_recombination, rad51, atr, activates_checkpoint).
pathway_edge(homologous_recombination, atr, brca1, phosphorylates_feedback).

% --- Complement Cascade Pathway Edges ---
pathway_edge(complement_cascade, masp2, c4_c2_complex, cleaves).
pathway_edge(complement_cascade, c4_c2_complex, c3_convertase, forms).
pathway_edge(complement_cascade, c3_convertase, c3b, generates).
pathway_edge(complement_cascade, c3b, masp2, amplifies_feedback).

% --- Fc Gamma R-mediated Phagocytosis Pathway Edges ---
pathway_edge(fc_gamma_r_phagocytosis, tec, rac1, activates).
pathway_edge(fc_gamma_r_phagocytosis, rac1, actin_polymerization, drives).
pathway_edge(fc_gamma_r_phagocytosis, actin_polymerization, phagosome_closure, executes).
pathway_edge(fc_gamma_r_phagocytosis, phagosome_closure, tec, deactivates_feedback).

% --- Axon Guidance Signaling Pathway Edges ---
pathway_edge(axon_guidance, ntn1, unc5, binds).
pathway_edge(axon_guidance, unc5, rhoA, activates).
pathway_edge(axon_guidance, rhoA, growth_cone_collapse, triggers).
pathway_edge(axon_guidance, growth_cone_collapse, ntn1, local_feedback).

% --- PPAR Signaling Pathway Edges ---
pathway_edge(ppar_signaling, pparg, rxrg, heterodimerizes).
pathway_edge(ppar_signaling, rxrg, fabp4_transcription, activates).
pathway_edge(ppar_signaling, fabp4_transcription, lipogenesis, drives).
pathway_edge(ppar_signaling, lipogenesis, pparg, ligand_feedback_loop).

% --- Adipocytokine Signaling Pathway Edges ---
pathway_edge(adipocytokine_signaling, adipoq, ampk, activates).
pathway_edge(adipocytokine_signaling, ampk, ppar_signaling, stimulates).
pathway_edge(adipocytokine_signaling, ppar_signaling, fatty_acid_oxidation, increases).
pathway_edge(adipocytokine_signaling, fatty_acid_oxidation, adipoq, systemic_feedback).

% --- Oxytocin Signaling Pathway Edges ---
pathway_edge(oxytocin_signaling, oxtr, g_q_protein, activates).
pathway_edge(oxytocin_signaling, g_q_protein, plc, stimulates).
pathway_edge(oxytocin_signaling, plc, ca_channels, opens).
pathway_edge(oxytocin_signaling, ca_channels, oxtr, desensitization_feedback).

% --- Relaxin Signaling Pathway Edges ---
pathway_edge(relaxin_signaling, rxfp1, adenylyl_cyclase, stimulates).
pathway_edge(relaxin_signaling, adenylyl_cyclase, camp, produces).
pathway_edge(relaxin_signaling, camp, pka, activates).
pathway_edge(relaxin_signaling, pka, rxfp1, internalizes_feedback).

% --- Estrogen Signaling Pathway Edges ---
pathway_edge(estrogen_signaling, esr1, src, interacts).
pathway_edge(estrogen_signaling, src, mapk_erk, activates).
pathway_edge(estrogen_signaling, mapk_erk, esr1_transcription, upregulates).
pathway_edge(estrogen_signaling, esr1_transcription, src, scaffolding_feedback).

% --- Thyroid Hormone Signaling Pathway Edges ---
pathway_edge(thyroid_signaling, tshr, g_s_protein, activates).
pathway_edge(thyroid_signaling, g_s_protein, adenylyl_cyclase, stimulates).
pathway_edge(thyroid_signaling, adenylyl_cyclase, t3_t4_synthesis, drives).
pathway_edge(thyroid_signaling, t3_t4_synthesis, tshr, negative_feedback_axis).

% --- Glucagon Signaling Pathway Edges ---
pathway_edge(glucagon_signaling, gcgr, g_s_protein, activates).
pathway_edge(glucagon_signaling, g_s_protein, camp, generates).
pathway_edge(glucagon_signaling, camp, pka, activates).
pathway_edge(glucagon_signaling, pka, glycogen_phosphorylase, phosphorylates).
pathway_edge(glucagon_signaling, glycogen_phosphorylase, gcgr, metabolic_feedback).

% --- Aldosterone-Regulated Sodium Reabsorption Edges ---
pathway_edge(aldosterone_reabsorption, nr3c2, sgk1, transcribes).
pathway_edge(aldosterone_reabsorption, sgk1, enac_channel, activates_membrane).
pathway_edge(aldosterone_reabsorption, enac_channel, na_retention, drives).
pathway_edge(aldosterone_reabsorption, na_retention, nr3c2, osmotic_feedback).

% --- Calcium Signaling Pathway Edges ---
pathway_edge(calcium_signaling, itpr1, cytosolic_ca, releases).
pathway_edge(calcium_signaling, cytosolic_ca, camk2a, activates).
pathway_edge(calcium_signaling, camk2a, CREB, phosphorylates).
pathway_edge(calcium_signaling, CREB, itpr1, transcriptional_feedback).

% --- cGMP-PKG Signaling Pathway Edges ---
pathway_edge(cag_pathway, npr1, gtp_cyclase, activates).
pathway_edge(cag_pathway, gtp_cyclase, cgmp, produces).
pathway_edge(cag_pathway, cgmp, pkg, activates).
pathway_edge(cag_pathway, pkg, myosin_phosphatase, activates).
pathway_edge(cag_pathway, myosin_phosphatase, npr1, vasomotor_feedback).

% --- Tau/MAPT Neurofibrillary Signaling Pathway Edges ---
pathway_edge(mapt_signaling, gsk3b, mapt, hyperphosphorylates).
pathway_edge(mapt_signaling, mapt, neurofibrillary_tangles, aggregates).
pathway_edge(mapt_signaling, neurofibrillary_tangles, axonal_transport_block, causes).
pathway_edge(mapt_signaling, axonal_transport_block, gsk3b, stress_feedback_activation).

% =====================================================================

% --- Batch 3: Cellular Processing & Quality Control ---
pathway(upr_signaling, 'Unfolded Protein Response (UPR) Pathway').
pathway(ubiquitin_proteasome, 'Ubiquitin-Proteasome Degradation Pathway').
pathway(autophagy_pathway, 'Autophagy - Animal Pathway').
pathway(spliceosome_pathway, 'Spliceosome Assembly and Function').
pathway(ribosome_biogenesis, 'Ribosome Biogenesis in Eukaryotes').
pathway(peroxisome_pathway, 'Peroxisome Assembly and Function').
pathway(lysosome_pathway, 'Lysosome Transport and Hydrolase Pathway').
pathway(phagosome_pathway, 'Phagosome Maturation Pathway').
pathway(endocytosis_pathway, 'Clathrin-Mediated Endocytosis Pathway').
pathway(protein_export_pathway, 'Protein Export and Translocation Pathway').

% --- Batch 4: Central Carbohydrate & Nucleotide Metabolism ---
pathway(glycolysis_gluconeogenesis, 'Glycolysis and Gluconeogenesis Pathway').
pathway(tca_cycle, 'Citrate Cycle (TCA Cycle) Pathway').
pathway(pentose_phosphate, 'Pentose Phosphate Pathway').
pathway(fructose_mannose, 'Fructose and Mannose Metabolism').
pathway(galactose_metabolism, 'Galactose Metabolism Pathway').
pathway(starch_sucrose, 'Starch and Sucrose Metabolism').
pathway(amino_sugar_metabolism, 'Amino Sugar and Nucleotide Sugar Metabolism').
pathway(purine_metabolism, 'Purine Biosynthesis and Salvage Pathway').
pathway_path(pyrimidine_metabolism, 'Pyrimidine Biosynthesis and Salvage Pathway'). % Keep predicate name clean as pathway/2
pathway(pyrimidine_metabolism, 'Pyrimidine Biosynthesis and Salvage Pathway').
pathway(oxidative_phosphorylation, 'Oxidative Phosphorylation Electron Transport').

% --- Batch 5: Lipid & Steroid Metabolism ---
pathway(fatty_acid_biosynthesis, 'Fatty Acid Biosynthesis Pathway').
pathway(fatty_acid_elongation, 'Fatty Acid Elongation in Mitochondria and ER').
pathway(fatty_acid_degradation, 'Beta-Oxidation Fatty Acid Degradation').
pathway(ketone_body_metabolism, 'Synthesis and Degradation of Ketone Bodies').
pathway(steroid_biosynthesis, 'Cholesterol and Steroid Biosynthesis Pathway').
pathway(primary_bile_acid, 'Primary Bile Acid Biosynthesis Pathway').
pathway(secondary_bile_acid, 'Secondary Bile Acid Biosynthesis Pathway').
pathway(arachidonic_acid, 'Arachidonic Acid Metabolism Pathway').
pathway(linoleic_acid, 'Linoleic Acid Metabolism Pathway').
pathway(alpha_linolenic, 'Alpha-Linolenic Acid Metabolism Pathway').

% --- Batch 6: Amino Acid Metabolism ---
pathway(alanine_aspartate_glutamate, 'Alanine, Aspartate and Glutamate Metabolism').
pathway(glycine_serine_threonine, 'Glycine, Serine and Threonine Metabolism').
pathway(cysteine_methionine, 'Cysteine and Methionine Metabolism').
pathway(valine_leucine_isoleucine_deg, 'Valine, Leucine and Isoleucine Degradation').
pathway(lysine_degradation, 'Lysine Degradation Pathway').
pathway(arginine_proline, 'Arginine and Proline Metabolism').
pathway(histidine_metabolism, 'Histidine Metabolism Pathway').
pathway(tyrosine_metabolism, 'Tyrosine Metabolism Pathway').
pathway(phenylalanine_metabolism, 'Phenylalanine Metabolism Pathway').
pathway(tryptophan_metabolism, 'Tryptophan Metabolism Pathway').

% --- Batch 7: Energy, Nitrogen & Cofactor Metabolism ---
pathway(glyoxylate_dicarboxylate, 'Glyoxylate and Dicarboxylate Metabolism').
pathway(butanoate_metabolism, 'Butanoate Metabolism Pathway').
pathway(propanoate_metabolism, 'Propanoate Metabolism Pathway').
pathway(nitrogen_metabolism, 'Nitrogen Metabolism Pathway').
pathway(sulfur_metabolism, 'Sulfur Metabolism Pathway').
pathway(methane_metabolism, 'Methane Metabolism Pathway').
pathway(carbon_fixation, 'Carbon Fixation Pathways in Prokaryotes and Eukaryotes').
pathway(porphyrin_metabolism, 'Porphyrin and Chlorophyll Metabolism').
pathway(nicotinate_nicotinamide, 'Nicotinate and Nicotinamide Metabolism').
pathway(pantothenate_coa, 'Pantothenate and CoA Biosynthesis Pathway').

% --- Batch 8: Viral & Pathogen Infection Pathways ---
pathway(measles_infection, 'Measles Viral Infection Pathway').
pathway(influenza_a_infection, 'Influenza A Infection Pathway').
pathway(epstein_barr_infection, 'Epstein-Barr Virus Infection Pathway').
pathway(hepatitis_b_infection, 'Hepatitis B Infection Pathway').
pathway(hepatitis_c_infection, 'Hepatitis C Infection Pathway').
pathway(hiv_infection, 'Human Immunodeficiency Virus 1 (HIV-1) Infection').
pathway(htlv_infection, 'Human T-cell Leukemia Virus 1 Infection').
pathway(herpes_simplex_infection, 'Herpes Simplex Virus 1 Infection Pathway').
pathway(tuberculosis_infection, 'Tuberculosis Pathogenesis Pathway').
pathway(malaria_infection, 'Malaria Infection Pathway').

% --- Batch 9: Cancer & Malignancy Signaling ---
pathway(pathways_in_cancer, 'Pathways in Cancer Master Network').
pathway(proteoglycans_in_cancer, 'Proteoglycans in Cancer Pathway').
pathway(micrornas_in_cancer, 'MicroRNAs in Cancer Signaling').
pathway(colorectal_cancer_pathway, 'Colorectal Cancer Pathogenesis Pathway').
pathway(pancreatic_cancer_pathway, 'Pancreatic Cancer Signaling Pathway').
pathway(glioma_pathway, 'Glioma Signaling Pathway').
pathway(prostate_cancer_pathway, 'Prostate Cancer Signaling Pathway').
pathway(small_cell_lung_cancer, 'Small Cell Lung Cancer Pathway').
pathway(non_small_cell_lung_cancer, 'Non-Small Cell Lung Cancer Pathway').
pathway(breast_cancer_pathway, 'Breast Cancer Signaling Pathway').

% --- Batch 10: Neurodegeneration & Disease Pathways ---
pathway(alzheimer_disease, 'Alzheimer Disease Multi-Target Pathway').
pathway(parkinson_disease, 'Parkinson Disease Multi-Target Pathway').
pathway(als_pathway, 'Amyotrophic Lateral Sclerosis (ALS) Pathway').
pathway(huntington_disease, 'Huntington Disease Multi-Target Pathway').
pathway(prion_disease, 'Prion Disease Pathway').
pathway(spinocerebellar_ataxia, 'Spinocerebellar Ataxia Pathway').
pathway(chagas_disease, 'Chagas Disease (American Trypanosomiasis)').
pathway(leishmaniasis_pathway, 'Leishmaniasis Infection Pathway').
pathway(amoebiasis_pathway, 'Amoebiasis Pathogenesis Pathway').
pathway(pertussis_pathway, 'Pertussis Toxin Signaling Pathway').

% ---------------------------------------------------------------------
% 2. PATHWAY TRIGGER ENTRYPOINTS (BATCHES 3 - 10)
% ---------------------------------------------------------------------

pathway_trigger(upr_signaling, hspa5, accumulated_misfolded_proteins_in_er).
pathway_trigger(ubiquitin_proteasome, rbx1, polyubiquitinated_protein_substrate).
pathway_trigger(autophagy_pathway, ulk1, amino_acid_starvation).
pathway_trigger(spliceosome_pathway, snrnp, pre_mrna_splice_sites).
pathway_trigger(ribosome_biogenesis, rrn3, ribosomal_dna_transcription_activation).
pathway_trigger(peroxisome_pathway, pex3, peroxisomal_membrane_assembly).
pathway_trigger(lysosome_pathway, man6p_receptor, mannose_6_phosphate_tag).
pathway_trigger(phagosome_pathway, fc_gamma_r_phagocytosis, microbial_particle_engulfment).
pathway_trigger(endocytosis_pathway, clathrin, receptor_mediated_cargo_clustering).
pathway_trigger(protein_export_pathway, srp54, nascent_signal_peptide).

pathway_trigger(glycolysis_gluconeogenesis, slc2a1, extracellular_glucose_uptake).
pathway_trigger(tca_cycle, pdha1, pyruvate_entry_into_mitochondria).
pathway_trigger(pentose_phosphate, g6pd, glucose_6_phosphate_availability).
pathway_trigger(fructose_mannose, slc2a5, fructose_uptake).
pathway_trigger(galactose_metabolism, galk1, galactose_phosphorylation).
pathway_trigger(starch_sucrose, amylase, polysaccharide_cleavage).
pathway_trigger(amino_sugar_metabolism, gfat1, glutamine_fructose_amination).
pathway_trigger(purine_metabolism, prps1, ribose_5_phosphate_pyrophosphorylation).
pathway_trigger(pyrimidine_metabolism, cad_enzyme, bicarbonate_glutamine_condensation).
pathway_trigger(oxidative_phosphorylation, complex_i, nadh_availability).

pathway_trigger(fatty_acid_biosynthesis, acaca, acetyl_coa_carboxylation).
pathway_trigger(fatty_acid_elongation, elovl1, long_chain_acyl_coa_substrate).
pathway_trigger(fatty_acid_degradation, cpt1a, acyl_carnitine_shuttle_activation).
pathway_trigger(ketone_body_metabolism, hmgcs2, hepatic_acetyl_coa_abundance).
pathway_trigger(steroid_biosynthesis, hmgcr, mevalonate_pathway_flux).
pathway_trigger(primary_bile_acid, cyp7a1, cholesterol_7_alpha_hydroxylation).
pathway_trigger(secondary_bile_acid, bacterial_bile_salt_hydrolase, intestinal_bile_acid_exposure).
pathway_trigger(arachidonic_acid, pla2g4a, membrane_phospholipid_cleavage).
pathway_trigger(linoleic_acid, fads2, desaturation_trigger).
pathway_trigger(alpha_linolenic, elovl2, elongation_trigger).

pathway_trigger(alanine_aspartate_glutamate, got1, transamination_substrate).
pathway_trigger(glycine_serine_threonine, phgdh, 3_phosphoglycerate_oxidation).
pathway_trigger(cysteine_methionine, sah_hydrolase, s_adenosylhomocysteine_cleavage).
pathway_trigger(valine_leucine_isoleucine_deg, bcat2, branched_chain_transamination).
pathway_trigger(lys_degradation, sirt1, lysine_acetylation_status).
pathway_trigger(arginine_proline, arg1, urea_cycle_substrate_influx).
pathway_trigger(histidine_metabolism, hal_enzyme, histidine_ammonia_lyase_action).
pathway_trigger(tyrosine_metabolism, pah_enzyme, phenylalanine_hydroxylation).
pathway_trigger(phenylalanine_metabolism, pah_enzyme, aromatic_amino_acid_influx).
pathway_trigger(tryptophan_metabolism, tdo2, tryptophan_oxygenation).

pathway_trigger(glyoxylate_dicarboxylate, agxt, transamination_activation).
pathway_trigger(butanoate_metabolism, sco_enzyme, short_chain_fatty_acid_influx).
pathway_trigger(propanoate_metabolism, pccb, propionyl_coa_carboxylation).
pathway_trigger(nitrogen_metabolism, glul, ammonia_assimilation).
pathway_trigger(sulfur_metabolism, cbs_enzyme, homocysteine_condensation).
pathway_trigger(methana_metabolism, mcr_enzyme, methyl_coenzyme_m_reduction). % methane metabolism
pathway_trigger(carbon_fixation, rbc_l, ribulose_bisphosphate_carboxylase).
pathway_trigger(porphyrin_metabolism, alas1, succinyl_coa_glycine_condensation).
pathway_trigger(nicotinate_nicotinamide, napt_enzyme, nicotinate_phosphoribosylation).
pathway_trigger(pantothenate_coa, ppan_enzyme, phosphopantetheine_cleavage).

pathway_trigger(measles_infection, cd46, measles_hemagglutinin_binding).
pathway_trigger(influenza_a_infection, sialic_acid_receptor, influenza_hemagglutinin_binding).
pathway_trigger(epstein_barr_infection, cd21, ebv_gp350_binding).
pathway_trigger(hepatitis_b_infection, ntcp, hbv_pre_s1_peptide_binding).
pathway_trigger(hepatitis_c_infection, cd81, hcv_e2_glycoprotein_binding).
pathway_trigger(hiv_infection, cd4, hiv_gp120_binding).
pathway_trigger(htlv_infection, glut1, htlv_envelope_glycoprotein_binding).
pathway_trigger(herpes_simplex_infection, nectin1, hsv_g_d_glycoprotein_binding).
pathway_trigger(tuberculosis_infection, cr3, mycobacterial_trehalose_dimycolate).
pathway_trigger(malaria_infection, glycophorin_a, plasmodium_merozoite_invasion).

pathway_trigger(pathways_in_cancer, tp53, oncogenic_stress_signaling).
pathway_trigger(proteoglycans_in_cancer, syndecan1, extracellular_matrix_binding).
pathway_trigger(micrornas_in_cancer, dicer1, non_coding_rna_processing).
pathway_trigger(colorectal_cancer_pathway, apc_mutation, wnt_pathway_deregulation).
pathway_trigger(pancreatic_cancer_pathway, kras_g12d, gtpase_constitutive_activation).
pathway_trigger(glioma_pathway, egfr_v_iii, mutant_receptor_signaling).
pathway_trigger(prostate_cancer_pathway, ar_receptor, dihydrotestosterone_binding).
pathway_trigger(small_cell_lung_cancer, rb1_loss, cell_cycle_deregulation).
pathway_trigger(non_small_cell_lung_cancer, egfr_mutation, tyrosine_kinase_hyperactivation).
pathway_trigger(breast_cancer_pathway, brca1_mutation, genomic_instability).

pathway_trigger(alzheimer_disease, app_cleavage, amyloid_beta_peptide_accumulation).
pathway_trigger(parkinson_disease, snca_aggregation, alpha_synuclein_fibrillization).
pathway_trigger(als_pathway, sod1_mutation, protein_misfolding_in_motor_neurons).
pathway_trigger(huntington_disease, htt_polyq, expanded_polyglutamine_repeat).
pathway_trigger(prion_disease, prpc_to_prpsc, conformational_conversion).
pathway_trigger(spinocerebellar_ataxia, ataxin1, nuclear_inclusion_formation).
pathway_trigger(chagas_disease, cruzipain, trypanosome_protease_invasion).
pathway_trigger(leishmaniasis_pathway, lpg_molecule, leishmania_lipophosphoglycan).
pathway_trigger(amoebiasis_pathway, gal_lectin, entamoeba_adherence).
pathway_trigger(pertussis_pathway, pertussis_toxin, g_i_protein_ribosylation).

% --- UPR Signaling Pathway Edges ---
pathway_edge(upr_signaling, hspa5, perk, dissociates_and_activates).
pathway_edge(upr_signaling, perk, eif2s1, phosphorylates).
pathway_edge(upr_signaling, eif2s1, atf4, translates).
pathway_edge(upr_signaling, atf4, hspa5, transcriptional_feedback_refolding).

% --- Ubiquitin-Proteasome Pathway Edges ---
pathway_edge(ubiquitin_proteasome, rbx1, e2_enzyme, recruits).
pathway_edge(ubiquitin_proteasome, e2_enzyme, target_protein, polyubiquitinates).
pathway_edge(ubiquitin_proteasome, target_protein, proteasome_26s, degrades).
pathway_edge(ubiquitin_proteasome, proteasome_26s, rbx1, recycles_components).

% --- Autophagy Pathway Edges ---
pathway_edge(autophagy_pathway, ulk1, atg13, phosphorylates).
pathway_edge(autophagy_pathway, atg13, beclin1, complexes_with).
pathway_edge(autophagy_pathway, beclin1, lc3_ii, recruits).
pathway_edge(autophagy_pathway, lc3_ii, ulk1, feedback_regulation).

% --- Spliceosome Pathway Edges ---
pathway_edge(spliceosome_pathway, snrnp, pre_mrna, binds).
pathway_edge(spliceosome_pathway, pre_mrna, lariat_splice, catalyzes).
pathway_edge(spliceosome_pathway, lariat_splice, mature_mrna, produces).
pathway_edge(spliceosome_pathway, mature_mrna, snrnp, recycling_feedback).

% --- Ribosome Biogenesis Edges ---
pathway_edge(ribosome_biogenesis, rrn3, rna_pol_i, recruits).
pathway_edge(ribosome_biogenesis, rna_pol_i, rrna_transcript, produces).
pathway_edge(ribosome_biogenesis, rrna_transcript, ribosomal_proteins, assembles).
pathway_edge(ribosome_biogenesis, ribosomal_proteins, rrn3, feedback_repression).

% --- Peroxisome Pathway Edges ---
pathway_edge(peroxisome_pathway, pex3, pex19, interacts).
pathway_edge(peroxisome_pathway, pex19, membrane_proteins, targets).
pathway_edge(peroxisome_pathway, membrane_proteins, peroxisome_vesicle, forms).
pathway_edge(peroxisome_pathway, peroxisome_vesicle, pex3, recycling_loop).

% --- Lysosome Pathway Edges ---
pathway_edge(lysosome_pathway, man6p_receptor, hydrolase_enzyme, binds).
pathway_edge(lysosome_pathway, hydrolase_enzyme, acidic_vesicle, transports).
pathway_edge(lysosome_pathway, acidic_vesicle, cargo_degradation, executes).
pathway_edge(lysosome_pathway, cargo_degradation, man6p_receptor, recycling_feedback).

% --- Phagosome Pathway Edges ---
pathway_edge(phagosome_pathway, fc_gamma_r_phagocytosis, actin_cup, forms).
pathway_edge(phagosome_pathway, actin_cup, phagosome_sealing, closes).
pathway_edge(phagosome_pathway, phagosome_sealing, lysosome_fusion, matures).
pathway_edge(phagosome_pathway, lysosome_fusion, phagosome_pathway, degradation_feedback).

% --- Endocytosis Pathway Edges ---
pathway_edge(endocytosis_pathway, clathrin, adaptor_protein_2, recruits).
pathway_edge(endocytosis_pathway, adaptor_protein_2, receptor_cargo_complex, invaginates).
pathway_edge(endocytosis_pathway, receptor_cargo_complex, dynamin, pinches_vesicle).
pathway_edge(endocytosis_pathway, dynamin, clathrin, uncoating_feedback).

% --- Protein Export Pathway Edges ---
pathway_edge(protein_export_pathway, srp54, ribosome_nascent_chain, binds).
pathway_edge(protein_export_pathway, ribosome_nascent_chain, sec61_translocon, targets).
pathway_edge(protein_export_pathway, sec61_translocon, endoplasmic_reticulum_lumen, translocates).
pathway_edge(protein_export_pathway, endoplasmic_reticulum_lumen, srp54, recycling_loop).

% --- Glycolysis and Gluconeogenesis Edges ---
pathway_edge(glycolysis_gluconeogenesis, slc2a1, hk1, supplies_glucose).
pathway_edge(glycolysis_gluconeogenesis, hk1, g6p, phosphorylates).
pathway_edge(glycolysis_gluconeogenesis, g6p, pfkfb3, regulates).
pathway_edge(glycolysis_gluconeogenesis, pfkfb3, pyruvate, produces).
pathway_edge(glycolysis_gluconeogenesis, pyruvate, slc2a1, transcriptional_feedback).

% --- Citrate Cycle (TCA) Edges ---
pathway_edge(tca_cycle, pdha1, acetyl_coa, produces).
pathway_edge(tca_cycle, acetyl_coa, citrate_synthase, condenses).
pathway_edge(tca_cycle, citrate_synthase, alpha_ketoglutarate, yields).
pathway_edge(tca_cycle, alpha_ketoglutarate, pdha1, regulatory_feedback).

% --- Pentose Phosphate Pathway Edges ---
pathway_edge(pentose_phosphate, g6pd, 6p_glucono_delta_lactone, oxidizes).
pathway_edge(pentose_phosphate, 6p_glucono_delta_lactone, nadph, generates).
pathway_edge(pentose_phosphate, nadph, ribose_5_phosphate, produces).
pathway_edge(pentose_phosphate, ribose_5_phosphate, g6pd, feedback_regulation).

% --- Fructose and Mannose Metabolism Edges ---
pathway_edge(fructose_mannose, slc2a5, khk, transports_fructose).
pathway_edge(fructose_mannose, khk, fructose_1_phosphate, phosphorylates).
pathway_edge(fructose_mannose, fructose_1_phosphate, aldo_b, cleaves).
pathway_edge(fructose_mannose, aldo_b, slc2a5, metabolic_feedback).

% --- Galactose Metabolism Edges ---
pathway_edge(galactose_metabolism, galk1, galactose_1_phosphate, phosphorylates).
pathway_edge(galactose_metabolism, galactose_1_phosphate, galt, converts).
pathway_edge(galactose_metabolism, galt, udp_galactose, produces).
pathway_edge(galactose_metabolism, udp_galactose, galk1, feedback_loop).

% --- Starch and Sucrose Metabolism Edges ---
pathway_edge(starch_sucrose, amylase, maltose, hydrolyzes).
pathway_edge(starch_sucrose, maltose, maltase, cleaves_to_glucose).
pathway_edge(starch_sucrose, maltase, hexokinase, feeds_glycolysis).
pathway_edge(starch_sucrose, hexokinase, amylase, transcriptional_feedback).

% --- Amino Sugar Metabolism Edges ---
pathway_edge(amino_sugar_metabolism, gfat1, glucosamine_6_phosphate, synthesizes).
pathway_edge(amino_sugar_metabolism, glucosamine_6_phosphate, udp_glcnac, produces).
pathway_edge(amino_sugar_metabolism, udp_glcnac, ogt_enzyme, glycosylates).
pathway_edge(amino_sugar_metabolism, ogt_enzyme, gfat1, phosphorylation_feedback).

% --- Purine Metabolism Edges ---
pathway_edge(purine_metabolism, prps1, prpp, synthesizes).
pathway_edge(purine_metabolism, prpp, imp_synthase, builds_imp).
pathway_edge(purine_metabolism, imp_synthase, amp_gmp, branches_to).
pathway_edge(purine_metabolism, amp_gmp, prps1, feedback_inhibition).

% --- Pyrimidine Metabolism Edges ---
pathway_edge(pyrimidine_metabolism, cad_enzyme, carbamoyl_aspartate, produces).
pathway_edge(pyrimidine_metabolism, carbamoyl_aspartate, ump_synthase, builds_ump).
pathway_edge(pyrimidine_metabolism, ump_synthase, utp_ctp, yields).
pathway_edge(pyrimidine_metabolism, utp_ctp, cad_enzyme, feedback_loop).

% --- Oxidative Phosphorylation Edges ---
pathway_edge(oxidative_phosphorylation, complex_i, coenzyme_q, transfers_electrons).
pathway_edge(oxidative_phosphorylation, coenzyme_q, complex_iii, passes_electrons).
pathway_edge(oxidative_phosphorylation, complex_iii, cytochrome_c, shuttles).
pathway_edge(oxidative_phosphorylation, cytochrome_c, complex_iv, drives_atp_synthase).
pathway_edge(oxidative_phosphorylation, complex_iv, complex_i, proton_gradient_feedback).

% --- Fatty Acid Biosynthesis Edges ---
pathway_edge(fatty_acid_biosynthesis, acaca, malonyl_coa, carboxylates).
pathway_edge(fatty_acid_biosynthesis, malonyl_coa, fasn, elongates).
pathway_edge(fatty_acid_biosynthesis, fasn, palmitate, produces).
pathway_edge(fatty_acid_biosynthesis, palmitate, acaca, feedback_inhibition).

% --- Fatty Acid Elongation Edges ---
pathway_edge(fatty_acid_elongation, elovl1, long_chain_acyl_coa, elongates).
pathway_edge(fatty_acid_elongation, long_chain_acyl_coa, hsd17b12, reduces).
pathway_edge(fatty_acid_elongation, hsd17b12, very_long_chain_fatty_acid, yields).
pathway_edge(fatty_acid_elongation, very_long_chain_fatty_acid, elovl1, feedback_loop).

% --- Fatty Acid Degradation Edges ---
pathway_edge(fatty_acid_degradation, cpt1a, acyl_carnitine, imports).
pathway_edge(fatty_acid_degradation, acyl_carnitine, acadl, dehydrogenates).
pathway_edge(fatty_acid_degradation, acadl, acetyl_coa_beta_ox, produces).
pathway_edge(fatty_acid_degradation, acetyl_coa_beta_ox, cpt1a, malate_feedback).

% --- Ketone Body Metabolism Edges ---
pathway_edge(ketone_body_metabolism, hmgcs2, hmg_coa_ketone, condenses).
pathway_edge(ketone_body_metabolism, hmg_coa_ketone, acetoacetate, generates).
pathway_edge(ketone_body_metabolism, acetoacetate, beta_hydroxybutyrate, reduces).
pathway_edge(ketone_body_metabolism, beta_hydroxybutyrate, hmgcs2, systemic_feedback).

% --- Steroid Biosynthesis Edges ---
pathway_edge(steroid_biosynthesis, hmgcr, mevalonate, reduces).
pathway_edge(steroid_biosynthesis, mevalonate, fpps, builds_farnesyl).
pathway_edge(steroid_biosynthesis, fpps, squalene_sqs, dimerizes).
pathway_edge(steroid_biosynthesis, squalene_sqs, cholesterol, produces).
pathway_edge(steroid_biosynthesis, cholesterol, hmgcr, sterol_feedback_degradation).

% --- Primary Bile Acid Biosynthesis Edges ---
pathway_edge(primary_bile_acid, cyp7a1, 7_alpha_hydroxycholesterol, hydroxylates).
pathway_edge(primary_bile_acid, 7_alpha_hydroxycholesterol, cyp8b1, processes).
pathway_edge(primary_bile_acid, cyp8b1, cholic_acid, synthesizes).
pathway_edge(primary_bile_acid, cholic_acid, cyp7a1, negative_transcriptional_feedback).

% --- Secondary Bile Acid Biosynthesis Edges ---
pathway_edge(secondary_bile_acid, bacterial_bile_salt_hydrolase, deconjugated_bile_acid, deconjugates).
pathway_edge(secondary_bile_acid, deconjugated_bile_acid, 7_alpha_dehydroxylase, converts).
pathway_edge(secondary_bile_acid, 7_alpha_dehydroxylase, lithocholic_deoxycholic, produces).
pathway_edge(secondary_bile_acid, lithocholic_deoxycholic, bacterial_bile_salt_hydrolase, microbial_feedback).

% --- Arachidonic Acid Metabolism Edges ---
pathway_edge(arachidonic_acid, pla2g4a, arachidonate_free, releases).
pathway_edge(arachidonic_acid, arachidonate_free, ptgs2, oxygenates).
pathway_edge(arachidonic_acid, ptgs2, prostaglandin_e2, produces).
pathway_edge(arachidonic_acid, prostaglandin_e2, pla2g4a, autocrine_feedback).

% --- Linoleic Acid Metabolism Edges ---
pathway_edge(linoleic_acid, fads2, gamma_linolenic_acid, desaturates).
pathway_edge(linoleic_acid, gamma_linolenic_acid, elovl5, elongates).
pathway_edge(linoleic_acid, elovl5, dihomo_gla, produces).
pathway_edge(linoleic_acid, dihomo_gla, fads2, feedback_loop).

% --- Alpha-Linolenic Acid Metabolism Edges ---
pathway_edge(alpha_linolenic, elovl2, stearidonic_acid, elongates).
pathway_edge(alpha_linolenic, stearidonic_acid, fads3, desaturates).
pathway_edge(alpha_linolenic, fads3, epa_dha_precursors, produces).
pathway_edge(alpha_linolenic, epa_dha_precursors, elovl2, feedback_regulation).

% --- Alanine, Aspartate and Glutamate Metabolism Edges ---
pathway_edge(alanine_aspartate_glutamate, got1, oxaloacetate_glutamate, transaminates).
pathway_edge(alanine_aspartate_glutamate, oxaloacetate_glutamate, glul, amidates).
pathway_edge(alanine_aspartate_glutamate, glul, glutamine, produces).
pathway_edge(alanine_aspartate_glutamate, glutamine, got1, feedback_loop).

% --- Glycine, Serine and Threonine Metabolism Edges ---
pathway_edge(glycine_serine_threonine, phgdh, 3p_hydroxypyruvate, oxidizes).
pathway_edge(glycine_serine_threonine, 3p_hydroxypyruvate, psat1, transaminates).
pathway_edge(glycine_serine_threonine, psat1, serine, produces).
pathway_edge(glycine_serine_threonine, serine, phgdh, feedback_inhibition).

% --- Cysteine and Methionine Metabolism Edges ---
pathway_edge(cysteine_methionine, sah_hydrolase, homocysteine, hydrolyzes).
pathway_edge(cysteine_methionine, homocysteine, cbs_enzyme, condenses).
pathway_edge(cysteine_methionine, cbs_enzyme, cystathionine, produces).
pathway_edge(cysteine_methionine, cystathionine, sah_hydrolase, feedback_loop).

% --- Valine, Leucine and Isoleucine Degradation Edges ---
pathway_edge(valine_leucine_isoleucine_deg, bcat2, alpha_keto_acids, transaminates).
pathway_edge(valine_leucine_isoleucine_deg, alpha_keto_acids, bckdhb, decarboxylates).
pathway_edge(valine_leucine_isoleucine_deg, bckdhb, succinyl_acetyl_coa, yields).
pathway_edge(valine_leucine_isoleucine_deg, succinyl_acetyl_coa, bcat2, feedback_loop).

% --- Lysine Degradation Edges ---
pathway_edge(lysine_degradation, sirt1, saccharopine_pathway, regulates).
pathway_edge(lysine_degradation, saccharopine_pathway, aminoadipate, converts).
pathway_edge(lysine_degradation, aminoadipate, acetyl_coa_lys, produces).
pathway_edge(lysine_degradation, acetyl_coa_lys, sirt1, feedback_regulation).

% --- Arginine and Proline Metabolism Edges ---
pathway_edge(arginine_proline, arg1, ornithine_urea, cleaves).
pathway_edge(arginine_proline, ornithine_urea, pyrroline_carboxylate, converts).
pathway_edge(arginine_proline, pyrroline_carboxylate, proline, reduces).
pathway_edge(arginine_proline, proline, arg1, feedback_loop).

% --- Histidine Metabolism Edges ---
pathway_edge(histidine_metabolism, hal_enzyme, urocanate, deaminates).
pathway_edge(histidine_metabolism, urocanate, futh_enzyme, processes).
pathway_edge(histidine_metabolism, futh_enzyme, glutamate_his, yields).
pathway_edge(histidine_metabolism, glutamate_his, hal_enzyme, feedback_loop).

% --- Tyrosine Metabolism Edges ---
pathway_edge(tyrosine_metabolism, pah_enzyme, p_hydroxyphenylpyruvate, hydroxylates).
pathway_edge(tyrosine_metabolism, p_hydroxyphenylpyruvate, homogentisate, converts).
pathway_edge(tyrosine_metabolism, homogentisate, fumarate_acetoacetate, cleaves).
pathway_edge(tyrosine_metabolism, fumarate_acetoacetate, pah_enzyme, feedback_loop).

% --- Phenylalanine Metabolism Edges ---
pathway_edge(phenylalanine_metabolism, pah_enzyme, tyrosine_phe, converts).
pathway_edge(phenylalanine_metabolism, tyrosine_phe, dopa_pathway, funnels).
pathway_edge(phenylalanine_metabolism, dopa_pathway, catecholamines, yields).
pathway_edge(phenylalanine_metabolism, catecholamines, pah_enzyme, systemic_feedback).

% --- Tryptophan Metabolism Edges ---
pathway_edge(tryptophan_metabolism, tdo2, n_formylkynurenine, oxygenates).
pathway_edge(tryptophan_metabolism, n_formylkynurenine, kynurenine, converts).
pathway_edge(tryptophan_metabolism, kynurenine, nad_de_novo, synthesizes).
pathway_edge(tryptophan_metabolism, nad_de_novo, tdo2, metabolic_feedback).

% --- Glyoxylate and Dicarboxylate Edges ---
pathway_edge(glyoxylate_dicarboxylate, agxt, glycine_glyoxylate, transaminates).
pathway_edge(glyoxylate_dicarboxylate, glycine_glyoxylate, oxalate_pathway, converts).
pathway_edge(glyoxylate_dicarboxylate, oxalate_pathway, malate_synthase, bridges).
pathway_edge(glyoxylate_dicarboxylate, malate_synthase, agxt, feedback_loop).

% --- Butanoate Metabolism Edges ---
pathway_edge(butanoate_metabolism, sco_enzyme, butyryl_coa, activates).
pathway_edge(butanoate_metabolism, butyryl_coa, acetoacetyl_coa, oxidizes).
pathway_edge(butanoate_metabolism, acetoacetyl_coa, acetyl_coa_but, splits).
pathway_edge(butanoate_metabolism, acetyl_coa_but, sco_enzyme, feedback_loop).

% --- Propanoate Metabolism Edges ---
pathway_edge(propanoate_metabolism, pccb, methylmalonyl_coa, carboxylates).
pathway_edge(propanoate_metabolism, methylmalonyl_coa, mutase_enzyme, rearranges).
pathway_edge(propanoate_metabolism, mutase_enzyme, succinyl_coa_prop, produces).
pathway_edge(propanoate_metabolism, succinyl_coa_prop, pccb, feedback_loop).

% --- Nitrogen Metabolism Edges ---
pathway_edge(nitrogen_metabolism, glul, glutamine_n, synthesizes).
pathway_edge(nitrogen_metabolism, glutamine_n, carbamoyl_phosphate_synthetase, feeds).
pathway_edge(nitrogen_metabolism, carbamoyl_phosphate_synthetase, urea, excretes).
pathway_edge(nitrogen_metabolism, urea, glul, feedback_loop).

% --- Sulfur Metabolism Edges ---
pathway_edge(sulfur_metabolism, cbs_enzyme, cystathionine_sulfur, condenses).
pathway_edge(sulfur_metabolism, cystathionine_sulfur, cysteine_s, produces).
pathway_edge(sulfur_metabolism, cysteine_s, glutathione_s, builds).
pathway_edge(sulfur_metabolism, glutathione_s, cbs_enzyme, feedback_loop).

% --- Methane Metabolism Edges ---
pathway_edge(methana_metabolism, mcr_enzyme, methyl_com, reduces).
pathway_edge(methana_metabolism, methyl_com, formaldehyde_meth, oxidizes).
pathway_edge(methana_metabolism, formaldehyde_meth, formate_meth, converts).
pathway_edge(methana_metabolism, formate_meth, mcr_enzyme, feedback_loop).

% --- Carbon Fixation Edges ---
pathway_edge(carbon_fixation, rbc_l, 3_phosphoglycerate_cf, carboxylates).
pathway_edge(carbon_fixation, 3_phosphoglycerate_cf, glyceraldehyde_3p, reduces).
pathway_edge(carbon_fixation, glyceraldehyde_3p, ribulose_bisphosphate, regenerates).
pathway_edge(carbon_fixation, ribulose_bisphosphate, rbc_l, feedback_loop).

% --- Porphyrin Metabolism Edges ---
pathway_edge(porphyrin_metabolism, alas1, delta_aminolevulinate, synthesizes).
pathway_edge(porphyrin_metabolism, delta_aminolevulinate, porphobilinogen, condenses).
pathway_edge(porphyrin_metabolism, porphobilinogen, heme_group, builds).
pathway_edge(porphyrin_metabolism, heme_group, alas1, negative_feedback_repression).

% --- Nicotinate and Nicotinamide Edges ---
pathway_edge(nicotinate_nicotinamide, napt_enzyme, nicotinate_mononucleotide, produces).
pathway_edge(nicotinate_nicotinamide, nicotinate_mononucleotide, nad_synthase, builds_nad).
pathway_edge(nicotinate_nicotinamide, nad_synthase, nad_cofactor, yields).
pathway_edge(nicotinate_nicotinamide, nad_cofactor, napt_enzyme, feedback_loop).

% --- Pantothenate and CoA Edges ---
pathway_edge(pantothenate_coa, ppan_enzyme, 4_phosphopantetheine, synthesizes).
pathway_edge(pantothenate_coa, 4_phosphopantetheine, coa_synthase, builds_coa).
pathway_edge(pantothenate_coa, coa_synthase, coenzyme_a, yields).
pathway_edge(pantothenate_coa, coenzyme_a, ppan_enzyme, feedback_loop).

% --- Measles Infection Edges ---
pathway_edge(measles_infection, cd46, viral_fusion, initiates).
pathway_edge(measles_infection, viral_fusion, host_membrane_disruption, executes).
pathway_edge(measles_infection, host_membrane_disruption, immune_suppression, triggers).
pathway_edge(measles_infection, immune_suppression, cd46, viral_feedback).

% --- Influenza A Infection Edges ---
pathway_edge(influenza_a_infection, sialic_acid_receptor, endosomal_uptake, mediates).
pathway_edge(influenza_a_infection, endosomal_uptake, m2_proton_channel, acidifies).
pathway_edge(influenza_a_infection, m2_proton_channel, v_rnp_release, drives).
pathway_edge(influenza_a_infection, v_rnp_release, sialic_acid_receptor, replication_feedback).

% --- Epstein-Barr Infection Edges ---
pathway_edge(epstein_barr_infection, cd21, b_cell_entry, facilitates).
pathway_edge(epstein_barr_infection, b_cell_entry, lmp1_oncogene, activates).
pathway_edge(epstein_barr_infection, lmp1_oncogene, nf_kb_signaling, stimulates).
pathway_edge(epstein_barr_infection, nf_kb_signaling, cd21, immortalization_feedback).

% --- Hepatitis B Infection Edges ---
pathway_edge(hepatitis_b_infection, ntcp, sodium_taurocholate_receptor, binds).
pathway_edge(hepatitis_b_infection, sodium_taurocholate_receptor, cccdna_formation, triggers).
pathway_edge(hepatitis_b_infection, cccdna_formation, viral_replication, drives).
pathway_edge(hepatitis_b_infection, viral_replication, ntcp, chronic_feedback).

% --- Hepatitis C Infection Edges ---
pathway_edge(hepatitis_c_infection, cd81, claudin_1, corecruits).
pathway_edge(hepatitis_c_infection, claudin_1, hcv_rna_translation, initiates).
pathway_edge(hepatitis_c_infection, hcv_rna_translation, lipid_droplet_hijacking, subverts).
pathway_edge(hepatitis_c_infection, lipid_droplet_hijacking, cd81, viral_feedback).

% --- HIV-1 Infection Edges ---
pathway_edge(hiv_infection, cd4, ccr5, coreceptor_binds).
pathway_edge(hiv_infection, ccr5, viral_envelope_fusion, triggers).
pathway_edge(hiv_infection, viral_envelope_fusion, reverse_transcriptase, activates).
pathway_edge(hiv_infection, reverse_transcriptase, cd4, immunological_feedback).

% --- HTLV-1 Infection Edges ---
pathway_edge(htlv_infection, glut1, tax_oncoprotein, induces).
pathway_edge(htlv_infection, tax_oncoprotein, nf_kb_signaling, hyperactivates).
pathway_edge(htlv_infection, nf_kb_signaling, lymphocyte_proliferation, drives).
pathway_edge(htlv_infection, lymphocyte_proliferation, glut1, feedback_loop).

% --- Herpes Simplex Virus 1 Edges ---
pathway_edge(herpes_simplex_infection, nectin1, viral_envelope_glycoproteins, binds).
pathway_edge(herpes_simplex_infection, viral_envelope_glycoproteins, capsid_transport, initiates).
pathway_edge(herpes_simplex_infection, capsid_transport, nuclear_egress, executes).
pathway_edge(herpes_simplex_infection, nuclear_egress, nectin1, feedback_loop).

% --- Tuberculosis Pathogenesis Edges ---
pathway_edge(tuberculosis_infection, cr3, phagolysosomal_arrest, induces).
pathway_edge(tuberculosis_infection, phagolysosomal_arrest, granuloma_formation, builds).
pathway_edge(tuberculosis_infection, granuloma_formation, caseous_necrosis, triggers).
pathway_edge(tuberculosis_infection, caseous_necrosis, cr3, chronic_feedback).

% --- Malaria Infection Edges ---
pathway_edge(malaria_infection, glycophorin_a, merozoite_invasion, mediates).
pathway_edge(malaria_infection, merozoite_invasion, erythrocyte_rupture, executes).
pathway_edge(malaria_infection, erythrocyte_rupture, hemoglobin_digestion, triggers).
pathway_edge(malaria_infection, hemoglobin_digestion, glycophorin_a, cycle_feedback).

% --- Pathways in Cancer Edges ---
pathway_edge(pathways_in_cancer, tp53, mdm2, regulates_feedback).
pathway_edge(pathways_in_cancer, kras, braf_mapk, activates).
pathway_edge(pathways_in_cancer, braf_mapk, cell_cycle_progression, drives).
pathway_edge(pathways_in_cancer, cell_cycle_progression, tp53, apoptotic_feedback).

% --- Proteoglycans in Cancer Edges ---
pathway_edge(proteoglycans_in_cancer, syndecan1, fgfr_signaling, potentiates).
pathway_edge(proteoglycans_in_cancer, fgfr_signaling, focal_adhesion_kinases, activates).
pathway_edge(proteoglycans_in_cancer, focal_adhesion_kinases, tumor_angiogenesis, promotes).
pathway_edge(proteoglycans_in_cancer, tumor_angiogenesis, syndecan1, stromal_feedback).

% --- MicroRNAs in Cancer Edges ---
pathway_edge(micrornas_in_cancer, dicer1, mirna_duplex, processes).
pathway_edge(micrornas_in_cancer, mirna_duplex, oncogene_mrna_silencing, executes).
pathway_edge(micrornas_in_cancer, oncogene_mrna_silencing, tumor_suppression, induces).
pathway_edge(micrornas_in_cancer, tumor_suppression, dicer1, transcriptional_feedback).

% --- Colorectal Cancer Pathway Edges ---
pathway_edge(colorectal_cancer_pathway, apc_mutation, beta_catenin_accumulation, causes).
pathway_edge(colorectal_cancer_pathway, beta_catenin_accumulation, myc_transcription, activates).
pathway_edge(colorectal_cancer_pathway, myc_transcription, crypt_hyperproliferation, drives).
pathway_edge(colorectal_cancer_pathway, crypt_hyperproliferation, apc_mutation, genetic_feedback).

% --- Pancreatic Cancer Pathway Edges ---
pathway_edge(pancreatic_cancer_pathway, kras_g12d, pi3k_akt_mtor, stimulates).
pathway_edge(pancreatic_cancer_pathway, pi3k_akt_mtor, nf_kb_signaling, activates).
pathway_edge(pancreatic_cancer_pathway, nf_kb_signaling, desmoplasia_stroma, secretes).
pathway_edge(pancreatic_cancer_pathway, desmoplasia_stroma, kras_g12d, microenvironmental_feedback).

% --- Glioma Signaling Edges ---
pathway_edge(glioma_pathway, egfr_v_iii, pi3k_akt_mtor, hyperactivates).
pathway_edge(glioma_pathway, pi3k_akt_mtor, mtorc1_signaling, sustains).
pathway_edge(glioma_pathway, mtorc1_signaling, glioblastoma_growth, drives).
pathway_edge(glioma_pathway, glioblastoma_growth, egfr_v_iii, hypoxic_feedback).

% --- Prostate Cancer Pathway Edges ---
pathway_edge(prostate_cancer_pathway, ar_receptor, prostate_specific_antigen, transcribes).
pathway_edge(prostate_cancer_pathway, prostate_specific_antigen, mapk_erk, activates).
pathway_edge(prostate_cancer_pathway, mapk_erk, cell_survival_androgen, promotes).
pathway_edge(prostate_cancer_pathway, cell_survival_androgen, ar_receptor, hormonal_feedback).

% --- Small Cell Lung Cancer Edges ---
pathway_edge(small_cell_lung_cancer, rb1_loss, e2f_transcription, unchains).
pathway_edge(small_cell_lung_cancer, e2f_transcription, rapid_cell_division, triggers).
pathway_edge(small_cell_lung_cancer, rapid_cell_division, genomic_instability_sclc, causes).
pathway_edge(small_cell_lung_cancer, genomic_instability_sclc, rb1_loss, feedback_loop).

% --- Non-Small Cell Lung Cancer Edges ---
pathway_edge(non_small_cell_lung_cancer, egfr_mutation, mapk_erk, constitutively_activates).
pathway_edge(non_small_cell_lung_cancer, mapk_erk, anti_apoptotic_bcl2, upregulation).
pathway_edge(non_small_cell_lung_cancer, anti_apoptotic_bcl2, tumor_immortality, maintains).
pathway_edge(non_small_cell_lung_cancer, tumor_immortality, egfr_mutation, feedback_loop).

% --- Breast Cancer Pathway Edges ---
pathway_edge(breast_cancer_pathway, brca1_mutation, homologous_recombination, impairs).
pathway_edge(breast_cancer_pathway, homologous_recombination, parp_dependency, creates_vulnerability).
pathway_edge(breast_cancer_pathway, parp_dependency, genomic_catastrophe, triggers).
pathway_edge(breast_cancer_pathway, genomic_catastrophe, brca1_mutation, feedback_loop).

% --- Alzheimer Disease Pathway Edges ---
pathway_edge(alzheimer_disease, app_cleavage, amyloid_beta_plaque, aggregates).
pathway_edge(alzheimer_disease, amyloid_beta_plaque, tau_hyperphosphorylation, induces).
pathway_edge(alzheimer_disease, tau_hyperphosphorylation, synaptic_dysfunction, causes).
pathway_edge(alzheimer_disease, synaptic_dysfunction, app_cleavage, neuroinflammatory_feedback).

% --- Parkinson Disease Pathway Edges ---
pathway_edge(parkinson_disease, snca_aggregation, lewy_body_formation, drives).
pathway_edge(parkinson_disease, lewy_body_formation, mitochondrial_complex_i_dysfunction, impairs).
pathway_edge(parkinson_disease, mitochondrial_complex_i_dysfunction, dopaminergic_cell_death, triggers).
pathway_edge(parkinson_disease, dopaminergic_cell_death, snca_aggregation, oxidative_feedback).

% --- ALS Pathway Edges ---
pathway_edge(als_pathway, sod1_mutation, protein_misfolding_motor, aggregates).
pathway_edge(als_pathway, protein_misfolding_motor, excitotoxicity_glutamate, causes).
pathway_edge(als_pathway, excitotoxicity_glutamate, motor_neuron_apoptosis, executes).
pathway_edge(als_pathway, motor_neuron_apoptosis, sod1_mutation, glial_feedback).

% --- Huntington Disease Pathway Edges ---
pathway_edge(huntington_disease, htt_polyq, transcriptional_dysregulation, causes).
pathway_edge(huntington_disease, transcriptional_dysregulation, bdnf_deprivation, leads_to).
pathway_edge(huntington_disease, bdnf_deprivation, striatal_neuron_degeneration, executes).
pathway_edge(huntington_disease, striatal_neuron_degeneration, htt_polyq, axonal_feedback).

% --- Prion Disease Pathway Edges ---
pathway_edge(prion_disease, prpc_to_prpsc, conformational_conversion_prion, cascades).
pathway_edge(prion_disease, conformational_conversion_prion, spongiform_change, triggers).
pathway_edge(prion_disease, spongiform_change, neuronal_vacuolation, executes).
pathway_edge(prion_disease, neuronal_vacuolation, prpc_to_prpsc, propagation_feedback).

% --- Spinocerebellar Ataxia Edges ---
pathway_edge(spinocerebellar_ataxia, ataxin1, nuclear_inclusion_sca, forms).
pathway_edge(spinocerebellar_ataxia, nuclear_inclusion_sca, purkinje_cell_degeneration, causes).
pathway_edge(spinocerebellar_ataxia, purkinje_cell_degeneration, ataxia_phenotype, manifests).
pathway_edge(spinocerebellar_ataxia, ataxia_phenotype, ataxin1, cerebellar_feedback).

% --- Chagas Disease Pathway Edges ---
pathway_edge(chagas_disease, cruzipain, extracellular_matrix_degradation, drives).
pathway_edge(chagas_disease, extracellular_matrix_degradation, trypomastigote_invasion, facilitates).
pathway_edge(chagas_disease, trypomastigote_invasion, intracellular_replication, executes).
pathway_edge(chagas_disease, intracellular_replication, cruzipain, parasite_feedback).

% --- Leishmaniasis Pathway Edges ---
pathway_edge(leishmaniasis_pathway, lpg_molecule, macrophage_receptor_binding, mediates).
pathway_edge(leishmaniasis_pathway, macrophage_receptor_binding, oxidative_burst_inhibition, prevents).
pathway_edge(leishmaniasis_pathway, oxidative_burst_inhibition, amastigote_survival, ensures).
pathway_edge(leishmaniasis_pathway, amastigote_survival, lpg_molecule, immunological_feedback).

% --- Amoebiasis Pathway Edges ---
pathway_edge(amoebiasis_pathway, gal_lectin, host_cell_adherence, mediates).
pathway_edge(amoebiasis_pathway, host_cell_adherence, amoebic_cytolysis, triggers).
pathway_edge(amoebiasis_pathway, amoebic_cytolysis, intestinal_ulceration, causes).
pathway_edge(amoebiasis_pathway, intestinal_ulceration, gal_lectin, tissue_feedback).

% --- Pertussis Toxin Signaling Edges ---
pathway_edge(pertussis_pathway, pertussis_toxin, g_i_protein_ribosylation, catalyzes).
pathway_edge(pertussis_pathway, g_i_protein_ribosylation, adenylyl_cyclase_deregulation, uncouples).
pathway_edge(pertussis_pathway, adenylyl_cyclase_deregulation, camp_elevation_pertussis, causes).
pathway_edge(pertussis_pathway, camp_elevation_pertussis, pertussis_toxin, systemic_feedback).


% =====================================================================

% --- Batch 11: Endocrine & Metabolic Regulatory Systems ---
pathway(growth_hormone_signaling, 'Growth Hormone Receptor Signaling Pathway').
pathway(prolactin_signaling, 'Prolactin Signaling Pathway').
pathway(type2_diabetes_mellitus, 'Type II Diabetes Mellitus Pathway').
pathway(maturity_onset_diabetes, 'Maturity Onset Diabetes of the Young (MODY)').
pathway(insulin_secretion_pathway, 'Pancreatic Beta Cell Insulin Secretion').
pathway(renin_angiotensin_system, 'Renin-Angiotensin System Pathway').
pathway(parathyroid_hormone_synthesis, 'Parathyroid Hormone Synthesis and Secretion').
pathway(msh_signaling, 'Melanocyte Stimulating Hormone Signaling').
pathway(somatostatin_signaling, 'Somatostatin Receptor Signaling Network').
pathway(ghrelin_metabolic_axis, 'Ghrelin-Regulated Energy Balance Axis').

% --- Batch 12: Immune Response & Hematopoietic Networks ---
pathway(th1_th2_differentiation, 'Th1 and Th2 Cell Differentiation Pathway').
pathway(th17_differentiation, 'Th17 Cell Differentiation Pathway').
pathway(nk_cell_cytotoxicity, 'Natural Killer Cell Mediated Cytotoxicity').
pathway(leukocyte_migration, 'Leukocyte Transendothelial Migration Pathway').
pathway(platelet_activation_pathway, 'Platelet Activation and Aggregation Pathway').
pathway(hematopoietic_lineage, 'Hematopoietic Cell Lineage Differentiation').
pathway(iga_production, 'Intestinal Immune Network for IgA Production').
pathway(complement_coagulation, 'Complement and Coagulation Cascades').
pathway(antigen_processing_presentation, 'Antigen Processing and Presentation Pathway').
pathway(toll_like_receptor_network, 'Extended Toll-Like Receptor Network').

% --- Batch 13: Viral Host Interactions & Pathogen Defense ---
pathway(covid19_pathway, 'Coronavirus Disease (COVID-19) Signaling').
pathway(cytomegalovirus_infection, 'Human Cytomegalovirus Infection Pathway').
pathway(kaposi_sarcoma_herpesvirus, 'Kaposi Sarcoma-Associated Herpesvirus Infection').
pathway(hpv_infection, 'Human Papillomavirus Infection Pathway').
pathway(shigellosis_pathway, 'Shigellosis Bacterial Pathogenesis Pathway').
pathway(salmonella_infection, 'Salmonella Infection Pathway').
pathway(yersinia_infection, 'Yersinia Infection and Virulence Pathway').
pathway(h_pylori_infection, 'Epithelial Cell Signaling in H. pylori Infection').
pathway(amoebic_dysentery, 'Amoebic Dysentery Infection Pathway').
pathway(toxoplasmosis_pathway, 'Toxoplasmosis Host-Pathogen Interaction').

% --- Batch 14: Cellular Growth, Death & Proliferation ---
pathway(cellular_senescence, 'Cellular Senescence and Aging Pathway').
pathway(foxo_signaling, 'FoxO Signaling Pathway').
pathway(rap1_signaling, 'Rap1 Signaling Pathway').
pathway(ras_signaling_extended, 'Extended Ras Signaling Pathway').
pathway(pi3k_akt_expansion, 'PI3K-Akt Downstream Regulatory Expansion').
pathway(cell_cycle_progression, 'Eukaryotic Cell Cycle Progression Network').
pathway(p53_signaling_network, 'p53 Downstream Transcriptional Network').
pathway(ferroptosis_pathway, 'Ferroptosis Iron-Dependent Cell Death').
pathway(necroptosis_pathway, 'Regulated Necroptosis Pathway').
pathway(anoikis_pathway, 'Anoikis Matrix-Detachment Apoptosis').

% --- Batch 15: Environmental Information Processing & Sensory ---
pathway(olfactory_transduction, 'Olfactory Transduction Signaling Pathway').
pathway(taste_transduction, 'Gustatory Taste Transduction Pathway').
pathway(phototransduction, 'Retinal Phototransduction Cascade').
pathway(circadian_entrainment, 'Circadian Entrainment Pathway').
pathway(circadian_rhythm_core, 'Core Circadian Rhythm Feedback Loop').
pathway(abc_transporters_network, 'ATP-Binding Cassette (ABC) Transporters').
pathway(retrograde_endocannabinoid, 'Retrograde Endocannabinoid Signaling Pathway').
pathway(synaptic_vesicle_cycle, 'Synaptic Vesicle Exocytosis and Cycling').
pathway(long_term_potentiation, 'Long-Term Potentiation (LTP) Signaling').
pathway(long_term_depression, 'Long-Term Depression (LTD) Signaling').

% --- Batch 16: Organismal Systems - Circulatory, Digestive & Excretory ---
pathway(cardiac_muscle_contraction, 'Cardiac Muscle Contraction Pathway').
pathway(adrenergic_cardiomyocytes, 'Adrenergic Signaling in Cardiomyocytes').
pathway(vascular_smooth_muscle_contract, 'Vascular Smooth Muscle Contraction').
pathway(salivary_secretion_pathway, 'Salivary Secretion and Fluid Transport').
pathway(gastric_acid_secretion, 'Gastric Acid Secretion and Regulation').
pathway(pancreatic_secretion_pathway, 'Pancreatic Enzyme and Bicarbonate Secretion').
pathway(bile_secretion_pathway, 'Bile Secretion and Hepatic Clearance').
pathway(collecting_duct_water_reabs, 'Collecting Duct Acid-Base and Water Homeostasis').
pathway(proximal_tubule_bicarb, 'Proximal Tubule Bicarbonate Reclamation').
pathway(distal_tubule_na_chlor_reabs, 'Distal Tubule Sodium and Chloride Reabsorption').

pathway_trigger(growth_hormone_signaling, ghrelin_metabolic_axis, growth_hormone_binding).
pathway_trigger(prolactin_signaling, jak2, prolactin_dimerization).
pathway_trigger(type2_diabetes_mellitus, insr, systemic_insulin_resistance).
pathway_trigger(maturity_onset_diabetes, hnf1a, transcription_factor_mutation).
pathway_trigger(insulin_secretion_pathway, kcnma1, glucose_induced_atp_surge).
pathway_trigger(renin_angiotensin_system, agt, renin_cleavage_of_angiotensinogen).
pathway_trigger(parathyroid_hormone_synthesis, casr, extracellular_calcium_sensing).
pathway_trigger(msh_signaling, mc1r, alpha_msh_binding).
pathway_trigger(somatostatin_signaling, sst1, somatostatin_tetrapeptide_binding).
pathway_trigger(ghrelin_metabolic_axis, ghsr, octanoylated_ghrelin_binding).

pathway_trigger(th1_th2_differentiation, stat1, interferon_gamma_stimulation).
pathway_trigger(th17_differentiation, stat3, il6_tgf_beta_co_stimulation).
pathway_trigger(nk_cell_cytotoxicity, klrk1, target_cell_stress_ligand).
pathway_trigger(leukocyte_migration, itga4beta1, endothelial_adhesion_molecule_binding).
pathway_trigger(platelet_activation_pathway, p2ry12, adp_binding_at_platelet_surface).
pathway_trigger(hematopoietic_lineage, stem_cell_factor, kit_receptor_dimerization).
pathway_trigger(iga_production, tgfb1, mucosal_class_switch_recombination).
pathway_trigger(complement_coagulation, c1q, immune_complex_recognition).
pathway_trigger(antigen_processing_presentation, mhc_class_i, cytosolic_peptide_loading).
pathway_trigger(toll_like_receptor_network, tlr4, lipopolysaccharide_endotoxin).

pathway_trigger(covid19_pathway, ace2, sars_cov_2_spike_glycoprotein).
pathway_trigger(cytomegalovirus_infection, egfr, hcmv_envelope_glycoprotein).
pathway_trigger(kaposi_sarcoma_herpesvirus, kshv_gp, integrin_receptor_engagement).
pathway_trigger(hpv_infection, integrin_alpha6, hpv_l1_capsid_binding).
pathway_trigger(shigellosis_pathway, ipa_invasion_protein, host_epithelial_adherence).
pathway_trigger(salmonella_infection, spi1_type3_secretion, effector_protein_injection).
pathway_trigger(yersinia_infection, yadA_adhesin, extracellular_matrix_binding).
pathway_trigger(h_pylori_infection, cagA_toxin, type_iv_secretion_injection).
pathway_trigger(amoebic_dysentery, gal_lectin, mucosal_epithelial_contact).
pathway_trigger(toxoplasmosis_pathway, mic_proteins, host_cell_penetration).

pathway_trigger(cellular_senescence, cdkn1a, telomere_shortening_stress).
pathway_trigger(foxo_signaling, akt1, phosphorylation_dependent_exclusion).
pathway_trigger(rap1_signaling, epac1, camp_elevation_trigger).
pathway_trigger(ras_signaling_extended, sos1, gtp_exchange_activation).
pathway_trigger(pi3k_akt_expansion, pdgfr, platelet_derived_growth_factor).
pathway_trigger(cell_cycle_progression, cdk1_cyclin_b, mitotic_entry_trigger).
pathway_trigger(p53_signaling_network, atm, genotoxic_dna_damage).
pathway_trigger(ferroptosis_pathway, slc7a11, glutathione_depletion).
pathway_trigger(necroptosis_pathway, ripk1, tnfr1_complex_ii_formation).
pathway_trigger(anoikis_pathway, itgb1, extracellular_matrix_loss).

pathway_trigger(olfactory_transduction, or_family, odorant_volatile_molecule).
pathway_trigger(taste_transduction, tas2r, bitter_compound_binding).
pathway_trigger(phototransduction, rhodopsin, photon_absorption_retinal).
pathway_trigger(circadian_entrainment, iprgc_melanopsin, blue_light_illumination).
pathway_trigger(circadian_rhythm_core, arntl, clock_heterodimer_assembly).
pathway_trigger(abc_transporters_network, abcb1, xenobiotic_substrate_influx).
pathway_trigger(retrograde_endocannabinoid, cnr1, 2_arachidonoylglycerol_release).
pathway_trigger(synaptic_vesicle_cycle, synapsin1, calcium_influx_trigger).
pathway_trigger(long_term_potentiation, nmda_receptor, glutamate_and_depolarization).
pathway_trigger(long_term_depression, mglur5, metabotropic_glutamate_activation).

pathway_trigger(cardiac_muscle_contraction, l_type_ca_channel, sarcolemmal_depolarization).
pathway_trigger(adrenergic_cardiomyocytes, adrb1, norepinephrine_binding).
pathway_trigger(vascular_smooth_muscle_contract, ednra, endothelin_1_binding).
pathway_trigger(salivary_secretion_pathway, chrm3, acetylcholine_muscarinic_binding).
pathway_trigger(gastric_acid_secretion, hrh2, histamine_h2_receptor_binding).
pathway_trigger(pancreatic_secretion_pathway, cckar, cholecystokinin_binding).
pathway_trigger(bile_secretion_pathway, ntcp_transporter, taurocholate_hepatic_uptake).
pathway_trigger(collecting_duct_water_reabs, avpr2, antidiuretic_hormone_vasopressin).
pathway_trigger(proximal_tubule_bicarb, ca4_enzyme, luminal_bicarbonate_dehydration).
pathway_trigger(distal_tubule_na_chlor_reabs, slc12a3, thiazide_sensitive_cotransport).

% --- Growth Hormone Signaling Edges ---
pathway_edge(growth_hormone_signaling, ghrelin_metabolic_axis, jak2, activates).
pathway_edge(growth_hormone_signaling, jak2, stat5a, phosphorylates).
pathway_edge(growth_hormone_signaling, stat5a, igf1_transcription, drives).
pathway_edge(growth_hormone_signaling, igf1_transcription, ghrelin_metabolic_axis, hepatic_feedback).

% --- Prolactin Signaling Edges ---
pathway_edge(prolactin_signaling, jak2, stat5a, activates).
pathway_edge(prolactin_signaling, stat5a, csn2_transcription, induces).
pathway_edge(prolactin_signaling, csn2_transcription, socs1, upregulates_feedback).
pathway_edge(prolactin_signaling, socs1, jak2, inhibits_cycle).

% --- Type II Diabetes Mellitus Edges ---
pathway_edge(type2_diabetes_mellitus, insr, irs1, fails_to_phosphorylate).
pathway_edge(type2_diabetes_mellitus, irs1, pi3k_akt_mtor, blocks_activation).
pathway_edge(type2_diabetes_mellitus, pi3k_akt_mtor, slc2a4, impairs_translocation).
pathway_edge(type2_diabetes_mellitus, slc2a4, insr, systemic_glycemic_feedback).

% --- MODY Pathway Edges ---
pathway_edge(maturity_onset_diabetes, hnf1a, ins_transcription, regulates).
pathway_edge(maturity_onset_diabetes, ins_transcription, glucose_sensing, maintains).
pathway_edge(maturity_onset_diabetes, glucose_sensing, beta_cell_function, preserves).
pathway_edge(maturity_onset_diabetes, beta_cell_function, hnf1a, feedback_loop).

% --- Insulin Secretion Pathway Edges ---
pathway_edge(insulin_secretion_pathway, kcnma1, atp_sensitive_k_channel, closes).
pathway_edge(insulin_secretion_pathway, atp_sensitive_k_channel, membrane_depolarization, triggers).
pathway_edge(insulin_secretion_pathway, membrane_depolarization, voltage_ca_channel, opens).
pathway_edge(insulin_secretion_pathway, voltage_ca_channel, insulin_exocytosis, drives).
pathway_edge(insulin_secretion_pathway, insulin_exocytosis, kcnma1, secretory_feedback).

% --- Renin-Angiotensin System Edges ---
pathway_edge(renin_angiotensin_system, agt, angiotensin_i, cleaves).
pathway_edge(renin_angiotensin_system, angiotensin_i, ace_enzyme, converts_to_ang_ii).
pathway_edge(renin_angiotensin_system, ace_enzyme, agtr1, binds).
pathway_edge(renin_angiotensin_system, agtr1, vasoconstriction, drives).
pathway_edge(renin_angiotensin_system, vasoconstriction, agt, hemodynamic_feedback).

% --- Parathyroid Hormone Synthesis Edges ---
pathway_edge(parathyroid_hormone_synthesis, casr, g_q_protein, activates).
pathway_edge(parathyroid_hormone_synthesis, g_q_protein, phospholipase_c, stimulates).
pathway_edge(parathyroid_hormone_synthesis, phospholipase_c, pth_suppression, inhibits_secretion).
pathway_edge(parathyroid_hormone_synthesis, pth_suppression, casr, calcium_feedback).

% --- MSH Signaling Edges ---
pathway_edge(msh_signaling, mc1r, adenylyl_cyclase, activates).
pathway_edge(msh_signaling, adenylyl_cyclase, camp, produces).
pathway_edge(msh_signaling, camp, pka, stimulates).
pathway_edge(msh_signaling, pka, tyrosinase, activates_pigmentation).
pathway_edge(msh_signaling, tyrosinase, mc1r, metabolic_feedback).

% --- Somatostatin Signaling Edges ---
pathway_edge(somatostatin_signaling, sst1, g_i_protein, activates).
pathway_edge(somatostatin_signaling, g_i_protein, adenylyl_cyclase, inhibits).
pathway_edge(somatostatin_signaling, adenylyl_cyclase, hormone_suppression, halts_secretion).
pathway_edge(somatostatin_signaling, hormone_suppression, sst1, receptor_recycling).

% --- Ghrelin Metabolic Axis Edges ---
pathway_edge(ghrelin_metabolic_axis, ghsr, g_q_protein, activates).
pathway_edge(ghrelin_metabolic_axis, g_q_protein, arcuate_nucleus_neurons, stimulates).
pathway_edge(ghrelin_metabolic_axis, arcuate_nucleus_neurons, appetite_stimulation, drives).
pathway_edge(ghrelin_metabolic_axis, appetite_stimulation, ghsr, feeding_feedback).

% --- Th1/Th2 Cell Differentiation Edges ---
pathway_edge(th1_th2_differentiation, stat1, t_bet_transcription, induces).
pathway_edge(th1_th2_differentiation, t_bet_transcription, ifn_gamma_production, drives).
pathway_edge(th1_th2_differentiation, ifn_gamma_production, stat1, autocrine_feedback).

% --- Th17 Cell Differentiation Edges ---
pathway_edge(th17_differentiation, stat3, roryt_transcription, activates).
pathway_edge(th17_differentiation, roryt_transcription, il17_secretion, produces).
pathway_edge(th17_differentiation, il17_secretion, stat3, inflammatory_feedback).

% --- NK Cell Cytotoxicity Edges ---
pathway_edge(nk_cell_cytotoxicity, klrk1, zap70, phosphorylates).
pathway_edge(nk_cell_cytotoxicity, zap70, perforin_granzyme_polarization, triggers).
pathway_edge(nk_cell_cytotoxicity, perforin_granzyme_polarization, target_cell_lysis, executes).
pathway_edge(nk_cell_cytotoxicity, target_cell_lysis, klrk1, recycling_loop).

% --- Leukocyte Migration Edges ---
pathway_edge(leukocyte_migration, itga4beta1, vcam_1_interaction, binds).
pathway_edge(leukocyte_migration, vcam_1_interaction, actin_cytoskeleton_remodeling, drives).
pathway_edge(leukocyte_migration, actin_cytoskeleton_remodeling, diapedesis, executes).
pathway_edge(leukocyte_migration, diapedesis, itga4beta1, detachment_feedback).

% --- Platelet Activation Edges ---
pathway_edge(platelet_activation_pathway, p2ry12, g_i_protein, activates).
pathway_edge(platelet_activation_pathway, g_i_protein, adenylyl_cyclase_inhibition, reduces_camp).
pathway_edge(platelet_activation_pathway, adenylyl_cyclase_inhibition, integrin_alphaiib_beta3, activates).
pathway_edge(platelet_activation_pathway, integrin_alphaiib_beta3, fibrinogen_binding, aggregates).
pathway_edge(platelet_activation_pathway, fibrinogen_binding, p2ry12, positive_feedback).

% --- Hematopoietic Cell Lineage Edges ---
pathway_edge(hematopoietic_lineage, stem_cell_factor, kit_receptor, dimerizes).
pathway_edge(hematopoietic_lineage, kit_receptor, mapk_erk, stimulates).
pathway_edge(hematopoietic_lineage, mapk_erk, lineage_commitment, directs).
pathway_edge(hematopoietic_lineage, lineage_commitment, stem_cell_factor, feedback_loop).

% --- IgA Production Edges ---
pathway_edge(iga_production, tgfb1, smad2_3, phosphorylates).
pathway_edge(iga_production, smad2_3, activation_induced_deaminase, induces).
pathway_edge(iga_production, activation_induced_deaminase, class_switch_recombination, executes).
pathway_edge(iga_production, class_switch_recombination, tgfb1, mucosal_feedback).

% --- Complement and Coagulation Cascades Edges ---
pathway_edge(complement_coagulation, c1q, c1r_c1s_complex, activates).
pathway_edge(complement_coagulation, c1r_c1s_complex, c4_c2_cleavage, triggers).
pathway_edge(complement_coagulation, c4_c2_cleavage, membrane_attack_complex, forms).
pathway_edge(complement_coagulation, membrane_attack_complex, c1q, lytic_feedback).

% --- Antigen Processing and Presentation Edges ---
pathway_edge(antigen_processing_presentation, mhc_class_i, tap_transporter, recruits).
pathway_edge(antigen_processing_presentation, tap_transporter, peptide_loading_complex, assembles).
pathway_edge(antigen_processing_presentation, peptide_loading_complex, cell_surface_display, translocates).
pathway_edge(antigen_processing_presentation, cell_surface_display, mhc_class_i, immunological_feedback).

% --- Extended TLR Network Edges ---
pathway_edge(toll_like_receptor_network, tlr4, trif_adapter, recruits).
pathway_edge(toll_like_receptor_network, trif_adapter, irf3_transcription, activates).
pathway_edge(toll_like_receptor_network, irf3_transcription, type_i_interferons, produces).
pathway_edge(toll_like_receptor_network, type_i_interferons, tlr4, interferon_feedback).

% --- COVID-19 Pathway Edges ---
pathway_edge(covid19_pathway, ace2, sars_cov_2_spike, binds).
pathway_edge(covid19_pathway, sars_cov_2_spike, tmprss2, primes_cleavage).
pathway_edge(covid19_pathway, tmprss2, viral_membrane_fusion, drives).
pathway_edge(covid19_pathway, viral_membrane_fusion, ace2, downregulates_feedback).

% --- Cytomegalovirus Infection Edges ---
pathway_edge(cytomegalovirus_infection, egfr, hcmv_glycoprotein, interacts).
pathway_edge(cytomegalovirus_infection, hcmv_glycoprotein, pi3k_akt_mtor, activates).
pathway_edge(cytomegalovirus_infection, pi3k_akt_mtor, viral_latency, maintains).
pathway_edge(cytomegalovirus_infection, viral_latency, egfr, reactivation_loop).

% --- Kaposi Sarcoma Herpesvirus Edges ---
pathway_edge(kaposi_sarcoma_herpesvirus, kshv_gp, focal_adhesion_kinases, triggers).
pathway_edge(kaposi_sarcoma_herpesvirus, focal_adhesion_kinases, mapk_erk, stimulates).
pathway_edge(kaposi_sarcoma_herpesvirus, mapk_erk, angiopoietin_signaling, promotes).
pathway_edge(kaposi_sarcoma_herpesvirus, angiopoietin_signaling, kshv_gp, angiogenic_feedback).

% --- HPV Infection Edges ---
pathway_edge(hpv_infection, integrin_alpha6, e6_e7_oncoproteins, expresses).
pathway_edge(hpv_infection, e6_e7_oncoproteins, tp53, degrades_and_inactivates).
pathway_edge(hpv_infection, tp53, rb1_degradation, accelerates).
pathway_edge(hpv_infection, rb1_degradation, integrin_alpha6, immortalization_feedback).

% --- Shigellosis Pathway Edges ---
pathway_edge(shigellosis_pathway, ipa_invasion_protein, actin_polymerization, triggers).
pathway_edge(shigellosis_pathway, actin_polymerization, macropinocytosis, executes).
pathway_edge(shigellosis_pathway, macropinocytosis, epithelial_invasion, completes).
pathway_edge(shigellosis_pathway, epithelial_invasion, ipa_invasion_protein, intracellular_feedback).

% --- Salmonella Infection Edges ---
pathway_edge(salmonella_infection, spi1_type3_secretion, rho_gtpases, manipulates).
pathway_edge(salmonella_infection, rho_gtpases, membrane_ruffling, induces).
pathway_edge(salmonella_infection, membrane_ruffling, salmonella_containing_vacuole, forms).
pathway_edge(salmonella_infection, salmonella_containing_vacuole, spi1_type3_secretion, replication_feedback).

% --- Yersinia Infection Edges ---
pathway_edge(yersinia_infection, yadA_adhesin, beta1_integrins, binds).
pathway_edge(yersinia_infection, beta1_integrins, yop_effectors_injection, triggers).
pathway_edge(yersinia_infection, yop_effectors_injection, immune_evasion_yersinia, executes).
pathway_edge(yersinia_infection, immune_evasion_yersinia, yadA_adhesin, chronic_feedback).

% --- H. pylori Infection Edges ---
pathway_edge(h_pylori_infection, cagA_toxin, shp2_phosphatase, binds_and_activates).
pathway_edge(h_pylori_infection, shp2_phosphatase, mapk_erk, hyperactivates).
pathway_edge(h_pylori_infection, mapk_erk, hummingbird_phenotype, drives).
pathway_edge(h_pylori_infection, hummingbird_phenotype, cagA_toxin, gastric_feedback).

% --- Amoebic Dysentery Edges ---
pathway_edge(amoebic_dysentery, gal_lectin, host_mucin_adherence, mediates).
pathway_edge(amoebic_dysentery, host_mucin_adherence, amoebapore_secretion, triggers).
pathway_edge(amoebic_dysentery, amoebapore_secretion, epithelial_cell_lysis, executes).
pathway_edge(amoebic_dysentery, epithelial_cell_lysis, gal_lectin, tissue_feedback).

% --- Toxoplasmosis Pathway Edges ---
pathway_edge(toxoplasmosis_pathway, mic_proteins, host_plasma_membrane, invades).
pathway_edge(toxoplasmosis_pathway, host_plasma_membrane, parasitophorous_vacuole, establishes).
pathway_edge(toxoplasmosis_pathway, parasitophorous_vacuole, metabolic_hijacking, drives).
pathway_edge(toxoplasmosis_pathway, metabolic_hijacking, mic_proteins, chronic_feedback).

% --- Cellular Senescence Edges ---
pathway_edge(cellular_senescence, cdkn1a, cdk2_cyclin_e, inhibits).
pathway_edge(cellular_senescence, cdk2_cyclin_e, rb1_phosphorylation, blocks).
pathway_edge(cellular_senescence, rb1_phosphorylation, cell_cycle_arrest, enforces).
pathway_edge(cellular_senescence, cell_cycle_arrest, cdkn1a, senescence_feedback).

% --- FoxO Signaling Edges ---
pathway_edge(foxo_signaling, akt1, foxo1_3, phosphorylates).
pathway_edge(foxo_signaling, foxo1_3, cytoplasmic_sequestration, triggers).
pathway_edge(foxo_signaling, cytoplasmic_sequestration, stress_resistance_genes, suppresses).
pathway_edge(foxo_signaling, stress_resistance_genes, akt1, metabolic_feedback).

% --- Rap1 Signaling Edges ---
pathway_edge(rap1_signaling, epac1, rap1_gtpase, activates).
pathway_edge(rap1_signaling, rap1_gtpase, integrin_activation, stimulates).
pathway_edge(rap1_signaling, integrin_activation, cell_adhesion, drives).
pathway_edge(rap1_signaling, cell_adhesion, epac1, mechanical_feedback).

% --- Extended Ras Signaling Edges ---
pathway_edge(ras_signaling_extended, sos1, kras_active, generates).
pathway_edge(ras_signaling_extended, kras_active, braf_kinase, recruits).
pathway_edge(ras_signaling_extended, braf_kinase, mapk_erk, propagates).
pathway_edge(ras_signaling_extended, mapk_erk, sos1, inhibitory_phosphorylation_feedback).

% --- PI3K-Akt Expansion Edges ---
pathway_edge(pi3k_akt_expansion, pdgfr, pik3ca, activates).
pathway_edge(pi3k_akt_expansion, pik3ca, akt1, phosphorylates).
pathway_edge(pi3k_akt_expansion, akt1, mtorc1, stimulates).
pathway_edge(pi3k_akt_expansion, mtorc1, protein_synthesis, drives).
pathway_edge(pi3k_akt_expansion, protein_synthesis, pdgfr, feedback_loop).

% --- Cell Cycle Progression Edges ---
pathway_edge(cell_cycle_progression, cdk1_cyclin_b, nuclear_envelope_breakdown, triggers).
pathway_edge(cell_cycle_progression, nuclear_envelope_breakdown, mitotic_spindle_assembly, drives).
pathway_edge(cell_cycle_progression, mitotic_spindle_assembly, anaphase_transition, executes).
pathway_edge(cell_cycle_progression, anaphase_transition, cdk1_cyclin_b, ubiquitin_mediated_degradation_feedback).

% --- p53 Downstream Network Edges ---
pathway_edge(p53_signaling_network, atm, tp53_activation, phosphorylates).
pathway_edge(p53_signaling_network, tp53_activation, cdkn1a, transcribes).
pathway_edge(p53_signaling_network, cdkn1a, bax, balances).
pathway_edge(p53_signaling_network, bax, mdm2, regulatory_feedback).

% --- Ferroptosis Pathway Edges ---
pathway_edge(ferroptosis_pathway, slc7a11, glutathione_synthesis, limits).
pathway_edge(ferroptosis_pathway, glutathione_synthesis, gpx4_enzyme, starves).
pathway_edge(ferroptosis_pathway, gpx4_enzyme, lipid_peroxide_accumulation, fails_to_reduce).
pathway_edge(ferroptosis_pathway, lipid_peroxide_accumulation, slc7a11, membrane_rupture_feedback).

% --- Necroptosis Pathway Edges ---
pathway_edge(necroptosis_pathway, ripk1, ripk3, phosphorylates).
pathway_edge(necroptosis_pathway, ripk3, mlkl_protein, oligomerizes).
pathway_edge(necroptosis_pathway, mlkl_protein, plasma_membrane_rupture, executes).
pathway_edge(necroptosis_pathway, plasma_membrane_rupture, ripk1, inflammatory_feedback).

% --- Anoikis Pathway Edges ---
pathway_edge(anoikis_pathway, itgb1, focal_adhesion_kinase_detachment, loses_signal).
pathway_edge(anoikis_pathway, focal_adhesion_kinase_detachment, bim_protein, activates).
pathway_edge(anoikis_pathway, bim_protein, intrinsic_apoptosis, initiates).
pathway_edge(anoikis_pathway, intrinsic_apoptosis, itgb1, survival_feedback).

% --- Olfactory Transduction Edges ---
pathway_edge(olfactory_transduction, or_family, g_olf_protein, activates).
pathway_edge(olfactory_transduction, g_olf_protein, adenylyl_cyclase_iii, stimulates).
pathway_edge(olfactory_transduction, adenylyl_cyclase_iii, camp_olfactory, produces).
pathway_edge(olfactory_transduction, camp_olfactory, cyclic_nucleotide_gated_channel, opens_ca).
pathway_edge(olfactory_transduction, cyclic_nucleotide_gated_channel, or_family, adaptation_feedback).

% --- Taste Transduction Edges ---
pathway_edge(taste_transduction, tas2r, gustducin_protein, activates).
pathway_edge(taste_transduction, gustducin_protein, phospholipase_c_beta2, stimulates).
pathway_edge(taste_transduction, phospholipase_c_beta2, ip3_generation, produces).
pathway_edge(taste_transduction, ip3_generation, trpm5_channel, opens).
pathway_edge(taste_transduction, trpm5_channel, tas2r, depolarization_feedback).

% --- Phototransduction Edges ---
pathway_edge(phototransduction, rhodopsin, transducin_alpha, activates).
pathway_edge(phototransduction, transducin_alpha, pde6_enzyme, stimulates).
pathway_edge(phototransduction, pde6_enzyme, cgmp_hydrolysis, depletes).
pathway_edge(phototransduction, cgmp_hydrolysis, cng_channel_closure, hyperpolarizes).
pathway_edge(phototransduction, cng_channel_closure, rhodopsin, recovery_feedback).

% --- Circadian Entrainment Edges ---
pathway_edge(circadian_entrainment, iprgc_melanopsin, g_q_protein, activates).
pathway_edge(circadian_entrainment, g_q_protein, phospholipase_c, stimulates).
pathway_edge(circadian_entrainment, phospholipase_c, ca_flux_circadian, induces).
pathway_edge(circadian_entrainment, ca_flux_circadian, per1_per2_transcription, drives).
pathway_edge(circadian_entrainment, per1_per2_transcription, iprgc_melanopsin, resetting_feedback).

% --- Core Circadian Rhythm Edges ---
pathway_edge(circadian_rhythm_core, arntl, clock_heterodimer, complexes).
pathway_edge(circadian_rhythm_core, clock_heterodimer, per_cry_transcription, drives).
pathway_edge(circadian_rhythm_core, per_cry_transcription, per_cry_protein_complex, translates).
pathway_edge(circadian_rhythm_core, per_cry_protein_complex, arntl, represses_transcription_feedback).

% --- ABC Transporters Network Edges ---
pathway_edge(abc_transporters_network, abcb1, atp_hydrolysis, powers).
pathway_edge(abc_transporters_network, atp_hydrolysis, xenobiotic_efflux, extrudes_drug).
pathway_edge(abc_transporters_network, xenobiotic_efflux, cell_membrane_retention, reduces).
pathway_edge(abc_transporters_network, cell_membrane_retention, abcb1, transcriptional_feedback).

% --- Retrograde Endocannabinoid Signaling Edges ---
pathway_edge(retrograde_endocannabinoid, cnr1, g_i_protein, activates).
pathway_edge(retrograde_endocannabinoid, g_i_protein, n_type_ca_channel, inhibits_influx).
pathway_edge(retrograde_endocannabinoid, n_type_ca_channel, 2_arachidonoylglycerol_synthesis, triggers).
pathway_edge(retrograde_endocannabinoid, 2_arachidonoylglycerol_synthesis, cnr1, retrograde_feedback).

% --- Synaptic Vesicle Cycle Edges ---
pathway_edge(synaptic_vesicle_cycle, synapsin1, actin_cytoskeleton_release, untethers_vesicle).
pathway_edge(synaptic_vesicle_cycle, actin_cytoskeleton_release, snare_complex, docks).
pathway_edge(synaptic_vesicle_cycle, snare_complex, neurotransmitter_exocytosis, fuses).
pathway_edge(synaptic_vesicle_cycle, neurotransmitter_exocytosis, synapsin1, endocytic_recycling_feedback).

% --- Long-Term Potentiation Edges ---
pathway_edge(long_term_potentiation, nmda_receptor, ca_influx, permits).
pathway_edge(long_term_potentiation, ca_influx, camk2a, auto_phosphorylates).
pathway_edge(long_term_potentiation, camk2a, ampa_receptor_insertion, drives).
pathway_edge(long_term_potentiation, ampa_receptor_insertion, nmda_receptor, synaptic_strengthening_feedback).

% --- Long-Term Depression Edges ---
pathway_edge(long_term_depression, mglur5, phospholipase_c_beta, activates).
pathway_edge(long_term_depression, phospholipase_c_beta, ip3_dag_pathway, generates).
pathway_edge(long_term_depression, ip3_dag_pathway, pkc_activation, stimulates).
pathway_edge(long_term_depression, pkc_activation, ampa_receptor_internalization, drives).
pathway_edge(long_term_depression, ampa_receptor_internalization, mglur5, synaptic_weakening_feedback).

% --- Cardiac Muscle Contraction Edges ---
pathway_edge(cardiac_muscle_contraction, l_type_ca_channel, ryanodine_receptor_2, triggers_calcium_release).
pathway_edge(cardiac_muscle_contraction, ryanodine_receptor_2, sarcoplasmic_ca_surge, floods_cytosol).
pathway_edge(cardiac_muscle_contraction, sarcoplasmic_ca_surge, troponin_c, binds).
pathway_edge(cardiac_muscle_contraction, troponin_c, actomyosin_crossbridge, contracts).
pathway_edge(cardiac_muscle_contraction, actomyosin_crossbridge, l_type_ca_channel, relaxation_feedback).

% --- Adrenergic Signaling in Cardiomyocytes Edges ---
pathway_edge(adrenergic_cardiomyocytes, adrb1, g_s_protein, activates).
pathway_edge(adrenergic_cardiomyocytes, g_s_protein, adenylyl_cyclase, produces_camp).
pathway_edge(adrenergic_cardiomyocytes, produces_camp, pka_cardiac, activates_pka).
pathway_edge(adrenergic_cardiomyocytes, pka_cardiac, phospholamban, phosphorylates).
pathway_edge(adrenergic_cardiomyocytes, phospholamban, adrb1, inotropic_feedback).

% --- Vascular Smooth Muscle Contraction Edges ---
pathway_edge(vascular_smooth_muscle_contract, ednra, g_q_protein, activates).
pathway_edge(vascular_smooth_muscle_contract, g_q_protein, phospholipase_c, produces_ip3).
pathway_edge(vascular_smooth_muscle_contract, produces_ip3, myosin_light_chain_kinase, activates_mlck).
pathway_edge(vascular_smooth_muscle_contract, activates_mlck, vasoconstriction_tone, drives).
pathway_edge(vascular_smooth_muscle_contract, vasoconstriction_tone, ednra, myogenic_feedback).

% --- Salivary Secretion Edges ---
pathway_edge(salivary_secretion_pathway, chrm3, phospholipase_c, activates).
pathway_edge(salivary_secretion_pathway, phospholipase_c, calcium_release, stimulates).
pathway_edge(salivary_secretion_pathway, calcium_release, fluid_electrolyte_secretion, drives).
pathway_edge(salivary_secretion_pathway, fluid_electrolyte_secretion, chrm3, secretory_feedback).

% --- Gastric Acid Secretion Edges ---
pathway_edge(gastric_acid_secretion, hrh2, adenylyl_cyclase, activates).
pathway_edge(gastric_acid_secretion, adenylyl_cyclase, camp_gastric, generates).
pathway_edge(gastric_acid_secretion, camp_gastric, pka, stimulates).
pathway_edge(gastric_acid_secretion, pka, atp4a_proton_pump, translocates_apical).
pathway_edge(gastric_acid_secretion, atp4a_proton_pump, hrh2, luminal_ph_feedback).

% --- Pancreatic Secretion Edges ---
pathway_edge(pancreatic_secretion_pathway, cckar, phospholipase_c, stimulates).
pathway_edge(pancreatic_secretion_pathway, phospholipase_c, calcium_flux_pancreas, triggers).
pathway_edge(pancreatic_secretion_pathway, calcium_flux_pancreas, zymogen_granule_exocytosis, drives).
pathway_edge(pancreatic_secretion_pathway, zymogen_granule_exocytosis, cckar, enzymatic_feedback).

% --- Bile Secretion Edges ---
pathway_edge(bile_secretion_pathway, ntcp_transporter, taurocholate_uptake, mediates).
pathway_edge(bile_secretion_pathway, taurocholate_uptake, abcb11_export, secretes_into_canaliculus).
pathway_edge(bile_secretion_pathway, abcb11_export, bile_flow, drives).
pathway_edge(bile_secretion_pathway, bile_flow, ntcp_transporter, choleretic_feedback).

% --- Collecting Duct Water Reabsorption Edges ---
pathway_edge(collecting_duct_water_reabs, avpr2, g_s_protein, activates).
pathway_edge(collecting_duct_water_reabs, g_s_protein, adenylyl_cyclase, generates_camp).
pathway_edge(collecting_duct_water_reabs, generates_camp, pka, activates_pka).
pathway_edge(collecting_duct_water_reabs, activates_pka, aqp2_water_channel, translocates_membrane).
pathway_edge(collecting_duct_water_reabs, aqp2_water_channel, avpr2, osmotic_feedback).

% --- Proximal Tubule Bicarbonate Reclamation Edges ---
pathway_edge(proximal_tubule_bicarb, ca4_enzyme, luminal_co2_h2o, dehydrates).
pathway_edge(proximal_tubule_bicarb, luminal_co2_h2o, slc9a3, exchanges_na_h).
pathway_edge(proximal_tubule_bicarb, slc9a3, bicarb_reabsorption, drives).
pathway_edge(proximal_tubule_bicarb, bicarb_reabsorption, ca4_enzyme, renal_feedback).

% --- Distal Tubule Sodium/Chloride Reabsorption Edges ---
pathway_edge(distal_tubule_na_chlor_reabs, slc12a3, apical_cotransport, reabsorbs_na_cl).
pathway_edge(distal_tubule_na_chlor_reabs, apical_cotransport, intracellular_calcium_mod, regulates).
pathway_edge(distal_tubule_na_chlor_reabs, intracellular_calcium_mod, distal_tubule_tone, tunes).
pathway_edge(distal_tubule_na_chlor_reabs, distal_tubule_tone, slc12a3, thiazide_feedback).
