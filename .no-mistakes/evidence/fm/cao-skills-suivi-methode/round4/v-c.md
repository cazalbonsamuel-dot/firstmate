## Firstmate spec

**Unité** : Plans normatifs TechDraw de la pièce **coque**, un jeu de pages (une page, `coque-p1`).
Cas `inclinometre-jimny-boitier`. Ligne du §13 : « Plans normatifs TechDraw (un jeu de pages par pièce) ».

**Règles communes** : applique `method/worker.md` en entier. Il fixe le rôle, la lecture, les entrées gelées, la propriété et les écrivains du manifeste, les exécutions FreeCAD, le commit, le budget, la fiche, l'intégration et les refus. Ce brief ne les répète pas et ne les assouplit pas.

**Lire** (après `method/worker.md`) :
- le noyau du contrat de preuves (`method/proof-contract-v2.md`), comme `method/worker.md` §2 le demande ;
- la colonne « Lire » de ta ligne : §5 « Fabrication » du noyau, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md` ;
- le cas : son `README.md`, tes entrées gelées, et la synthèse du manifeste (`python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`).

Aucune autre lecture n'est ajoutée.

**Base** : commit `01b88f2` de la branche du cas. Lance-toi en partant de cette branche (`--base-branch`).

**Entrées gelées, à ne pas modifier** :
- les fichiers gelés du cas à `01b88f2` (`method/worker.md` §3) ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit. Tu l'ouvres en lecture seule et tu ne l'enregistres jamais. Aucune empreinte n'est recopiée ici : vérifie-le selon `method/worker.md` §3.

**Livrable accepté** : SVG et PDF de la page, `techdraw_report.json` en `verifie`, pages relues en image. Aucun FCStd modifié.

**Fichiers que tu possèdes** (propriétaire unique du dossier) : tout `cases/inclinometre-jimny-boitier/docs/plans/coque/`, soit :
- `pages.json`
- `coque-p1.svg`
- `coque-p1.pdf`
- `techdraw_report.json`

Dans le manifeste, tu ne touches que les lignes de ces fichiers et la preuve `PLAN-COQUE`, que tu as toi-même rejouée. Si tu changes un fichier cité par la preuve d'une autre unité, déclare-la dans `invalidated_proofs`.
Tu ne modifies ni `scripts/techdraw_pages.py` ni aucun autre helper. Un besoin de ce genre est `blocked` (`method/worker.md` §4).

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Numérote `-2`, `-3` pour une remise suivante le même jour.

**Budget** :
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`, sans le dépasser.
- `max_iterations` : 2, réduit pour cette unité.
- `max_heavy_runs_per_brief` : 2, réduit pour cette unité. Les exécutions TechDraw comptent dans ce plafond.
- Une troisième exécution TechDraw ne se fait que sur autorisation écrite du second maître. Elle est alors justifiée dans la fiche (`depassement`).

**Exécutions lourdes** :
- Runtime hors bac à sable.
- Chaque exécution TechDraw se lance seulement sur autorisation du second maître, demandée par `needs-decision`.
- Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`).

**Remise** : commandes selon `method/worker.md` §8 et le contrat, « Commandes du worker », code et durée de chacune dans la fiche. Le contrôle natif de la coque est `cases/inclinometre-jimny-boitier/scripts/check_coque.sh --json <chemin>`. Écris son rapport hors du dépôt, ou ne le commite pas s'il est identique au rapport en place.

**Points propres au cas** :
- Le plan se pose sur la spécification de pages que tu produis à partir de l'existante, `docs/plans/coque/pages.json`, lue comme point de départ. Il doit couvrir au moins la vue de gauche, la vue de dessous et la coupe B-B, avec les cotes d'interface. Chaque cote s'appuie sur `params.json` (pointeur JSON) ou sur une valeur attendue déclarée.
- Cotes serrées : rainure en queue d'aronde (embouchure, plafond, hauteur) et ouverture micro-USB. Elles sont lues à `compare_tolerance_mm` 0,01 mm. Pour chaque référence d'arête, choisis un point intérieur à une seule arête, jamais une jonction, notamment autour des chanfreins de 0,5 mm de la rainure.
- Une cote qui manque, ne tient pas géométriquement ou s'écarte de `params.json` donne `needs-decision`. Tu ne choisis jamais une valeur en silence.
- Ce plan ne couvre ni façade ni semelle ni assemblage : autres unités, autres propriétaires.

**Remonter** : tout besoin de modifier une entrée gelée ou un helper, ou de dépasser le budget, passe par `needs-decision` ou `blocked` selon `method/worker.md` §1, §4 et §7.
