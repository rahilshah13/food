:- use_module(library(lists)).

% ==========================================
total_period_requirements(Mass, Days, [need('Protein', P), need('Zinc, Zn', Z), need('Energy', E)]) :-
    P is (Mass * 1.2) * Days,
    Z is 0.011 * Days,
    E is 2000 * Days.

solve_meal(Requirements, Meal) :-
    findall(f(Id, Desc, Nutrients), food_data(Id, Desc, Nutrients), Foods),
    solve_greedy(Requirements, Foods, [], Meal).

solve_greedy(_, [], Acc, Acc) :- !.
solve_greedy(CurrentReqs, [f(_, Desc, Nutrients)|T], Acc, Meal) :-
    Grams = 500,
    update_reqs(CurrentReqs, Nutrients, Grams, NewReqs),
    solve_greedy(NewReqs, T, [portion(Desc, Grams) | Acc], Meal).

all_met([]).
all_met([need(_, Goal) | T]) :-
    Goal < 1000, % Exit if requirement is within a reasonable threshold
    all_met(T).

update_reqs([], _, _, []).
update_reqs([need(Name, Goal) | T], FoodNuts, Grams, [need(Name, NewGoal) | Rest]) :-
    (member(nutrient(Name, ValPer100g), FoodNuts)
        -> Contributed is (ValPer100g / 100.0) * Grams
        ;  Contributed is 0),
    NewGoal is Goal - Contributed,
    update_reqs(T, FoodNuts, Grams, Rest).

truncate_str(Atom, Max, Result) :-
    atom_length(Atom, Len),
    (Len > Max ->
        % sub_atom(Atom, Start, Length, After, Sub)
        sub_atom(Atom, 0, Max, _, Sub),
        atom_concat(Sub, '...', Result)
    ;   Result = Atom).

summarize_and_print(Stream, Meal) :-
    aggregate_meal(Meal, [], Summary),
    format(Stream, '~n--- Daily Dietary Portfolio (Aggregated) ---~n', []),
    format(Stream, '~`=t~45+~n', []),
    format(Stream, 'Food Item~25|Mass (g)~n', []),
    format(Stream, '~`-t~45+~n', []),
    print_summary(Stream, Summary),
    format(Stream, '~`=t~45+~n~n', []), !. % Added cut to handle stream

print_summary(_, []) :- !.
print_summary(Stream, [Desc-Total|T]) :-
    truncate_str(Desc, 22, ShortDesc),
    format(Stream, '~w~25|~w~n', [ShortDesc, Total]),
    print_summary(Stream, T).

print_metabolic_breakdown(Stream, Mass, TotalP) :-
    format(Stream, '--- Organ Tissue Synthesis & Nutrient Allocation ---~n', []),
    format(Stream, '~`=t~55+~n', []),
    format(Stream, 'Organ~25|Mass (kg)~40|Protein (g)~n', []),
    format(Stream, '~`-t~55+~n', []),
    forall(organ(_, _, Name, _, MassPct), (
        OrganMass is Mass * MassPct,
        AllocatedProtein is TotalP * MassPct,
        format(Stream, '~w~25|~2f~40|~2f~n', [Name, OrganMass, AllocatedProtein])
    )),
    format(Stream, '~`=t~55+~n', []), !. % Added cut to handle stream

aggregate_organ_mass([], 0).
aggregate_organ_mass([_-Ratio|T], Total) :-
    aggregate_organ_mass(T, Rest),
    Total is (Ratio * 100) + Rest.

aggregate_meal([], Acc, Acc).
aggregate_meal([portion(Desc, Grams)|T], Acc, Final) :-
    (select(Desc-Total, Acc, Rest)
        -> NewTotal is Total + Grams, aggregate_meal(T, [Desc-NewTotal|Rest], Final)
        ;  aggregate_meal(T, [Desc-Grams|Acc], Final)).

write_human_report(Gender, Mass, Days, FileName) :-
    total_period_requirements(Mass, Days, TotalReqs),
    open(FileName, write, Stream),
    format(Stream, '==================================================~n', []),
    format(Stream, 'GROWTH & NUTRITION PLAN: ~w HUMAN~n', [Gender]),
    format(Stream, '==================================================~n', []),
    format(Stream, 'Target Growth Mass: ~w kg~n', [Mass]),
    format(Stream, 'Duration: ~w days~n~n', [Days]),
    (solve_meal(TotalReqs, Meal)
        -> (summarize_and_print(Stream, Meal),
            member(need('Protein', TotalP), TotalReqs),
            print_metabolic_breakdown(Stream, Mass, TotalP))
        ;  format(Stream, "Error: Insufficient nutritional density.~n", [])
    ),
    close(Stream).
