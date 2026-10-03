% ============================================================================
% UNIFIED COMBINED PROLOG ENGINE: ALLOY, BATTERY, AND SMILES MODULES
% ============================================================================

% ----------------------------------------------------------------------------
% 1. PERIODIC TABLE DATABASE (Superset with Crystal Structure & Category)
% ----------------------------------------------------------------------------
element(h, [aw(1.008), cs(hcp), cat(nonmetal)]).
element(he, [aw(4.0026), cs(hcp), cat(noble_gas)]).
element(li, [aw(6.94), cs(bcc), cat(alkali_metal)]).
element(be, [aw(9.0122), cs(hcp), cat(alkaline_earth)]).
element(b, [aw(10.81), cs(hcp), cat(metalloid)]).
element(c, [aw(12.011), cs(hcp), cat(nonmetal)]).
element(n, [aw(14.007), cs(hcp), cat(nonmetal)]).
element(o, [aw(15.999), cs(hcp), cat(nonmetal)]).
element(f, [aw(18.998), cs(hcp), cat(halogen)]).
element(ne, [aw(20.180), cs(fcc), cat(noble_gas)]).
element(na, [aw(22.990), cs(bcc), cat(alkali_metal)]).
element(mg, [aw(24.305), cs(hcp), cat(alkaline_earth)]).
element(al, [aw(26.982), cs(fcc), cat(post_transition)]).
element(si, [aw(28.085), cs(diamond_cubic), cat(metalloid)]).
element(p, [aw(30.974), cs(hcp), cat(nonmetal)]).
element(s, [aw(32.06), cs(hcp), cat(nonmetal)]).
element(cl, [aw(35.45), cs(hcp), cat(halogen)]).
element(ar, [aw(39.95), cs(fcc), cat(noble_gas)]).
element(k, [aw(39.098), cs(bcc), cat(alkali_metal)]).
element(ca, [aw(40.078), cs(fcc), cat(alkaline_earth)]).
element(sc, [aw(44.956), cs(hcp), cat(transition_metal)]).
element(ti, [aw(47.867), cs(hcp), cat(transition_metal)]).
element(v, [aw(50.942), cs(bcc), cat(transition_metal)]).
element(cr, [aw(51.996), cs(bcc), cat(transition_metal)]).
element(mn, [aw(54.938), cs(bcc), cat(transition_metal)]).
element(fe, [aw(55.845), cs(bcc), cat(transition_metal)]).
element(co, [aw(58.933), cs(hcp), cat(transition_metal)]).
element(ni, [aw(58.693), cs(fcc), cat(transition_metal)]).
element(cu, [aw(63.546), cs(fcc), cat(transition_metal)]).
element(zn, [aw(65.38), cs(hcp), cat(transition_metal)]).
element(ga, [aw(69.723), cs(orthorhombic), cat(post_transition)]).
element(ge, [aw(72.630), cs(diamond_cubic), cat(metalloid)]).
element(as, [aw(74.922), cs(rhombohedral), cat(metalloid)]).
element(se, [aw(78.971), cs(hexagonal), cat(nonmetal)]).
element(br, [aw(79.904), cs(orthorhombic), cat(halogen)]).
element(kr, [aw(83.800), cs(fcc), cat(noble_gas)]).
element(rb, [aw(85.468), cs(bcc), cat(alkali_metal)]).
element(sr, [aw(87.62), cs(fcc), cat(alkaline_earth)]).
element(y, [aw(88.906), cs(hcp), cat(transition_metal)]).
element(zr, [aw(91.224), cs(hcp), cat(transition_metal)]).
element(nb, [aw(92.906), cs(bcc), cat(transition_metal)]).
element(mo, [aw(95.95), cs(bcc), cat(transition_metal)]).
element(tc, [aw(98.0), cs(hcp), cat(transition_metal)]).
element(ru, [aw(101.07), cs(hcp), cat(transition_metal)]).
element(rh, [aw(102.91), cs(fcc), cat(transition_metal)]).
element(pd, [aw(106.42), cs(fcc), cat(transition_metal)]).
element(ag, [aw(107.87), cs(fcc), cat(transition_metal)]).
element(cd, [aw(112.41), cs(hcp), cat(transition_metal)]).
element(in, [aw(114.82), cs(tetragonal), cat(post_transition)]).
element(sn, [aw(118.71), cs(tetragonal), cat(post_transition)]).
element(sb, [aw(121.76), cs(rhombohedral), cat(metalloid)]).
element(te, [aw(127.60), cs(hexagonal), cat(metalloid)]).
element(i, [aw(126.90), cs(orthorhombic), cat(halogen)]).
element(xe, [aw(131.29), cs(fcc), cat(noble_gas)]).
element(cs, [aw(132.91), cs(bcc), cat(alkali_metal)]).
element(ba, [aw(137.33), cs(bcc), cat(alkaline_earth)]).
element(la, [aw(138.91), cs(hcp), cat(lanthanide)]).
element(ce, [aw(140.12), cs(fcc), cat(lanthanide)]).
element(pr, [aw(140.91), cs(hcp), cat(lanthanide)]).
element(nd, [aw(144.24), cs(hcp), cat(lanthanide)]).
element(pm, [aw(145.0), cs(hcp), cat(lanthanide)]).
element(sm, [aw(150.36), cs(rhombohedral), cat(lanthanide)]).
element(eu, [aw(151.96), cs(bcc), cat(lanthanide)]).
element(gd, [aw(157.25), cs(hcp), cat(lanthanide)]).
element(tb, [aw(158.93), cs(hcp), cat(lanthanide)]).
element(dy, [aw(162.50), cs(hcp), cat(lanthanide)]).
element(ho, [aw(164.93), cs(hcp), cat(lanthanide)]).
element(er, [aw(167.26), cs(hcp), cat(lanthanide)]).
element(tm, [aw(168.93), cs(hcp), cat(lanthanide)]).
element(yb, [aw(173.05), cs(fcc), cat(lanthanide)]).
element(lu, [aw(174.97), cs(hcp), cat(lanthanide)]).
element(hf, [aw(178.49), cs(hcp), cat(transition_metal)]).
element(ta, [aw(180.95), cs(bcc), cat(transition_metal)]).
element(w, [aw(183.84), cs(bcc), cat(transition_metal)]).
element(re, [aw(186.21), cs(hcp), cat(transition_metal)]).
element(os, [aw(190.23), cs(hcp), cat(transition_metal)]).
element(ir, [aw(192.22), cs(fcc), cat(transition_metal)]).
element(pt, [aw(195.08), cs(fcc), cat(transition_metal)]).
element(au, [aw(196.97), cs(fcc), cat(transition_metal)]).
element(hg, [aw(200.59), cs(rhombohedral), cat(transition_metal)]).
element(tl, [aw(204.38), cs(hcp), cat(post_transition)]).
element(pb, [aw(207.2), cs(fcc), cat(post_transition)]).
element(bi, [aw(208.98), cs(rhombohedral), cat(post_transition)]).
element(po, [aw(209.0), cs(simple_cubic), cat(post_transition)]).
element(at, [aw(210.0), cs(hcp), cat(halogen)]).
element(rn, [aw(222.0), cs(fcc), cat(noble_gas)]).
element(fr, [aw(223.0), cs(bcc), cat(alkali_metal)]).
element(ra, [aw(226.0), cs(bcc), cat(alkaline_earth)]).
element(ac, [aw(227.0), cs(fcc), cat(actinide)]).
element(th, [aw(232.04), cs(fcc), cat(actinide)]).
element(pa, [aw(231.04), cs(tetragonal), cat(actinide)]).
element(u, [aw(238.03), cs(orthorhombic), cat(actinide)]).
element(np, [aw(237.0), cs(orthorhombic), cat(actinide)]).
element(pu, [aw(244.0), cs(monoclinic), cat(actinide)]).
element(am, [aw(243.0), cs(hexagonal), cat(actinide)]).
element(cm, [aw(247.0), cs(hcp), cat(actinide)]).
element(bk, [aw(247.0), cs(hcp), cat(actinide)]).
element(cf, [aw(251.0), cs(hcp), cat(actinide)]).
element(es, [aw(252.0), cs(hcp), cat(actinide)]).
element(fm, [aw(257.0), cs(hcp), cat(actinide)]).
element(md, [aw(258.0), cs(hcp), cat(actinide)]).
element(no, [aw(259.0), cs(hcp), cat(actinide)]).
element(lr, [aw(266.0), cs(hcp), cat(actinide)]).
element(rf, [aw(267.0), cs(hcp), cat(transition_metal)]).
element(db, [aw(268.0), cs(bcc), cat(transition_metal)]).
element(sg, [aw(271.0), cs(bcc), cat(transition_metal)]).
element(bh, [aw(270.0), cs(hcp), cat(transition_metal)]).
element(hs, [aw(277.0), cs(hcp), cat(transition_metal)]).
element(mt, [aw(278.0), cs(hcp), cat(transition_metal)]).
element(ds, [aw(281.0), cs(hcp), cat(transition_metal)]).
element(rg, [aw(282.0), cs(hcp), cat(transition_metal)]).
element(cn, [aw(285.0), cs(hcp), cat(transition_metal)]).
element(nh, [aw(286.0), cs(hcp), cat(post_transition)]).
element(fl, [aw(289.0), cs(hcp), cat(post_transition)]).
element(mc, [aw(290.0), cs(hcp), cat(post_transition)]).
element(lv, [aw(293.0), cs(hcp), cat(post_transition)]).
element(ts, [aw(294.0), cs(hcp), cat(halogen)]).
element(og, [aw(294.0), cs(hcp), cat(noble_gas)]).

% ----------------------------------------------------------------------------
% 2. SHARED MOLE & ATOMIC PERCENTAGE COMPUTATION UTILITIES
% ----------------------------------------------------------------------------
compute_atomic_percentages([], []).
compute_atomic_percentages(MassList, Atomics) :-
    maplist(safe_get_moles, MassList, MoleList),
    sum_list_second(MoleList, TotalMoles),
    ( TotalMoles > 0 ->
        maplist(normalize_mole(TotalMoles), MoleList, Atomics)
    ;   throw(error(zero_total_moles, compute_atomic_percentages))
    ).

safe_get_moles((El, Mass), (El, Moles)) :-
    ( element(El, Properties) ->
        ( member(aw(AW), Properties) ->
            ( NumericAW is AW, NumericAW > 0 ->
                Moles is Mass / NumericAW
            ; throw(error(invalid_atomic_weight, El))
            )
        ; throw(error(missing_atomic_weight_property, El))
        )
    ; throw(error(element_not_found_in_database, El))
    ).

sum_list_second([], 0).
sum_list_second([(_, M)|T], Total) :-
    sum_list_second(T, Rest),
    Total is M + Rest.

normalize_mole(TotalMoles, (El, Moles), (El, AtPct)) :-
    AtPct is (Moles / TotalMoles) * 100.

% ----------------------------------------------------------------------------
% 3. ALLOY MECHANICAL PROPERTY ENGINE
% ----------------------------------------------------------------------------
compute_phase_fractions(Atomics, FCCFraction, BCCFraction, HCPFraction) :-
    sum_stabilizers(Atomics, fcc_stabilizer, FCCScore),
    sum_stabilizers(Atomics, bcc_stabilizer, BCCScore),
    sum_stabilizers(Atomics, hcp_stabilizer, HCPScore),
    TotalScore is FCCScore + BCCScore + HCPScore,
    ( TotalScore > 0 ->
        FCCFraction is FCCScore / TotalScore,
        BCCFraction is BCCScore / TotalScore,
        HCPFraction is HCPScore / TotalScore
    ;   FCCFraction = 0.33, BCCFraction = 0.34, HCPFraction = 0.33
    ).

sum_stabilizers(Atomics, StabilizerType, TotalScore) :-
    findall(Score, (
        member((El, AtPct), Atomics),
        call(StabilizerType, El),
        Score = AtPct
    ), Scores),
    sum_list(Scores, TotalScore).

fcc_stabilizer(ni). fcc_stabilizer(mn). fcc_stabilizer(c). fcc_stabilizer(cu). fcc_stabilizer(au). fcc_stabilizer(ag). fcc_stabilizer(pt). fcc_stabilizer(pd). fcc_stabilizer(al). fcc_stabilizer(pb). fcc_stabilizer(rh). fcc_stabilizer(ir). fcc_stabilizer(ca). fcc_stabilizer(sr). fcc_stabilizer(th). fcc_stabilizer(ac).
bcc_stabilizer(cr). bcc_stabilizer(mo). bcc_stabilizer(si). bcc_stabilizer(w). bcc_stabilizer(v). bcc_stabilizer(fe). bcc_stabilizer(ta). bcc_stabilizer(nb). bcc_stabilizer(k). bcc_stabilizer(na). bcc_stabilizer(li). bcc_stabilizer(rb). bcc_stabilizer(cs). bcc_stabilizer(ba). bcc_stabilizer(eu). bcc_stabilizer(db). bcc_stabilizer(sg).
hcp_stabilizer(ti). hcp_stabilizer(mg). hcp_stabilizer(zn). hcp_stabilizer(zr). hcp_stabilizer(co). hcp_stabilizer(cd). hcp_stabilizer(hf). hcp_stabilizer(ru). hcp_stabilizer(re). hcp_stabilizer(os). hcp_stabilizer(sc). hcp_stabilizer(y). hcp_stabilizer(tc). hcp_stabilizer(la). hcp_stabilizer(ce). hcp_stabilizer(pr). hcp_stabilizer(nd). hcp_stabilizer(pm). hcp_stabilizer(gd). hcp_stabilizer(tb). hcp_stabilizer(dy). hcp_stabilizer(ho). hcp_stabilizer(er). hcp_stabilizer(tm). hcp_stabilizer(lu). hcp_stabilizer(cm). hcp_stabilizer(bk). hcp_stabilizer(cf). hcp_stabilizer(es). hcp_stabilizer(fm). hcp_stabilizer(md). hcp_stabilizer(no). hcp_stabilizer(lr). hcp_stabilizer(rf). hcp_stabilizer(bh). hcp_stabilizer(hs). hcp_stabilizer(mt). hcp_stabilizer(ds). hcp_stabilizer(rg). hcp_stabilizer(cn). hcp_stabilizer(nh). hcp_stabilizer(fl). hcp_stabilizer(mc). hcp_stabilizer(lv). hcp_stabilizer(ts). hcp_stabilizer(og).

estimate_mechanical_properties(MassList, EstimatedDuctility, EstimatedMalleability) :-
    compute_atomic_percentages(MassList, Atomics),
    compute_phase_fractions(Atomics, FCCFrac, BCCFrac, HCPFrac),
    base_ductility(fcc_austenite, FCC_EL),
    base_ductility(bcc_ferrite, BCC_EL),
    base_ductility(hcp_matrix, HCP_EL),
    base_malleability(fcc_austenite, FCC_Mal),
    base_malleability(bcc_ferrite, BCC_Mal),
    base_malleability(hcp_matrix, HCP_Mal),
    CompositeBaseEL is (FCCFrac * FCC_EL) + (BCCFrac * BCC_EL) + (HCPFrac * HCP_EL),
    CompositeBaseMal is (FCCFrac * FCC_Mal) + (BCCFrac * BCC_Mal) + (HCPFrac * HCP_Mal),
    calculate_nonlinear_alloy_penalties(Atomics, DuctilityPenalty),
    calculate_malleability_penalties(Atomics, MalleabilityPenalty),
    EstimatedDuctility is max(2.0, CompositeBaseEL - DuctilityPenalty),
    EstimatedMalleability is max(1.0, CompositeBaseMal - MalleabilityPenalty).

base_ductility(fcc_austenite, 45.0).  
base_ductility(bcc_ferrite, 22.0).    
base_ductility(hcp_matrix, 12.0).    

base_malleability(fcc_austenite, 90.0). 
base_malleability(bcc_ferrite, 55.0).   
base_malleability(hcp_matrix, 30.0).    

calculate_nonlinear_alloy_penalties(Atomics, TotalPenalty) :-
    findall(EffectivePenalty, (
        member((El, AtPct), Atomics),
        solute_penalty_config(El, BaseFactor, SolubleLimit),
        EffectivePenalty is non_linear_penalty_calc(AtPct, BaseFactor, SolubleLimit)
    ), Penalties),
    sum_list(Penalties, TotalPenalty).

calculate_malleability_penalties(Atomics, TotalPenalty) :-
    findall(EffectivePenalty, (
        member((El, AtPct), Atomics),
        malleability_penalty_config(El, BaseFactor, SolubleLimit),
        EffectivePenalty is non_linear_penalty_calc(AtPct, BaseFactor, SolubleLimit)
    ), Penalties),
    sum_list(Penalties, TotalPenalty).

non_linear_penalty_calc(AtPct, BaseFactor, SolubleLimit) :-
    ( AtPct =< SolubleLimit ->
        EffectivePenalty is AtPct * BaseFactor
    ;   OverLimit is AtPct - SolubleLimit,
        EffectivePenalty is (SolubleLimit * BaseFactor) + (OverLimit * (BaseFactor * 0.2))
    ).

solute_penalty_config(c, 3.5, 2.0).  
solute_penalty_config(p, 5.0, 0.1).  
solute_penalty_config(s, 5.0, 0.05). 
solute_penalty_config(si, 1.2, 8.0). 
solute_penalty_config(mn, 0.5, 15.0).
solute_penalty_config(_, 0.1, 100.0).

malleability_penalty_config(c, 6.0, 1.5).  
malleability_penalty_config(p, 7.0, 0.1).  
malleability_penalty_config(s, 7.0, 0.05). 
malleability_penalty_config(si, 2.0, 6.0). 
malleability_penalty_config(mn, 0.8, 12.0).
malleability_penalty_config(_, 0.2, 100.0).

% ----------------------------------------------------------------------------
% 4. BATTERY CELL FORMULATION & MANUFACTURING ENGINE
% ----------------------------------------------------------------------------
cell_comp(li_ion, 3.6, 150). 
cell_comp(lifepo4, 3.2, 120). 
cell_comp(nmc, 3.7, 200). 
cell_comp(lco, 3.8, 180). 
cell_comp(solid_state, 3.9, 250).
cell_comp(sodium_ion, 3.0, 100).
cell_comp(lithium_sulfur, 2.1, 400).
cell_comp(zinc_air, 1.6, 350).

separator_coeff(microporous_pe, 0.40). 
separator_coeff(nanofiber_celgard, 0.30). 
separator_coeff(ceramic_coated, 0.25). 
separator_coeff(glass_fiber, 0.20). 
separator_coeff(solid_electrolyte_membrane, 0.10).
separator_coeff(cellulose_separator, 0.35).
separator_coeff(nafion_membrane, 0.15).

validate_recipe(solid_state, solid_electrolyte, solid_electrolyte_membrane) :- !.
validate_recipe(solid_state, _, _) :- !, fail.
validate_recipe(zinc_air, alkaline_electrolyte, nafion_membrane) :- !.
validate_recipe(zinc_air, _, _) :- !, fail.
validate_recipe(lithium_sulfur, liquid_electrolyte, glass_fiber) :- !.
validate_recipe(lithium_sulfur, _, _) :- !, fail.
validate_recipe(sodium_ion, liquid_electrolyte, cellulose_separator) :- !.
validate_recipe(sodium_ion, liquid_electrolyte, microporous_pe) :- !.
validate_recipe(sodium_ion, _, _) :- !, fail.
validate_recipe(li_ion, liquid_electrolyte, microporous_pe) :- !.
validate_recipe(li_ion, gel_electrolyte, ceramic_coated) :- !.
validate_recipe(nmc, liquid_electrolyte, nanofiber_celgard) :- !.
validate_recipe(nmc, gel_electrolyte, ceramic_coated) :- !.
validate_recipe(lco, liquid_electrolyte, microporous_pe) :- !.
validate_recipe(lifepo4, gel_electrolyte, ceramic_coated) :- !.
validate_recipe(_, _, _) :- fail.

recipe(cylindrical_18650, li_ion, liquid_electrolyte, graphite_anode, microporous_pe, steel_can, 0).
recipe(cylindrical_21700, nmc, liquid_electrolyte, graphite_anode, nanofiber_celgard, steel_can, 1).
recipe(prismatic_ev, lifepo4, gel_electrolyte, hard_carbon_anode, ceramic_coated, aluminum_pouch, 3).
recipe(pouch_phone, lco, liquid_electrolyte, graphite_anode, microporous_pe, aluminum_pouch, 0).
recipe(solid_state_pack, solid_state, solid_electrolyte, lithium_metal_anode, solid_electrolyte_membrane, ceramic_case, 6).
recipe(sodium_cylindrical, sodium_ion, liquid_electrolyte, hard_carbon_anode, cellulose_separator, steel_can, 1).
recipe(sulfur_aviation, lithium_sulfur, liquid_electrolyte, lithium_metal_anode, glass_fiber, aluminum_pouch, 4).
recipe(zinc_air_grid, zinc_air, alkaline_electrolyte, porous_zinc_anode, nafion_membrane, titanium_case, 2).

syneresis(microporous_pe, high_porosity). 
syneresis(nanofiber_celgard, medium_porosity). 
syneresis(ceramic_coated, low_porosity). 
syneresis(glass_fiber, ultra_porosity). 
syneresis(solid_electrolyte_membrane, zero_porosity).
syneresis(cellulose_separator, high_porosity).
syneresis(nafion_membrane, low_porosity).

equipment(high_porosity, ['Coater', 'Calender', 'Slitter', 'Winder', 'Electrolyte Dispenser']).
equipment(medium_porosity, ['Coater', 'Calender', 'Ultrasonic Welder', 'Vacuum Sealer', 'Degassing Chamber']).
equipment(low_porosity, ['Dry Room', 'Coater', 'Laser Cutter', 'Stacker', 'Welder', 'Hot Press']).
equipment(ultra_porosity, ['Inert Atmosphere Box', 'Coater', 'Press', 'Sealer', 'Vacuum Impregnator']).
equipment(zero_porosity, ['Sintering Furnace', 'Atomic Layer Deposition', 'Press', 'Laser Welder', 'Annealing Oven']).

calculate_capacity(Chemistry, Separator, Capacity) :- 
    cell_comp(Chemistry, V, CapDensity), 
    separator_coeff(Separator, SDec), 
    EnergyDensity is CapDensity * (1.0 - SDec), 
    Capacity is (((V * EnergyDensity) + (CapDensity * 0.5)) * 0.95) / (1.0 - SDec).

intercalation(_, 0, stable_cycling) :- !.
intercalation(high_porosity, _, capacity_fade) :- !.
intercalation(medium_porosity, Months, high_degradation) :- Months >= 3, !.
intercalation(medium_porosity, _, moderate_degradation) :- !.
intercalation(low_porosity, Months, high_stability) :- Months >= 6, !.
intercalation(low_porosity, _, stable_cycling) :- !.
intercalation(zero_porosity, Months, extreme_energy_density) :- Months >= 12, !.
intercalation(zero_porosity, _, high_efficiency) :- !.

electrochemical_stability(_, _, 0, nominal_voltage) :- !.
electrochemical_stability(li_ion, liquid_electrolyte, _, standard_thermal_profile) :- !.
electrochemical_stability(lifepo4, gel_electrolyte, _, high_thermal_stability) :- !.
electrochemical_stability(nmc, liquid_electrolyte, _, high_power_output) :- !.
electrochemical_stability(lco, liquid_electrolyte, _, high_energy_density) :- !.
electrochemical_stability(solid_state, solid_electrolyte, Months, dendrite_resistant) :- Months >= 6, !.
electrochemical_stability(sodium_ion, liquid_electrolyte, _, cost_effective_cycling) :- !.
electrochemical_stability(lithium_sulfur, liquid_electrolyte, Months, high_gravimetric_capacity) :- Months >= 4, !.
electrochemical_stability(zinc_air, alkaline_electrolyte, _, ambient_oxygen_breathing) :- !.

time(mixing, 4.0). 
time(coating, 6.0). 
time(drying, 12.0). 
time(assembly, 24.0). 
time(formation, 48.0).

estimate_cell_properties(CompositionList, TargetAH, Capacity, Degradation, Stability) :-
    compute_atomic_percentages(CompositionList, _Atomics),
    recipe(Name, Chemistry, Electrolyte, _Anode, Separator, _Casing, Months),
    (   validate_recipe(Chemistry, Electrolyte, Separator) ->
        separator_coeff(Separator, Porosity), 
        equipment(Porosity, _Tools), 
        calculate_capacity(Chemistry, Separator, Capacity),
        CathodeKG is TargetAH / (Capacity / 100.0), 
        BinderG is CathodeKG * 0.05, 
        SolventML is CathodeKG * 0.20, 
        SaltG is TargetAH * 1.5,
        intercalation(Porosity, Months, Degradation), 
        electrochemical_stability(Chemistry, Electrolyte, Months, Stability),
        format('~n[BATCH] ~w (~wAh) | CAPACITY: ~2f%~n', [Name, TargetAH, Capacity]),
        format('[INGR] ~2fkg ~w cathode | ~2fg binder | ~2fml solvent | ~2fg electrolyte salt~n', [CathodeKG, Chemistry, BinderG, SolventML, SaltG]),
        format('[TOOLS] ~w~n', [_Tools]),
        format('[STEPS]:~n'),
        format('  1. Slurry Mixing: Blend active materials for ~w hours.~n', [T1 = 4.0]),
        format('  2. Electrode Coating: Coat current collectors and dry for ~w hours.~n', [T2 = 6.0]),
        format('  3. Calendaring & Slitting: Compress through ~w structure.~n', [Porosity]),
        format('  4. Cell Assembly: Wind/stack with ~w separator inside ~w for ~w hours.~n', [Separator, _Casing, T4 = 24.0]),
        format('  5. Electrolyte Filling: Inject under controlled atmosphere.~n'),
        format('  6. Formation & Aging: Cycle for ~w hours and age for ~w months.~n', [T5 = 48.0, Months]),
        format('[FINAL] Expected degradation: ~w. Expected stability: ~w.~n', [Degradation, Stability])
    ;   format('~n[ERROR] Invalid configuration detected!~n', []),
        fail
    ).

% ----------------------------------------------------------------------------
% 5. SMILES MOLECULAR DATABASE & CONVERSION ENGINE
% ----------------------------------------------------------------------------
molecule('CC(=O)OC1=CC=CC=C1C(=O)O', [(c, 108.099), (h, 9.072), (o, 63.996)]). % Acetylsalicylic Acid
molecule('CCO', [(c, 24.022), (h, 6.048), (o, 15.999)]).                    % Ethanol
molecule('CC(=O)O', [(c, 24.022), (h, 4.032), (o, 31.998)]).                 % Acetic Acid
molecule('C1COCO1', [(c, 24.022), (h, 4.032), (o, 15.999)]).                 % Dioxirane / Cyclic Ether Form
molecule('O=C(OC)OC', [(c, 36.033), (h, 6.048), (o, 47.997)]).               % Dimethyl Carbonate
molecule('O=C(O)O', [(c, 12.011), (h, 2.016), (o, 47.997)]).                 % Carbonic Acid
molecule('CS(=O)(=O)C', [(c, 24.022), (h, 6.048), (o, 31.998), (s, 32.06)]). % Dimethyl Sulfone
molecule('C1=CC=CC=C1', [(c, 72.066), (h, 6.048)]).                          % Benzene
molecule('CC(C)O', [(c, 36.033), (h, 8.064), (o, 15.999)]).                  % Isopropanol
molecule('CC(=O)C', [(c, 36.033), (h, 6.048), (o, 15.999)]).                 % Acetone
molecule('CN1C=NC2=C1C(=O)N(C(=O)N2C)C', [(c, 96.088), (h, 10.08), (n, 56.028), (o, 31.998)]). % Caffeine
% FDA Macros, Nutrients, and Vitamins
molecule('C(C1C(C(C(C1O)O)O)O)O', [(c, 72.066), (h, 12.096), (o, 59.997)]).  % D-Glucose
molecule('CCCCCCCCCCCCCCCCCC(=O)O', [(c, 216.198), (h, 36.288), (o, 31.998)]).% Stearic Acid
molecule('NCC(=O)O', [(c, 24.022), (h, 5.040), (n, 14.007), (o, 31.998)]).   % Glycine
molecule('CC(C(=O)O)N', [(c, 36.033), (h, 7.056), (n, 14.007), (o, 31.998)]).% Alanine
molecule('C(C(=O)O)N', [(c, 24.022), (h, 5.040), (n, 28.014), (o, 31.998)]).% Urea / Nitrogen nutrient baseline
molecule('CC1=C(C(=C(C(=C1C)C)O)C)CCC=C(C)CCC=C(C)CCC=C(C)C', [(c, 336.308), (h, 48.384), (o, 15.999)]). % Alpha-Tocopherol (Vitamin E)
molecule('CC(=O)CC1=C(C=CC(=C1)O)C', [(c, 108.099), (h, 12.096), (o, 31.998)]). % Vitamin K baseline
molecule('C(C1C(C(C(C(O1)O)O)O)O)O', [(c, 72.066), (h, 12.096), (o, 59.997)]).  % Ascorbic Acid / Vitamin C analog
molecule('CC1=NC2=C(C(=C1)C)N(C3=NC(=O)NC(=O)C3=N2)CC(C(C(CO)_O)_O)_O', [(c, 204.187), (h, 20.16), (n, 48.024), (o, 95.952)]). % Riboflavin (Vitamin B2)

smiles_to_mass_list(Smiles, MassList) :-
    string_chars(Smiles, Chars),
    extract_atoms(Chars, AtomList),
    count_atoms(AtomList, Counts),
    counts_to_mass_list(Counts, MassList).

extract_atoms([], []).
extract_atoms([C|Rest], AtomList) :-
    char_type(C, upper),
    (   Rest = [Lower|More], char_type(Lower, lower),
        atom_concat(C, Lower, AtomName),
        downcase_atom(AtomName, LowerAtom),
        atom_string(AtomAtom, LowerAtom)
    ->  AtomList = [AtomAtom|RestAtoms],
        extract_atoms(More, RestAtoms)
    ;   downcase_atom(C, LowerC),
        atom_string(AtomAtom, LowerC),
        AtomList = [AtomAtom|RestAtoms],
        extract_atoms(Rest, RestAtoms)
    ).
extract_atoms([C|Rest], AtomList) :-
    (char_type(C, lower) ; char_type(C, digit) ; member(C, ['(', ')', '=', '#', '.', '[', ']'])),
    extract_atoms(Rest, AtomList).

count_atoms(List, Counts) :-
    msort(List, Sorted),
    pack(Sorted, Counts).

pack([], []).
pack([X|Xs], [[X, N]|Zs]) :-
    run(Xs, X, 1, N, Ys),
    pack(Ys, Zs).

run([], _, N, N, []).
run([X|Xs], X, I, N, Ys) :-
    I1 is I + 1,
    run(Xs, X, I1, N, Ys).
run([X|Xs], Y, N, N, [X|Xs]) :-
    X \= Y.

counts_to_mass_list([], []).
counts_to_mass_list([[Atom, Count]|Rest], [(Atom, Mass)|MassRest]) :-
    ( element(Atom, Props) ->
        member(aw(AW), Props),
        Mass is AW * Count
    ;   Mass is 12.011 * Count
    ),
    counts_to_mass_list(Rest, MassRest).

iterate_smiles_from_mass(MassList, Smiles) :-
    molecule(Smiles, KnownMassList),
    match_mass_profile(MassList, KnownMassList).

match_mass_profile(List1, List2) :-
    normalize_and_sort(List1, Norm1),
    normalize_and_sort(List2, Norm2),
    subset_match(Norm1, Norm2).

normalize_and_sort(List, SortedNorm) :-
    sort(List, Sorted),
    aggregate_masses(Sorted, SortedNorm).

aggregate_masses([], []).
aggregate_masses([(El, M)], [(El, M)]).
aggregate_masses([(El, M1), (El, M2)|Rest], Out) :-
    M3 is M1 + M2,
    aggregate_masses([(El, M3)|Rest], Out).
aggregate_masses([(El1, M1), (El2, M2)|Rest], [(El1, M1)|Out]) :-
    El1 \= El2,
    aggregate_masses([(El2, M2)|Rest], Out).

subset_match([], _).
subset_match([(El, M1)|Rest1], List2) :-
    member((El, M2), List2),
    abs(M1 - M2) < 2.5,
    subset_match(Rest1, List2).
