- `git clone https://github.com/trealla-prolog/trealla.git` && `brew install libffi openssl coreutils` && `cd trealla` && `make` && `sudo ln -s ~/trealla/tpl /usr/local/bin/tpl`
--- 
### `cell.pl`

- `tpl -l cell.pl -g "Combo = [skeletal_muscle-N1, smooth_muscle_cell-N2, fibroblast-N3, adipocyte-N4], heterogeneous_sample(tissue_sample_B, Combo), writeln(Combo), fail."`
- `tpl -l cell.pl -g "Combo = [fibroblast-N1, macrophage-N2, adipocyte-N3, red_blood_cell-N4], heterogeneous_sample(tissue_sample_A, Combo), writeln(Combo), halt."`
- `tpl -l cell.pl -g "Combo = [liver_cell-Hepatocytes, adipocyte-FatCells, macrophage-KupfferCells, fibroblast-StellateCells], heterogeneous_sample(fatty_liver_biopsy, Combo), writeln(Combo), halt."`
---
### `food.pl` & `meal.pl`

1. install scala and sbt 
2. download FDA FoundationFoods: [`food.json`](https://fdc.nal.usda.gov/download-datasets); delete nulls at the end of the file.
3. sbt run


- Find meals consisting of 9 portions, under 600g, with 150g of Protein and 15mg Zinc, satisfying FDA Vitamin Daily Values. 
- `tpl food.pl meal.pl -g "solve_meal([need('Protein', 150.0), need('Zinc, Zn', 0.015)], 600, 9, yes, Meal), writeln(Meal), halt."`
- `tpl food.pl meal.pl -g "forall(solve_meal_all([need('Protein', 150.0), need('Zinc, Zn', 0.015)], 600, 9, yes, Meal), writeln(Meal)), halt."`

---
### `cheese.pl`
- `tpl cheese.pl -g "list_non_rennet, halt."`
- `tpl cheese.pl -g "plan_batch(cheddar, 10), halt."`
- `tpl cheese.pl -g "forall(recipe(Name, Milk, _, _, _, _, 0),format('Zero Age Time: ~w (Base: ~w)~n', [Name, Milk])),halt."`

---
### `grow.pl`
* **Identify Glutamine-Dependent Organs:**
    `tpl -l grow.pl -g "organ(_, _, Name, _), organ_needs(Name, 1000, Needs), member(glutamine-Amount, Needs), Amount > 100, format('~w requires ~2f glutamine~n', [Name, Amount]), fail."`

* **Find "Lean" Organs (by cell type count):**
    `tpl -l grow.pl -g "organ(_, _, Name, Cells), length(Cells, Len), Len < 3, writeln(Name), fail."`

* **Compare Glucose Requirements (Brain vs. Heart):**
    `tpl -l grow.pl -g "organ_needs(brain, 500, BN), organ_needs(heart, 500, HN), member(glucose-B, BN), member(glucose-H, HN), format('Brain: ~2f, Heart: ~2f~n', [B, H]), halt."`

* **Detect High Iron Demand:**
    `tpl -l grow.pl -g "organ(_, _, Name, _), organ_needs(Name, 100, Needs), member(iron-Amt, Needs), Amt > 5, format('High Iron Need: ~w (~2f)~n', [Name, Amt]), fail."`

* **Acquire Mass from Nutrient Budget (Leucine Example):**
    `tpl -l grow.pl -g "cell(_, skeletal_myocyte, UnitMass, _, Nutrients), member(leucine-Prop, Nutrients), Mass #= 50 // (Prop * UnitMass), writeln(Mass), halt."`

---
### `human.pl`
`tpl food.pl grow.pl human.pl -g "write_human_report(m, 80, 7305, 'human_growth.txt'), halt."`
- Calculates the nutrient surplus required for a male (`m`) to reach 80kg over 20 years, identifies the FDA complaint dietary intake to support that growth, and writes the plan to `human_growth.txt`.
- Gemini estimates the cost of the 20 year meal plan to be under $2000 USD

 **predicates**
* `write_human_report(+Gender, +TargetMass, +Days, +FileName)`: entry point
* `solve_growth(+TargetMass, +Days, -DailyNeeds)`: Maps biomass requirements to nutrient targets
* `calculate_expenditure(+Mass, +Days, -TDEE)`: Computes metabolic baseline and tissue synthesis costs
* `match_nutrients(+DailyNeeds, +FoodDB, -OptimalMeal)`: Selects foods to meet requirements
* `print_metabolic_breakdown(+Stream, +Mass, +TotalProtein)`: Calculates organ-specific protein needs.
* `summarize_and_print(+Stream, +Meal)`: Aggregates data for the report
* `print_summary(+Stream, +Summary)`
* `truncate_str(+Input, +Len, -Output)`

**facts**
* `organ(+Gender, +ID, +Name, +Composition, +MassPct)`: Anatomical definitions
* `cell(+Gender, +Name, +Size, +Turnover, +NutrientRatio)`: Metabolic cost per cell type
* `food_data(+ID, +Name, +NutrientList)`: Nutritional inventory

---
### `alloy.pl`

* evaluates the estimated tensile ductility and malleability of alloy compositions using a multi-phase rule of mixtures and non-linear solute solubility penalties.

* Null Example: calculates properties for carbon, demonstrating the structural penalties applied to pure interstitial non-metals.
* `tpl engine.pl "estimate_mechanical_properties([(c, 100.0)], D, M)"`
* novel alloy example
* `tpl engine.pl "estimate_mechanical_properties([(ti, 60.0), (al, 10.0), (v, 15.0), (mo, 10.0), (zr, 5.0)], D, M)"`

--- 
### `battery.pl`
* Uses stoichiometric analysis with `cheese.pl` inspired recipe-driven constraints to make batteries.
* **Standard Cell Evaluation**: `tpl engine.pl "estimate_cell_properties([(li, 50.0), (co, 30.0), (o, 20.0)], 50, C, D, S)"`
  * Evaluates cell manufacturing parameters, capacity, and stability for a lithium-cobalt composition using valid liquid electrolyte configurations.
* **Solid-State Evaluation**: `tpl engine.pl "estimate_cell_properties([(li, 40.0), (si, 30.0), (o, 30.0)], 100, C, D, S)"`


--- 

### `smiles.pl` 

* `iterate_smiles_from_mass([(c, 24.02), (h, 6.05), (o, 16.0)], Smiles)`: Iterates through matching topological SMILES strings in the library that align with an ethanol mass profile, yielding valid string representations.
* `smiles_to_mass_list('CC(=O)OC1=CC=CC=C1C(=O)O', MassList)`: Parses an input SMILES string (such as aspirin) through the atom extractor and periodic table database to calculate and return its total elemental mass breakdown.
* `match_mass_profile([(c, 72.0), (h, 12.0)], [(c, 72.066), (h, 6.048)])`: Normalizes, sorts, and checks a target element-mass list against a known molecule's profile within an absolute tolerance range of 2.5.


---

### `laundry.pl`
- Models laundry load efficacy, material blends, and multi-regime cascading tumbler mechanics.
  
```
%   tpl -g "Load = [garment(shirt, 1.2, cotton)], optimize_wash_cycle(Load, 0.25, Soap, Water, Temp, Speed, Len, Clean)."
%   tpl -g "Load = [garment(c1,0.5,cotton),garment(c2,0.3,wool),garment(c3,0.4,denim),garment(c4,0.2,silk),garment(c5,0.6,linen),garment(c6,0.5,nylon),garment(c7,0.4,fleece),garment(c8,0.7,cashmere),garment(c9,0.3,spandex),garment(c10,0.5,rayon),garment(c11,1.0,canvas),garment(c12,0.4,polyester),garment(c13,0.6,cotton),garment(c14,0.3,wool),garment(c15,0.5,denim),garment(c16,0.2,silk),garment(c17,0.4,linen),garment(c18,0.5,nylon),garment(c19,0.3,fleece),garment(c20,0.6,cashmere),garment(c21,0.4,spandex),garment(c22,0.5,rayon),garment(c23,0.8,canvas),garment(c24,0.3,polyester),garment(c25,0.5,cotton),garment(c26,0.4,wool),garment(c27,0.3,denim),garment(c28,0.5,linen),garment(c29,0.2,nylon),garment(c30,0.4,fleece)], optimize_wash_cycle(Load, 0.25, Soap, Water, Temp, Speed, Len, Clean)."
```
