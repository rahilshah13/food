is_upper(C) :-
    (   atom(C) -> atom_codes(C, [Code])
    ;   integer(C) -> Code = C
    ),
    Code >= 65, Code <= 90.

is_lower(C) :-
    (   atom(C) -> atom_codes(C, [Code])
    ;   integer(C) -> Code = C
    ),
    Code >= 97, Code <= 122.

is_digit(C) :-
    (   atom(C) -> atom_codes(C, [Code])
    ;   integer(C) -> Code = C
    ),
    Code >= 48, Code <= 57.

element(h, 1.008).
element(c, 12.011).
element(n, 14.007).
element(o, 15.999).
element(f, 18.998).
element(mg, 24.305).
element(p, 30.974).
element(s, 32.060).
element(cl, 35.450).
element(br, 79.904).
element(i, 126.904).

aromatic(b).
aromatic(c).
aromatic(n).
aromatic(o).
aromatic(p).
aromatic(s).

% ---------------------------------------------------------------------
% MOLECULAR DATABASE (Consolidated Intermediates & APIs)
% ---------------------------------------------------------------------

molecule(acetyl_tritylimidazole, 'CC(=O)C1=CN(C(C2=CC=CC=C2)(C3=CC=CC=C3)C4=CC=CC=C4)C=N1', '1-Trityl-1H-imidazole-4-ethanone', 'C24H20N2O', 352.44, 0).[cite: 1]
molecule(dimethylphenyl_magnesium_bromide, 'CC1=C(C)C(=CC=C1)[Mg]Br', '(2,3-Dimethylphenyl)magnesium bromide', 'C8H9BrMg', 209.37, 0).[cite: 1]
molecule(medetomidine_alcohol_trityl, 'CC(O)(C1=C(C)C(=CC=C1)C)C2=CN(C(C3=CC=CC=C3)(C4=CC=CC=C4)C5=CC=CC=C5)C=N2', '1-(2,3-Dimethylphenyl)-1-(1-trityl-1H-imidazol-4-yl)ethanol', 'C32H30N2O', 458.60, 1).[cite: 1]
molecule(medetomidine_racemic, 'CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2', 'Racemic Medetomidine', 'C13H16N2', 200.28, 1).[cite: 1]
molecule(l_tartaric_acid, 'O=C(O)C(O)C(O)C(=O)O', 'L-Tartaric Acid', 'C4H6O6', 150.09, 2).[cite: 1]
molecule(dexmedetomidine, 'CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2', 'Dexmedetomidine Free Base', 'C13H16N2', 200.28, 1).[cite: 1]
molecule(dexmedetomidine_hcl, 'CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2.Cl', 'Dexmedetomidine Hydrochloride', 'C13H17ClN2', 236.74, 1).[cite: 1]

molecule(cortisone, 'CC12CCC3C(C1CC(=O)C2(C(=O)CO)O)CCC4=CC(=O)CCC43C', 'Cortisone', 'C21H28O5', 360.45, 6).[cite: 2]
molecule(acetic_anhydride, 'CC(=O)OC(=O)C', 'Acetic Anhydride', 'C4H6O3', 102.09, 0).[cite: 2, 3, 7]
molecule(cortisone_acetate, 'CC12CCC3C(C1CC(=O)C2(C(=O)COC(=O)C)O)CCC4=CC(=O)CCC43C', 'Cortisone 21-acetate', 'C23H30O6', 402.48, 6).[cite: 2, 3, 7]
molecule(prednisone_acetate, 'CC12CCC3C(C1CC(=O)C2(C(=O)COC(=O)C)O)CCC4=CC(=O)C=CC43C', 'Prednisone 21-acetate', 'C23H28O6', 400.47, 6).[cite: 2, 3, 7]
molecule(prednisone, 'CC12CCC3C(C1CC(=O)C2(C(=O)CO)O)CCC4=CC(=O)C=CC43C', 'Prednisone Free Base', 'C21H26O5', 358.43, 6).[cite: 2, 3, 7]

molecule(soybean_seed_biomass, 'BIOMASS_SOURCE', 'Soybean mature seeds, raw', 'BIO_COMPOSITE', 0.00, 0).[cite: 3]
molecule(stigmasterol, 'CC(=CC=CH[C@H]1CC[C@@H]2[C@@H]3CC=C4[C@@H](CC[C@@]4(C)[C@H]3CC[C@]12C)O)C', 'Stigmasterol', 'C29H48O', 412.69, 9).[cite: 3]
molecule(stigmasterol_acetate, 'CC(=CC=CH[C@H]1CC[C@@H]2[C@@H]3CC=C4[C@@H](CC[C@@]4(C)[C@H]3CC[C@]12C)OC(=O)C)C', 'Stigmasterol 3beta-acetate', 'C31H50O2', 454.73, 9).[cite: 3]
molecule(dehydropregnenolone_acetate, 'CC(=O)C1=CC2[C@@H]3CC=C4[C@@H](CC[C@@]4(C)[C@H]3CC2C1)OC(=O)C', '16-Dehydropregnenolone Acetate [16-DPA]', 'C23H32O3', 356.50, 5).[cite: 3, 7]

molecule(yam_tuber_biomass, 'BIOMASS_SOURCE', 'Yam raw, tuber', 'BIO_COMPOSITE', 0.00, 0).[cite: 7]
molecule(diosgenin, 'O1[C@@H]4[C@H]([C@@H]([C@]12OC[C@@H](CC2)C)C)[C@@]5(C)CC[C@@H]3[C@@]6(C(=C/C[C@H]3[C@@H]5C4)\\C[C@@H](O)CC6)C', 'Diosgenin', 'C27H42O3', 414.63, 8).[cite: 7]
molecule(diosgenin_acetate, 'O1[C@@H]4[C@H]([C@@H]([C@]12OC[C@@H](CC2)C)C)[C@@]5(C)CC[C@@H]3[C@@]6(C(=C/C[C@H]3[C@@H]5C4)\\C[C@@H](OC(=O)C)CC6)C', 'Diosgenin Acetate', 'C29H44O4', 456.66, 8).[cite: 7]

molecule(chloro_pyrrolo_pyrimidine, 'Clc1ncnc2c1c[nH]c2', '4-chloro-7H-pyrrolo[2,3-d]pyrimidine', 'C6H4ClN3', 153.57, 0).[cite: 4]
molecule(chiral_piperidine_amine, 'CN[C@@H]1CC[C@@H](C)N(Cc2ccccc2)C1', '(3R,4R)-1-benzyl-N,4-dimethylpiperidin-3-amine', 'C14H22N2', 218.34, 2).[cite: 4]
molecule(coupled_benzyl_intermediate, 'CN(C1CC[C@@H](C)N(Cc2ccccc2)C1)c3ncnc4c3c[nH]c4', 'Coupled Benzyl Intermediate', 'C20H25N7', 363.46, 2).[cite: 4]
molecule(deprotected_amine_intermediate, 'CN(C1CC[C@@H](C)NC1)c2ncnc3c2c[nH]3', 'Secondary Amine Intermediate', 'C13H19N7', 273.34, 2).[cite: 4]
molecule(tofacitinib, 'CN1C[C@@H]([C@@H](C1)N(C)C(=O)CC#N)C2=C3C(=CN2)N=CN3', 'Tofacitinib Free Base', 'C16H20N6O', 312.37, 2).[cite: 4]
molecule(citric_acid, 'OC(=O)CC(O)(CC(=O)O)C(=O)O', 'Citric Acid Anhydrous', 'C6H8O7', 192.12, 0).[cite: 4]
molecule(tofacitinib_citrate, 'CN1C[C@@H]([C@@H](C1)N(C)C(=O)CC#N)C2=C3C(=CN2)N=CN3', 'Tofacitinib Citrate Monocitrate Salt', 'C22H28N6O8', 504.49, 2).[cite: 4]

molecule(fermentation_feedstock, 'OC[C@@H]1[C@@H]([C@H]([C@@H]([C@H](O1)O)O)O)O', 'D-Glucose', 'C6H12O6', 180.16, 5).[cite: 5]
molecule(vancomycin_broth, 'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O', 'Crude Vancomycin Broth', 'C66H75Cl2N9O24', 1449.25, 18).[cite: 5]
molecule(vancomycin_crude, 'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O', 'Vancomycin Free Base (Crude)', 'C66H75Cl2N9O24', 1449.25, 18).[cite: 5]
molecule(vancomycin_free_base, 'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O', 'Vancomycin Free Base (Pure)', 'C66H75Cl2N9O24', 1449.25, 18).[cite: 5]
molecule(hydrochloric_acid, 'Cl', 'Hydrochloric Acid', 'HCl', 36.46, 0).[cite: 5]
molecule(vancomycin_hydrochloride, 'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O.Cl', 'Vancomycin Hydrochloride', 'C66H76Cl3N9O24', 1485.71, 18).[cite: 5]

molecule(cho_cell_culture_harvest, 'CC(C)C', 'CHO Cell Culture Expression Broth', 'C6528H10072N1732O2042S42', 146837.00, 0).[cite: 6]
molecule(purified_antibody_intermediate, 'CC(C)C', 'Polished Bulk Drug Substance', 'C6528H10072N1732O2042S42', 146837.00, 0).[cite: 6]
molecule(vedolizumab, 'CC(C)C', 'Vedolizumab IgG1 Monoclonal Antibody', 'C6528H10072N1732O2042S42', 146837.00, 0).[cite: 6]
molecule(formulation_excipients, 'OC[C@H]1O[C@@H](O[C@@H]2[C@@H](O)[C@@H](O)CO2)[C@@H](O)[C@H]1O', 'Excipient Blend', 'C12H22O11', 342.30, 8).[cite: 6]
molecule(vedolizumab_iv_formulation, 'CC(C)C', 'Entyvio Lyophilized Vial Formulation', 'C6540H10100N1740O2060S42', 148000.00, 8).[cite: 6]

% ---------------------------------------------------------------------
% REACTION NETWORK & PROCEDURES (Namespaced)
% ---------------------------------------------------------------------

reaction(dex_r1, grignard_addition, [acetyl_tritylimidazole, dimethylphenyl_magnesium_bromide], medetomidine_alcohol_trityl, reagents([tetrahydrofuran, ammonium_chloride_aq]), conditions(temperature_c(0), pressure_bar(1), yield_percent(88)), verified(true)).[cite: 1]
reaction(dex_r2, hydrogenolysis_deprotection, [medetomidine_alcohol_trityl], medetomidine_racemic, reagents([palladium_on_carbon, hydrogen_gas, hydrochloric_acid, methanol]), conditions(temperature_c(50), pressure_bar(3), yield_percent(91)), verified(true)).[cite: 1]
reaction(dex_r3, chiral_resolution, [medetomidine_racemic, l_tartaric_acid], dexmedetomidine, reagents([ethanol, acetone, sodium_hydroxide]), conditions(temperature_c(25), pressure_bar(1), yield_percent(42)), verified(true)).[cite: 1]
reaction(dex_r4, salt_formation, [dexmedetomidine], dexmedetomidine_hcl, reagents([hydrochloric_acid_isopropanolic, isopropyl_alcohol]), conditions(temperature_c(10), pressure_bar(1), yield_percent(95)), verified(true)).[cite: 1]

reaction(pred_r1, esterification_protection, [cortisone, acetic_anhydride], cortisone_acetate, reagents([pyridine, dichloromethane]), conditions(temperature_c(25), pressure_bar(1), yield_percent(95)), verified(true)).[cite: 2]
reaction(pred_r2, dehydrogenation, [cortisone_acetate], prednisone_acetate, reagents([ddq, p_toluenesulfonic_acid, dioxane]), conditions(temperature_c(100), pressure_bar(1), yield_percent(82)), verified(true)).[cite: 2]
reaction(pred_r3, base_catalyzed_hydrolysis, [prednisone_acetate], prednisone, reagents([potassium_carbonate, methanol, deionized_water]), conditions(temperature_c(20), pressure_bar(1), yield_percent(90)), verified(true)).[cite: 2]

reaction(soy_r_extract, biomass_solvent_extraction, [soybean_seed_biomass], stigmasterol, reagents([hexane, sodium_hydroxide, ethanol, water]), conditions(temperature_c(65), pressure_bar(1), yield_percent(15)), verified(true)).[cite: 3]
reaction(soy_r_protect, esterification_protection, [stigmasterol, acetic_anhydride], stigmasterol_acetate, reagents([pyridine, dichloromethane]), conditions(temperature_c(25), pressure_bar(1), yield_percent(94)), verified(true)).[cite: 3]
reaction(soy_r_julian, oxidative_cleavage, [stigmasterol_acetate], dehydropregnenolone_acetate, reagents([ozone_o3, zinc_acetic_acid, pyridine]), conditions(temperature_c(-78), pressure_bar(1), yield_percent(62)), verified(true)).[cite: 3]
reaction(soy_r_func, hydroxylation_and_epoxidation, [dehydropregnenolone_acetate], cortisone_acetate, reagents([alkaline_hydrogen_peroxide, rhizopus_arrhizus_culture, acetyl_chloride]), conditions(temperature_c(28), pressure_bar(1), yield_percent(45)), verified(true)).[cite: 3]
reaction(soy_r_dehyd, biocatalytic_dehydrogenation, [cortisone_acetate], prednisone_acetate, reagents([arthrobacter_simplex, nutrient_broth]), conditions(temperature_c(30), pressure_bar(1), yield_percent(85)), verified(true)).[cite: 3]
reaction(soy_r_hydro, base_catalyzed_hydrolysis, [prednisone_acetate], prednisone, reagents([potassium_carbonate, methanol, deionized_water]), conditions(temperature_c(20), pressure_bar(1), yield_percent(90)), verified(true)).[cite: 3]

reaction(yam_r_extract, acid_hydrolysis_extraction, [yam_tuber_biomass], diosgenin, reagents([hydrochloric_acid, water, toluene]), conditions(temperature_c(100), pressure_bar(1), yield_percent(12)), verified(true)).[cite: 7]
reaction(yam_r_protect, esterification_protection, [diosgenin, acetic_anhydride], diosgenin_acetate, reagents([pyridine, dichloromethane]), conditions(temperature_c(25), pressure_bar(1), yield_percent(95)), verified(true)).[cite: 7]
reaction(yam_r_marker, marker_degradation_cleavage, [diosgenin_acetate], dehydropregnenolone_acetate, reagents([acetic_anhydride, chromium_trioxide, acid_catalyst]), conditions(temperature_c(140), pressure_bar(1), yield_percent(55)), verified(true)).[cite: 7]

reaction(tof_r1, snar_coupling, [chloro_pyrrolo_pyrimidine, chiral_piperidine_amine], coupled_benzyl_intermediate, reagents([potassium_carbonate, acetonitrile_water]), conditions(temperature_c(80), pressure_bar(1), yield_percent(87)), verified(true)).[cite: 4]
reaction(tof_r2, catalytic_hydrogenation, [coupled_benzyl_intermediate], deprotected_amine_intermediate, reagents([palladium_hydroxide_carbon, hydrogen_gas, acetic_acid]), conditions(temperature_c(50), pressure_bar(3), yield_percent(91)), verified(true)).[cite: 4]
reaction(tof_r3, cyanoacylation, [deprotected_amine_intermediate], tofacitinib, reagents([cyanoacetic_acid, dbu, tetrahydrofuran]), conditions(temperature_c(25), pressure_bar(1), yield_percent(84)), verified(true)).[cite: 4]
reaction(tof_r4, salt_formation, [tofacitinib, citric_acid], tofacitinib_citrate, reagents([aqueous_ethanol, absolute_citric_acid]), conditions(temperature_c(60), pressure_bar(1), yield_percent(95)), verified(true)).[cite: 4]

reaction(vanc_r1, bioprocess_fermentation, [fermentation_feedstock], vancomycin_broth, reagents([amycolatopsis_orientalis_spores, soybean_meal, trace_minerals]), conditions(temperature_c(28), pressure_bar(1), titer_g_L(15)), verified(true)).[cite: 5]
reaction(vanc_r2, resin_adsorption_extraction, [vancomycin_broth], vancomycin_crude, reagents([macroporous_adsorbent_resin, ethanol_eluent, sodium_hydroxide]), conditions(temperature_c(20), pressure_bar(1), yield_percent(78)), verified(true)).[cite: 5]
reaction(vanc_r3, preparative_hplc_purification, [vancomycin_crude], vancomycin_free_base, reagents([c18_silica_gel, ammonium_acetate_buffer, acetonitrile]), conditions(temperature_c(25), pressure_bar(40), yield_percent(85)), verified(true)).[cite: 5]
reaction(vanc_r4, hydrochloride_salt_formation, [vancomycin_free_base, hydrochloric_acid], vancomycin_hydrochloride, reagents([purified_water_for_injection, absolute_ethanol]), conditions(temperature_c(10), pressure_bar(1), yield_percent(98)), verified(true)).[cite: 5]

reaction(ved_r1, fed_batch_expression, [cho_cell_culture_harvest], purified_antibody_intermediate, reagents([protein_a_resin, sodium_citrate_buffer, low_ph_wash]), conditions(temperature_c(37), pressure_bar(1), titer_g_l(5.4)), verified(true)).[cite: 6]
reaction(ved_r2, downstream_polishing, [purified_antibody_intermediate], vedolizumab, reagents([anion_exchange_membrane, cation_exchange_resin, viral_retention_filter]), conditions(temperature_c(22), pressure_bar(25), yield_percent(88)), verified(true)).[cite: 6]
reaction(ved_r3, ultrafiltration_diafiltration, [vedolizumab, formulation_excipients], vedolizumab_iv_formulation, reagents([l_histidine, sucrose, polysorbate_80, water_for_injection]), conditions(temperature_c(20), pressure_bar(2), yield_percent(96)), verified(true)).[cite: 6]

% ---------------------------------------------------------------------
% NEW RECIPE LISTING PREDICATE
% ---------------------------------------------------------------------

list_recipes :-
    format('~n============================================================~n'),
    format('AVAILABLE INDUSTRIAL SYNTHESIS & BIOPROCESS RECIPES~n'),
    format('============================================================~n'),
    forall(
        recipe_summary(Target, ModelName, Description),
        (
            format('Target Product : ~w~n', [Target]),
            format('Model Plan   : ~w~n', [ModelName]),
            format('Description  : ~w~n', [Description]),
            format('------------------------------------------------------------~n')
        )
    ).

recipe_summary(dexmedetomidine_hcl, dexmedetomidine_industrial_synthesis_model, 'Dexmedetomidine Hydrochloride API Synthesis').[cite: 1]
recipe_summary(prednisone, prednisone_industrial_synthesis_model, 'Prednisone Synthesis (Semi-synthetic Route)').[cite: 2]
recipe_summary(prednisone, soybean_to_prednisone_industrial_pathway, 'Soybean Biomass to Prednisone Pathway').[cite: 3]
recipe_summary(prednisone, yam_to_prednisone_industrial_pathway, 'Yam Biomass to Prednisone Pathway').[cite: 7]
recipe_summary(tofacitinib, xeljanz_industrial_synthesis_model, 'Tofacitinib / Xeljanz Synthesis').[cite: 4]
recipe_summary(vancomycin_hydrochloride, vancomycin_industrial_synthesis_model, 'Vancomycin Hydrochloride Fermentation & Purification').[cite: 5]
recipe_summary(vedolizumab, entyvio_bioprocess_model, 'Vedolizumab Monoclonal Antibody Bioprocess').[cite: 6]

% ---------------------------------------------------------------------
% SMILES PARSING & ENGINE UTILITIES
% ---------------------------------------------------------------------

smiles_parse(S, graph(Atoms, Bonds, Components)) :-
    string_chars(S, Cs),
    parse_components(Cs, Atoms, Bonds, Components).

parse_components(Cs, Atoms, Bonds, Components) :-
    split_components(Cs, Parts),
    parse_component_list(Parts, 1, Atoms, Bonds, Components).

split_components([], [[]]).
split_components(Cs, Parts) :-
    split_components_(Cs, [], Parts).

split_components_([], Current, [Current]).
split_components_(['.'|R], Current, [Current|Parts]) :-
    split_components_(R, [], Parts).
split_components_([C|R], Current, Parts) :-
    append(Current, [C], Next),
    split_components_(R, Next, Parts).

parse_component_list([], _, [], [], []).
parse_component_list([Part|Rest], Offset, Atoms, Bonds, [component(Offset, N)|Components]) :-
    parse_component(Part, LocalAtoms, LocalBonds),
    length(LocalAtoms, N),
    shift_atoms(LocalAtoms, Offset, ShiftedAtoms),
    shift_bonds(LocalBonds, Offset, ShiftedBonds),
    append(ShiftedAtoms, Atoms0, Atoms),
    append(ShiftedBonds, Bonds0, Bonds),
    Offset1 is Offset + N,
    parse_component_list(Rest, Offset1, Atoms0, Bonds0, Components).

shift_atoms([], _, []).
shift_atoms([node(I, A)|R], Offset, [node(J, A)|T]) :-
    J is I + Offset - 1,
    shift_atoms(R, Offset, T).

shift_bonds([], _, []).
shift_bonds([edge(A, B, Type)|R], Offset, [edge(X, Y, Type)|S]) :-
    X is A + Offset - 1,
    Y is B + Offset - 1,
    shift_bonds(R, Offset, S).

parse_component(Cs, Atoms, Bonds) :-
    parse_stream(Cs, none, [], [], [], Atoms, Bonds, []).

parse_stream([], none, _, _, Atoms, Bonds, Atoms, Bonds) :- !.
parse_stream([], _, _, _, _, _, _, _) :-
    throw(error(unclosed_smiles, smiles_parse/2)).
parse_stream(['('|R], Current, Stack, Pending, Atoms, Bonds, AF, BF) :-
    !,
    parse_stream(R, Current, [Current|Stack], Pending, Atoms, Bonds, AF, BF).
parse_stream([')'|R], _, [Parent|Stack], _, Atoms, Bonds, AF, BF) :-
    !,
    parse_stream(R, Parent, Stack, none, Atoms, Bonds, AF, BF).
parse_stream([')'|_], _, [], _, _, _, _, _) :-
    throw(error(unmatched_branch, smiles_parse/2)).
parse_stream(Cs, Current, Stack, Pending, Atoms0, Bonds0, Atoms, Bonds) :-
    bond_prefix(Cs, Pending1, R1),
    parse_atom_or_ring(R1, Current, Pending1, Atoms0, Bonds0, Current1, Bonds1, Atoms1, R2),
    parse_stream(R2, Current1, Stack, none, Atoms1, Bonds1, Atoms, Bonds).

bond_prefix(['-'|R], single, R) :- !.
bond_prefix(['='|R], double, R) :- !.
bond_prefix(['#'|R], triple, R) :- !.
bond_prefix([':'|R], aromatic, R) :- !.
bond_prefix(['~'|R], any, R) :- !.
bond_prefix(R, none, R).

parse_atom_or_ring(Cs, Current, Bond, Atoms, Bonds, Next, BondsF, AtomsF, Rest) :-
    ring_token(Cs, Label, R),
    !,
    close_ring(Label, Current, Bond, Bonds, BondsF),
    Next = Current,
    AtomsF = Atoms,
    Rest = R.
parse_atom_or_ring(Cs, Current, Bond, Atoms0, Bonds0, Next, Bonds, Atoms, Rest) :-
    atom_token(Cs, Atom, Rest),
    length(Atoms0, N),
    Next is N + 1,
    append(Atoms0, [node(Next, Atom)], Atoms),
    connect(Current, Next, Bond, Atoms, Bonds0, Bonds).

atom_token(['['|R], Atom, Rest) :-
    !,
    bracket_body(R, Body, Rest),
    bracket_atom(Body, Atom).
atom_token(['*'|R], atom(0, *, wildcard, 0, 0, none, none), R) :- !.
atom_token(Cs, atom(0, E, K, 0, 0, none, none), Rest) :-
    atom_symbol(Cs, E, K, Rest).

atom_symbol([A, B|R], E, aliphatic, R) :-
    is_upper(A), is_lower(B),
    atom_chars(X, [A, B]), downcase_atom(X, E), element(E, _), !.
atom_symbol([A|R], E, aliphatic, R) :-
    is_upper(A), downcase_atom(A, E), element(E, _), !.
atom_symbol([A, B|R], E, aromatic, R) :-
    is_lower(A), is_lower(B),
    atom_chars(X, [A, B]), downcase_atom(X, E), aromatic(E), !.
atom_symbol([A|R], E, aromatic, R) :-
    is_lower(A), downcase_atom(A, E), aromatic(E), !.
atom_symbol([C|_], _, _, _) :-
    throw(error(invalid_atom(C), smiles_parse/2)).

bracket_body([], _, _) :- throw(error(unclosed_bracket, smiles_parse/2)).
bracket_body([']'|R], [], R) :- !.
bracket_body([C|R], [C|T], Rest) :- bracket_body(R, T, Rest).

bracket_atom(Cs, atom(Isotope, E, K, H, Charge, Chiral, Map)) :-
    isotope(Cs, R1, Isotope),
    bracket_symbol(R1, R2, E, K),
    chirality(R2, R3, Chiral),
    hydrogens(R3, R4, H),
    charge(R4, R5, Charge),
    atom_map(R5, R6, Map),
    R6 = [].

isotope([C|R], Rest, N) :- is_digit(C), !, digits([C|R], Ds, Rest), number_chars(N, Ds).
isotope(R, R, 0).

digits([C|R], [C|Ds], Rest) :- is_digit(C), !, digits(R, Ds, Rest).
digits(R, [], R).

bracket_symbol([A, B|R], R, E, aliphatic) :- is_upper(A), is_lower(B), atom_chars(X, [A, B]), downcase_atom(X, E), element(E, _), !.
bracket_symbol([A|R], R, E, aliphatic) :- is_upper(A), downcase_atom(A, E), element(E, _), !.
bracket_symbol([A, B|R], R, E, aromatic) :- is_lower(A), is_lower(B), atom_chars(X, [A, B]), downcase_atom(X, E), aromatic(E), !.
bracket_symbol([A|R], R, E, aromatic) :- is_lower(A), downcase_atom(A, E), aromatic(E), !.
bracket_symbol(['*'|R], R, *, wildcard).

chirality(['@', '@'|R], R, at_at) :- !.
chirality(['@'|R], R, at) :- !.
chirality(R, R, none).

hydrogens(['H', D|R], R, N) :- is_digit(D), !, atom_number(D, N).
hydrogens(['H'|R], R, 1) :- !.
hydrogens(R, R, 0).

charge(['+', D|R], R, N) :- is_digit(D), !, atom_number(D, N).
charge(['-', D|R], R, N) :- is_digit(D), !, atom_number(D, N0), N is -N0.
charge(['+'|R], R, 1) :- !.
charge(['-'|R], R, -1) :- !.
charge(R, R, 0).

atom_map([':'|R], Rest, N) :- digits(R, Ds, Rest), Ds \= [], number_chars(N, Ds), !.
atom_map(R, R, none).

ring_token(['%', A, B|R], N, R) :- is_digit(A), is_digit(B), number_chars(N, [A, B]), !.
ring_token([D|R], N, R) :- is_digit(D), atom_number(D, N).

close_ring(Label, Current, Bond, Bonds, BondsF) :-
    ring_marker(Label, Other, OldBond),
    !,
    compatible_ring_bond(OldBond, Bond, FinalBond),
    retract_ring_marker(Label, Other, OldBond),
    append(Bonds, [edge(Other, Current, FinalBond)], BondsF).
close_ring(Label, Current, Bond, Bonds, Bonds) :-
    assert_ring_marker(Label, Current, Bond).

:- dynamic ring_marker/3.

retract_ring_marker(Label, Other, Bond) :- retractall(ring_marker(Label, Other, Bond)).
assert_ring_marker(Label, Current, Bond) :- assertz(ring_marker(Label, Current, Bond)).

compatible_ring_bond(none, none, single).
compatible_ring_bond(none, B, B) :- B \= none.
compatible_ring_bond(B, none, B) :- B \= none.
compatible_ring_bond(B, B, B) :- B \= none.
compatible_ring_bond(A, B, _) :- A \= B, throw(error(conflicting_ring_bonds(A, B), smiles_parse/2)).

connect(none, _, _, _, Bonds, Bonds).
connect(Current, Next, none, Atoms, Bonds0, Bonds) :-
    default_bond(Current, Next, Atoms, Bond),
    append(Bonds0, [edge(Current, Next, Bond)], Bonds).
connect(Current, Next, Bond, _, Bonds0, Bonds) :-
    Bond \= none,
    append(Bonds0, [edge(Current, Next, Bond)], Bonds).

default_bond(A, B, Atoms, aromatic) :-
    memberchk(node(A, atom(_, E1, aromatic, _, _, _, _)), Atoms),
    memberchk(node(B, atom(_, E2, aromatic, _, _, _, _)), Atoms),
    aromatic(E1), aromatic(E2), !.
default_bond(_, _, _, single).

main :-
    list_recipes.
