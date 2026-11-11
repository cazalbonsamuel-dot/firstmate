## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) », ligne du §13 de `method/methode-cao-operationnelle-v1.md`. Pièce : `facade`, cas `inclinometre-jimny-boitier`. Ship, avec exécution lourde courte (GUI).

**Règles et lecture.** Applique `method/worker.md`, puis la colonne « Lire » de cette ligne, rien de plus :
- §5 « Fabrication » du noyau, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Le contrat de preuves se lit comme `method/worker.md` §2 le fixe. Aucune lecture ajoutée.

**Base.** Commit `7d74a39` de la branche du cas. Entrées gelées, à ne pas modifier :
- les fichiers gelés du cas à ce commit, selon `method/worker.md` §3 ;
- `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, rouvert en lecture seule et jamais enregistré. Le worker vérifie qu'il est inchangé au commit de base avant de commencer.

**Point de synchronisation.** S3 est atteint (façade conçue et intégrée, FCStd gelé). La spécification de pages existe déjà : `cases/inclinometre-jimny-boitier/docs/plans/facade/pages.json`, une page `facade-p1` avec vue de face, coupe A-A et 8 cotes lues sur le modèle. Elle doit passer `--check` avant toute exécution lourde. Si elle ne passe pas, ou si une cote lue ne correspond pas à `params.json` ou à `interfaces.json`, le worker s'arrête en `needs-decision` et ne choisit aucune valeur.

**Livrable accepté.** Un SVG et un PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié. Pour cette pièce : `facade-p1.svg`, `facade-p1.pdf` et `techdraw_report.json`.

**Fichiers possédés** (le worker est seul propriétaire, sous `cases/inclinometre-jimny-boitier/docs/plans/facade/`) :
- `pages.json`
- `facade-p1.svg`
- `facade-p1.pdf`
- `techdraw_report.json`

Dans `method/cases/inclinometre-jimny-boitier/manifest.json`, il ne touche que les lignes de ces fichiers et la preuve `PLAN-FACADE` qu'il rejoue lui-même. Il ne touche ni `cad/`, ni `design/`, ni `scripts/` hors lanceur, ni les autres pièces (`coque`, `semelle`), ni l'assemblage.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`. Pour une remise suivante le même jour : `-2`, `-3`.

**Commandes de remise.** `method/worker.md` §8 et le contrat (« Commandes du worker »). Le brief ne les recopie pas. Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_facade.sh`. Il n'est lancé que si l'unité le demande ou si une preuve du FCStd est invalidée, ce qui ne devrait pas arriver puisque le FCStd reste gelé.

**Budget.**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` : 2 exécutions TechDraw pour le jeu de pages de la façade.
- Itérations et exécutions lourdes réduites par le second maître à 2 itérations et 2 exécutions lourdes (`max_iterations`, `max_heavy_runs_per_brief` de la fiche).
- Pas de dépassement sans autorisation écrite du second maître, citée dans `depassement`.

**Exécutions lourdes.** Chaque exécution, via `scripts/run_freecad_capture.sh --script`, attend l'autorisation du second maître et son délai maximal (`cao-freecad-execution`). Le délai attendu est d'une vingtaine de secondes, le plafond annoncé à chaque autorisation est de 300 s. Le worker déclare l'attente selon `method/worker.md` §5. Runtime hors bac à sable sur ce Mac (§12). Un bail `freecad` non obtenu rend 75 : attendre et réessayer, sans rien forcer.

**Points propres au cas.**
- Repère de la façade : plaque dans XY, face avant à z = 0, arrière à z = -2,5, cadre 87 x 42 vu par le conducteur, origine au coin bas gauche.
- Les cotes à lire sont les 8 de `pages.json` : largeur et hauteur de plaque, largeur et hauteur de fenêtre (prises au dos de la plaque, chanfrein de 1 mm vers l'avant), perçages LED et encodeur, passage de vis, épaisseur de plaque en coupe A-A. Chaque valeur attendue vient de `params.json`, de `interfaces.json` ou du script de construction de la façade. Aucune seconde source.
- Cotes serrées connues, à ne pas modifier :
  - tête de la vis basse à 2,44 mm du bouton (seuil 2,0) ;
  - bague arrière de la LED 2 à 1,05 mm du bossage haut droit ;
  - avant-trou d'écran à 2,41 mm du bord gauche de la plaque ;
  - jeu plaque-cadre de 0,3.

  Ce sont des cotes de pièce, pas de plan : le plan ne les change pas.
- Cotes d'écran provisoires (module non mesuré) : le plan ne les présente pas comme mesurées, le cartouche indique `non approuvé`.

**Hors périmètre.** Toute modification de la géométrie de la façade, de `params.json` ou de `interfaces.json` ; les plans de la coque et de la semelle ; la nomenclature ; tout helper de `scripts/` ou lanceur (lot méthode séparé : s'arrêter en `blocked`).
