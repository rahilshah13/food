:- use_module(library(clpz)).
:- use_module(library(lists)).
:- use_module(library(format)).

organ(any, 1, skin, [keratinocyte-0.80, fibroblast-0.10, melanocyte-0.05, sebocyte-0.05]).
organ(any, 2, brain, [astrocyte-0.40, oligodendrocyte-0.30, pyramidal_neuron-0.15, microglia-0.10, ependymal-0.05]).
organ(any, 3, spinal_cord, [astrocyte-0.40, oligodendrocyte-0.30, pyramidal_neuron-0.10, microglia-0.10, ependymal-0.10]).
organ(any, 4, heart, [cardiomyocyte-0.70, endothelial-0.15, fibroblast-0.10, smooth_muscle-0.05]).
organ(any, 5, blood, [erythrocyte-0.90, neutrophil-0.05, t_lymphocyte-0.03, b_lymphocyte-0.02]).
organ(any, 6, stomach, [parietal-0.40, chief_cell-0.40, smooth_muscle-0.15, endothelial-0.05]).
organ(any, 7, liver, [hepatocyte-0.80, endothelial-0.10, cholangiocyte-0.05, macrophage-0.05]).
organ(any, 8, small_intestine, [enterocyte-0.70, goblet-0.15, paneth_cell-0.10, m_cell-0.05]).
organ(any, 9, large_intestine, [enterocyte-0.70, goblet-0.15, smooth_muscle-0.10, macrophage-0.05]).
organ(any, 10, lung, [pneumocyte_type_1-0.40, pneumocyte_type_2-0.30, endothelial-0.20, macrophage-0.10]).
organ(any, 11, kidney, [podocyte-0.40, endothelial-0.40, fibroblast-0.10, macula_densa-0.10]).
organ(any, 12, bone, [osteocyte-0.85, osteoblast-0.05, osteoclast-0.05, fibroblast-0.05]).
organ(any, 13, skeletal_muscle, [skeletal_myocyte-0.85, satellite_cell-0.05, fibroblast-0.05, endothelial-0.05]).
organ(any, 14, cartilage, [chondrocyte-0.90, fibroblast-0.10]).
organ(any, 15, peripheral_nerve, [schwann_cell-0.80, fibroblast-0.15, endothelial-0.05]).
organ(any, 16, eye_retina, [photoreceptor-0.70, astrocyte-0.20, melanocyte-0.10]).
organ(any, 17, cornea, [keratinocyte-0.60, fibroblast-0.30, endothelial-0.10]).
organ(any, 18, olfactory_epithelium, [pyramidal_neuron-0.60, astrocyte-0.30, fibroblast-0.10]).
organ(any, 19, inner_ear, [schwann_cell-0.60, fibroblast-0.30, endothelial-0.10]).
organ(any, 20, tooth, [odontoblast-0.50, ameloblast-0.30, fibroblast-0.15, endothelial-0.05]).
organ(any, 21, hair_follicle, [trichocyte-0.60, keratinocyte-0.30, melanocyte-0.10]).
organ(any, 22, sebaceous_gland, [sebocyte-0.80, keratinocyte-0.10, fibroblast-0.10]).
organ(any, 23, sweat_gland, [keratinocyte-0.70, smooth_muscle-0.20, endothelial-0.10]).
organ(any, 24, pineal_gland, [astrocyte-0.60, pyramidal_neuron-0.20, endothelial-0.20]).
organ(any, 25, pituitary_gland, [chromaffin-0.60, endothelial-0.20, fibroblast-0.20]).
organ(any, 26, esophagus, [keratinocyte-0.60, smooth_muscle-0.30, fibroblast-0.10]).
organ(any, 27, gallbladder, [cholangiocyte-0.60, smooth_muscle-0.30, fibroblast-0.10]).
organ(any, 28, pancreas, [acinar_cell-0.80, beta_cell-0.10, alpha_cell-0.05, endothelial-0.05]).
organ(any, 29, salivary_gland, [acinar_cell-0.70, goblet-0.20, endothelial-0.10]).
organ(any, 30, tongue, [skeletal_myocyte-0.70, keratinocyte-0.20, fibroblast-0.10]).
organ(any, 31, pharynx, [skeletal_myocyte-0.60, keratinocyte-0.30, fibroblast-0.10]).
organ(any, 32, trachea, [goblet-0.50, chondrocyte-0.30, smooth_muscle-0.20]).
organ(any, 33, bronchus, [goblet-0.40, smooth_muscle-0.40, chondrocyte-0.20]).
organ(any, 34, larynx, [chondrocyte-0.50, skeletal_myocyte-0.30, goblet-0.20]).
organ(any, 35, diaphragm, [skeletal_myocyte-0.80, fibroblast-0.10, endothelial-0.10]).
organ(any, 36, spleen, [macrophage-0.40, t_lymphocyte-0.30, b_lymphocyte-0.20, endothelial-0.10]).
organ(any, 37, thymus, [t_lymphocyte-0.60, macrophage-0.20, fibroblast-0.20]).
organ(any, 38, lymph_node, [b_lymphocyte-0.40, t_lymphocyte-0.40, macrophage-0.20]).
organ(any, 39, bone_marrow, [megakaryocyte-0.40, erythrocyte-0.30, neutrophil-0.20, b_lymphocyte-0.10]).
organ(any, 40, tonsil, [b_lymphocyte-0.40, t_lymphocyte-0.30, keratinocyte-0.30]).
organ(any, 41, artery, [smooth_muscle-0.60, endothelial-0.20, fibroblast-0.20]).
organ(any, 42, vein, [endothelial-0.40, smooth_muscle-0.40, fibroblast-0.20]).
organ(any, 43, capillary, [endothelial-0.80, fibroblast-0.20]).
organ(any, 44, lymphatic_vessel, [endothelial-0.70, smooth_muscle-0.30]).
organ(any, 45, appendix, [enterocyte-0.40, b_lymphocyte-0.30, t_lymphocyte-0.20, goblet-0.10]).
organ(any, 46, thyroid_gland, [thyroid_foll-0.80, endothelial-0.10, fibroblast-0.10]).
organ(any, 47, parathyroid_gland, [chief_cell-0.80, endothelial-0.10, fibroblast-0.10]).
organ(any, 48, adrenal_gland, [chromaffin-0.70, endothelial-0.20, fibroblast-0.10]).
organ(any, 49, ureter, [smooth_muscle-0.60, endothelial-0.20, fibroblast-0.20]).
organ(any, 50, urinary_bladder, [smooth_muscle-0.70, fibroblast-0.20, endothelial-0.10]).
organ(any, 51, urethra, [keratinocyte-0.50, smooth_muscle-0.40, endothelial-0.10]).
organ(f, 52, ovary, [granulosa-0.70, oocyte-0.10, oogonium-0.10, endothelial-0.10]).
organ(m, 53, testis, [spermatogonium-0.40, spermatozoa-0.40, leydig-0.15, endothelial-0.05]).
organ(f, 54, uterus, [smooth_muscle-0.70, fibroblast-0.20, endothelial-0.10]).
organ(m, 55, prostate, [acinar_cell-0.60, smooth_muscle-0.30, fibroblast-0.10]).
organ(f, 56, fallopian_tube, [smooth_muscle-0.60, fibroblast-0.30, goblet-0.10]).
organ(m, 57, epididymis, [smooth_muscle-0.60, fibroblast-0.30, endothelial-0.10]).
organ(f, 58, vagina, [keratinocyte-0.60, smooth_muscle-0.30, fibroblast-0.10]).
organ(m, 59, vas_deferens, [smooth_muscle-0.80, fibroblast-0.20]).
organ(f, 60, clitoris, [endothelial-0.50, smooth_muscle-0.30, fibroblast-0.20]).
organ(m, 61, penis, [endothelial-0.50, smooth_muscle-0.30, fibroblast-0.20]).
organ(f, 62, mammary_gland, [acinar_cell-0.60, fibroblast-0.20, endothelial-0.10, smooth_muscle-0.10]).
organ(m, 63, seminal_vesicle, [smooth_muscle-0.50, acinar_cell-0.40, fibroblast-0.10]).
organ(m, 64, bulbourethral, [acinar_cell-0.60, goblet-0.20, fibroblast-0.20]).
organ(f, 65, placenta, [syncytiotrophoblast-0.60, cytotrophoblast-0.20, endothelial-0.10, macrophage-0.10]).
organ(any, 66, umbilical_cord, [fibroblast-0.50, endothelial-0.30, smooth_muscle-0.20]).
organ(any, 67, amnion, [epiblast-0.50, fibroblast-0.30, endothelial-0.20]).
organ(any, 68, yolk_sac, [hypoblast-0.50, erythrocyte-0.30, endothelial-0.20]).
organ(any, 69, rectum, [enterocyte-0.60, goblet-0.20, smooth_muscle-0.20]).
organ(any, 70, anus, [keratinocyte-0.70, smooth_muscle-0.20, melanocyte-0.10]).
organ(any, 71, ligament, [fibroblast-0.80, chondrocyte-0.20]).
organ(any, 72, tendon, [fibroblast-0.80, skeletal_myocyte-0.20]).
organ(any, 73, mesentery, [fibroblast-0.60, endothelial-0.30, macrophage-0.10]).
organ(any, 74, synovium, [fibroblast-0.60, macrophage-0.30, endothelial-0.10]).
organ(any, 75, sclera, [fibroblast-0.90, melanocyte-0.10]).
organ(any, 76, iris, [melanocyte-0.60, smooth_muscle-0.30, endothelial-0.10]).
organ(any, 77, lens, [keratinocyte-0.90, fibroblast-0.10]).
organ(any, 78, meninges, [fibroblast-0.70, endothelial-0.20, macrophage-0.10]).

cell(any, blastomere, 0.001, 0.05, [glucose-0.6, amino_acids-0.4]).
cell(any, cytotrophoblast, 5.0, 0.005, [glucose-0.7, amino_acids-0.3]).
cell(any, syncytiotrophoblast, 50.0, 0.002, [cholesterol-0.5, glucose-0.5]).
cell(any, epiblast, 0.01, 0.01, [glucose-0.6, amino_acids-0.4]).
cell(any, hypoblast, 0.01, 0.01, [glucose-0.6, amino_acids-0.4]).
cell(any, keratinocyte, 4000, 0.0009, [cysteine-0.4, methionine-0.3, glucose-0.3]).
cell(any, trichocyte, 20, 0.0005, [cysteine-0.6, methionine-0.4]).
cell(any, sebocyte, 50, 0.0003, [lipids-0.8, glucose-0.2]).
cell(any, ameloblast, 10, 0.0001, [calcium-0.6, phosphate-0.4]).
cell(any, pyramidal_neuron, 800, 0.00001, [dha-0.5, glucose-0.5]).
cell(any, purkinje_cell, 150, 0.00001, [dha-0.5, glucose-0.5]).
cell(any, astrocyte, 700, 0.00002, [glucose-0.8, glutamate-0.2]).
cell(any, oligodendrocyte, 300, 0.00002, [cholesterol-0.7, lipids-0.3]).
cell(any, ependymal, 20, 0.00005, [glucose-0.7, sodium-0.3]).
cell(any, photoreceptor, 2, 0.00005, [vitamin_a-0.8, dha-0.2]).
cell(any, melanocyte, 15, 0.0001, [tyrosine-0.7, copper-0.3]).
cell(any, schwann_cell, 200, 0.00002, [cholesterol-0.7, lipids-0.3]).
cell(any, chromaffin, 5, 0.0001, [tyrosine-0.8, vitamin_c-0.2]).
cell(any, odontoblast, 15, 0.00005, [calcium-0.5, glycine-0.3, proline-0.2]).
cell(m, skeletal_myocyte, 35000, 0.00015, [leucine-0.4, isoleucine-0.2, valine-0.2]).
cell(f, skeletal_myocyte, 24000, 0.00015, [leucine-0.4, isoleucine-0.2, valine-0.2]).
cell(any, satellite_cell, 50, 0.00005, [leucine-0.5, glucose-0.5]).
cell(any, osteoblast, 1000, 0.00005, [calcium-0.4, glycine-0.3, proline-0.2]).
cell(any, osteocyte, 9000, 0.00001, [calcium-0.8, phosphate-0.2]).
cell(any, chondrocyte, 2000, 0.00008, [glucosamine-0.5, proline-0.5]).
cell(any, fibroblast, 3000, 0.0002, [proline-0.4, glycine-0.3, vitamin_c-0.2]).
cell(any, podocyte, 10, 0.00001, [glucose-0.6, amino_acids-0.4]).
cell(any, macula_densa, 2, 0.0001, [sodium-0.8, chloride-0.2]).
cell(m, leydig, 5, 0.00005, [cholesterol-0.8, zinc-0.2]).
cell(f, granulosa, 10, 0.0005, [cholesterol-0.8, glucose-0.2]).
cell(any, cardiomyocyte, 300, 0.00005, [fatty_acids-0.7, leucine-0.3]).
cell(any, smooth_muscle, 2000, 0.0001, [amino_acids-0.8, glucose-0.2]).
cell(any, endothelial, 1000, 0.0003, [arginine-0.5, lipids-0.3, glucose-0.2]).
cell(any, erythrocyte, 2500, 0.0001, [iron-0.5, histidine-0.3, glycine-0.2]).
cell(any, megakaryocyte, 10, 0.0002, [amino_acids-0.8, iron-0.2]).
cell(any, neutrophil, 100, 0.002, [glucose-0.7, glutamine-0.3]).
cell(any, macrophage, 150, 0.0007, [glutamine-0.5, glucose-0.5]).
cell(any, osteoclast, 50, 0.0005, [amino_acids-0.6, glucose-0.4]).
cell(any, microglia, 40, 0.00005, [glucose-0.6, glutamine-0.4]).
cell(any, t_lymphocyte, 300, 0.0008, [glutamine-0.7, glucose-0.3]).
cell(any, b_lymphocyte, 200, 0.0008, [glutamine-0.7, glucose-0.3]).
cell(any, pneumocyte_type_1, 300, 0.0001, [glucose-0.6, amino_acids-0.4]).
cell(any, pneumocyte_type_2, 200, 0.0002, [lipids-0.7, choline-0.3]).
cell(any, hepatocyte, 1500, 0.0002, [glucose-0.6, glutamine-0.4]).
cell(any, cholangiocyte, 50, 0.0002, [glucose-0.6, water-0.4]).
cell(any, parietal, 50, 0.0004, [chloride-0.5, potassium-0.3]).
cell(any, chief_cell, 40, 0.0003, [amino_acids-0.8, glucose-0.2]).
cell(any, beta_cell, 2, 0.00005, [amino_acids-0.8, zinc-0.2]).
cell(any, alpha_cell, 1, 0.00005, [amino_acids-0.8, glucose-0.2]).
cell(any, acinar_cell, 80, 0.0004, [amino_acids-0.8, lipids-0.2]).
cell(any, thyroid_foll, 15, 0.0001, [iodine-0.8, tyrosine-0.2]).
cell(any, enterocyte, 100, 0.002, [glutamine-0.7, glucose-0.3]).
cell(any, goblet, 30, 0.001, [threonine-0.4, serine-0.3, proline-0.3]).
cell(any, paneth_cell, 15, 0.0005, [amino_acids-0.7, zinc-0.3]).
cell(any, m_cell, 5, 0.0003, [glucose-0.6, glutamine-0.4]).
cell(f, oogonium, 2, 0.00001, [glucose-0.7, lipids-0.3]).
cell(f, oocyte, 5, 0.0001, [cholesterol-0.7, lipids-0.3]).
cell(m, spermatogonium, 5, 0.0004, [glucose-0.5, zinc-0.5]).
cell(m, spermatozoa, 10, 0.0005, [fructose-0.6, zinc-0.4]).

organ_needs(OrganName, Mass, TotalNeeds) :-
    organ(_, _, OrganName, Cells),
    % Ensure Mass is passed into the helper to calculate actual amounts
    sum_cell_needs(Mass, Cells, [], TotalNeeds).

sum_cell_needs(_, [], Acc, Acc).

sum_cell_needs(Mass, [CellName-Prop | Rest], AccIn, AccOut) :-
    cell(_, CellName, UnitMass, _, Nutrients),
    CellMass is Mass * Prop * UnitMass,
    scale_nutrients(CellMass, Nutrients, Scaled),
    merge_nutrients(Scaled, AccIn, AccMid),
    sum_cell_needs(Mass, Rest, AccMid, AccOut).

cell_location(CellName, OrganName) :-
    organ(_, _, OrganName, Cells),
    member(CellName-_, Cells).

list_nutrients(OrganName, Nutrients) :-
    organ(_, _, OrganName, Cells),
    findall(N, (member(C-_, Cells), cell(_, C, _, _, Ns), member(N-_, Ns)), All),
    list_to_set(All, Nutrients).

scale_nutrients(_, [], []).
scale_nutrients(Mass, [N-Prop | T], [N-Amount | Rest]) :-
    Amount is Mass * Prop,
    scale_nutrients(Mass, T, Rest).

merge_nutrients([], Acc, Acc).
merge_nutrients([N-A | T], AccIn, AccOut) :-
    (select(N-B, AccIn, Rest) -> NewA is A + B, merge_nutrients(T, [N-NewA | Rest], AccOut)
    ; merge_nutrients(T, [N-A | AccIn], AccOut)).
