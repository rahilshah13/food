% =====================================================================
% DEXMEDETOMIDINE INDUSTRIAL SYNTHESIS & PROCESS MODELING ENGINE
% Grignard/Trityl-Protected
% =====================================================================

% ---------------------------------------------------------------------
% Character Classification Helpers
% ---------------------------------------------------------------------

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

% ---------------------------------------------------------------------
% Reference Elemental Atomic Masses (IUPAC Standard Weights)
% ---------------------------------------------------------------------

element(h, 1.008).
element(c, 12.011).
element(n, 14.007).
element(o, 15.999).
element(f, 18.998).
element(mg, 24.305).  % Added for Grignard Reagent
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

% =====================================================================
% MOLECULAR DATABASE (Dexmedetomidine Industrial Intermediates)
% =====================================================================

molecule(
    acetyl_tritylimidazole,
    'CC(=O)C1=CN(C(C2=CC=CC=C2)(C3=CC=CC=C3)C4=CC=CC=C4)C=N1',
    '1-Trityl-1H-imidazole-4-ethanone (Protected Precursor)',
    'C24H20N2O',
    352.44,
    0
).

molecule(
    dimethylphenyl_magnesium_bromide,
    'CC1=C(C)C(=CC=C1)[Mg]Br',
    '(2,3-Dimethylphenyl)magnesium bromide (Grignard Reagent)',
    'C8H9BrMg',
    209.37,
    0
).

molecule(
    medetomidine_alcohol_trityl,
    'CC(O)(C1=C(C)C(=CC=C1)C)C2=CN(C(C3=CC=CC=C3)(C4=CC=CC=C4)C5=CC=CC=C5)C=N2',
    '1-(2,3-Dimethylphenyl)-1-(1-trityl-1H-imidazol-4-yl)ethanol (Intermediate Alcohol)',
    'C32H30N2O',
    458.60,
    1
).

molecule(
    medetomidine_racemic,
    'CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2',
    'Racemic Medetomidine (4-[1-(2,3-dimethylphenyl)ethyl]-1H-imidazole)',
    'C13H16N2',
    200.28,
    1
).

molecule(
    l_tartaric_acid,
    'O=C(O)C(O)C(O)C(=O)O',
    'L-Tartaric Acid (Chiral Resolving Agent)',
    'C4H6O6',
    150.09,
    2
).

molecule(
    dexmedetomidine,
    'CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2',
    'Dexmedetomidine Free Base ((S)-4-[1-(2,3-dimethylphenyl)ethyl]-1H-imidazole)',
    'C13H16N2',
    200.28,
    1
).

molecule(
    dexmedetomidine_hcl,
    'CC(C1=C(C)C(=CC=C1)C)C2=CN=CN2.Cl',
    'Dexmedetomidine Hydrochloride (Final API)',
    'C13H17ClN2',
    236.74,
    1
).

% =====================================================================
% INDUSTRIAL REACTION NETWORK & CONDITIONS
% =====================================================================

reaction(
    r1,
    grignard_addition,
    [acetyl_tritylimidazole, dimethylphenyl_magnesium_bromide],
    medetomidine_alcohol_trityl,
    reagents([tetrahydrofuran, ammonium_chloride_aq]),
    conditions(temperature_c(0), pressure_bar(1), yield_percent(88)),
    verified(true)
).

reaction(
    r2,
    hydrogenolysis_deprotection,
    [medetomidine_alcohol_trityl],
    medetomidine_racemic,
    reagents([palladium_on_carbon, hydrogen_gas, hydrochloric_acid, methanol]),
    conditions(temperature_c(50), pressure_bar(3), yield_percent(91)),
    verified(true)
).

reaction(
    r3,
    chiral_resolution,
    [medetomidine_racemic, l_tartaric_acid],
    dexmedetomidine,
    reagents([ethanol, acetone, sodium_hydroxide]),
    conditions(temperature_c(25), pressure_bar(1), yield_percent(42)),
    verified(true)
).

reaction(
    r4,
    salt_formation,
    [dexmedetomidine],
    dexmedetomidine_hcl,
    reagents([hydrochloric_acid_isopropanolic, isopropyl_alcohol]),
    conditions(temperature_c(10), pressure_bar(1), yield_percent(95)),
    verified(true)
).

% =====================================================================
% INDUSTRIAL BATCH UNIT OPERATIONS & INSTRUMENT MAPPINGS
% =====================================================================

synthetic_procedure(
    r1,
    'Grignard Addition to Trityl-Protected Imidazole',
    [glass_lined_reactor, dry_nitrogen_manifold, thermal_jacket, hplc_system],
    [
      'Charge rigorously dried reactor with 4-acetyl-1-tritylimidazole dissolved in anhydrous THF under N2.',
      'Cool solution to 0 °C using jacket chiller.',
      'Slowly dose (2,3-dimethylphenyl)magnesium bromide (Grignard reagent) while maintaining temp < 5 °C.',
      'Stir for 2 hours, then quench cautiously with saturated aqueous ammonium chloride.',
      'Extract with ethyl acetate, wash with brine, dry over Na2SO4, and concentrate to yield trityl-alcohol intermediate.'
    ]
).

synthetic_procedure(
    r2,
    'Catalytic Hydrogenolysis & Trityl Deprotection',
    [pressure_hydrogenator, catalyst_filter, distillation_column, gc_ms],
    [
      'Transfer the trityl-alcohol intermediate into a pressure hydrogenator vessel.',
      'Dissolve in methanol containing a stoichiometric excess of concentrated HCl.',
      'Charge 10% Palladium on Carbon (Pd/C) catalyst under an inert atmosphere.',
      'Pressurize reactor to 3 bar H2 and heat to 50 °C for 18 hours (removes benzylic OH and cleaves trityl group).',
      'Filter catalyst safely via nutsche filter and wash with methanol.',
      'Evaporate solvent, partition residue in aqueous base, and extract racemic medetomidine free base.'
    ]
).

synthetic_procedure(
    r3,
    'Resolution of (S)-Enantiomer via L-Tartaric Acid',
    [crystallization_vessel, polarimeter, chiller_unit, centrifuge],
    [
      'Dissolve racemic medetomidine free base in absolute ethanol at 60 °C.',
      'Charge L-tartaric acid solution to form diastereomeric tartrate salts.',
      'Controlled cooling to 15 °C at 0.5 °C/min to selectively crystallize (S)-medetomidine L-tartrate.',
      'Filter diastereomeric salt using a basket centrifuge and wash with chilled acetone.',
      'Basify the salt in water using dilute NaOH to liberate pure Dexmedetomidine free base.',
      'Verify optical rotation via polarimetry (chiral purity > 99.0% ee).'
    ]
).

synthetic_procedure(
    r4,
    'Hydrochlorination & Final API Crystallization',
    [cGMP_crystallizer, micronizer, vacuum_tray_dryer, hplc_chiral],
    [
      'Dissolve Dexmedetomidine free base in dry isopropanol at 20 °C.',
      'Add 1.05 equivalents of isopropanolic HCl under continuous agitation.',
      'Cool batch to 5 °C to precipitate Dexmedetomidine Hydrochloride.',
      'Filter white crystalline powder using closed Nutsche filter under inert nitrogen.',
      'Vacuum dry at 45 °C for 8 hours to meet residual solvent standards (ICH guidelines).'
    ]
).

% =====================================================================
% ANALYTICAL PROFILES & QUALITY GATES
% =====================================================================

bench_profile(
    structural_validation,
    [smiles, atoms, bonds, rings, chirality_absolute, optical_rotation]
).

bench_profile(
    reaction_graph,
    [stoichiometry_matrix, thermodynamic_feasibility, pathway_depth, enantiomeric_excess]
).

bench_profile(
    analytical_release,
    [chiral_purity_hplc, identity_ftir_nmr, heavy_metals, residual_solvents_gc]
).

analysis_recipe(
    dexmedetomidine_identity,
    dexmedetomidine_hcl,
    structural_validation,
    identity
).

analysis_recipe(
    dexmedetomidine_process_graph,
    dexmedetomidine_hcl,
    reaction_graph,
    process_structure
).

analysis_recipe(
    dexmedetomidine_release,
    dexmedetomidine_hcl,
    analytical_release,
    final_release
).

quality_gate(identity, [structure, formula, molecular_weight, stereo_configuration]).
quality_gate(process_structure, [precursors, reagents, chiral_resolving_agent, temperature_profile]).
quality_gate(final_release, [identity, assay_98_102_percent, enantiomeric_purity_gt_99_5_percent, residual_solvents]).

% =====================================================================
% SMILES PARSING & STRUCTURAL EXTRACTION ENGINE
% =====================================================================

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
    is_upper(A),
    is_lower(B),
    atom_chars(X, [A, B]),
    downcase_atom(X, E),
    element(E, _),
    !.
atom_symbol([A|R], E, aliphatic, R) :-
    is_upper(A),
    downcase_atom(A, E),
    element(E, _),
    !.
atom_symbol([A, B|R], E, aromatic, R) :-
    is_lower(A),
    is_lower(B),
    atom_chars(X, [A, B]),
    downcase_atom(X, E),
    aromatic(E),
    !.
atom_symbol([A|R], E, aromatic, R) :-
    is_lower(A),
    downcase_atom(A, E),
    aromatic(E),
    !.
atom_symbol([C|_], _, _, _) :-
    throw(error(invalid_atom(C), smiles_parse/2)).

bracket_body([], _, _) :-
    throw(error(unclosed_bracket, smiles_parse/2)).
bracket_body([']'|R], [], R) :- !.
bracket_body([C|R], [C|T], Rest) :-
    bracket_body(R, T, Rest).

bracket_atom(Cs, atom(Isotope, E, K, H, Charge, Chiral, Map)) :-
    isotope(Cs, R1, Isotope),
    bracket_symbol(R1, R2, E, K),
    chirality(R2, R3, Chiral),
    hydrogens(R3, R4, H),
    charge(R4, R5, Charge),
    atom_map(R5, R6, Map),
    R6 = [].

isotope([C|R], Rest, N) :-
    is_digit(C),
    !,
    digits([C|R], Ds, Rest),
    number_chars(N, Ds).
isotope(R, R, 0).

digits([C|R], [C|Ds], Rest) :-
    is_digit(C),
    !,
    digits(R, Ds, Rest).
digits(R, [], R).

bracket_symbol([A, B|R], R, E, aliphatic) :-
    is_upper(A),
    is_lower(B),
    atom_chars(X, [A, B]),
    downcase_atom(X, E),
    element(E, _),
    !.
bracket_symbol([A|R], R, E, aliphatic) :-
    is_upper(A),
    downcase_atom(A, E),
    element(E, _),
    !.
bracket_symbol([A, B|R], R, E, aromatic) :-
    is_lower(A),
    is_lower(B),
    atom_chars(X, [A, B]),
    downcase_atom(X, E),
    aromatic(E),
    !.
bracket_symbol([A|R], R, E, aromatic) :-
    is_lower(A),
    downcase_atom(A, E),
    aromatic(E),
    !.
bracket_symbol(['*'|R], R, *, wildcard).

chirality(['@', '@'|R], R, at_at) :- !.
chirality(['@'|R], R, at) :- !.
chirality(R, R, none).

hydrogens(['H', D|R], R, N) :-
    is_digit(D),
    !,
    atom_number(D, N).
hydrogens(['H'|R], R, 1) :- !.
hydrogens(R, R, 0).

charge(['+', D|R], R, N) :-
    is_digit(D),
    !,
    atom_number(D, N).
charge(['-', D|R], R, N) :-
    is_digit(D),
    !,
    atom_number(D, N0),
    N is -N0.
charge(['+'|R], R, 1) :- !.
charge(['-'|R], R, -1) :- !.
charge(R, R, 0).

atom_map([':'|R], Rest, N) :-
    digits(R, Ds, Rest),
    Ds \= [],
    number_chars(N, Ds),
    !.
atom_map(R, R, none).

ring_token(['%', A, B|R], N, R) :-
    is_digit(A),
    is_digit(B),
    number_chars(N, [A, B]),
    !.
ring_token([D|R], N, R) :-
    is_digit(D),
    atom_number(D, N).

close_ring(Label, Current, Bond, Bonds, BondsF) :-
    ring_marker(Label, Other, OldBond),
    !,
    compatible_ring_bond(OldBond, Bond, FinalBond),
    retract_ring_marker(Label, Other, OldBond),
    append(Bonds, [edge(Other, Current, FinalBond)], BondsF).
close_ring(Label, Current, Bond, Bonds, Bonds) :-
    assert_ring_marker(Label, Current, Bond).

:- dynamic ring_marker/3.

retract_ring_marker(Label, Other, Bond) :-
    retractall(ring_marker(Label, Other, Bond)).

assert_ring_marker(Label, Current, Bond) :-
    assertz(ring_marker(Label, Current, Bond)).

compatible_ring_bond(none, none, single).
compatible_ring_bond(none, B, B) :- B \= none.
compatible_ring_bond(B, none, B) :- B \= none.
compatible_ring_bond(B, B, B) :- B \= none.
compatible_ring_bond(A, B, _) :-
    A \= B,
    throw(error(conflicting_ring_bonds(A, B), smiles_parse/2)).

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
    aromatic(E1),
    aromatic(E2),
    !.
default_bond(_, _, _, single).

smiles_to_atoms(S, Atoms) :-
    smiles_parse(S, graph(Nodes, _, _)),
    findall(A, member(node(_, A), Nodes), Atoms).

atom_counts(S, Counts) :-
    smiles_to_atoms(S, Atoms),
    findall(E, member(atom(_, E, _, _, _, _, _), Atoms), Elements),
    msort(Elements, Sorted),
    groups(Sorted, Counts).

groups([], []).
groups([X|R], [[X, N]|T]) :-
    consume(R, X, 1, N, Rest),
    groups(Rest, T).

consume([], _, N, N, []).
consume([X|R], X, I, N, Rest) :-
    !,
    I1 is I + 1,
    consume(R, X, I1, N, Rest).
consume(R, _, N, N, R).

smiles_mass(S, Mass) :-
    atom_counts(S, Counts),
    mass_counts(Counts, Mass).

mass_counts([], 0.0).
mass_counts([[E, N]|R], Mass) :-
    element(E, MW),
    mass_counts(R, M),
    Mass is MW * N + M.

analyze_molecule(Name) :-
    molecule(Name, S, D, F, W, SC),
    smiles_parse(S, Graph),
    atom_counts(S, Counts),
    smiles_mass(S, Mass),
    Graph = graph(Atoms, Bonds, Components),
    length(Atoms, AtomCount),
    length(Bonds, BondCount),
    format('~n[Molecule] ~w~n', [Name]),
    format('[Description] ~w~n', [D]),
    format('[SMILES] ~w~n', [S]),
    format('[Formula] ~w~n', [F]),
    format('[Reference MW] ~2f g/mol~n', [W]),
    format('[Parsed MW] ~2f g/mol~n', [Mass]),
    format('[Atoms] ~w~n', [AtomCount]),
    format('[Bonds] ~w~n', [BondCount]),
    format('[Components] ~w~n', [Components]),
    format('[Stereocenters] ~w~n', [SC]),
    format('[Parsed counts] ~w~n', [Counts]).

% =====================================================================
% PROCESS PLANNING & RECIPE SERIALIZATION
% =====================================================================

reaction_step(Id, Step) :-
    reaction(Id, Class, Inputs, Output, Reagents, Conditions, Status),
    Step = step(Id, Class, Inputs, Output, Reagents, Conditions, Status).

target_reaction(Target, Step) :-
    reaction_step(_, Step),
    Step = step(_, _, _, Target, _, _, _).

reaction_path(Target, Path) :-
    reaction_path(Target, [], Path).

reaction_path(Target, Seen, []) :-
    memberchk(Target, Seen),
    !.
reaction_path(Target, Seen, [Step|Rest]) :-
    target_reaction(Target, Step),
    Step = step(Id, _, Inputs, Target, _, _, _),
    \+ memberchk(Id, Seen),
    append(Seen, [Id], Seen1),
    input_paths(Inputs, Seen1, Rest).

input_paths([], _, []).
input_paths([Input|R], Seen, Path) :-
    reaction_path(Input, Seen, P1),
    input_paths(R, Seen, P2),
    append(P1, P2, Path).

validate_reaction_graph(Target) :-
    reaction_path(Target, [], Path),
    Path \= [],
    !.
validate_reaction_graph(Target) :-
    throw(error(no_reaction_path(Target), validate_reaction_graph/1)).

unique_steps(Steps, Unique) :-
    sort(Steps, Unique).

production_steps(Target, Steps) :-
    reaction_path(Target, [], Raw),
    unique_steps(Raw, Steps).

production_materials(Target, Materials) :-
    production_steps(Target, Steps),
    findall(
        M,
        (
            member(step(_, _, Inputs, _, _, _, _), Steps),
            member(M, Inputs),
            molecule(M, _, _, _, _, _)
        ),
        Raw
    ),
    sort(Raw, Materials).

production_intermediates(Target, Intermediates) :-
    production_steps(Target, Steps),
    findall(
        Output,
        (
            member(step(_, _, _, Output, _, _, _), Steps),
            \+ molecule(Output, _, _, _, _, _)
        ),
        Raw
    ),
    sort(Raw, Intermediates).

production_gates(Target, Gates) :-
    findall(
        gate(Name, Target, Profile, Quality),
        analysis_recipe(Name, Target, Profile, Quality),
        Gates
    ).

build_process_plan(Target, process_plan(
    dexmedetomidine_industrial_synthesis_model,
    1,
    Target,
    Steps,
    Materials,
    Intermediates,
    Gates
)) :-
    validate_reaction_graph(Target),
    production_steps(Target, Steps),
    production_materials(Target, Materials),
    production_intermediates(Target, Intermediates),
    production_gates(Target, Gates).

serialize_process_plan(
    process_plan(Name, Version, Target, Steps, Materials, Intermediates, Gates)
) :-
    format('~n[INDUSTRIAL PROCESS PLAN]~n'),
    format('name: ~w~n', [Name]),
    format('version: ~w~n', [Version]),
    format('target: ~w~n', [Target]),
    format('reaction_steps: ~w~n', [Steps]),
    format('starting_materials: ~w~n', [Materials]),
    format('intermediates: ~w~n', [Intermediates]),
    format('quality_gates: ~w~n', [Gates]).

print_synthetic_recipes :-
    format('~n============================================================~n'),
    format('STEP-BY-STEP INDUSTRIAL SYNTHESIS RECIPE & EQUIPMENT MANIFEST~n'),
    format('============================================================~n'),
    forall(
        synthetic_procedure(Id, Title, Equipment, Steps),
        (
            format('~n[STEP: ~w] ~w~n', [Id, Title]),
            format('Equipment / Instruments: ~w~n', [Equipment]),
            format('Operational Procedure:~n'),
            print_recipe_steps(Steps, 1)
        )
    ).

print_recipe_steps([], _).
print_recipe_steps([H|T], N) :-
    format('  ~w. ~w~n', [N, H]),
    N1 is N + 1,
    print_recipe_steps(T, N1).

plan_analysis(Name) :-
    analysis_recipe(Name, Molecule, Profile, Quality),
    bench_profile(Profile, Capabilities),
    quality_gate(Quality, Attributes),
    format('~n[ANALYTICAL RECIPE] ~w~n', [Name]),
    format('compound: ~w~n', [Molecule]),
    format('profile: ~w~n', [Profile]),
    format('capabilities: ~w~n', [Capabilities]),
    format('quality_gate: ~w~n', [Quality]),
    format('attributes: ~w~n', [Attributes]).

% =====================================================================
% ENTRY POINT & EXECUTION ENGINE
% =====================================================================

run_bench :-
    retractall(ring_marker(_, _, _)),
    format('~n============================================================~n'),
    format('DEXMEDETOMIDINE SYNTHESIS & PROCESS MODELING ENGINE (v2.0)~n'),
    format('============================================================~n'),
    analyze_molecule(dexmedetomidine_hcl),
    validate_reaction_graph(dexmedetomidine_hcl),
    build_process_plan(dexmedetomidine_hcl, Plan),
    serialize_process_plan(Plan),
    print_synthetic_recipes,
    plan_analysis(dexmedetomidine_identity),
    plan_analysis(dexmedetomidine_process_graph),
    plan_analysis(dexmedetomidine_release),
    retractall(ring_marker(_, _, _)),
    format('~n[COMPLETE] Industrial synthesis recipe execution finished.~n').

main :-
    run_bench.
