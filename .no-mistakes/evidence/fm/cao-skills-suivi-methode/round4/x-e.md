## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw (un jeu de pages par pièce)**, pièce **coque** du cas `inclinometre-jimny-boitier`, ligne du §13 de `method/methode-cao-operationnelle-v1.md`.
Applique [`method/worker.md`](method/worker.md) (règles communes à toute unité : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus), puis la colonne « Lire » de cette ligne. La méthode et le contrat de preuves font foi.
Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Lire** (après `method/worker.md` et le noyau de `method/proof-contract-v2.md`) :
- §5 « Fabrication » du noyau, lu seul.
- `method/guides/techdraw.md`.
- `method/guides/freecad.md`.
- Aucune partie de `method/contrat/` n'est demandée pour cette unité.
- Le cas : `cases/inclinometre-jimny-boitier/README.md`, la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`, et les lignes du manifeste de tes fichiers (extraction `jq`, `method/worker.md` §2).

**Base** : commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier` (le worker est lancé avec `--base-branch fm/cao-inclinometre-boitier`).
Entrées gelées, à ne pas modifier :
- Les fichiers gelés du cas à ce commit (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/`.
- Le FCStd gelé de la pièce : `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit. Il reste ouvert en lecture seule et n'est jamais enregistré.

**Livrable** (colonne « Livrable accepté ») : SVG et PDF de chaque page de la coque, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.

**Fichiers que tu possèdes** :
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`, et toute autre page de ce jeu.
- Les lignes du manifeste de ces fichiers, et la preuve qui consomme `techdraw_report.json` si tu la rejoues.
- Les plans de la façade et de la semelle ne sont pas à toi : tu n'y touches pas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json` (`-2`, `-3` pour une remise suivante le même jour).

**Budget** :
- `max_iterations` : 3.
- `max_techdraw_runs_per_page_set` : 2 (`method/iteration_budget.json`).
- `max_heavy_runs_per_brief` : réduit à 2 pour cette unité, au lieu de 6.
- Un dépassement se justifie dans la fiche.

**Exécutions lourdes** : chaque exécution `run_freecad_capture.sh --script scripts/techdraw_pages.py` est autorisée par le présent brief, une à la fois, avec un délai maximal de 600 s (`cao-freecad-execution`).

**Commandes de remise** : celles de `method/worker.md` §8 et du contrat (« Commandes du worker »), qui les fixent pour une unité avec exécution native. Le brief ne les recopie pas.

**Points propres au cas** :
- `docs/plans/coque/pages.json` existe déjà : une page `coque-p1` en A3 (vues de gauche et de dessous, coupe B-B, 8 cotes). Reprends-le comme point de départ, pas comme entrée gelée.
- Revérifie ses cotes à valeur littérale contre le modèle gelé au commit `01b88f2` : `hauteur` (46,0532), `rainure_bas_chanfreins` (17,074), `rainure_plafond` (21,0392), `rainure_hauteur` (4,3) et les points de référence des arêtes. Les autres cotes pointent dans `params.json`.
- Une cote qui manque, ou dont la valeur ne tient pas sur le modèle gelé, donne `needs-decision`, pas une valeur choisie en silence.
- Cotes serrées de la coque à lire sans les arrondir ni les déplacer :
  - hauteur 46,05 sur la coque, soit 49,05 sur la semelle (marge 0,95 sur C5 ≤ 50) ;
  - ouverture micro-USB 12,6 x 10,5, remontée de 0,73 au gel n°10 ;
  - rainure : plafond 21,04, hauteur 4,3, chanfreins de 0,5 à 45°.
- Cartouche : dernier état du modèle de page déjà utilisé par les plans livrés de la coque. Garde `drawing_number` `INCLINO-COQUE` et passe `date_of_issue` à la date de la remise.
