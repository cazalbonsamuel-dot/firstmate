## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw (un jeu de pages par pièce)**, ligne du §13 de `method/methode-cao-operationnelle-v1.md`. La pièce est la **coque** du cas `inclinometre-jimny-boitier`.

**Règles et lecture**
- Applique `method/worker.md` : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus. Il fait foi et tu n'en assouplis aucune règle.
- Lis ensuite le noyau du contrat de preuves `method/proof-contract-v2.md` (principes, commandes, remise d'un worker), comme le demande `method/worker.md` §2.
- Lis ensuite la colonne « Lire » de ta ligne du §13, sans rien y ajouter :
  - §5 « Fabrication » du noyau, lu seul ;
  - `method/guides/techdraw.md` ;
  - `method/guides/freecad.md`.
- Pour le cas, lis son `README.md`, tes entrées gelées, et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

**Base et entrées gelées (à ne pas modifier)**
- Base : le commit `01b88f2` de la branche du cas. Les fichiers gelés vivent sur cette branche et pas sur la branche par défaut : travaille dans un worktree lancé avec `--base-branch` sur la branche du cas (`AGENTS.md` section 7).
- Entrées gelées :
  - les fichiers gelés du cas à `01b88f2` (`method/worker.md` §3) ;
  - le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit, rouvert en lecture seule et jamais enregistré. Le digest géométrique à épingler est celui de la ligne `delivered_files` de ce FCStd dans le manifeste du cas.
- Vérifie ces entrées au début de ton travail comme le demande `method/worker.md` §3. Aucun gel complémentaire n'est en cours. S'il en arrive un, il te sera transmis par `fm-send` sous la forme d'un seul identifiant de commit.

**Livrable** : un SVG et un PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.

**Fichiers que tu possèdes**
- Seulement le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste du cas, uniquement les lignes de ces fichiers et la preuve `json_metrics` du `techdraw_report.json` que tu rejoues (`method/worker.md` §4).
- Pas les plans de la façade ni de la semelle, pas `check_coque.json`, pas le FCStd, pas `scripts/`.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour. Elle suit le format du contrat (« Fiche de remise »).

**Budget**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`, soit 2 exécutions pour ce jeu de pages.
- `max_iterations` : 2, réduit de 3 car l'unité est courte.
- `max_heavy_runs_per_brief` : 2, réduit de 6 pour la même raison. Les exécutions TechDraw comptent dans ce total.
- Chaque exécution lourde exige l'autorisation préalable du second maître. Demande-la par `needs-decision`, sans lancer avant de l'avoir.
- Délai maximal de chaque exécution : 600 s (`FREECAD_TIMEOUT_S=600`).
- Pour le déclarer dans la fiche, utilise le schéma fixe du contrat. Pour `depassement` et la suite, applique `method/worker.md` §7.

**Commandes de remise** : `method/worker.md` §8 et le contrat (« Commandes du worker »). Cette unité est native et le cas a déjà son contrôle natif.

**Points propres au cas**
- Le `docs/plans/coque/pages.json` présent à `01b88f2` est ta spécification de départ. Elle a été écrite avant le dernier gel. Ses valeurs attendues par pointeur viennent de `params.json`, mais plusieurs sont écrites en dur : `hauteur` 46,0532, `rainure_bas_chanfreins` 17,074, `rainure_plafond` 21,0392 et `rainure_hauteur` 4,3.
- Pour chacune de ces valeurs en dur, vérifie qu'elle découle toujours de `params.json` et de `interfaces.json` à `01b88f2` (gel n°10 : rainure en queue d'aronde, jeu de 0,3 par face, chanfreins de 0,5). En cas d'écart ou de cote absente, remonte `needs-decision` sans choisir de valeur.
- Les références de cote (points du modèle) et l'origine de la coupe B-B dépendent de la géométrie de `01b88f2`. Revalide-les avant toute exécution.
- Cotes serrées : la coque est sans tolérance générale définie, et le cartouche porte « non définies ». Ne prétends à aucune tolérance ni état de surface.
- Jeu de pages : une seule page A3 paysage, comme l'existant.

**Refus** : tout besoin de modifier un helper de `scripts/`, une autre pièce, un autre cas ou une entrée gelée est `blocked` ou `needs-decision`, selon `method/worker.md` §4 et §10.
