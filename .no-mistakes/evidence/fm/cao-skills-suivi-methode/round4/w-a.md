## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (un jeu de pages, celui de la pièce coque du cas `inclinometre-jimny-boitier`), ligne « Plans normatifs TechDraw » de la table du §13.
Applique `method/worker.md` (règles communes à toute unité : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus), puis la colonne « Lire » de cette ligne, sans rien y ajouter :
- §5 « Fabrication » et §15 du noyau `method/methode-cao-operationnelle-v1.md`, lus seuls ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Le noyau du contrat de preuves (`method/proof-contract-v2.md`) se lit comme l'impose `method/worker.md` §2.
La méthode et le contrat font foi.
Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base**
- Commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`.
- Les artefacts gelés vivent sur cette branche, pas sur `main` : le worker est lancé avec `--base-branch fm/cao-inclinometre-boitier` (`AGENTS.md` section 7).

**Entrées gelées, à ne pas modifier**
- Les fichiers gelés du cas à ce commit (`method/worker.md` §3) : `cases/inclinometre-jimny-boitier/design/params.json`, `interfaces.json`, `acceptance_criteria/`, `recherche-options.md`, `recherche/`.
- Le FCStd gelé de la pièce, `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, au digest épinglé dans le manifeste du cas à ce commit.
- Il est rouvert en lecture seule par le lanceur et jamais enregistré.
- Aucun autre FCStd n'est touché.

**Livrable** (colonne « Livrable accepté »)
- SVG et PDF de chaque page.
- `techdraw_report.json` en `verifie`.
- Pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes** (propriétaire unique du dossier de sorties `cases/inclinometre-jimny-boitier/docs/plans/coque/`)
- `pages.json`, la spécification à valider par `--check` avant chaque exécution.
- `coque-p1.svg`, `coque-p1.pdf` et `techdraw_report.json`.
- Les lignes du manifeste de ces fichiers et la preuve `PLAN-COQUE` que tu as toi-même rejouée, rien d'autre.
- Les plans de la façade et de la semelle, les nomenclatures et `docs/dossier-conception.md` ne sont pas à toi.

**Fiche de remise**
- `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.
- Numérotée `-2`, `-3` pour une remise suivante le même jour.

**Commandes de remise**
- Voir `method/worker.md` §8 et le contrat (« Commandes du worker »).
- L'unité a une exécution native et le cas a déjà son contrôle natif.
- Le contrôle natif de ta pièce est celui de `delivery_checks[]` du manifeste du cas, `DELIVERY-COQUE-NATIF`, avec son code et sa durée dans ta fiche.

**Budget** (`method/iteration_budget.json`, réduit parce que l'unité ne porte qu'un jeu de pages)
- 2 itérations.
- 3 exécutions lourdes au plus : les passes TechDraw, relances après plantage comprises, plus une exécution du contrôle natif de ta pièce.
- `max_techdraw_runs_per_page_set` : 2 (`method/iteration_budget.json`).

**Exécutions lourdes**
- Autorisation du second maître donnée pour chaque exécution du lanceur FreeCAD de ce brief : `scripts/run_freecad_capture.sh --script scripts/techdraw_pages.py` et le contrôle natif de la coque.
- Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`).
- Runtime hors bac à sable obligatoire sur ce Mac (§12).

**Points propres au cas**
- Dernière mesure du jeu de pages de la coque : 10,2 s (`method/performance.md`).
- Le modèle ouvert reste dans son repère de construction : x de 0 à 87, y de 0 (avant) à 48 (arrière), z = 0 sur le dessous posé sur la semelle.
- Les 8 cotes de `pages.json` sont les cotes d'interface à porter. Leur valeur attendue vient de `params.json` par pointeur JSON, sauf `hauteur`, `rainure_bas_chanfreins`, `rainure_plafond` et `rainure_hauteur` (valeur déclarée dans la spécification). Une cote qui ne se porte pas ou ne tient pas à 0,01 mm près se remonte, sans changer sa valeur attendue en silence.
- Les cotes serrées sont celles de la rainure : `rainure_hauteur` (4,3 mm), `rainure_bas_chanfreins` (17,074 mm, chanfreins de 0,5 mm à 45° sur ses arêtes basses) et `rainure_plafond`, dans la coupe B-B à l'échelle 3:2.
- Les chanfreins de la rainure viennent du gel n°10 : prendre pour chaque cote un point intérieur à une seule arête, jamais une jonction.
- La hauteur de coque, 46,0532 mm, n'est pas la hauteur de 49,05 mm lue sur la semelle (`note` de `hauteur`).
- La pièce est livrée et les critères C1 à C10 sont tenus : ce plan ne change aucune cote, il la relit sur le modèle.
- Le plan ne prouve ni tolérances, ni fabrication : la mention « non définies » du cartouche reste.
