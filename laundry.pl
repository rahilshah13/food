material(cotton, 1.54, 35.0, 1.8, 0.45).
material(polyester, 1.38, 12.0, 0.4, 0.30).
material(wool, 1.31, 45.0, 2.2, 0.55).
material(denim, 1.55, 20.0, 1.3, 0.50).
material(silk, 1.25, 50.0, 1.5, 0.20).
material(linen, 1.50, 40.0, 2.0, 0.40).
material(nylon, 1.14, 15.0, 0.5, 0.25).
material(fleece, 1.20, 55.0, 2.5, 0.60).
material(cashmere, 1.15, 60.0, 2.4, 0.65).
material(spandex, 1.21, 10.0, 0.3, 0.15).
material(rayon, 1.52, 42.0, 2.1, 0.35).
material(canvas, 1.56, 18.0, 1.4, 0.52).
material(leather, 0.85, 8.0, 0.1, 0.70).

garment_fact(cotton, 60, 7, 'Natural cellulose fiber; high strength when wet, absorbs moisture heavily.').
garment_fact(polyester, 40, 2, 'Synthetic petroleum-based fiber; hydrophobic, oleophilic (attracts oils).').
garment_fact(wool, 30, 3, 'Protein fiber from animal hair; scales trap debris, highly sensitive to thermal shock and alkali.').
garment_fact(denim, 50, 5, 'Heavy twill-weave cotton structure; requires robust water motion to penetrate dense yarn bundles.').
garment_fact(silk, 30, 8, 'Delicate protein filament; low abrasion tolerance, loses structural integrity when soaked.').
garment_fact(linen, 60, 10, 'Flax plant fiber; highly breathable, stiff when dry, softens with washing but wrinkles easily.').
garment_fact(nylon, 40, 3, 'Synthetic polyamide; durable and elastic, prone to picking up fugitive dyes from wash water.').
garment_fact(fleece, 40, 4, 'Synthetic brushed pile fabric; traps air and particulate matter easily, prone to static build-up.').
garment_fact(cashmere, 30, 4, 'Luxurious fine goat hair; extremely delicate, prone to felting and shrinkage under mechanical stress.').
garment_fact(spandex, 30, 1, 'Polyurethane-polyurea copolymer; elastic and flexible, degraded by high heat and chlorine bleach.').
garment_fact(rayon, 30, 8, 'Semi-synthetic regenerated cellulose; weak when wet, requires gentle tumbling and low thermal settings.').
garment_fact(canvas, 60, 6, 'Plain-weave heavy cotton fabric; exceptionally durable, high tensile strength, needs aggressive flow.').
garment_fact(leather, 20, 9, 'Treated animal hide; strictly non-washable via standard aqueous immersion without chemical conditioning.').

soap_type(bio_enzyme, 1.4, 0.7).
soap_type(standard, 1.0, 0.5).
soap_type(gentle, 0.8, 0.3).
soap_type(none, 0.3, 0.1).

resolve_material_prop(Material, Density, Ssa, Abs, Friction) :-
    atom(Material),
    material(Material, Density, Ssa, Abs, Friction).

resolve_material_prop(BlendList, Density, Ssa, Abs, Friction) :-
    is_list(BlendList),
    sum_blend_properties(BlendList, 0, 0, 0, 0, Density, Ssa, Abs, Friction).

sum_blend_properties([], D, S, A, F, D, S, A, F).
sum_blend_properties([Mat-Ratio | Rest], AccD, AccS, AccA, AccF, FinalD, FinalS, FinalA, FinalF) :-
    material(Mat, D_m, S_m, A_m, F_m),
    NewD is AccD + (D_m * Ratio),
    NewS is AccS + (S_m * Ratio),
    NewA is AccA + (A_m * Ratio),
    NewF is AccF + (F_m * Ratio),
    sum_blend_properties(Rest, NewD, NewS, NewA, NewF, FinalD, FinalS, FinalA, FinalF).

resolve_safe_temp(Material, SafeTemp) :-
    atom(Material),
    garment_fact(Material, SafeTemp, _, _).

resolve_safe_temp(BlendList, SafeTemp) :-
    is_list(BlendList),
    find_blend_min_temp(BlendList, 90, SafeTemp).

find_blend_min_temp([], CurrentMin, CurrentMin).
find_blend_min_temp([Mat-_ | Rest], CurrentMin, SafeTemp) :-
    garment_fact(Mat, MatTemp, _, _),
    NewMin is min(CurrentMin, MatTemp),
    find_blend_min_temp(Rest, NewMin, SafeTemp).

load_mass([], 0).
load_mass([garment(_, Mass, _)|Rest], TotalMass) :-
    load_mass(Rest, SubMass),
    TotalMass is Mass + SubMass.

load_surface_area([], 0).
load_surface_area([garment(_, Mass, Material)|Rest], TotalArea) :-
    resolve_material_prop(Material, _, Ssa, _, _),
    GarmentArea is Mass * Ssa,
    load_surface_area(Rest, SubArea),
    TotalArea is GarmentArea + SubArea.

saturation_threshold([], 0).
saturation_threshold([garment(_, Mass, Material)|Rest], TotalCap) :-
    resolve_material_prop(Material, _, _, AbsFactor, _),
    Cap is Mass * AbsFactor,
    saturation_threshold(Rest, SubCap),
    TotalCap is Cap + SubCap.

load_mean_friction([], 0, 0).
load_mean_friction([garment(_, Mass, Material)|Rest], TotalMass, WeightedFrictionSum) :-
    resolve_material_prop(Material, _, _, _, Friction),
    load_mean_friction(Rest, RestMass, RestFrictionSum),
    TotalMass is Mass + RestMass,
    WeightedFrictionSum is (Mass * Friction) + RestFrictionSum.

get_load_friction(Load, MeanFriction) :-
    load_mean_friction(Load, TotalMass, WeightedFrictionSum),
    ( TotalMass > 0 -> MeanFriction is WeightedFrictionSum / TotalMass 
    ; MeanFriction = 0.4 ).

calculate_tumbler_dynamics(Load, TumblerRadius, TumblerSpeed, CycleLength, MechanicalActionScore) :-
    get_load_friction(Load, Friction),
    load_mass(Load, Mass),
    Omega is TumblerSpeed * 3.14159265 / 30.0,
    G is 9.81,
    CentrifugalFactor is (Omega * Omega * TumblerRadius) / G,
    ( CentrifugalFactor < 0.3 ->
        CascadingEfficiency is CentrifugalFactor / 0.3
    ; CentrifugalFactor < 0.85 ->
        CascadingEfficiency is 1.0 - abs(0.65 - CentrifugalFactor) * 0.5
    ; CentrifugalFactor < 1.0 ->
        CascadingEfficiency is max(0.0, 1.0 - (CentrifugalFactor - 0.85) * 6.66)
    ; 
        CascadingEfficiency is 0.0
    ),
    DynamicFrictionPull is Friction * (1.0 + (Mass * 0.05)),
    NetSlipThreshold is max(0.1, 1.0 - (DynamicFrictionPull / max(0.5, TumblerSpeed * 0.05))),
    TotalRevolutions is TumblerSpeed * CycleLength,
    ActionUnits is TotalRevolutions * CascadingEfficiency * NetSlipThreshold,
    MechanicalActionScore is min(1.5, max(0.2, ActionUnits / 500.0)).

max_safe_temperature([], 90).
max_safe_temperature([garment(_, _, Material)|Rest], SafeTemp) :-
    resolve_safe_temp(Material, MatTemp),
    max_safe_temperature(Rest, RestTemp),
    SafeTemp is min(MatTemp, RestTemp).

evaluate_cleanliness_with_tumbler(Load, Soap, WaterVol, Temp, TumblerRadius, TumblerSpeed, CycleLength, Cleanliness) :-
    load_mass(Load, Mass),
    SafeSat is max(0.001, SaturationCap =.. [_, _]),
    saturation_threshold(Load, SaturationCap),
    ( WaterVol < SaturationCap ->
        WaterFactor is WaterVol / SaturationCap
    ; 
        Excess is WaterVol - SaturationCap,
        WaterFactor is max(0.5, 1.0 - (Excess / (max(0.001, SaturationCap) * 3.0)) )
    ),
    TempFactor is min(1.2, max(0.4, Temp / 40.0)),
    soap_type(Soap, SoapEff, TensionReducer),
    calculate_tumbler_dynamics(Load, TumblerRadius, TumblerSpeed, CycleLength, MechAction),
    AgitationDrag is SurfaceArea / max(1.0, WaterVol),
    MechanicalFactor is max(0.3, (1.0 - (AgitationDrag * 0.02)) * MechAction),
    RawScore is (WaterFactor * 0.25) + 
                (TempFactor * 0.20) + 
                (SoapEff * MechanicalFactor * 0.55),
    Percentage is RawScore * 85.0 * TensionReducer * 1.25,
    Cleanliness is min(100.0, max(5.0, Percentage)).

optimize_wash_cycle(Load, TumblerRadius, OptimalSoap, OptimalWaterVol, OptimalTemp, OptimalSpeed, OptimalCycleLen, MaxCleanliness) :-
    saturation_threshold(Load, SatSaturation),
    OptimalWaterVol is SatSaturation * 2.2,
    max_safe_temperature(Load, TempCeiling),
    OptimalTemp = TempCeiling,
    OptimalSpeed = 45,       
    OptimalCycleLen = 35,    
    findall(
        Score-Soap,
        ( soap_type(Soap, _, _), evaluate_cleanliness_with_tumbler(Load, Soap, OptimalWaterVol, OptimalTemp, TumblerRadius, OptimalSpeed, OptimalCycleLen, Score) ),
        ScoredSoaps
    ),
    keysort(ScoredSoaps, SortedSoaps),
    last(SortedSoaps, MaxScore-OptimalSoap),
    MaxCleanliness is MaxScore.
