fda_daily_value('Protein', 50.0).
fda_daily_value('Iron, Fe', 0.018).
fda_daily_value('Calcium, Ca', 1.3).
fda_daily_value('Vitamin C, total ascorbic acid', 0.090).
fda_daily_value('Vitamin B-6', 0.0017).
fda_daily_value('Zinc, Zn', 0.011).

base_bio_factor('Iron, Fe', 0.1).
base_bio_factor('Calcium, Ca', 0.3).
base_bio_factor('Vitamin E (alpha-tocopherol)', 0.5).
base_bio_factor('Protein', 0.9).
base_bio_factor('Vitamin B-6', 0.7).
base_bio_factor('Zinc, Zn', 0.2).
base_bio_factor('Magnesium, Mg', 0.4).
base_bio_factor('Vitamin C, total ascorbic acid', 0.8).
base_bio_factor('Folate, total', 0.5).
base_bio_factor('Thiamin', 0.6).
base_bio_factor('Riboflavin', 0.6).
base_bio_factor('Potassium, K', 0.9).
base_bio_factor('Sodium, Na', 0.95).
base_bio_factor(_, 1.0).

gene_impact_mapping('Iron, Fe', hfe).
gene_impact_mapping('Calcium, Ca', vdr).
gene_impact_mapping('Vitamin E (alpha-tocopherol)', a-tocopheryl-transport-protein).
gene_impact_mapping('Protein', pep-1).
gene_impact_mapping('Magnesium, Mg', trpm6).
gene_impact_mapping('Folate, total', mthfr).
gene_impact_mapping('Zinc, Zn', znt1).

expression_level(hfe, 1.2).
expression_level(vdr, 0.85).
expression_level(a-tocopheryl-transport-protein, 1.1).
expression_level(pep-1, 1.0).
expression_level(trpm6, 0.9).
expression_level(mthfr, 0.7).
expression_level(znt1, 1.15).
expression_level(_, 1.0).
% -------------------------------------

bio_factor(Nutrient, FinalFactor) :-
    base_bio_factor(Nutrient, Base),
    (gene_impact_mapping(Nutrient, Gene) -> 
        expression_level(Gene, Impact) ; Impact = 1.0),
    FinalFactor is Base * Impact.

bioavailable_amount(FoodId, NutrientName, Grams, BioAmount) :-
    food_data(FoodId, _, List),
    member(nutrient(NutrientName, AmountPer100g), List),
    bio_factor(NutrientName, Factor),
    BioAmount is (AmountPer100g / 100.0) * Grams * Factor.

solve_meal_all(Requirements, TotalWeightLimit, N, UseFDA, Meal) :-
    (UseFDA == yes -> 
        findall(need(Nutr, Req), (member(Nutr, Requirements), fda_daily_value(Nutr, Req)), ActualReqs)
    ;   ActualReqs = Requirements),
    length(ActualReqs, ReqCount),
    N >= ReqCount,
    solve_recursive(ActualReqs, TotalWeightLimit, N, [], Meal).

solve_meal(Requirements, TotalWeightLimit, N, UseFDA, Meal) :-
    (UseFDA == yes -> findall(need(Nutr, Req), (member(Nutr, Requirements), fda_daily_value(Nutr, Req)), ActualReqs); ActualReqs = Requirements),
    length(ActualReqs, ReqCount),
    N >= ReqCount,
    once(solve_recursive(ActualReqs, TotalWeightLimit, N, [], Meal)).

solve_recursive([], _, 0, _, []).

solve_recursive([need(Nutrient, Goal) | RestReqs], WeightLimit, N, UsedIds, [portion(Desc, Grams) | Tail]) :-
    N > 0,
    food_data(Id, Desc, _),
    \+ member(Id, UsedIds),
    member(Grams, [10, 50, 100, 150, 200, 400]),
    Grams =< WeightLimit,
    bioavailable_amount(Id, Nutrient, Grams, BioAmount),
    BioAmount >= Goal, 
    RemainingWeight is WeightLimit - Grams,
    NextN is N - 1,
    solve_recursive(RestReqs, RemainingWeight, NextN, [Id | UsedIds], Tail).

solve_recursive([], WeightLimit, N, UsedIds, [portion(Desc, Grams) | Tail]) :-
    N > 0,
    food_data(Id, Desc, _),
    \+ member(Id, UsedIds),
    member(Grams, [50, 100, 150, 200]),
    Grams =< WeightLimit,
    RemainingWeight is WeightLimit - Grams,
    NextN is N - 1,
    solve_recursive([], RemainingWeight, NextN, [Id | UsedIds], Tail).