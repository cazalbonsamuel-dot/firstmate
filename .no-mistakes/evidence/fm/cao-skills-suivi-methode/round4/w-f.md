## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (ligne du §13 « Plans normatifs TechDraw (un jeu de pages par pièce) »), pour la pièce **coque** du cas `inclinometre-jimny-boitier`.

**Règles et lectures**
- Applique `method/worker.md` (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus) sans l'assouplir. La méthode et le contrat de preuves font foi.
- Lis ensuite la colonne « Lire » de ta ligne :
  - §5 « Fabrication » du noyau `method/methode-cao-operationnelle-v1.md`, lu seul ;
  - `method/guides/techdraw.md` ;
  - `method/guides/freecad.md`.
- Applique §5 « Fabrication » et §15.
- Aucune lecture ajoutée.
- Toute question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 remonte au second maître en `needs-decision`.

**Base et entrées gelées**
- Base : commit `01b88f2` de la branche du cas. Tu es lancé avec `--base-branch` sur cette branche.
- Entrées gelées, à ne pas modifier :
  - les fichiers gelés du cas à ce commit (`method/worker.md` §3) ;
  - le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit, rouvert en lecture seule, jamais enregistré ;
  - la preuve `DEC-ARCHI`.
- Vérifie ces entrées au début de ton travail (`method/worker.md` §3). Sur écart, arrête-toi en `blocked`.

**Livrable** (colonne « Livrable accepté »)
- Un jeu de pages : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes**
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf` et `techdraw_report.json`. Tu es le seul propriétaire de ce dossier de sorties.
- Dans le manifeste, seulement les lignes `delivered_files` de ces quatre fichiers et la preuve `PLAN-COQUE`, que tu rejoues toi-même.
- Aucun autre fichier : ni la façade, ni la semelle, ni `scripts/`, ni `method/`.

**Fiche de remise**
- `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.
- Numérote `-2`, `-3` pour une remise suivante le même jour.

**Budget** (`method/iteration_budget.json`, réduit)
- 2 itérations.
- 2 exécutions lourdes, relances comprises.
- `max_techdraw_runs_per_page_set` : 2, comprises dans les exécutions lourdes.
- Une troisième exécution TechDraw, ou un dépassement de l'un de ces plafonds, ne s'exécute pas sans l'autorisation écrite du second maître. Elle se justifie alors dans la fiche (`depassement`).

**Exécutions lourdes**
- Runtime hors bac à sable (§12).
- Autorisation du second maître : donnée pour la première exécution TechDraw. La seconde est autorisée par le second maître au vu de ta première passe : déclare-la avant de la lancer.
- Délai maximal : 600 s par exécution (`FREECAD_TIMEOUT_S=600`).

**Commandes de remise**
- `method/worker.md` §8 et le contrat, « Commandes du worker ». Rien n'est recopié ici.

**Points propres au cas**
- Le jeu de pages existe déjà sous `docs/plans/coque/`. Il a été produit avant le commit de base. Reprends sa spécification `pages.json` comme point de départ, et rejoue-la sur le FCStd gelé à `01b88f2`.
- Une cote lue sur le modèle gelé qui s'écarte de sa valeur attendue (`non_conforme`) ou qui est refusée (`echec`) n'est jamais corrigée par un changement de la valeur attendue ni de la cible.
  - Les valeurs attendues viennent de `design/params.json` (pointeurs JSON) ou de valeurs numériques propres à la spécification.
  - Si l'écart vient du modèle ou des entrées gelées, arrête-toi en `needs-decision`.
- Les plans ne portent ni tolérances ni états de surface : `general_tolerances` reste « non définies ». Ne les invente pas.
- Les critères du cas qui citent `PLAN-COQUE` (C4, notamment l'ouverture micro-USB) dépendent de cette preuve : déclare dans la fiche toute preuve d'un autre propriétaire que tu invalides (`invalidated_proofs`).
