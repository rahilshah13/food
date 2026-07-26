element(li, [aw(6.94), cat(alkali_metal)]).
element(na, [aw(22.990), cat(alkali_metal)]).
element(k, [aw(39.098), cat(alkali_metal)]).
element(mg, [aw(24.305), cat(alkaline_earth)]).
element(al, [aw(26.982), cat(post_transition)]).
element(si, [aw(28.085), cat(metalloid)]).
element(s, [aw(32.06), cat(nonmetal)]).
element(c, [aw(12.011), cat(nonmetal)]).
element(zn, [aw(65.38), cat(transition_metal)]).
element(o, [aw(15.999), cat(nonmetal)]).
element(co, [aw(58.933), cat(transition_metal)]).
element(ni, [aw(58.693), cat(transition_metal)]).
element(fe, [aw(55.845), cat(transition_metal)]).
element(p, [aw(30.974), cat(nonmetal)]).

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
        time(mixing, T1), time(coating, T2), time(drying, T3), time(assembly, T4), time(formation, T5),
        format('~n[BATCH] ~w (~wAh) | CAPACITY: ~2f%~n', [Name, TargetAH, Capacity]),
        format('[INGR] ~2fkg ~w cathode | ~2fg binder | ~2fml solvent | ~2fg electrolyte salt~n', [CathodeKG, Chemistry, BinderG, SolventML, SaltG]),
        format('[TOOLS] ~w~n', [_Tools]),
        format('[STEPS]:~n'),
        format('  1. Slurry Mixing: Blend active materials for ~w hours.~n', [T1]),
        format('  2. Electrode Coating: Coat current collectors and dry for ~w hours.~n', [T2]),
        format('  3. Calendaring & Slitting: Compress through ~w structure.~n', [Porosity]),
        format('  4. Cell Assembly: Wind/stack with ~w separator inside ~w for ~w hours.~n', [Separator, _Casing, T4]),
        format('  5. Electrolyte Filling: Inject under controlled atmosphere.~n'),
        format('  6. Formation & Aging: Cycle for ~w hours and age for ~w months.~n', [T5, Months]),
        format('[FINAL] Expected degradation: ~w. Expected stability: ~w.~n', [Degradation, Stability])
    ;   format('~n[ERROR] Invalid configuration detected!~n', []),
        fail
    ).
