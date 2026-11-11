## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **conception d'une pièce, la `semelle`**, du cas `inclinometre-jimny-boitier` (ligne « Conception d'une pièce ou d'un sous-ensemble » du §13). Applique `method/worker.md` (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus) puis la colonne « Lire » de cette ligne. La méthode et le contrat de preuves font foi. Toute question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 s'arrête et se remonte au second maître, sans trancher.

**Lecture, dans cet ordre**
- `method/worker.md`, puis le noyau de `method/proof-contract-v2.md` (principes, commandes du worker, remise, écrivains du manifeste).
- Sections du noyau `method/methode-cao-operationnelle-v1.md`, lues seules : §2 « Détail mécanique utile par défaut » et « Implantation avant le détail » ; §4 « Fermeture fonctionnelle proportionnée » ; §5 « Géométrie » et « Export STEP non validé » ; §6.
- Guide `method/guides/freecad.md` ; partie du contrat `method/contrat/geometry-digest.md`.
- Le cas : `cases/inclinometre-jimny-boitier/README.md`, tes entrées gelées, et `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.
- Tes lignes du manifeste, extraites par `jq` (`worker.md` §2), pas le fichier entier.
- Aucune lecture ajoutée.

**Base et entrées gelées, à ne pas modifier**
- Base : commit `7d74a39`.
- Fichiers gelés du cas à ce commit (`worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/` (C1 à C10), `design/recherche-options.md`, `design/recherche/`.
- Décision `DEC-ARCHI` en `option_validee` (A1, coin imprimé monobloc, angle fixe, collé).
- S2 et S3 sont acquis. Vérifie les entrées gelées au début (`git diff --exit-code 7d74a39 -- <chemins>`), sinon `blocked`.
- Interfaces dont tu es propriétaire : `IF-GLISSIERE`, `IF-VERROU`, `IF-BASE-SEMELLE`. La coque, la façade et l'assemblage sont hors de ton périmètre.
- `design/calculs_verrou.json` (CALC-VERROU) et `scripts/calc_verrou.py` sont des entrées en lecture seule. La conception les consomme, tu ne les modifies pas. Si le modèle exige de les changer, `needs-decision`.

**Livrable** (colonne « Livrable accepté ») : STEP et STL de la semelle, solide unique, BOP strict, sa part de BOM. Les lignes de tes fichiers sont re-pointées dans le manifeste et les preuves que tu invalides sont déclarées dans ta fiche.

**Fichiers que tu possèdes, et eux seuls**
- `cases/inclinometre-jimny-boitier/cad/semelle.FCStd`, `semelle.step`, `semelle.stl`
- `cases/inclinometre-jimny-boitier/scripts/build_semelle.py`, `build_semelle.sh`, `check_semelle.py`, `check_semelle.sh`
- `cases/inclinometre-jimny-boitier/docs/nomenclature-semelle.csv`
- `cases/inclinometre-jimny-boitier/outputs/check_semelle.json`
- Dans `method/cases/inclinometre-jimny-boitier/manifest.json`, uniquement les lignes `FILE-SEMELLE-*`, `NAT-PIECE-SEMELLE` et `DELIVERY-SEMELLE-NATIF` (écrivain 3).
- Les plans (`docs/plans/semelle/`), `outputs/impression/semelle-*`, les captures, l'assemblage, la coque et la façade appartiennent à d'autres unités. Si ta géométrie change, déclare leurs preuves dans `invalidated_proofs` avec `cites`, sans toucher à leurs hashes.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/semelle-2026-11-11.json`, au schéma du contrat (« Fiche de remise »), commitée après le commit de l'unité.

**Budget** : 3 itérations et 6 exécutions lourdes (`method/iteration_budget.json`), sans augmentation. Chaque exécution lourde attend l'autorisation du second maître et son délai maximal.

**Commande de remise** : le cas n'a pas encore de contrôle natif de cas (avant S4). Le contrôle natif de ta pièce est donc `cases/inclinometre-jimny-boitier/scripts/check_semelle.sh --json cases/inclinometre-jimny-boitier/outputs/check_semelle.json`. Il est précédé de `build_semelle.sh` quand la géométrie change. Les commandes, codes et durées sont déclarés selon `worker.md` §8 et le contrat (« Commandes du worker »). Jamais `delivery --execute`.

**Exécutions lourdes** : les deux lanceurs de la pièce (build et contrôle), en console, hors bac à sable. Les durées mesurées sont de 0,7 à 1,4 s pour le build et de 0,4 à 3,1 s pour le contrôle. Le délai maximal proposé au second maître est de 60 s, le `timeout_s` de `DELIVERY-SEMELLE-NATIF`.

**Points propres au cas**
- Cotes serrées de la semelle :
  - Plaque d'emprise 87 x 51 ; dessous plan d'une seule face, surface collée ≥ 29 cm² (43,6 cm² à la dernière remise).
  - Rail : largeur 20 en haut, flancs 60°, hauteur 4, axe x = 73,35, jeu par face 0,3 avec la rainure de la coque. Lèvre arrière hors emprise, hauteur 3.
  - Languette : épaisseur 2,0, largeur 5,4, racine y ≤ 32. Fenêtre traversante sous la partie libre. Marge de surcourse ≥ 1,0 mm au pire des tolérances ± 0,2 (1,149 à la dernière remise).
  - Épaisseur mini 2,0 et surplombs sans support déclarés (C8).
  - Congé au pied du rail borné par `jeu_conge_pied_min` 0,3.
- Interface avec la coque, à déclarer dans ta fiche sans la trancher : la rampe avant du cran de la coque doit être inclinée d'au moins 30°, comme la rampe de la dent, et son angle n'est pas coté dans `IF-VERROU`.
- Pas de capture dans cette unité.
