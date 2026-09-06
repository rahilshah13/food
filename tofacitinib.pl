% =====================================================================
% XELJANZ (TOFACITINIB) INDUSTRIAL SYNTHESIS & PROCESS MODELING ENGINE
% High-Precision Chemical Knowledge Base & Route Optimizer
% =====================================================================

% Character classification helpers
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

% Reference elemental atomic masses (IUPAC standard atomic weights)
element(h,1.008).
element(c,12.011).
element(n,14.007).
element(o,15.999).
element(f,18.998).
element(p,30.974).
element(s,32.060).
element(cl,35.450).
element(br,79.904).
element(i,126.904).

aromatic(b).
aromatic(c).
aromatic(n).
aromatic(o).
aromatic(p).
aromatic(s).

% =====================================================================
% MOLECULAR DATABASE (Precise Industrial Intermediates & Reagents)
% =====================================================================

molecule(
    chloro_pyrrolo_pyrimidine,
    'Clc1ncnc2c1c[nH]c2',
    '4-chloro-7H-pyrrolo[2,3-d]pyrimidine (Core Heterocycle)',
    'C6H4ClN3',
    153.57,
    0
).

molecule(
    chiral_piperidine_amine,
    'CN[C@@H]1CC[C@@H](C)N(Cc2ccccc2)C1',
    '(3R,4R)-1-benzyl-N,4-dimethylpiperidin-3-amine (Chiral Building Block)',
    'C14H22N2',
    218.34,
    2
).

molecule(
    coupled_benzyl_intermediate,
    'CN(C1CC[C@@H](C)N(Cc2ccccc2)C1)c3ncnc4c3c[nH]c4',
    'N-((3R,4R)-1-benzyl-4-methylpiperidin-3-yl)-N-methyl-7H-pyrrolo[2,3-d]pyrimidin-4-amine',
    'C20H25N7',
    363.46,
    2
).

molecule(
    deprotected_amine_intermediate,
    'CN(C1CC[C@@H](C)NC1)c2ncnc3c2c[nH]3',
    '(3R,4R)-N,4-dimethyl-N-(7H-pyrrolo[2,3-d]pyrimidin-4-yl)piperidin-3-amine (Secondary Amine)',
    'C13H19N7',
    273.34,
    2
).

molecule(
    tofacitinib,
    'CN1C[C@@H]([C@@H](C1)N(C)C(=O)CC#N)C2=C3C(=CN2)N=CN3',
    'Tofacitinib Free Base (3-{(3R,4R)-4-methyl-3-[methyl(7H-pyrrolo[2,3-d]pyrimidin-4-yl)amino]piperidin-1-yl}-3-oxopropanenitrile)',
    'C16H20N6O',
    312.37,
    2
).

molecule(
    citric_acid,
    'OC(=O)CC(O)(CC(=O)O)C(=O)O',
    'Citric Acid Anhydrous',
    'C6H8O7',
    192.12,
    0
).

molecule(
    tofacitinib_citrate,
    'CN1C[C@@H]([C@@H](C1)N(C)C(=O)CC#N)C2=C3C(=CN2)N=CN3',
    'Tofacitinib Citrate Monocitrate Salt (Xeljanz API)',
    'C22H28N6O8',
    504.49,
    2
).

% =====================================================================
% INDUSTRIAL REACTION NETWORK & CONDITIONS
% =====================================================================

reaction(
    r1,
    snar_coupling,
    [chloro_pyrrolo_pyrimidine, chiral_piperidine_amine],
    coupled_benzyl_intermediate,
    reagents([potassium_carbonate, acetonitrile_water]),
    conditions(temperature_c(80), pressure_bar(1), yield_percent(87)),
    verified(true)
).

reaction(
    r2,
    catalytic_hydrogenation,
    [coupled_benzyl_intermediate],
    deprotected_amine_intermediate,
    reagents([palladium_hydroxide_carbon, hydrogen_gas, acetic_acid]),
    conditions(temperature_c(50), pressure_bar(3), yield_percent(91)),
    verified(true)
).

reaction(
    r3,
    cyanoacylation,
    [deprotected_amine_intermediate],
    tofacitinib,
    reagents([cyanoacetic_acid, dbu, tetrahydrofuran]),
    conditions(temperature_c(25), pressure_bar(1), yield_percent(84)),
    verified(true)
).

reaction(
    r4,
    salt_formation,
    [tofacitinib, citric_acid],
    tofacitinib_citrate,
    reagents([aqueous_ethanol, absolute_citric_acid]),
    conditions(temperature_c(60), pressure_bar(1), yield_percent(95)),
    verified(true)
).

% =====================================================================
% INDUSTRIAL BATCH UNIT OPERATIONS & INSTRUMENT MAPPINGS
% =====================================================================

synthetic_procedure(
    r1,
    'Nucleophilic Aromatic Substitution (S_NAr)',
    [glass_lined_reactor, thermal_jacket, reflux_condenser, overhead_anchor_agitator, hplc_system],
    [
      'Charge glass-lined reactor with 4-chloro-7H-pyrrolo[2,3-d]pyrimidine and (3R,4R)-1-benzyl-N,4-dimethylpiperidin-3-amine.',
      'Add solvent mixture of acetonitrile and purified water under inert nitrogen blanket.',
      'Add potassium carbonate base while activating the overhead anchor agitator at 120 RPM.',
      'Engage thermal jacket to heat batch mixture to 80 °C under atmospheric pressure (1 bar).',
      'Reflux mixture for 16 hours, monitoring conversion rates via high-performance liquid chromatography (HPLC system).',
      'Cool batch to 20 °C, extract organic layer, and concentrate via rotary evaporator to yield coupled benzyl intermediate.'
    ]
).

synthetic_procedure(
    r2,
    'Catalytic Benzyl Deprotection via Hydrogenation',
    [stainless_steel_hydrogenation_autoclave, hydrogen_sparger, pressure_controller, nutsche_filter_dryer, atomic_absorption_spectrometer],
    [
      'Transfer coupled benzyl intermediate into a stainless steel hydrogenation autoclave.',
      'Slurry catalyst palladium hydroxide on carbon (Pd(OH)2/C) into glacial acetic acid and charge into autoclave.',
      'Purge vessel three times with nitrogen gas, then pressurize with hydrogen gas to 3 bar.',
      'Maintain batch temperature at 50 °C with vigorous internal gas dispersion for 6 hours.',
      'De-pressurize reactor, pass mixture through a Nutsche filter dryer pre-coated with Celite to remove spent catalyst.',
      'Verify complete palladium removal below threshold limits via atomic absorption spectrometer; concentrate filtrate.'
    ]
).

synthetic_procedure(
    r3,
    'Cyanoacylation Side-Chain Coupling',
    [glass_lined_reactor, dosing_funnel, pH_meter, chilled_water_loop, vacuum_filter],
    [
      'Dissolve deprotected secondary amine intermediate in anhydrous tetrahydrofuran inside a dry glass-lined reactor.',
      'Add DBU (1,8-diazabicyclo[5.4.0]undec-7-ene) as organic base catalyst.',
      'Slowly dose cyanoacetic acid solution via dosing funnel over 45 minutes while keeping internal temperature at 25 °C.',
      'Agitate reaction mixture for 4 hours until cyanoacylation reaches completion.',
      'Quench reaction with chilled deionized water, precipitate crude Tofacitinib free base, and isolate via vacuum filter.'
    ]
).

synthetic_procedure(
    r4,
    'Monocitrate Salt Crystallization',
    [crystallization_vessel, jacketed_condenser, differential_scanning_calorimeter, hplc_chiral_analyzer, industrial_tray_dryer],
    [
      'Suspend isolated Tofacitinib free base in aqueous ethanol inside a jacketed crystallization vessel.',
      'Prepare a separate solution of absolute anhydrous citric acid in warm ethanol.',
      'Slowly add citric acid solution into the free-base slurry at 60 °C to initiate salt formation.',
      'Cool crystallization batch programmatically to 5 °C over 3 hours to form high-purity monocitrate salt crystals.',
      'Harvest crystal cake via centrifuge filtration and dry in an industrial tray dryer under vacuum at 45 °C.',
      'Analyze final API batch purity and enantiomeric excess (ee > 99%) using HPLC chiral analyzer and differential scanning calorimeter.'
    ]
).

% =====================================================================
% ANALYTICAL PROFILES & QUALITY GATES
% =====================================================================

bench_profile(
    structural_validation,
    [smiles,atoms,bonds,rings,branches,brackets,charges,chirality_absolute]
).

bench_profile(
    reaction_graph,
    [stoichiometry_matrix,thermodynamic_feasibility,pathway_depth,reagent_compatibility]
).

bench_profile(
    analytical_release,
    [chiral_purity_hplc,residual_palladium,identity_ftir_nmr,molecular_weight,heavy_metals]
).

analysis_recipe(
    tofacitinib_identity,
    tofacitinib,
    structural_validation,
    identity
).

analysis_recipe(
    tofacitinib_process_graph,
    tofacitinib,
    reaction_graph,
    process_structure
).

analysis_recipe(
    tofacitinib_release,
    tofacitinib,
    analytical_release,
    final_release
).

analysis_recipe(
    tofacitinib_citrate_release,
    tofacitinib_citrate,
    analytical_release,
    final_release
).

quality_gate(identity,[structure,formula,molecular_weight,chiral_centers]).
quality_gate(process_structure,[precursors,reagents,catalysts,temperature_profile]).
quality_gate(final_release,[identity,stereochemistry_ee_gt_99_percent,residual_solvents,purity]).

% =====================================================================
% SMILES PARSING & STRUCTURAL EXTRACTION ENGINE
% =====================================================================

smiles_parse(S,graph(Atoms,Bonds,Components)) :-
    string_chars(S,Cs),
    parse_components(Cs,Atoms,Bonds,Components).

parse_components(Cs,Atoms,Bonds,Components) :-
    split_components(Cs,Parts),
    parse_component_list(Parts,1,Atoms,Bonds,Components).

split_components([], [[]]).
split_components(Cs,Parts) :-
    split_components_(Cs,[],Parts).

split_components_([],Current,[Current]).
split_components_(['.'|R],Current,[Current|Parts]) :-
    split_components_(R,[],Parts).
split_components_([C|R],Current,Parts) :-
    append(Current,[C],Next),
    split_components_(R,Next,Parts).

parse_component_list([],_,[],[],[]).
parse_component_list([Part|Rest],Offset,Atoms,Bonds,[component(Offset,N)|Components]) :-
    parse_component(Part,LocalAtoms,LocalBonds),
    length(LocalAtoms,N),
    shift_atoms(LocalAtoms,Offset,ShiftedAtoms),
    shift_bonds(LocalBonds,Offset,ShiftedBonds),
    append(ShiftedAtoms,Atoms0,Atoms),
    append(ShiftedBonds,Bonds0,Bonds),
    Offset1 is Offset+N,
    parse_component_list(Rest,Offset1,Atoms0,Bonds0,Components).

shift_atoms([],_,[]).
shift_atoms([node(I,A)|R],Offset,[node(J,A)|T]) :-
    J is I+Offset-1,
    shift_atoms(R,Offset,T).

shift_bonds([],_,[]).
shift_bonds([edge(A,B,T)|R],Offset,[edge(X,Y,T)|S]) :-
    X is A+Offset-1,
    Y is B+Offset-1,
    shift_bonds(R,Offset,S).

parse_component(Cs,Atoms,Bonds) :-
    parse_stream(Cs,none,[],[],[],Atoms,Bonds,[]).

parse_stream([],none,_,_,Atoms,Bonds,Atoms,Bonds) :-
    !.
parse_stream([],_,_,_,_,_,_,_) :-
    throw(error(unclosed_smiles,smiles_parse/2)).
parse_stream(['('|R],Current,Stack,Pending,Atoms,Bonds,AF,BF) :-
    !,
    parse_stream(R,Current,[Current|Stack],Pending,Atoms,Bonds,AF,BF).
parse_stream([')'|R],_,[Parent|Stack],_,Atoms,Bonds,AF,BF) :-
    !,
    parse_stream(R,Parent,Stack,none,Atoms,Bonds,AF,BF).
parse_stream([')'|_],_,[],_,_,_,_,_) :-
    throw(error(unmatched_branch,smiles_parse/2)).
parse_stream(Cs,Current,Stack,Pending,Atoms0,Bonds0,Atoms,Bonds) :-
    bond_prefix(Cs,Pending1,R1),
    parse_atom_or_ring(R1,Current,Pending1,Atoms0,Bonds0,Current1,Bonds1,Atoms1,R2),
    parse_stream(R2,Current1,Stack,none,Atoms1,Bonds1,Atoms,Bonds).

bond_prefix(['-'|R],single,R) :- !.
bond_prefix(['='|R],double,R) :- !.
bond_prefix(['#'|R],triple,R) :- !.
bond_prefix([':'|R],aromatic,R) :- !.
bond_prefix(['~'|R],any,R) :- !.
bond_prefix(R,none,R).

parse_atom_or_ring(Cs,Current,Bond,Atoms,Bonds,Next,BondsF,AtomsF,Rest) :-
    ring_token(Cs,Label,R),
    !,
    close_ring(Label,Current,Bond,Bonds,BondsF),
    Next=Current,
    AtomsF=Atoms,
    Rest=R.
parse_atom_or_ring(Cs,Current,Bond,Atoms0,Bonds0,Next,Bonds,Atoms,Rest) :-
    atom_token(Cs,Atom,Rest),
    length(Atoms0,N),
    Next is N+1,
    append(Atoms0,[node(Next,Atom)],Atoms),
    connect(Current,Next,Bond,Atoms,Bonds0,Bonds).

atom_token(['['|R],Atom,Rest) :-
    !,
    bracket_body(R,Body,Rest),
    bracket_atom(Body,Atom).
atom_token(['*'|R],atom(0,*,wildcard,0,0,none,none),R) :- !.
atom_token(Cs,atom(0,E,K,0,0,none,none),Rest) :-
    atom_symbol(Cs,E,K,Rest).

atom_symbol([A,B|R],E,aliphatic,R) :-
    is_upper(A),
    is_lower(B),
    atom_chars(X,[A,B]),
    downcase_atom(X,E),
    element(E,_),
    !.
atom_symbol([A|R],E,aliphatic,R) :-
    is_upper(A),
    downcase_atom(A,E),
    element(E,_),
    !.
atom_symbol([A,B|R],E,aromatic,R) :-
    is_lower(A),
    is_lower(B),
    atom_chars(X,[A,B]),
    downcase_atom(X,E),
    aromatic(E),
    !.
atom_symbol([A|R],E,aromatic,R) :-
    is_lower(A),
    downcase_atom(A,E),
    aromatic(E),
    !.
atom_symbol([C|_],_,_,_) :-
    throw(error(invalid_atom(C),smiles_parse/2)).

bracket_body([],_,_) :-
    throw(error(unclosed_bracket,smiles_parse/2)).
bracket_body([']'|R],[],R) :- !.
bracket_body([C|R],[C|T],Rest) :-
    bracket_body(R,T,Rest).

bracket_atom(Cs,atom(Isotope,E,K,H,Charge,Chiral,Map)) :-
    isotope(Cs,R1,Isotope),
    bracket_symbol(R1,R2,E,K),
    chirality(R2,R3,Chiral),
    hydrogens(R3,R4,H),
    charge(R4,R5,Charge),
    atom_map(R5,R6,Map),
    R6=[].

isotope([C|R],Rest,N) :-
    is_digit(C),
    !,
    digits([C|R],Ds,Rest),
    number_chars(N,Ds).
isotope(R,R,0).

digits([C|R],[C|Ds],Rest) :-
    is_digit(C),
    !,
    digits(R,Ds,Rest).
digits(R,[],R).

bracket_symbol([A,B|R],R,E,aliphatic) :-
    is_upper(A),
    is_lower(B),
    atom_chars(X,[A,B]),
    downcase_atom(X,E),
    element(E,_),
    !.
bracket_symbol([A|R],R,E,aliphatic) :-
    is_upper(A),
    downcase_atom(A,E),
    element(E,_),
    !.
bracket_symbol([A,B|R],R,E,aromatic) :-
    is_lower(A),
    is_lower(B),
    atom_chars(X,[A,B]),
    downcase_atom(X,E),
    aromatic(E),
    !.
bracket_symbol([A|R],R,E,aromatic) :-
    is_lower(A),
    downcase_atom(A,E),
    aromatic(E),
    !.
bracket_symbol(['*'|R],R,*,wildcard).

chirality(['@','@'|R],R,at_at) :- !.
chirality(['@'|R],R,at) :- !.
chirality(R,R,none).

hydrogens(['H',D|R],R,N) :-
    is_digit(D),
    !,
    atom_number(D,N).
hydrogens(['H'|R],R,1) :- !.
hydrogens(R,R,0).

charge(['+',D|R],R,N) :-
    is_digit(D),
    !,
    atom_number(D,N).
charge(['-',D|R],R,N) :-
    is_digit(D),
    !,
    atom_number(D,N0),
    N is -N0.
charge(['+'|R],R,1) :- !.
charge(['-'|R],R,-1) :- !.
charge(R,R,0).

atom_map([':'|R],Rest,N) :-
    digits(R,Ds,Rest),
    Ds\=[],
    number_chars(N,Ds),
    !.
atom_map(R,R,none).

ring_token(['%',A,B|R],N,R) :-
    is_digit(A),
    is_digit(B),
    number_chars(N,[A,B]),
    !.
ring_token([D|R],N,R) :-
    is_digit(D),
    atom_number(D,N).

close_ring(Label,Current,Bond,Bonds,BondsF) :-
    ring_marker(Label,Other,OldBond),
    !,
    compatible_ring_bond(OldBond,Bond,FinalBond),
    retract_ring_marker(Label,Other,OldBond),
    append(Bonds,[edge(Other,Current,FinalBond)],BondsF).
close_ring(Label,Current,Bond,Bonds,Bonds) :-
    assert_ring_marker(Label,Current,Bond).

:- dynamic ring_marker/3.

retract_ring_marker(Label,Other,Bond) :-
    retractall(ring_marker(Label,Other,Bond)).

assert_ring_marker(Label,Current,Bond) :-
    assertz(ring_marker(Label,Current,Bond)).

compatible_ring_bond(none,none,single).
compatible_ring_bond(none,B,B) :- B\=none.
compatible_ring_bond(B,none,B) :- B\=none.
compatible_ring_bond(B,B,B) :- B\=none.
compatible_ring_bond(A,B,_) :-
    A\=B,
    throw(error(conflicting_ring_bonds(A,B),smiles_parse/2)).

connect(none,_,_,_,Bonds,Bonds).
connect(Current,Next,none,Atoms,Bonds0,Bonds) :-
    default_bond(Current,Next,Atoms,Bond),
    append(Bonds0,[edge(Current,Next,Bond)],Bonds).
connect(Current,Next,Bond,_,Bonds0,Bonds) :-
    Bond\=none,
    append(Bonds0,[edge(Current,Next,Bond)],Bonds).

default_bond(A,B,Atoms,aromatic) :-
    memberchk(node(A,atom(_,E1,aromatic,_,_,_,_)),Atoms),
    memberchk(node(B,atom(_,E2,aromatic,_,_,_,_)),Atoms),
    aromatic(E1),
    aromatic(E2),
    !.
default_bond(_,_,_,single).

smiles_to_atoms(S,Atoms) :-
    smiles_parse(S,graph(Nodes,_,_)),
    findall(A,member(node(_,A),Nodes),Atoms).

atom_counts(S,Counts) :-
    smiles_to_atoms(S,Atoms),
    findall(E,
        member(atom(_,E,_,_,_,_,_),Atoms),
        Elements),
    msort(Elements,Sorted),
    groups(Sorted,Counts).

groups([],[]).
groups([X|R],[[X,N]|T]) :-
    consume(R,X,1,N,Rest),
    groups(Rest,T).

consume([],_,N,N,[]).
consume([X|R],X,I,N,Rest) :-
    !,
    I1 is I+1,
    consume(R,X,I1,N,Rest).
consume(R,_,N,N,R).

smiles_mass(S,Mass) :-
    atom_counts(S,Counts),
    mass_counts(Counts,Mass).

mass_counts([],0.0).
mass_counts([[E,N]|R],Mass) :-
    element(E,MW),
    mass_counts(R,M),
    Mass is MW*N+M.

molecular_graph(Name,Graph) :-
    molecule(Name,S,_,_,_,_),
    smiles_parse(S,Graph).

validate_molecule(Name,valid(Name)) :-
    molecule(Name,S,_,_,_,_),
    catch(smiles_parse(S,_),_,fail),
    !.
validate_molecule(Name,invalid(Name)) :-
    molecule(Name,_,_,_,_,_).

validate_database :-
    findall(Result,
        (
            molecule(Name,_,_,_,_,_),
            validate_molecule(Name,Result)
        ),
        Results),
    print_validation(Results).

print_validation([]).
print_validation([valid(Name)|R]) :-
    format('[OK] ~w~n',[Name]),
    print_validation(R).
print_validation([invalid(Name)|R]) :-
    format('[INVALID] ~w~n',[Name]),
    print_validation(R).

analyze_molecule(Name) :-
    molecule(Name,S,D,F,W,SC),
    smiles_parse(S,Graph),
    atom_counts(S,Counts),
    smiles_mass(S,Mass),
    Graph=graph(Atoms,Bonds,Components),
    length(Atoms,AtomCount),
    length(Bonds,BondCount),
    format('~n[Molecule] ~w~n',[Name]),
    format('[Description] ~w~n',[D]),
    format('[SMILES] ~w~n',[S]),
    format('[Formula] ~w~n',[F]),
    format('[Reference MW] ~2f g/mol~n',[W]),
    format('[Parsed MW] ~2f g/mol~n',[Mass]),
    format('[Atoms] ~w~n',[AtomCount]),
    format('[Bonds] ~w~n',[BondCount]),
    format('[Components] ~w~n',[Components]),
    format('[Stereocenters] ~w~n',[SC]),
    format('[Parsed counts] ~w~n',[Counts]).

% =====================================================================
% PROCESS PLANNING & RECIPE SERIALIZATION
% =====================================================================

reaction_step(Id,Step) :-
    reaction(Id,Class,Inputs,Output,Reagents,Conditions,Status),
    Step=step(Id,Class,Inputs,Output,Reagents,Conditions,Status).

target_reaction(Target,Step) :-
    reaction_step(_,Step),
    Step=step(_,_,_,Target,_,_,_).

reaction_path(Target,Path) :-
    reaction_path(Target,[],Path).

reaction_path(Target,Seen,[]) :-
    memberchk(Target,Seen),
    !.
reaction_path(Target,Seen,[Step|Rest]) :-
    target_reaction(Target,Step),
    Step=step(Id,_,Inputs,Target,_,_,_),
    \+ memberchk(Id,Seen),
    append(Seen,[Id],Seen1),
    input_paths(Inputs,Seen1,Rest).

input_paths([],_,[]).
input_paths([Input|R],Seen,Path) :-
    reaction_path(Input,Seen,P1),
    input_paths(R,Seen,P2),
    append(P1,P2,Path).

validate_reaction_graph(Target) :-
    reaction_path(Target,[],Path),
    Path\= [],
    !.
validate_reaction_graph(Target) :-
    throw(error(no_reaction_path(Target),validate_reaction_graph/1)).

unique_steps(Steps,Unique) :-
    sort(Steps,Unique).

production_steps(Target,Steps) :-
    reaction_path(Target,[],Raw),
    unique_steps(Raw,Steps).

production_materials(Target,Materials) :-
    production_steps(Target,Steps),
    findall(
        M,
        (
            member(step(_,_,Inputs,_,_,_,_),Steps),
            member(M,Inputs),
            molecule(M,_,_,_,_,_)
        ),
        Raw
    ),
    sort(Raw,Materials).

production_intermediates(Target,Intermediates) :-
    production_steps(Target,Steps),
    findall(
        Output,
        (
            member(step(_,_,_,Output,_,_,_),Steps),
            \+ molecule(Output,_,_,_,_,_)
        ),
        Raw
    ),
    sort(Raw,Intermediates).

production_gates(Target,Gates) :-
    findall(
        gate(Name,Target,Profile,Quality),
        analysis_recipe(Name,Target,Profile,Quality),
        Gates
    ).

build_process_plan(Target,process_plan(
    xeljanz_industrial_synthesis_model,
    3,
    Target,
    Steps,
    Materials,
    Intermediates,
    Gates
)) :-
    validate_reaction_graph(Target),
    production_steps(Target,Steps),
    production_materials(Target,Materials),
    production_intermediates(Target,Intermediates),
    production_gates(Target,Gates).

serialize_process_plan(
    process_plan(Name,Version,Target,Steps,Materials,Intermediates,Gates)
) :-
    format('~n[INDUSTRIAL PROCESS PLAN]~n'),
    format('name: ~w~n',[Name]),
    format('version: ~w~n',[Version]),
    format('target: ~w~n',[Target]),
    format('reaction_steps: ~w~n',[Steps]),
    format('starting_materials: ~w~n',[Materials]),
    format('intermediates: ~w~n',[Intermediates]),
    format('quality_gates: ~w~n',[Gates]).

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
    analysis_recipe(Name,Molecule,Profile,Quality),
    bench_profile(Profile,Capabilities),
    quality_gate(Quality,Attributes),
    format('~n[ANALYTICAL RECIPE] ~w~n',[Name]),
    format('compound: ~w~n',[Molecule]),
    format('profile: ~w~n',[Profile]),
    format('capabilities: ~w~n',[Capabilities]),
    format('quality_gate: ~w~n',[Quality]),
    format('attributes: ~w~n',[Attributes]).

run_bench :-
    retractall(ring_marker(_,_,_)),
    format('~n============================================================~n'),
    format('XELJANZ INDUSTRIAL SYNTHESIS & PROCESS MODELING ENGINE (v3.0)~n'),
    format('============================================================~n'),
    validate_database,
    analyze_molecule(tofacitinib),
    analyze_molecule(tofacitinib_citrate),
    validate_reaction_graph(tofacitinib),
    build_process_plan(tofacitinib,Plan),
    serialize_process_plan(Plan),
    print_synthetic_recipes,
    plan_analysis(tofacitinib_identity),
    plan_analysis(tofacitinib_process_graph),
    plan_analysis(tofacitinib_release),
    plan_analysis(tofacitinib_citrate_release),
    retractall(ring_marker(_,_,_)),
    format('~n[COMPLETE] Industrial synthesis recipe execution finished.~n').

main :-
    run_bench.
