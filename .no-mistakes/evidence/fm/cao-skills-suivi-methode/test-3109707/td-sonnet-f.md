## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) », ligne du §13 de `method/methode-cao-operationnelle-v1.md`. Le jeu de pages est celui de la pièce **coque** du cas `inclinometre-jimny-boitier`. Unité native et lourde (courte), donc runtime hors bac à sable sur ce Mac (§12). Lance-la avec `--base-branch` sur la branche du cas.

**Règles communes** : applique `method/worker.md` en entier. Il fixe le rôle, la lecture, les entrées gelées, la propriété et le manifeste, FreeCAD, le commit, le budget, la remise, l'intégration et les refus. Ce brief ne les recopie pas.

**Lire**, après `method/worker.md` et le noyau du contrat (`method/proof-contract-v2.md`), seulement la colonne « Lire » de ta ligne :
- du noyau de la méthode : §5 « Fabrication » et §15, lus seuls ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Je n'ajoute aucune autre lecture. Dans le cas, lis `cases/inclinometre-jimny-boitier/README.md`, tes entrées gelées, la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json` et tes lignes du manifeste, extraites avec `jq`.

**Base** : commit `01b88f2` de la branche du cas. Il gèle le FCStd de la coque.

**Entrées gelées**, à ne pas modifier :
- les fichiers gelés du cas à ce commit (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md` et `design/recherche/` ;
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, à ce commit, rouvert en lecture seule et jamais enregistré ;
- la preuve de décision `DEC-ARCHI`.

**Livrable** (colonne « Livrable accepté ») :
- le SVG et le PDF de chaque page ;
- `techdraw_report.json` en `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes** :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json` ;
- dans le manifeste, uniquement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT` et la preuve `PLAN-COQUE`.

Tu ne touches ni aux plans de la façade ni à ceux de la semelle, ni à `scripts/`, ni aux autres cas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour se numérote `-2`, `-3`.

**Budget** : 2 itérations et 2 exécutions lourdes (`method/iteration_budget.json`, réduit de 3 et 6). Pour les plans, `max_techdraw_runs_per_page_set` = 2, valeur de `method/iteration_budget.json`. Ces exécutions comptent dans les exécutions lourdes. Un dépassement demande l'autorisation écrite du second maître.

**Exécutions lourdes** : chacune exige l'autorisation préalable du second maître, par message `fm-send`. Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`).

**Commandes de remise** : `method/worker.md` §8 et le contrat (« Commandes du worker »). Aucune n'est recopiée ici.

**Points propres au cas** :
- La spécification `docs/plans/coque/pages.json` existe déjà, pour la page `coque-p1` (A3, trois vues : gauche, dessous, coupe B-B). Tu en es propriétaire et tu la reprends depuis le modèle gelé.
- Les cotes `hauteur` (46,0532), `rainure_bas_chanfreins` (17,074), `rainure_plafond` (21,0392) et `rainure_hauteur` (4,3) portent leur valeur attendue en littéral dans la spécification. Les autres cotes pointent vers `params.json`. La géométrie de la rainure suit le gel n°10 (`outputs/remises/gel-complement-10-2026-11-10.json`).
- Si une valeur littérale ne concorde plus avec le modèle gelé, ne l'ajuste pas en silence : arrête-toi en `needs-decision`.
- Les textes du cartouche viennent de la spécification existante : pièce « Coque de l'inclinomètre Jimny », dessin `INCLINO-COQUE`, indice A. Ne change ni numéro ni indice sans décision du second maître.

**Remontée** : toute entrée gelée à modifier, toute cote manquante ou incohérente, et tout besoin de modifier un helper (`scripts/`) vont au second maître (`needs-decision` ou `blocked`). Rien ne va directement au capitaine.
