## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw (un jeu de pages par pièce)**, ligne du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`.

Applique `method/worker.md` : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus. Il fait foi et ce brief ne le modifie pas. Applique ensuite la colonne « Lire » de ta ligne, sans lecture ajoutée :
- §5 « Fabrication » du noyau `method/methode-cao-operationnelle-v1.md`, lu seul ;
- §15 du noyau ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Lis aussi le noyau `method/proof-contract-v2.md` (principes, commandes, remise d'un worker) et le `README.md` du cas.
La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base.** Commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Ta branche d'unité part de ce commit. Le worker est lancé avec `--base-branch fm/cao-inclinometre-boitier`.

**Entrées gelées**, à ne pas modifier, à ce commit :
- `cases/inclinometre-jimny-boitier/design/params.json` ;
- `cases/inclinometre-jimny-boitier/design/interfaces.json` ;
- `cases/inclinometre-jimny-boitier/design/acceptance_criteria/` ;
- `cases/inclinometre-jimny-boitier/design/recherche-options.md` ;
- `cases/inclinometre-jimny-boitier/design/recherche/` ;
- le FCStd gelé de la pièce, `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, rouvert en lecture seule par le lanceur et jamais enregistré.

Vérifie-les au début selon `method/worker.md` §3 (`git diff --exit-code 01b88f2 -- <chemins>`). Un écart donne `blocked`. Toute cote attendue vient de `params.json` ou du modèle ouvert, sans seconde source. Les `input_hashes` de tes preuves restent calculés sur ces fichiers.

**Livrable** (colonne « Livrable accepté »). Pour la coque, un jeu de pages comprenant :
- un SVG et un PDF par page ;
- `techdraw_report.json` en `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes** :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` en entier (`pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`, tout nouveau fichier de page) ;
- dans `method/cases/inclinometre-jimny-boitier/manifest.json`, uniquement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT` et la preuve `PLAN-COQUE` (`path`/`sha256`, `generated_by`, `input_hashes`, `source_artifacts`), que tu rejoues toi-même.

Rien d'autre n'est à toi : ni `cad/`, ni `design/`, ni les plans de la façade et de la semelle, ni `docs/dossier-conception.md` ni les nomenclatures, ni `scripts/` de la racine (dont `techdraw_pages.py`), ni un autre cas.
Déclare dans ta fiche (`invalidated_proofs`, avec `cites`) toute preuve d'un autre propriétaire qui cite un fichier que tu re-pointes.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Numérote `-2`, `-3` pour une remise suivante le même jour.

**Commandes de remise** : celles de `method/worker.md` §8 et du contrat (« Commandes du worker »). Code et durée de chacune sont dans ta fiche.

**Budget** : `max_iterations` 3 (`method/iteration_budget.json`). Tu es limité à `max_techdraw_runs_per_page_set` (`method/iteration_budget.json`) exécutions du lanceur de plans pour ce jeu de pages. `max_heavy_runs_per_brief` est réduit de 6 à 2, car ces exécutions comptent aussi dans `heavy_runs`. Une exécution de plus exige l'autorisation écrite du second maître et se justifie dans ta fiche (`depassement`).
Chaque exécution FreeCAD attend l'autorisation du second maître. Délai maximal par exécution : **600 s**, soit `FREECAD_TIMEOUT_S=600`. Avant d'attendre, déclare `paused … until <début + délai>` (`method/worker.md` §5).
Runtime hors bac à sable sur ce Mac (§12) ; jamais un profil dont le bac à sable bloque Qt.

**Points propres au cas** :
- Le dossier `docs/plans/coque/` contient déjà un plan de la coque (page `coque-p1`, 8 cotes, preuve `PLAN-COQUE`), produit sur un FCStd antérieur à `01b88f2`.
- Pars de cette spécification existante.
- Compare d'abord le digest géométrique de `coque.FCStd` à `01b88f2` à celui de `PLAN-COQUE`.
- Chaque référence et chaque valeur attendue de `pages.json` se relit contre le modèle à `01b88f2`. Cela vaut pour les valeurs en dur (hauteur 46,0532, plafond de rainure 21,0392, embouchure 17,074, hauteur de rainure 4,3) comme pour les pointeurs vers `params.json`.
- Une cote qui ne tient plus, ou une référence ambiguë, donne `needs-decision`, jamais une valeur choisie en silence.
- Cotes serrées de la coque, à ne pas masquer : hauteur sur semelle 49,05 (marge 0,95 sur C5), paroi de lèvre 2,0, plafond de rainure sous l'épaulement 2,07.
- Vues de la page, conservées sauf raison écrite : vue de gauche 1:1, vue de dessous 1:1, coupe B-B 3:2 sur la vue de dessous.
- Le cartouche reste celui de la spécification existante. Si la date ou l'indice de révision doivent changer, c'est une décision du second maître.
