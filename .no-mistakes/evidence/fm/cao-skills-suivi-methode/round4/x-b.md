Je rédige à partir de `method/worker.md`, du §13 (ligne « Plans normatifs TechDraw »), du budget et du manifeste du cas. Je n'ai pas pu vérifier que le commit `01b88f2` existe, ni que `docs/plans/coque/pages.json` y est validée par `--check` : la commande git a été refusée.

## Firstmate spec

**Unité** : plans normatifs TechDraw de la pièce coque (un jeu de pages) du cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13 de `method/methode-cao-operationnelle-v1.md`. L'unité est lourde (GUI du lanceur) et sert un seul jeu de pages.

**Règles communes** : applique `method/worker.md` tel quel (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus). Ce brief ne les recopie pas.

**Lire**, après `method/worker.md` et le noyau du contrat de preuves, et rien d'autre sans raison écrite :
- noyau `method/methode-cao-operationnelle-v1.md` : §5 « Fabrication » (lue seule) et §15 ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md` ;
- le cas : `cases/inclinometre-jimny-boitier/README.md`, la synthèse du manifeste (`summary`) et tes lignes `FILE-PLAN-COQUE-*` / `PLAN-COQUE` extraites par `jq`.

**Base** :
- Commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Lance le worker avec `--base-branch fm/cao-inclinometre-boitier`, car les artefacts gelés ne sont pas sur la branche par défaut.
- Entrées gelées à ce commit : les fichiers gelés du cas (`design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/`).
- FCStd gelé de la pièce : `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, au digest du manifeste. Tu le rouvres en lecture seule et tu ne l'enregistres jamais.
- Spécification de pages : `cases/inclinometre-jimny-boitier/docs/plans/coque/pages.json`, entrée fournie par le second maître.

**Livrable accepté** (colonne du §13) : SVG et PDF par page et `techdraw_report.json` en `verifie`, sous `cases/inclinometre-jimny-boitier/docs/plans/coque/`. Les pages sont relues en image. Aucun FCStd n'est modifié.

**Fichiers que tu possèdes** (propriétaire unique) :
- tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` (spécification, SVG, PDF, rapport) ;
- dans le manifeste, seulement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT` et la preuve `PLAN-COQUE`.

Tu ne touches ni à `cad/`, ni aux plans des autres pièces, ni à `scripts/techdraw_pages.py` (helper commun), ni aux lanceurs. Un besoin de modifier un helper donne `blocked`.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Si une remise a déjà été faite ce jour-là, numérote `-2`, `-3`.

**Budget** :
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`, soit 2, non modifié.
- `max_iterations` réduit à 2.
- `max_heavy_runs_per_brief` réduit à 2 : l'unité n'a que des exécutions TechDraw, qui comptent dans `heavy_runs`.
- Un dépassement n'est possible qu'avec l'autorisation écrite du second maître.

**Exécutions lourdes** : le second maître autorise les exécutions TechDraw de cette unité, avec un délai maximal de 120 s chacune (une passe dure environ 10 à 20 s). Le runtime est hors bac à sable.

**Points propres au cas** :
- Le plan de la coque porte 8 cotes d'interface. Elles viennent de `params.json` et de `interfaces.json` et sont relues par TechDraw sur le modèle ouvert en lecture seule. Une cote absente ou géométriquement impossible donne `needs-decision`, sans valeur choisie en silence.
- Aucune vue de capture n'est exigée.

**Remise** : commandes, fiche et refus selon `method/worker.md` §8 et §10 et le contrat (« Commandes du worker », « Fiche de remise »). Les durées et les compteurs de budget vont dans la fiche.
