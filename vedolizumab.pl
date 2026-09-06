% =====================================================================
% ENTYVIO (VEDOLIZUMAB) BIOPROCESS & MANUFACTURING ENGINE
% High-Precision Biopharmaceutical Knowledge Base & Route Optimizer
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
% BIOLOGICAL & CHEMICAL MOLECULAR DATABASE (Entyvio / Vedolizumab)
% =====================================================================

molecule(
    cho_cell_culture_harvest,
    'CC(C)C',
    'CHO Cell Culture Expression Broth (Raw Monoclonal Antibody Output)',
    'C6528H10072N1732O2042S42',
    146837.00,
    0
).

molecule(
    purified_antibody_intermediate,
    'CC(C)C',
    'Protein A & Ion-Exchange Polished Bulk Drug Substance',
    'C6528H10072N1732O2042S42',
    146837.00,
    0
).

molecule(
    vedolizumab,
    'CC(C)C',
    'Vedolizumab Recombinant Humanized IgG1 Monoclonal Antibody API',
    'C6528H10072N1732O2042S42',
    146837.00,
    0
).

molecule(
    formulation_excipients,
    'OC[C@H]1O[C@@H](O[C@@H]2[C@@H](O)[C@@H](O)CO2)[C@@H](O)[C@H]1O',
    'L-Histidine, Arginine, Polysorbate 80, and Sucrose Excipient Blend',
    'C12H22O11',
    342.30,
    8
).

molecule(
    vedolizumab_iv_formulation,
    'CC(C)C',
    'Entyvio 300 mg Intravenous Lyophilized Vial Formulation',
    'C6540H10100N1740O2060S42',
    148000.00,
    8
).

% =====================================================================
% INDUSTRIAL BIOPROCESS REACTION NETWORK & CONDITIONS
% =====================================================================

reaction(
    r1,
    fed_batch_expression,
    [cho_cell_culture_harvest],
    purified_antibody_intermediate,
    reagents([protein_a_resin, sodium_citrate_buffer, low_ph_wash]),
    conditions(temperature_c(37), pressure_bar(1), titer_g_l(5.4)),
    verified(true)
).

reaction(
    r2,
    downstream_polishing,
    [purified_antibody_intermediate],
    vedolizumab,
    reagents([anion_exchange_membrane, cation_exchange_resin, viral_retention_filter]),
    conditions(temperature_c(22), pressure_bar(25), yield_percent(88)),
    verified(true)
).

reaction(
    r3,
    ultrafiltration_diafiltration,
    [vedolizumab, formulation_excipients],
    vedolizumab_iv_formulation,
    reagents([l_histidine, sucrose, polysorbate_80, water_for_injection]),
    conditions(temperature_c(20), pressure_bar(2), yield_percent(96)),
    verified(true)
).

% =====================================================================
% INDUSTRIAL BATCH UNIT OPERATIONS & INSTRUMENT MAPPINGS
% =====================================================================

synthetic_procedure(
    r1,
    'Fed-Batch Upstream Expression & Clarification',
    [stainless_steel_bioreactor, seed_train_incubator, automated_feed_dosing_system, depth_filtration_skid, online_biomass_sensor],
    [
      'Inoculate Chinese Hamster Ovary (CHO) cell line expressing vedolizumab into a seed train incubator.',
      'Transfer seed culture into a production-scale stainless steel bioreactor containing chemically defined growth media.',
      'Maintain parameters at 37 °C, pH 7.1, and dissolved oxygen at 40% saturation via automated feed dosing system.',
      'Execute 14-day fed-batch cultivation cycle, harvesting cell broth upon reaching peak volumetric titer (~5.4 g/L).',
      'Pass harvest broth through a primary depth filtration skid followed by secondary sterile microfiltration to remove biomass.'
    ]
).

synthetic_procedure(
    r2,
    'Protein A Capture & Chromatography Polishing',
    [protein_a_chromatography_skid, low_ph_viral_inactivation_vessel, anion_exchange_chromatography_column, viral_retention_filter, analytical_sec_hplc],
    [
      'Load clarified supernatant onto a Protein A affinity chromatography skid for selective monoclonal antibody capture.',
      'Perform low-pH incubation (pH 3.5 for 60 minutes) in a dedicated vessel for enveloped virus inactivation.',
      'Polish product stream using an anion-exchange chromatography column to remove host cell proteins and DNA impurities.',
      'Pass intermediate through a virus retention nanofilter and concentrate via ultrafiltration.',
      'Verify monomer purity (>99%) and aggregate clearance using an analytical size-exclusion HPLC system.'
    ]
).

synthetic_procedure(
    r3,
    'Buffer Exchange, Excipient Blending & Lyophilization',
    [tangential_flow_filtration_skid, sterile_mixing_tank, industrial_lyophilizer, automated_visual_inspection_system, hplc_chiral_analyzer],
    [
      'Execute ultrafiltration and diafiltration (UF/DF) via a tangential flow filtration skid to transition API into the formulation buffer.',
      'Blend purified vedolizumab bulk solution with excipients: L-histidine, sucrose, L-arginine hydrochloride, and polysorbate 80 inside a sterile mixing tank.',
      'Aseptically fill 20 mL glass vials with formulated solution on an automated filling line.',
      'Load vials into an industrial lyophilizer for controlled primary and secondary freeze-drying cycles.',
      'Seal vials under vacuum with stopper assemblies, and conduct automated visual inspection and purity testing.'
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
    [titer_yield_matrix,thermodynamic_feasibility,pathway_depth,reagent_compatibility]
).

bench_profile(
    analytical_release,
    [sec_hplc_purity,endotoxin_limulus_assay,peptide_mapping,molecular_weight,host_cell_protein_elisa]
).

analysis_recipe(
    vedolizumab_identity,
    vedolizumab,
    structural_validation,
    identity
).

analysis_recipe(
    vedolizumab_process_graph,
    vedolizumab,
    reaction_graph,
    process_structure
).

analysis_recipe(
    vedolizumab_release,
    vedolizumab,
    analytical_release,
    final_release
).

analysis_recipe(
    vedolizumab_iv_formulation_release,
    vedolizumab_iv_formulation,
    analytical_release,
    final_release
).

quality_gate(identity,[structure,formula,molecular_weight,glycosylation_profile]).
quality_gate(process_structure,[precursors,reagents,bioreactor_parameters,purification_steps]).
quality_gate(final_release,[identity,monomer_purity_gt_99_percent,endotoxin_limits,sterility]).

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
    entyvio_bioprocess_model,
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
    format('~n[BIOPROCESS PLAN]~n'),
    format('name: ~w~n',[Name]),
    format('version: ~w~n',[Version]),
    format('target: ~w~n',[Target]),
    format('reaction_steps: ~w~n',[Steps]),
    format('starting_materials: ~w~n',[Materials]),
    format('intermediates: ~w~n',[Intermediates]),
    format('quality_gates: ~w~n',[Gates]).

print_synthetic_recipes :-
    format('~n============================================================~n'),
    format('STEP-BY-STEP BIOPROCESS RECIPE & EQUIPMENT MANIFEST~n'),
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
    format('VEDOLIZUMAB'),
    format('============================================================~n'),
    validate_database,
    analyze_molecule(vedolizumab),
    analyze_molecule(vedolizumab_iv_formulation),
    validate_reaction_graph(vedolizumab),
    build_process_plan(vedolizumab,Plan),
    serialize_process_plan(Plan),
    print_synthetic_recipes,
    plan_analysis(vedolizumab_identity),
    plan_analysis(vedolizumab_process_graph),
    plan_analysis(vedolizumab_release),
    plan_analysis(vedolizumab_iv_formulation_release),
    retractall(ring_marker(_,_,_)),
    format('~n[COMPLETE] Bioprocess recipe execution finished.~n').

main :-
    run_bench.
