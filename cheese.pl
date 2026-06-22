milk_comp(cow, 3.8, 3.3). milk_comp(goat, 4.1, 3.4). milk_comp(sheep, 7.0, 5.4). milk_comp(yak, 6.5, 5.3). milk_comp(buffalo, 8.0, 4.5).  
moisture_coeff(very_high, 0.60). moisture_coeff(high, 0.50). moisture_coeff(medium, 0.38). moisture_coeff(low, 0.30). moisture_coeff(very_low, 0.25).  
calculate_yield(Animal, Moisture, Yield) :- milk_comp(Animal, F, P), moisture_coeff(Moisture, MDec), C is P * 0.78, Yield is (((0.93 * F) + (C - 0.1)) * 1.09) / (1.0 - MDec).

recipe(mozzarella, buffalo, thermophilic, rennet, minimal, none, 0).
recipe(oaxaca, cow, thermophilic, rennet, minimal, none, 0).
recipe(caciocavallo, cow, thermophilic, rennet, minimal, none, 6).
recipe(ricotta, cow, thermophilic, acid, minimal, none, 0).
recipe(paneer, cow, mesophilic, acid, minimal, none, 0).
recipe(brunost, cow, mesophilic, acid, minimal, none, 0).
recipe(queso_blanco, cow, mesophilic, acid, minimal, none, 0).
recipe(feta, sheep, mesophilic, rennet, large, none, 2).
recipe(queso_fresco, cow, mesophilic, rennet, large, none, 0).
recipe(teleme, cow, mesophilic, rennet, large, none, 1).
recipe(camembert, cow, mesophilic, rennet, large, penicillium_camemberti, 1.5).
recipe(brie, cow, mesophilic, rennet, large, penicillium_camemberti, 2).
recipe(cambozola, cow, mesophilic, rennet, large, penicillium_camemberti_and_roqueforti, 2).
recipe(humboldt_fog, goat, mesophilic, rennet, large, vegetable_ash, 2).
recipe(valencay, goat, mesophilic, rennet, large, vegetable_ash, 1).
recipe(crottin, goat, mesophilic, rennet, large, none, 2).
recipe(blue_stilton, cow, mesophilic, rennet, large, penicillium_roqueforti, 4).
recipe(gorgonzola, cow, mesophilic, rennet, large, penicillium_roqueforti, 3).
recipe(roquefort, sheep, mesophilic, rennet, large, penicillium_roqueforti, 5).
recipe(cabrales, sheep, mesophilic, rennet, large, penicillium_roqueforti, 4).
recipe(danish_blue, cow, mesophilic, rennet, large, penicillium_roqueforti, 3).
recipe(shanklish, cow, mesophilic, acid, large, penicillium_roqueforti, 4).
recipe(taleggio, cow, mesophilic, rennet, medium, brevibacterium_linens, 2).
recipe(limburger, cow, mesophilic, rennet, medium, brevibacterium_linens, 3).
recipe(munster, cow, mesophilic, rennet, medium, brevibacterium_linens, 2).
recipe(epoisses, cow, mesophilic, rennet, medium, brevibacterium_linens, 2).
recipe(saint_nectaire, cow, mesophilic, rennet, medium, none, 2).
recipe(fontina, cow, thermophilic, rennet, medium, none, 4).
recipe(gouda, cow, mesophilic, rennet, medium, none, 6).
recipe(edam, cow, mesophilic, rennet, medium, none, 4).
recipe(havarti, cow, mesophilic, rennet, medium, none, 3).
recipe(colby, cow, mesophilic, rennet, medium, none, 2).
recipe(monterey_jack, cow, mesophilic, rennet, medium, none, 3).
recipe(caerphilly, cow, mesophilic, rennet, medium, none, 2).
recipe(wensleydale, cow, mesophilic, rennet, medium, none, 4).
recipe(cheddar, cow, mesophilic, rennet, medium, none, 14).
recipe(provolone, cow, thermophilic, rennet, medium, none, 4).
recipe(halloumi, goat, mesophilic, rennet, large, none, 0).
recipe(manchego, sheep, mesophilic, rennet, small, none, 6).
recipe(idiazabal, sheep, mesophilic, rennet, small, smoke_infusion, 6).
recipe(asiago, cow, thermophilic, rennet, small, none, 5).
recipe(cotija, cow, mesophilic, rennet, small, none, 3).
recipe(gruyere, cow, thermophilic, rennet, small, none, 9).
recipe(comte, cow, thermophilic, rennet, small, none, 12).
recipe(emmental, cow, thermophilic, rennet, small, propionibacterium, 4).
recipe(parmigiano, cow, thermophilic, rennet, small, none, 24).
recipe(pecorino, sheep, thermophilic, rennet, pinhead, none, 12).
recipe(grana_padano, cow, thermophilic, rennet, pinhead, none, 18).
recipe(sbrinz, cow, thermophilic, rennet, pinhead, none, 36).
recipe(chhurpi, yak, mesophilic, acid, pinhead, none, 60). 

syneresis(minimal, very_high). syneresis(large, high). syneresis(medium, medium). syneresis(small, low). syneresis(pinhead, very_low).
equipment(very_high, ['Vat', 'Thermometer', 'Slotted Spoon', 'Cheesecloth/Stretching Bowl']).
equipment(high, ['Vat', 'Thermometer', 'Knife', 'Perforated Molds', 'Drain Mats']).
equipment(medium, ['Vat', 'Thermometer', 'Harp', 'Press', 'Weights', 'Aging Cave/Brine']).
equipment(low, ['Copper Vat', 'Thermometer', 'Harp', 'Heavy Press', 'Brine Tank']).
equipment(very_low, ['Copper Vat', 'Thermometer', 'Spino (Fine Harp)', 'Heavy Press', 'Brine Tank', 'Cellar Racks']).

proteolysis(_, 0, fresh_springy) :- !.
proteolysis(very_high, _, soft_curd) :- !.
proteolysis(high, Months, gooey) :- Months >= 1.5, !.
proteolysis(high, _, soft) :- !.
proteolysis(medium, Months, crumbly) :- Months >= 12, !.
proteolysis(medium, _, firm) :- !.
proteolysis(low, Months, crystalline) :- Months >= 12, !.
proteolysis(low, _, firm) :- !.
proteolysis(very_low, Months, granular_brittle) :- Months >= 8, !.
proteolysis(very_low, _, dense_hard) :- !.

lipolysis(_, _, 0, sweet_milky) :- !.
lipolysis(yak, none, _, earthy_floral) :- !.
lipolysis(buffalo, none, _, rich_milky) :- !.
lipolysis(_, acid, _, caramelized_sweet) :- !. 
lipolysis(_, brevibacterium_linens, _, pungent_stinky) :- !.
lipolysis(_, smoke_infusion, _, savory_smoky_wood) :- !.
lipolysis(sheep, penicillium_roqueforti, Months, intense_piquant) :- Months >= 3, !.
lipolysis(cow, penicillium_roqueforti, Months, sharp_savory_blue) :- Months >= 3, !.
lipolysis(cow, penicillium_camemberti_and_roqueforti, _, buttery_mild_blue) :- !.
lipolysis(sheep, none, Months, robust_salty_piquant) :- Months >= 8, !.
lipolysis(sheep, none, _, tangy_nutty) :- !.
lipolysis(goat, _, Months, sharp_goaty) :- Months >= 2, !.
lipolysis(cow, none, Months, sharp_complex) :- Months >= 12, !.
lipolysis(cow, none, _, mild_creamy) :- !.
lipolysis(cow, penicillium_camemberti, _, earthy_mushroom) :- !.
lipolysis(cow, vegetable_ash, _, bright_tangy_ash) :- !.

time(acidification, 1.5). time(coagulation, 1.0). time(syneresis, 2.0). time(pressing, 24.0).

plan_batch(Name, TargetKG) :-
    recipe(Name, Milk, Starter, Coagulant, Cut, Mold, Months),
    syneresis(Cut, Moisture), equipment(Moisture, Tools), calculate_yield(Milk, Moisture, Yield),
    MilkL is TargetKG / (Yield / 100.0), StartG is MilkL * 0.15, RenML is MilkL * 0.25, SaltG is TargetKG * 20.0,
    proteolysis(Moisture, Months, Texture), lipolysis(Milk, Mold, Months, Flavor),
    time(acidification, T1), time(coagulation, T2), time(syneresis, T3), time(pressing, T4),
    format('~n[BATCH] ~w (~wkg) | YIELD: ~2f%~n', [Name, TargetKG, Yield]),
    format('[INGR] ~2fL ~w milk | ~2fg ~w | ~2fml ~w | ~2fg salt | agent: ~w~n', [MilkL, Milk, StartG, Starter, RenML, Coagulant, SaltG, Mold]),
    format('[TOOLS] ~w~n', [Tools]),
    format('[STEPS]:~n'),
    format('  1. Acidification: Ripen milk with culture for ~w hours to adjust pH levels.~n', [T1]),
    format('  2. Coagulation: Add ~w coagulant and let set for ~w hours to form a firm curd matrix.~n', [Coagulant, T2]),
    format('  3. Syneresis: Cut the curd into ~w pieces and cook for ~w hours to expel excess whey.~n', [Cut, T3]),
    format('  4. Molding & Pressing: Transfer to molds and apply pressure for ~w hours to achieve desired density.~n', [T4]),
    format('  5. Salting: Apply salt to surface or brine to inhibit spoilage and enhance flavor development.~n'),
    format('  6. Affinage: Age in the cave for ~w months to complete the maturation process.~n', [Months]),
    format('[FINAL] Expected texture: ~w. Expected flavor: ~w.~n', [Texture, Flavor]).

list_non_rennet :- 
    forall(recipe(Name, _, _, acid, _, _, _), plan_batch(Name, 1)).