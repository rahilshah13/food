is_upper(C) :- (atom(C) -> atom_codes(C, [Cd]) ; Cd = C), Cd >= 65, Cd <= 90.
is_lower(C) :- (atom(C) -> atom_codes(C, [Cd]) ; Cd = C), Cd >= 97, Cd <= 122.
is_digit(C) :- (atom(C) -> atom_codes(C, [Cd]) ; Cd = C), Cd >= 48, Cd <= 57.

element(h,1.008). element(c,12.011). element(n,14.007). element(o,15.999).
element(f,18.998). element(si,28.085). element(p,30.974). element(s,32.060).
element(cl,35.450). element(k,39.098). element(ti,47.867). element(fe,55.845).
element(cu,63.546). element(br,79.904). element(i,126.904). element(cr,51.996).

aromatic(b). aromatic(c). aromatic(n). aromatic(o). aromatic(p). aromatic(s).

molecule(linolenic_acid, 'CCC=CC=CC=CCCCCCCCC(=O)O', 'Drying Oil Precursor', 'C18H30O2', 278.43, 0).
molecule(alkyd_resin_polymer, 'O=C(OCC(CO)OC(=O)c1ccccc1)CCCC=CC=CC=CCCCCCCCC', 'Alkyd Polyester Unit', 'C29H40O7', 500.63, 6).
molecule(acrylic_polymer, 'CC(C)(C(=O)OC)CC(C)(C(=O)OC)C', 'Acrylic Polymer Segment', 'C10H16O4', 200.23, 2).
molecule(cured_epoxy_network, 'CC(C)(c1ccc(OCC(O)CNCCNCCNCC(O)COc2ccc(C3(C)C)cc2)cc1)', 'Epoxy-Amine Network', 'C27H42N4O4', 486.65, 4).
molecule(polyurethane_resin, 'O=C=NCC1CC(CNC=O)CC1', 'Polyurethane Prepolymer', 'C10H14N2O2', 194.23, 2).
molecule(nitrocellulose, 'CC(O)C1(O)C(O)C(O)C(O)C1OOB(=O)O', 'Cellulose Nitrate', 'C6H9NO5', 175.14, 3).
molecule(lac_resin, 'CC1CC2CCC3C(C2(C)C)C1(C)O3', 'Natural Lac Resin', 'C16H26O4', 278.38, 4).
molecule(potassium_silicate, '[O-][Si]([O-])([O-])[O-].[K+].[K+]', 'Potassium Water Glass', 'K2SiO3', 154.28, 0).
molecule(casein_protein, 'NCC(=O)NCC(=O)NCC(=O)N', 'Milk Casein Network', 'C12H21N5O6', 331.33, 2).
molecule(silicone_resin, 'C[Si](C)(O)[Si](C)(C)O', 'Siloxane Polymer', 'C4H14OSi2', 134.31, 0).
molecule(pvdf_polymer, 'FC=C.FC=C.FC=C', 'PVDF Fluoropolymer', 'C6H3F3', 164.08, 0).

binder_density(_, 1.15).

% pigment(Name, SMILES, Description, Formula, MW, Stage, RGB_Tuple, Density)
pigment(titanium_dioxide, '[O-][Ti+4][O-]', 'Rutile White', 'TiO2', 79.87, high_shear_dispersion, rgb(255,255,255), 4.2).
pigment(carbon_black, 'C', 'Carbon Black', 'C', 12.01, high_shear_dispersion, rgb(0,0,0), 1.8).
pigment(iron_oxide_red, '[Fe+3].[Fe+3].[O-2].[O-2].[O-2]', 'Hematite Red', 'Fe2O3', 159.69, high_shear_dispersion, rgb(178,34,34), 5.1).
pigment(phthalocyanine_blue, 'c1ccc2c(c1)c3nc4[nH]c5ccccc5n4c3c2', 'Copper Phthalocyanine Blue', 'C32H16N8', 512.54, let_down_tinting, rgb(0,0,128), 1.6).
pigment(natural_chalk_calcite, 'O=C([O-])[O-].[Ca+2]', 'Calcium Carbonate', 'CaCO3', 100.09, initial_charge, rgb(245,245,245), 2.7).
pigment(hansa_yellow, 'CC(=O)C(N=Nc1ccc(cc1)[N+](=O)[O-])C(=O)Nc2c(C)cc(cc2)Cl', 'Hansa Yellow G', 'C17H17ClN4O4', 372.80, let_down_tinting, rgb(255,215,0), 1.5).
pigment(chrome_green, '[Cr+3].[Cr+3].[O-2].[O-2].[O-2].[O-2]', 'Chromium Oxide Green', 'Cr2O3', 151.99, high_shear_dispersion, rgb(46,139,87), 5.2).
pigment(quinacridone_magenta, 'c1ccc2c(c1)c3c(nc4cc5c(cc43)NC(=O)C=C5)NC2=O', 'Quinacridone Magenta', 'C20H12N2O2', 312.33, let_down_tinting, rgb(199,21,133), 1.4).
pigment(burnt_umber, 'Fe2O3.MnO2.nH2O', 'Natural Burnt Umber', 'FeMnO3', 246.85, high_shear_dispersion, rgb(139,69,19), 3.8).
pigment(cadmium_orange, '[Cd+2].[S-2]', 'Cadmium Sulfosenede Orange', 'CdS', 144.48, high_shear_dispersion, rgb(255,140,0), 4.9).
pigment(ultramarine_blue, 'Na8Al6Si6O24S4', 'Synthetic Ultramarine Blue', 'Na8Al6Si6O24S4', 916.94, let_down_tinting, rgb(65,105,225), 2.3).
pigment(dioxazine_violet, 'c1ccc2c(c1)nc3c4ccccc4nc(=O)c5ccccc5n32', 'Dioxazine Violet', 'C34H22Cl2N2O2', 557.47, let_down_tinting, rgb(138,43,226), 1.5).

compatible_pigment(_, _). 

paint_type(oil_based, linolenic_acid, slow, high_gloss, 16.0).
paint_type(alkyd, alkyd_resin_polymer, moderate, tough_satin, 12.0).
paint_type(acrylic, acrylic_polymer, fast, flexible_matte, 2.0).
paint_type(latex, acrylic_polymer, fast, water_borne_matte, 1.0).
paint_type(vinyl_acrylic, acrylic_polymer, fast, economical_flat, 1.5).
paint_type(pva, acrylic_polymer, fast, porous_primer, 1.0).
paint_type(enamel, alkyd_resin_polymer, moderate, hard_gloss, 14.0).
paint_type(epoxy, cured_epoxy_network, fast, rigid_chemical_resistant, 24.0).
paint_type(polyurethane, polyurethane_resin, moderate, abrasion_resistant, 18.0).
paint_type(urethane_alkyd, alkyd_resin_polymer, moderate, hybrid_tough, 10.0).
paint_type(lacquer, nitrocellulose, very_fast, smooth_solvent_gloss, 0.5).
paint_type(shellac, lac_resin, very_fast, natural_resin_seal, 0.5).
paint_type(varnish, linolenic_acid, slow, transparent_gloss, 12.0).
paint_type(polyurethane_varnish, polyurethane_resin, moderate, heavy_wear_resistant, 16.0).
paint_type(spar_varnish, linolenic_acid, slow, marine_flexible_uv, 24.0).
paint_type(stain, linolenic_acid, fast, low_pigment_penetrating, 4.0).
paint_type(gel_stain, alkyd_resin_polymer, moderate, non_drip_surface, 8.0).
paint_type(milk_paint, casein_protein, fast, chalky_protein, 2.0).
paint_type(chalk_paint, acrylic_polymer, fast, ultra_matte, 1.0).
paint_type(mineral_paint, potassium_silicate, fast, breathable_silicate, 3.0).
paint_type(silicate_paint, potassium_silicate, fast, permanent_petrified, 4.0).
paint_type(casein_paint, casein_protein, fast, protein_bound, 2.0).
paint_type(tempera_paint, casein_protein, fast, water_soluble_egg, 1.0).
paint_type(gouache, acrylic_polymer, fast, heavy_matte, 1.0).
paint_type(watercolor, acrylic_polymer, very_fast, transparent_wash, 0.5).
paint_type(acrylic_gouache, acrylic_polymer, fast, velvety_water_resistant, 1.5).
paint_type(encaustic_paint, linolenic_acid, very_fast, hot_wax_fused, 0.2).
paint_type(fresco_paint, potassium_silicate, moderate, wet_plaster_integral, 6.0).
paint_type(casein_lime_paint, casein_protein, moderate, exterior_lime_wash, 8.0).
paint_type(distemper_paint, casein_protein, fast, glue_size_chalk, 2.0).
paint_type(silicone_paint, silicone_resin, moderate, vapor_permeable_repellent, 12.0).
paint_type(fluoropolymer, pvdf_polymer, slow, extreme_weather_pvdf, 20.0).
paint_type(intumescent_paint, cured_epoxy_network, moderate, fire_retardant_char, 24.0).
paint_type(thermal_barrier_paint, acrylic_polymer, fast, ceramic_microsphere, 4.0).
paint_type(anti_condensation_paint, acrylic_polymer, fast, moisture_absorbing, 3.0).
paint_type(anti_graffiti_paint, polyurethane_resin, moderate, low_surface_energy, 10.0).
paint_type(anti_fouling_paint, cured_epoxy_network, slow, marine_biocide, 36.0).
paint_type(rust_converter, cured_epoxy_network, fast, iron_oxide_stabilizer, 6.0).
paint_type(hammered_paint, alkyd_resin_polymer, moderate, dimpled_metallic, 8.0).
paint_type(textured_paint, acrylic_polymer, moderate, aggregate_filled, 4.0).
paint_type(luminous_paint, acrylic_polymer, fast, phosphorescent_glow, 3.0).
paint_type(fluorescent_paint, acrylic_polymer, fast, high_visibility_uv, 2.0).
paint_type(reflective_paint, acrylic_polymer, fast, glass_bead_retroreflective, 3.0).
paint_type(thermographic_paint, acrylic_polymer, fast, temperature_sensitive, 2.0).
paint_type(magnetic_paint, cured_epoxy_network, fast, iron_particle_primer, 5.0).
paint_type(dry_erase_paint, polyurethane_resin, slow, two_component_whiteboard, 48.0).
paint_type(chalkboard_paint, alkyd_resin_polymer, moderate, durable_erase, 12.0).
paint_type(plastic_paint, acrylic_polymer, moderate, heat_cured_pvc, 8.0).
paint_type(bituminous_paint, linolenic_acid, slow, waterproof_tar, 24.0).
paint_type(ceramic_paint, cured_epoxy_network, slow, high_temperature_thermal, 24.0).
paint_type(metallic_paint, alkyd_resin_polymer, moderate, real_metal_flake, 10.0).

% Expressive Manufacturing Protocols by Binder Class
binder_protocol(linolenic_acid, 
    'Oxidative Oil-Based / Encaustic Thermal Cure',
    [thermal_melting_vat, heated_palette, cowles_dissolver, Gardner_tubes],
    [
      'Melt raw drying oil/wax binder matrix at 75°C under controlled thermal jacket.',
      'Blend mineral extenders and ground pigments into molten phase under moderate shear.',
      'Add metallic cobalt siccative driers to catalyze cross-linking via atmospheric oxygen absorption.',
      'Cast or package into sealed containers while maintaining thermal viscosity.'
    ]
).

binder_protocol(lac_resin,
    'Alcohol Dissolution & Polymer Cutting',
    [stainless_steel_dissolution_tank, anchor_agitator, 100_mesh_strainer, refractometer],
    [
      'Charge dissolution vessel with anhydrous denatured alcohol solvent.',
      'Slowly add natural lac flakes under slow anchor agitation over 4 hours until fully dissolved.',
      'Incorporate fine pigment dispersions into the alcoholic resin solution.',
      'Filter through a 100-mesh strainer to remove insoluble insect debris and impurities.'
    ]
).

binder_protocol(nitrocellulose,
    'Solvent Evaporation Lacquer Formulation',
    [explosion_proof_mixer, solvent_recovery_condenser, high_speed_disperser, viscometer],
    [
      'Charge nitrocellulose resin into ester/ketone solvent blend (butyl acetate and acetone) under explosion-proof agitation.',
      'Slowly disperse dry pigments into mill base; mill until Hegman gauge exceeds 7.',
      'Perform let-down with plasticizers and fast-evaporating thinners.',
      'Test viscosity and solids content prior to pressure-vessel packaging.'
    ]
).

binder_protocol(potassium_silicate,
    'Alkaline Silicate Petrification Reaction',
    [ceramic_lined_reactor, paddle_mixer, pH_meter, moisture_analyzer],
    [
      'Charge potassium water glass solution into ceramic-lined reactor.',
      'Blend mineral earth pigments and calcium carbonate extenders under gentle paddle mixing.',
      'Adjust alkalinity and viscosity with stabilizing additives to prevent premature gelation.',
      'Package in airtight containers; curing occurs via atmospheric carbon dioxide petrification.'
    ]
).

binder_protocol(casein_protein,
    'Protein Precipitation & Lime Slaking',
    [stainless_steel_vat, high_shear_emulsifier, cooling_jacket, viscometer],
    [
      'Hydrate milk casein protein in warm water with hydrated lime alkali activator.',
      'Allow protein chains to unwind and saponify under controlled temperature.',
      'Incorporate earth pigments and chalk extenders into the creamy protein emulsion.',
      'Package fresh; film hardens via moisture evaporation and irreversible protein cross-linking.'
    ]
).

binder_protocol(cured_epoxy_network,
    'Two-Component Thermoset Polyaddition',
    [dual_chamber_mixing_vessel, metering_pump, industrial_balance, differential_scanning_calorimeter],
    [
      'Weigh Component A (epoxy base resin with dispersed pigments) and Component B (amine hardener) to exact stoichiometric ratio.',
      'Mix under vacuum to eliminate air entrapment and prevent exothermic runaway.',
      'Monitor pot life strictly; apply or package immediately prior to polyaddition curing.'
    ]
).

% Default fallback protocol for standard synthetic emulsions (acrylics, alkyds, polyurethanes, etc.)
binder_protocol(_,
    'Standard Industrial Dispersion & Let-Down',
    [glass_lined_reactor, high_speed_cowles_dissolver, horizontal_media_mill, viscometer],
    [
      'Charge reactor with liquid synthetic resin binders, surfactants, and co-solvents.',
      'Slowly introduce pigments and extenders under high-speed Cowles dissolution shear.',
      'Pass mill base through a horizontal media mill until Hegman fineness gauge reaches 7+.',
      'Execute let-down phase with remaining solvents, driers, and rheology modifiers.'
    ]
).

finish_target_pvc(high_gloss, 0.15).
finish_target_pvc(hard_gloss, 0.18).
finish_target_pvc(smooth_solvent_gloss, 0.15).
finish_target_pvc(transparent_gloss, 0.05).
finish_target_pvc(tough_satin, 0.32).
finish_target_pvc(flexible_matte, 0.48).
finish_target_pvc(water_borne_matte, 0.48).
finish_target_pvc(economical_flat, 0.62).
finish_target_pvc(porous_primer, 0.55).
finish_target_pvc(_, 0.40).

cpvc_threshold(0.58).

hex_to_rgb(HexAtom, rgb(R,G,B)) :-
    atom_chars(HexAtom, ['#'|Chars]),
    Chars = [R1,R2,G1,G2,B1,B2],
    number_codes(R, [R1,R2], 16),
    number_codes(G, [G1,G2], 16),
    number_codes(B, [B1,B2], 16).

number_codes(Val, [C1,C2], Base) :-
    hex_val(C1, V1),
    hex_val(C2, V2),
    Val is V1 * Base + V2.

hex_val(C, V) :-
    char_code(C, Code),
    (   Code >= 48, Code <= 57 -> V is Code - 48
    ;   Code >= 65, Code <= 70 -> V is Code - 55
    ;   Code >= 97, Code <= 102 -> V is Code - 87
    ).

select_pigment(HexCode, PaintType, PigmentName) :-
    paint_type(PaintType, BaseChem, _, _, _),
    hex_to_rgb(HexCode, TargetRGB),
    findall(
        dist(Dist, Pig),
        (
            pigment(Pig, _, _, _, _, _, PigRGB, _),
            compatible_pigment(Pig, BaseChem),
            rgb_distance(TargetRGB, PigRGB, Dist)
        ),
        Distances
    ),
    keysort(Distances, [dist(_, PigmentName)|_]).

rgb_distance(rgb(R1,G1,B1), rgb(R2,G2,B2), Dist) :-
    Dist is (R1 - R2)*(R1 - R2) + (G1 - G2)*(G1 - G2) + (B1 - B2)*(B1 - B2).

print_steps([], _).
print_steps([H|T], N) :-
    format('    ~w. ~w~n', [N, H]),
    N1 is N + 1,
    print_steps(T, N1).

plan_paint_batch(HexCode) :-
    format('~n============================================================~n'),
    format('PAINT INDUSTRIAL SYNTHESIS SUITE | HEX CODE: ~w (EXPRESSIVE v10.0)~n', [HexCode]),
    format('============================================================~n'),
    forall(
        paint_type(PaintType, BaseChem, DryingSpeed, Finish, CureDays),
        (
            select_pigment(HexCode, PaintType, PigmentName),
            molecule(BaseChem, BSMILES, BDesc, BForm, BMW, _),
            pigment(PigmentName, PSMILES, PDesc, PForm, PMW, IntroStage, _, PigDensity),
            binder_density(BaseChem, BinderDensity),
            finish_target_pvc(Finish, TargetPVC),
            cpvc_threshold(CPVC),
            
            % Resolve binder-specific expressive manufacturing protocol
            (   binder_protocol(BaseChem, ProcTitle, Equipment, Steps) -> true
            ;   binder_protocol(_, ProcTitle, Equipment, Steps)
            ),

            TotalVolL = 10.0,
            VolSolids is TotalVolL * 0.80,
            VolPigment is VolSolids * TargetPVC,
            VolBinder is VolSolids * (1.0 - TargetPVC),
            MassPigment is VolPigment * PigDensity,
            MassBinder is VolBinder * BinderDensity,
            SolventVol is TotalVolL * 0.20,
            
            (   TargetPVC =< CPVC -> PVCStatus = 'Below CPVC (Gloss/Sealed Film)'
            ;   PVCStatus = 'Above CPVC (Matte/Porous Film)'
            ),

            format('~n[PAINT TYPE: ~w] Finish: ~w~n', [PaintType, Finish]),
            format('  [BINDER] ~w (~w) | MW: ~2f g/mol | Density: ~2fg/cm3~n', [BaseChem, BDesc, BMW, BinderDensity]),
            format('    SMILES: ~w | Formula: ~w~n', [BSMILES, BForm]),
            format('  [MATCHED PIGMENT] ~w (~w) | MW: ~2f g/mol | Density: ~2fg/cm3~n', [PigmentName, PDesc, PMW, PigDensity]),
            format('    SMILES: ~w | Formula: ~w | Stage: ~w~n', [PSMILES, PForm, IntroStage]),
            format('  [PVC CURVE METRICS] Target PVC: ~2f% | CPVC Limit: ~2f% | Status: ~w~n', [TargetPVC * 100, CPVC * 100, PVCStatus]),
            format('  [SCALED INGR (10L)] ~2f kg binder | ~2f kg pigment | ~2f L solvent~n', [MassBinder, MassPigment, SolventVol]),
            format('  [EQUIPMENT MANIFEST] ~w~n', [Equipment]),
            format('  [MANUFACTURING PROTOCOL: ~w]~n', [ProcTitle]),
            print_steps(Steps, 1),
            format('  [CURE PROFILE] Speed: ~w. Full chemical cure: ~w days.~n', [DryingSpeed, CureDays])
        )
    ).

main :-
    plan_paint_batch('#D2B48C').
