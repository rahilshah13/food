% =====================================================================
% VANCOMYCIN HYDROCHLORIDE INDUSTRIAL PROCESS & MODELING ENGINE
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
% Now utilizing Isomeric SMILES to explicitly map all chiral centers.
% =====================================================================

molecule(
    fermentation_feedstock,
    'OC[C@@H]1[C@@H]([C@H]([C@@H]([C@H](O1)O)O)O)O',
    'D-Glucose (Primary Carbon Source for A. orientalis)',
    'C6H12O6',
    180.16,
    5
).

molecule(
    vancomycin_broth,
    'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O',
    'Crude Vancomycin (Fermentation Broth Dilute)',
    'C66H75Cl2N9O24',
    1449.25,
    18
).

molecule(
    vancomycin_crude,
    'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O',
    'Vancomycin Free Base (Post-Resin Extraction)',
    'C66H75Cl2N9O24',
    1449.25,
    18
).

molecule(
    vancomycin_free_base,
    'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O',
    'Vancomycin Free Base (Chromatographically Purified API)',
    'C66H75Cl2N9O24',
    1449.25,
    18
).

molecule(
    hydrochloric_acid,
    'Cl',
    'Hydrochloric Acid (Aqueous)',
    'HCl',
    36.46,
    0
).

molecule(
    vancomycin_hydrochloride,
    'C[C@H]1[C@H]([C@@](C[C@@H](O1)O[C@@H]2[C@H]([C@@H]([C@H](O[C@H]2OC3=C4C=C5C=C3OC6=C(C=C(C=C6)[C@H]([C@H](C(=O)N[C@H](C(=O)N[C@H]5C(=O)N[C@@H]7C8=CC(=C(C=C8)O)C9=C(C=C(C=C9O)O)[C@H](NC(=O)[C@H]([C@@H](C%10=CC(=C(O4)C=C%10)Cl)O)NC7=O)C(=O)O)CC(=O)N)NC(=O)[C@@H](CC(C)C)NC)O)Cl)CO)O)O)(C)N)O.Cl',
    'Vancomycin Hydrochloride (Lyophilized API Salt)',
    'C66H76Cl3N9O24',
    1485.71,
    18
).

% =====================================================================
% INDUSTRIAL REACTION NETWORK & CONDITIONS
% =====================================================================

% Note: Step r1 is a bioprocess (fermentation). While modeled here using a 
% reaction/7 predicate for process continuity, it represents an enzymatic 
% biosynthesis pathway rather than strict molar stoichiometry. Yield is 
% represented as a volumetric titer (g/L).
reaction(
    r1,
    bioprocess_fermentation,
    [fermentation_feedstock],
    vancomycin_broth,
    reagents([amycolatopsis_orientalis_spores, soybean_meal, trace_minerals]),
    conditions(temperature_c(28), pressure_bar(1), titer_g_L(15)),
    verified(true)
).

reaction(
    r2,
    resin_adsorption_extraction,
    [vancomycin_broth],
    vancomycin_crude,
    reagents([macroporous_adsorbent_resin, ethanol_eluent, sodium_hydroxide]),
    conditions(temperature_c(20), pressure_bar(1), yield_percent(78)),
    verified(true)
).

reaction(
    r3,
    preparative_hplc_purification,
    [vancomycin_crude],
    vancomycin_free_base,
    reagents([c18_silica_gel, ammonium_acetate_buffer, acetonitrile]),
    conditions(temperature_c(25), pressure_bar(40), yield_percent(85)),
    verified(true)
).

reaction(
    r4,
    hydrochloride_salt_formation,
    [vancomycin_free_base, hydrochloric_acid],
    vancomycin_hydrochloride,
    reagents([purified_water_for_injection, absolute_ethanol]),
    conditions(temperature_c(10), pressure_bar(1), yield_percent(98)),
    verified(true)
).

% =====================================================================
% INDUSTRIAL BATCH UNIT OPERATIONS & INSTRUMENT MAPPINGS
% =====================================================================

synthetic_procedure(
    r1,
    'Aerobic Fermentation (Biosynthesis)',
    [industrial_bioreactor, sparger, thermal_jacket, dissolved_oxygen_sensor, pH_controller],
    [
      'Sterilize the industrial bioreactor and charge with fermentation feedstock (glucose) and soybean meal broth.',
      'Inoculate the media with a vegetative seed culture of Amycolatopsis orientalis.',
      'Activate the sparger to supply sterile compressed air, maintaining high dissolved oxygen levels.',
      'Engage the thermal jacket to maintain an isothermal batch temperature of 28 °C.',
      'Allow fermentation to proceed for 120-160 hours, continuously regulating pH to 7.2 using automated pH controllers.',
      'Harvest the whole broth containing crude dilute vancomycin once maximum secondary metabolite titer is achieved.'
    ]
).

synthetic_procedure(
    r2,
    'Macroporous Resin Extraction & Clarification',
    [disc_stack_centrifuge, resin_column, transfer_pump, vacuum_filter],
    [
      'Process the harvested whole broth through a disc-stack centrifuge to separate and discard mycelial biomass.',
      'Adjust the clarified filtrate to a weakly alkaline pH to ensure the vancomycin remains stable.',
      'Pump the filtrate through a column packed with polymeric macroporous adsorbent resin (e.g., XAD-16).',
      'Wash the loaded resin bed with deionized water to remove highly polar impurities and residual sugars.',
      'Elute the vancomycin crude product using a step gradient of aqueous ethanol (20% to 50% v/v).',
      'Concentrate the target fractions via vacuum evaporation to yield crude vancomycin extract.'
    ]
).

synthetic_procedure(
    r3,
    'Preparative HPLC Purification',
    [prep_hplc_system, uv_detector, fraction_collector, rotary_evaporator],
    [
      'Dissolve the concentrated crude vancomycin in an ammonium acetate loading buffer.',
      'Inject the solution onto an industrial-scale Preparative HPLC system packed with C18 functionalized silica gel.',
      'Elute using a mobile phase gradient of acetonitrile and ammonium acetate buffer at a pressure of 40 bar.',
      'Monitor the effluent continuously with a UV detector set at 280 nm.',
      'Isolate fractions exhibiting high chromatographic purity, rejecting early and late eluting degradation products.',
      'Desalt and evaporate the combined pure fractions to isolate Vancomycin free base.'
    ]
).

synthetic_procedure(
    r4,
    'Hydrochloride Salt Formation & Lyophilization',
    [glass_lined_reactor, sterile_filter, lyophilizer, chilled_water_loop],
    [
      'Suspend the purified Vancomycin free base in pyrogen-free Water for Injection (WFI).',
      'Under gentle agitation at 10 °C, carefully titrate the suspension with dilute hydrochloric acid until a pH of ~3.0 is reached.',
      'Ensure complete dissolution of the newly formed Vancomycin hydrochloride salt.',
      'Pass the aqueous API solution through a 0.22-micron sterile membrane filter into sterile lyophilization trays.',
      'Transfer the trays into an industrial lyophilizer (freeze-dryer).',
      'Execute a programmed primary and secondary drying cycle under deep vacuum to yield the final API powder.',
      'Package the sterile Vancomycin Hydrochloride powder under inert conditions.'
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
    [chromatographic_purity_hplc,identity_ir,water_content_karl_fischer,heavy_metals,bacterial_endotoxins]
).

analysis_recipe(
    vancomycin_identity,
    vancomycin_free_base,
    structural_validation,
    identity
).

analysis_recipe(
    vancomycin_process_graph,
    vancomycin_free_base,
    reaction_graph,
    process_structure
).

analysis_recipe(
    vancomycin_release,
    vancomycin_free_base,
    analytical_release,
    final_release
).

analysis_recipe(
    vancomycin_hydrochloride_release,
    vancomycin_hydrochloride,
    analytical_release,
    final_release
).

quality_gate(identity,[structure,formula,molecular_weight,chiral_centers,glycopeptide_core]).
quality_gate(process_structure,[precursors,reagents,biological_agents,temperature_profile]).
quality_gate(final_release,[identity,chromatographic_purity_gt_93_percent,residual_solvents,bacterial_endotoxins_pass]).

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
    vancomycin_industrial_synthesis_model,
    2,
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
    format('STEP-BY-STEP INDUSTRIAL PROCESS RECIPE & EQUIPMENT MANIFEST~n'),
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
    format('VANCOMYCIN HYDROCHLORIDE PROCESS MODELING ENGINE (v2.0)~n'),
    format('============================================================~n'),
    validate_database,
    analyze_molecule(vancomycin_free_base),
    analyze_molecule(vancomycin_hydrochloride),
    validate_reaction_graph(vancomycin_hydrochloride),
    build_process_plan(vancomycin_hydrochloride,Plan),
    serialize_process_plan(Plan),
    print_synthetic_recipes,
    plan_analysis(vancomycin_identity),
    plan_analysis(vancomycin_process_graph),
    plan_analysis(vancomycin_release),
    plan_analysis(vancomycin_hydrochloride_release),
    retractall(ring_marker(_,_,_)),
    format('~n[COMPLETE] Industrial process recipe execution finished.~n').

main :-
    run_bench.
