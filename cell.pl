% --- Sample Targets ---
sample(tissue_sample_A, 2.5e-3, 2.4e-3).
sample(tissue_sample_B, 5.0, 4.5).
sample(neural_tissue_cortex, 1.25e-2, 1.10e-2).
sample(fatty_liver_biopsy, 8.25e-3, 7.85e-3).

% Percentage of local volume occupied by cell structure
packing_fraction(interstitial_fluid, 1.00).
packing_fraction(adipocyte,          0.85).
packing_fraction(epithelial_cell,    0.75).
packing_fraction(fibroblast,         0.65).
packing_fraction(pyramidal_neuron,   0.55).
packing_fraction(mitochondria,       0.80).
packing_fraction(nucleus,            0.75).
packing_fraction(lysosome,           0.70).
packing_fraction(cytoskeleton,       0.40).
packing_fraction(default,            0.70).

% Component Mass: (Name, Mantissa, Exponent_Base10_Grams)
component_mass(water,         2.99, -23).
component_mass(amino_acid,    1.82, -22).
component_mass(lipid_unit,    1.25, -21).
component_mass(glucose_unit,  2.99, -22).
component_mass(nucleotide,    5.48, -22).
component_mass(atp,           8.36, -22).
component_mass(iron_ion,      9.27, -23).
component_mass(hemoglobin,    1.09, -19).
component_mass(actin_monomer, 7.00, -20).
component_mass(calcium_ion,   6.65, -23).

% Geometry: (Name, Shape, Radius, Length)
geometry(water,        sphere,   1.4,  0.0).
geometry(amino_acid,   cylinder, 2.5,  3.5).
geometry(lipid_unit,   cylinder, 4.5, 25.0).
geometry(glucose_unit, sphere,   4.4,  0.0).
geometry(nucleotide,   cylinder, 7.0,  3.4).
geometry(atp,          sphere,   6.0,  0.0).
geometry(iron_ion,     sphere,   0.8,  0.0).
geometry(hemoglobin,   sphere,   28.0, 0.0).
geometry(actin_monomer,sphere,   27.0, 0.0).
geometry(calcium_ion,  sphere,   1.0,  0.0).

% --- Cell Lineage Classifications ---
cell_classification(sperm_cell,      germ_line).
cell_classification(human_egg,       germ_line).
cell_classification(red_blood_cell,  connective).
cell_classification(platelet,        connective).
cell_classification(lymphocyte,      connective).
cell_classification(neutrophil,      connective).
cell_classification(fibroblast,      connective).
cell_classification(microglia,       connective).
cell_classification(enterocyte,      epithelial).
cell_classification(liver_cell,      epithelial).
cell_classification(cardiomyocyte,   muscular).
cell_classification(skeletal_muscle, muscular).
cell_classification(keratinocyte,    epithelial).
cell_classification(pneumocyte,      epithelial).
cell_classification(goblet_cell,     epithelial).
cell_classification(adipocyte,       connective).
cell_classification(osteocyte,       connective).
cell_classification(chondrocyte,     connective).
cell_classification(smooth_muscle_cell, muscular).
cell_classification(pyramidal_neuron, nervous).
cell_classification(astrocyte,       nervous).
cell_classification(oligodendrocyte, nervous).
cell_classification(osteoclast,      connective).
cell_classification(osteoblast,      connective).
cell_classification(dendritic_cell,  connective).
cell_classification(macrophage,      connective).
cell_classification(photoreceptor,   nervous).
cell_classification(hair_cell,       nervous).
cell_classification(beta_cell,       epithelial).
cell_classification(liver_stem_cell, epithelial).
cell_classification(pacemaker_cell,   muscular).
cell_classification(purkinje_cell,    muscular).
cell_classification(leydig_cell,      germ_line).
cell_classification(granulosa_cell,   germ_line).
cell_classification(thyroid_cell,     epithelial).
cell_classification(adrenal_cortex,   epithelial).
cell_classification(basophil,        connective).
cell_classification(monocyte,        connective).
cell_classification(plasma_cell,     connective).
cell_classification(pericyte,        connective).
cell_classification(mesothelial_cell,epithelial).
cell_classification(ciliated_cell,   epithelial).
cell_classification(olfactory_neuron,nervous).
cell_classification(cone_cell,       nervous).
cell_classification(megakaryocyte,   connective).
cell_classification(stomach_parietal, epithelial).

% --- Cell Profiles (CellType, Water, AminoAcid, Lipid, Glucose, Nucleotide) ---
cell_profile(sperm_cell,       4.68e10, 1.97e9,  1.12e8,  1.33e7, 6.00e9).
cell_profile(red_blood_cell,   2.10e12, 2.80e11, 2.40e9,  6.02e8, 0.0).
cell_profile(platelet,         9.50e10, 1.20e10, 8.50e8,  4.10e7, 0.0).
cell_profile(microglia,        6.30e12, 5.50e11, 3.20e10, 1.20e9, 1.20e10).
cell_profile(lymphocyte,       1.10e13, 9.80e11, 4.20e10, 2.20e9, 1.20e10).
cell_profile(neutrophil,       2.50e13, 2.10e12, 9.50e10, 4.80e9, 1.20e10).
cell_profile(fibroblast,       4.20e13, 4.50e12, 1.80e11, 8.10e9, 1.80e10).
cell_profile(enterocyte,       5.80e13, 5.10e12, 3.90e11, 1.50e10, 1.20e10).
cell_profile(liver_cell,       8.40e13, 7.20e12, 4.10e11, 2.10e11, 3.60e10).
cell_profile(cardiomyocyte,    6.20e14, 9.80e13, 1.90e12, 3.50e10, 4.80e10).
cell_profile(skeletal_muscle,  9.50e14, 1.40e14, 2.10e12, 8.90e10, 7.20e10).
cell_profile(human_egg,        2.10e16, 1.80e15, 9.50e13, 3.80e12, 1.20e10).
cell_profile(pyramidal_neuron, 9.50e13, 1.40e13, 5.50e12, 1.80e10, 1.20e10).
cell_profile(astrocyte,        7.20e13, 6.80e12, 8.50e11, 4.50e10, 1.20e10).
cell_profile(oligodendrocyte,  4.10e13, 3.20e12, 4.80e12, 3.80e9,  1.20e10).
cell_profile(keratinocyte,     3.50e13, 8.20e12, 2.10e11, 4.50e9,  1.20e10).
cell_profile(pneumocyte,       2.80e13, 3.10e12, 4.80e11, 3.20e9,  1.20e10).
cell_profile(goblet_cell,      4.50e13, 4.80e12, 2.50e11, 9.50e10, 1.20e10).
cell_profile(adipocyte,        2.50e14, 3.50e12, 6.40e13, 5.00e9,  1.20e10).
cell_profile(osteocyte,        1.50e13, 2.10e12, 1.20e11, 2.80e9,  1.20e10).
cell_profile(chondrocyte,      2.20e13, 3.80e12, 1.50e11, 4.20e10, 1.20e10).
cell_profile(smooth_muscle_cell, 8.50e13, 1.20e13, 3.80e11, 6.50e9, 1.20e10).
cell_profile(osteoclast,        1.20e14, 1.10e13, 8.50e11, 4.20e10, 2.50e10).
cell_profile(osteoblast,        4.80e13, 5.20e12, 1.90e11, 1.20e10, 1.80e10).
cell_profile(dendritic_cell,    7.20e13, 6.50e12, 5.50e11, 3.50e10, 1.50e10).
cell_profile(macrophage,        9.80e13, 8.20e12, 1.20e12, 9.50e10, 1.80e10).
cell_profile(photoreceptor,     3.20e13, 4.10e12, 2.80e12, 8.50e9,  1.20e10).
cell_profile(hair_cell,         2.50e13, 3.10e12, 4.50e11, 4.20e9,  1.20e10).
cell_profile(beta_cell,         5.20e13, 6.80e12, 3.20e11, 2.80e10, 1.50e10).
cell_profile(liver_stem_cell,   4.10e13, 3.50e12, 2.10e11, 4.50e10, 2.10e10).
cell_profile(pacemaker_cell,    3.50e13, 2.10e12, 1.20e11, 1.80e10, 1.20e10).
cell_profile(purkinje_cell,     7.20e13, 5.50e12, 3.10e11, 4.50e10, 2.80e10).
cell_profile(leydig_cell,       6.50e13, 4.20e12, 8.50e12, 3.20e9,  1.50e10).
cell_profile(granulosa_cell,    5.20e13, 3.80e12, 4.20e11, 1.20e10, 2.50e10).
cell_profile(thyroid_cell,      4.50e13, 5.10e12, 2.10e11, 4.50e9,  1.80e10).
cell_profile(adrenal_cortex,    6.20e13, 4.50e12, 5.50e12, 6.20e9,  1.20e10).
cell_profile(basophil,       3.50e13, 3.20e12, 4.50e11, 2.10e9, 1.20e10).
cell_profile(monocyte,       5.80e13, 5.50e12, 5.10e11, 3.20e10, 1.50e10).
cell_profile(plasma_cell,    7.20e13, 9.50e12, 6.20e11, 4.50e10, 2.20e10).
cell_profile(pericyte,       2.50e13, 2.80e12, 3.20e11, 1.50e9,  1.00e10).
cell_profile(mesothelial_cell, 3.80e13, 3.50e12, 2.80e11, 4.20e9,  1.20e10).
cell_profile(ciliated_cell,  4.20e13, 4.20e12, 3.10e11, 5.50e9,  1.20e10).
cell_profile(olfactory_neuron, 5.50e13, 6.50e12, 8.50e11, 8.50e9,  1.50e10).
cell_profile(cone_cell,      3.50e13, 4.50e12, 3.50e12, 4.80e9,  1.20e10).
cell_profile(megakaryocyte,  4.50e14, 8.20e13, 5.20e12, 1.20e11, 9.50e10).
cell_profile(stomach_parietal, 9.20e13, 1.10e13, 1.50e12, 1.80e10, 2.50e10).

% --- Calculation Pipeline ---
molecule_count(Cell, Category, Count) :-
    cell_profile(Cell, W, A, L, G, N),
    ( Category == water        -> Count = W
    ; Category == amino_acid   -> Count = A
    ; Category == lipid_unit   -> Count = L
    ; Category == glucose_unit -> Count = G
    ; Category == nucleotide   -> Count = N
    ).

raw_float_mass(Name, MassGrams) :-
    component_mass(Name, Mantissa, Exponent),
    MassGrams is float(Mantissa * (10 ** Exponent)).

category_mass_contribution(Cell, Category, AbsoluteMassGrams) :-
    molecule_count(Cell, Category, Count),
    raw_float_mass(Category, SingleUnitMass),
    AbsoluteMassGrams is float(Count * SingleUnitMass).

total_calculated_cell_mass(interstitial_fluid, 1.005e-12).
total_calculated_cell_volume(interstitial_fluid, 1.000e-12).

total_calculated_cell_mass(Cell, TotalMassGrams) :-
    category_mass_contribution(Cell, water, W),
    category_mass_contribution(Cell, amino_acid, A),
    category_mass_contribution(Cell, lipid_unit, L),
    category_mass_contribution(Cell, glucose_unit, G),
    category_mass_contribution(Cell, nucleotide, N),
    TotalMassGrams is W + A + L + G + N.

single_molecule_volume(Type, VolumeCC) :-
    geometry(Type, Shape, R, Length),
    Pi = 3.141592653589793,
    ( Shape == sphere   -> VolAngstroms is (4.0 / 3.0) * Pi * (R ** 3)
    ; Shape == cylinder -> VolAngstroms is Pi * (R ** 2) * Length
    ),
    VolumeCC is float(VolAngstroms * 1.0e-24).

category_volume_contribution(Cell, Category, TotalVolumeCC) :-
    molecule_count(Cell, Category, Count),
    single_molecule_volume(Category, SingleVol),
    TotalVolumeCC is float(Count * SingleVol).

total_calculated_cell_volume(interstitial_fluid, 1.000e-12).
total_calculated_cell_volume(Cell, TotalVolumeCC) :-
    category_volume_contribution(Cell, water, W),
    category_volume_contribution(Cell, amino_acid, A),
    category_volume_contribution(Cell, lipid_unit, L),
    category_volume_contribution(Cell, glucose_unit, G),
    category_volume_contribution(Cell, nucleotide, N),
    TotalVolumeCC is W + A + L + G + N.

% --- Helper: Fetch Adjusted Cell Properties ---
cell_properties(Cell, Mass, EffectiveVol) :-
    total_calculated_cell_mass(Cell, Mass),
    total_calculated_cell_volume(Cell, Vol_Pure),
    (packing_fraction(Cell, PF) -> true ; PF = 0.7),
    EffectiveVol is Vol_Pure / PF.

cell_contribution(Cell-Count, MassCont, VolCont) :-
    cell_properties(Cell, UnitMass, UnitVol),
    MassCont is Count * UnitMass,
    VolCont is Count * UnitVol.

% --- Solvers ---
heterogeneous_sample(Sample, CellCounts) :-
    sample(Sample, TargetMass, TargetVol),
    partition_cells(CellCounts, Knowns, Unknowns),
    length(Unknowns, UnkLen),
    ( UnkLen == 2 ->
        Unknowns = [CellA-CountA, CellB-CountB],
        maplist(cell_contribution, Knowns, KnownMasses, KnownVols),
        sum_list(KnownMasses, SubMass),
        sum_list(KnownVols, SubVol),
        AdjMass is TargetMass - SubMass,
        AdjVol is TargetVol - SubVol,
        cell_properties(CellA, MassA, VolA),
        cell_properties(CellB, MassB, VolB),
        CellA \= CellB,
        Determinant is (MassA * VolB) - (VolA * MassB),
        Determinant \= 0.0,
        RawCountA is ((AdjMass * VolB) - (AdjVol * MassB)) / Determinant,
        RawCountB is ((MassA * AdjVol) - (VolA * AdjMass)) / Determinant,
        RawCountA > 0, RawCountB > 0,
        CountA is round(RawCountA),
        CountB is round(RawCountB)
    ; UnkLen == 0 ->
        maplist(cell_contribution, CellCounts, MassList, VolList),
        sum_list(MassList, TotalMass),
        sum_list(VolList, TotalVol),
        abs(TotalMass - TargetMass) =< TargetMass * 0.01,
        abs(TotalVol - TargetVol) =< TargetVol * 0.01
    ; 
        maplist(cell_contribution, Knowns, KnownMasses, KnownVols),
        sum_list(KnownMasses, SubMass),
        sum_list(KnownVols, SubVol),
        AdjMass is TargetMass - SubMass,
        AdjVol is TargetVol - SubVol,
        search_unknowns(Unknowns, AdjMass, AdjVol, TargetMass, TargetVol)
    ).

search_unknowns([], AdjMass, AdjVol, TargetMass, TargetVol) :-
    abs(AdjMass) =< TargetMass * 0.01,
    abs(AdjVol) =< TargetVol * 0.01.

search_unknowns([C-N|T], AdjMass, AdjVol, TargetMass, TargetVol) :-
    (var(C) -> cell_profile(C, _, _, _, _, _) ; true),
    cell_properties(C, UnitMass, UnitVol),
    MaxN is floor(TargetMass / UnitMass),
    MaxN > 0,
    % Proportional Stepping - ensures tractable search times and scales to any sample mass.
    between(1, 20, StepMultiplier),
    N is max(1, floor(MaxN * (StepMultiplier * 0.05))),
    NewAdjMass is AdjMass - (N * UnitMass),
    NewAdjVol is AdjVol - (N * UnitVol),
    % Prune dead-end search paths early
    NewAdjMass > -(TargetMass * 0.05),
    NewAdjVol > -(TargetVol * 0.05),
    search_unknowns(T, NewAdjMass, NewAdjVol, TargetMass, TargetVol).

partition_cells([], [], []).
partition_cells([Cell-Count|T], [Cell-Count|Knowns], Unknowns) :-
    ground(Count), !, partition_cells(T, Knowns, Unknowns).
partition_cells([Cell-Count|T], Knowns, [Cell-Count|Unknowns]) :-
    partition_cells(T, Knowns, Unknowns).

homogeneous_sample(Sample, CellType, TotalCellCount) :-
    heterogeneous_sample(Sample, [CellType-TotalCellCount, interstitial_fluid-_]).