## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) », ligne du §13 de `method/methode-cao-operationnelle-v1.md`. La pièce est la **coque** du cas `inclinometre-jimny-boitier`. Applique `method/worker.md` (règles communes à toute unité : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus), puis la colonne « Lire » de ta ligne. La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Lire** (après `method/worker.md` et le noyau de `method/proof-contract-v2.md`) :
- §5 « Fabrication » de la méthode, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.
- Pour le cas : son `README.md`, tes entrées gelées, puis la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json` (pas le manifeste entier). Tes lignes du manifeste s'extraient avec `jq`, comme dans `method/worker.md` §2.

**Base** : commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier` (lance-toi depuis cette branche, pas depuis la branche par défaut).
**Entrées gelées, à ne pas modifier** :
- les fichiers gelés du cas à ce commit (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/` ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit. Tu l'ouvres en lecture seule et tu ne l'enregistres jamais.

**Livrable** (colonne « Livrable accepté ») : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image ; aucun FCStd modifié.

**Fichiers que tu possèdes** (seul propriétaire) :
- `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json` ;
- dans le manifeste du cas, seulement les lignes de ces fichiers (`FILE-PLAN-COQUE-SPEC`, `-SVG`, `-PDF`, `-RAPPORT`) et la preuve `json_metrics` `PLAN-COQUE` qui consomme le rapport, selon la liste fermée des écrivains du contrat.

Les plans de la façade et de la semelle (`docs/plans/facade/`, `docs/plans/semelle/`) ne sont pas à toi : ne les touche pas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour. Elle suit `method/worker.md` §8 et « Commandes du worker » du contrat. Cette unité a une exécution native, donc ses commandes de remise sont celles que ces deux textes fixent pour une unité native : ne les recopie pas ici.

**Budget** (`method/iteration_budget.json`, §13 « Budget par brief »), réduit parce que l'unité est courte et que le FCStd ne bouge pas :
- 2 itérations (défaut 3) ;
- 2 exécutions lourdes (défaut 6) ;
- `max_techdraw_runs_per_page_set` : 2, valeur du défaut, comprise dans les 2 exécutions lourdes.

Un dépassement n'est permis que sur autorisation écrite du second maître, citée dans `depassement`. La fiche déclare le budget au schéma fixe du contrat (« Fiche de remise »).

**Exécutions lourdes** :
- Le second maître autorise ici les deux exécutions du jeu de pages (une passe, puis au plus une reprise), en série, chacune sous le bail `freecad`. Une troisième exécution ne part qu'après une nouvelle autorisation du second maître.
- Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`).
- Runtime hors bac à sable : cette unité est native, un profil dont le bac à sable bloque Qt ne convient pas.

**Points propres au cas** :
- `docs/plans/coque/` existe déjà au commit de base, avec une spécification `pages.json` (page `coque-p1`, A3 paysage, vues de gauche, de dessous et coupe B-B, 8 cotes). Pars de cette spécification et de son `techdraw_report.json`. Les valeurs attendues viennent de `params.json` ou de valeurs numériques écrites dans la spécification. Une cote qui ne tient plus sur le FCStd gelé, ou dont la valeur attendue n'est plus celle du gel, remonte en `needs-decision` : tu ne choisis aucune valeur en silence.
- Cotes serrées connues de la coque (`outputs/remises/coque-2026-11-10.json`, `open_points`) : hauteur sur semelle 49,05 (marge 0,95 sur C5), parois au minimum de C8 (2,0 ; bossages 1,6). Ce sont des repères pour la relecture, pas des cotes que tu modifies.
- Aucune vue de capture n'est exigée.
- Le FCStd, le STEP, le STL et les scripts de la coque ne sont pas dans ton périmètre. Un besoin de modifier `scripts/techdraw_pages.py` ou un autre helper commun est un lot méthode séparé : arrête-toi en `blocked`.
