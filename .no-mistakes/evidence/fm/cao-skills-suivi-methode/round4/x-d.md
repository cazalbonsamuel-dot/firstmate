## Firstmate spec

**Unité** : Plans normatifs TechDraw de la pièce coque (un jeu de pages), cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13 de la méthode. Unité lourde et courte, en série avec tout autre travail lourd.

**Règles communes** : applique `method/worker.md`. Ce brief ne les recopie pas et ne les assouplit pas. Cela couvre le rôle, les entrées gelées, la propriété, les exécutions FreeCAD, le commit, le budget, la fiche de remise, l'intégration et les refus.

**Lecture** : après `method/worker.md` et le noyau du contrat de preuves, lis uniquement :
- §5 « Fabrication » du noyau de la méthode ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Lis ensuite le `README.md` du cas, tes entrées gelées, et la synthèse du manifeste du cas (`python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`). N'ajoute aucune autre lecture.

**Base** : le commit `01b88f2` de la branche du cas. Pars de ce commit : le worker est lancé avec `--base-branch <branche du cas>`, parce que les artefacts gelés vivent sur cette branche et non sur la branche par défaut.

**Entrées gelées**, à ce commit :
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, gelé avec son digest géométrique. Tu ne l'ouvres qu'en lecture seule, via `techdraw_pages.py`, et tu ne l'enregistres jamais ;
- `cases/inclinometre-jimny-boitier/design/params.json` ;
- `design/interfaces.json` ;
- `design/acceptance_criteria/` ;
- `design/recherche-options.md` ;
- `design/recherche/`.

Vérifie-les selon `method/worker.md` §3.

**Fichiers que tu possèdes** (propriétaire unique) : tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/`, soit :
- `pages.json` ;
- `coque-p1.svg` et `coque-p1.pdf` ;
- `techdraw_report.json`.

Tu re-pointes les lignes `delivered_files` de ces fichiers dans `method/cases/inclinometre-jimny-boitier/manifest.json`, et les preuves que tu as toi-même rejouées. Tu ne touches ni aux plans de la façade et de la semelle, ni à `cad/`, ni à `scripts/`, ni à `outputs/check_*.json`. Si un helper commun ou un autre fichier doit changer, arrête-toi en `blocked` (`method/worker.md` §4).

**Livrable accepté** :
- le SVG et le PDF de chaque page du jeu de pages de la coque ;
- `techdraw_report.json` en statut `verifie` ;
- la spécification `pages.json` conservée à côté ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Si une remise de cette unité existe déjà le même jour, numérote `-2`, `-3`.

**Commandes de remise** : `method/worker.md` §8 et le contrat, « Commandes du worker ». L'unité a une exécution native (plans TechDraw), donc applique la variante native de ces commandes.

**Budget** :
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` (2) ;
- `max_heavy_runs_per_brief` réduit à 2, puisque les exécutions TechDraw comptent dans `heavy_runs` ;
- `max_iterations` du fichier (3), sans augmentation.

Toute exécution au-delà se justifie dans la fiche par `depassement`, avec l'autorisation du second maître.

**Exécutions lourdes** :
- Autorisation du second maître : au plus 2 exécutions de `scripts/run_freecad_capture.sh --script scripts/techdraw_pages.py`.
- Délai maximal de chacune : `FREECAD_TIMEOUT_S=600`.
- La première exécution est autorisée dès que ta spécification est prête. La seconde l'est après ta relecture, si elle est nécessaire.
- Tu peux utiliser le runtime hors bac à sable et le bail `freecad` selon `method/worker.md` §5.

**Points propres au cas** :
- **Plan existant.** Un plan de la coque existe déjà dans `docs/plans/coque/`, établi avant le gel complémentaire n°10 (rainure et chanfreins de 0,5). Pars de `pages.json` et recale-le sur le modèle gelé à `01b88f2`. Le plan existant est un point de départ, pas une preuve.
- **Points de référence.** Un point de référence qui ne correspond plus à une arête du modèle donne une cote refusée, jamais une valeur choisie en silence.
- **Valeurs attendues.** Toute cote lisible dans `params.json` ou `interfaces.json` s'y réfère par pointeur et n'a pas de seconde source.
- **Cotes serrées.** Les cotes de la rainure (jeu de 0,3 par face, chanfreins de 0,5 à 45°) et de l'ouverture micro-USB (IF-USB-OUVERTURE) sont à tolérance serrée. Elles doivent figurer au plan.
- **Vues.** Le jeu de pages garde les vues de gauche, de dessous et la coupe B-B de la rainure.
- **Sans objet.** Aucune tolérance ni état de surface n'est porté par la méthode pour ce cas, et tu n'en inventes pas.
