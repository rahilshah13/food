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


- Find meals consisting of 9 portions, under 600g, with 150 of Protein and 15mg Zinc, satisfying FDA Vitamin Daily Values. 
- `tpl food.pl meal.pl -g "solve_meal([need('Protein', 150.0), need('Zinc, Zn', 0.015)], 600, 9, yes, Meal), writeln(Meal), halt."`
- `tpl food.pl meal.pl -g "forall(solve_meal_all([need('Protein', 150.0), need('Zinc, Zn', 0.015)], 600, 9, yes, Meal), writeln(Meal)), halt."`

---
### `cheese.pl`
- `tpl cheese.pl -g "list_non_rennet, halt."`
- `tpl cheese.pl -g "plan_batch(cheddar, 10), halt."`
- `tpl cheese.pl -g "forall(recipe(Name, Milk, _, _, _, _, 0),format('Zero Age Time: ~w (Base: ~w)~n', [Name, Milk])),halt."`
