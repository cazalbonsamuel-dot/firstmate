## Firstmate spec

**Unité.** Plans normatifs TechDraw de la pièce coque du cas `inclinometre-jimny-boitier`. Ligne du §13 : « Plans normatifs TechDraw (un jeu de pages par pièce) ». Cette unité est un ship : elle écrit dans le projet. Elle est lourde mais courte.

**Règles communes.** Applique `method/worker.md`, puis le noyau du contrat de preuves (`method/proof-contract-v2.md`).

**Lecture de la ligne.** Lis seulement :
- §5 « Fabrication » du noyau `method/methode-cao-operationnelle-v1.md` ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Le §15 est déjà dans le guide TechDraw. Aucune lecture n'est ajoutée.

**Base.** Le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Les artefacts gelés vivent sur cette branche et pas sur la branche par défaut, donc lance le worker avec `--base-branch fm/cao-inclinometre-boitier` (`AGENTS.md` section 7).

**Entrées gelées, à ne pas modifier.**
- Les fichiers gelés du cas à `01b88f2`, au sens de `method/worker.md` §3.
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, gelé à `01b88f2`. Il s'ouvre en lecture seule et n'est jamais enregistré.
- Il n'y a pas de preuve `DEC-...` propre à cette unité.

**Livrable.**
- Un SVG et un PDF par page, et un `techdraw_report.json` en `verifie`, pour la coque.
- Les pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes.** Tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` :
- `pages.json` ;
- les `coque-p<n>.svg` et `coque-p<n>.pdf` ;
- `techdraw_report.json`.

Tu es le seul propriétaire de ce dossier. Tu ne touches ni la façade, ni la semelle, ni l'assemblage, ni aucun autre cas, ni aucun helper de `scripts/`. Ton manifeste se limite aux lignes de ces fichiers : leur entrée `delivered_files` et la preuve de `techdraw_report.json` que tu as rejouée, comme le prévoit `method/worker.md` §4.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour.

**Budget.**
- `max_iterations` : 2, réduit de 3 (une passe, puis une reprise).
- `max_heavy_runs_per_brief` : 3, réduit de 6. Cela couvre les deux passes TechDraw et une relance après plantage.
- `max_techdraw_runs_per_page_set` : celui de `method/iteration_budget.json`, soit 2 pour ce jeu de pages.
- Un dépassement demande une justification écrite et mon autorisation préalable ; il se déclare dans `depassement` de la fiche.

**Exécutions lourdes.**
- Une seule exécution à la fois, sous le bail `freecad`.
- Autorisation : je donne l'autorisation du second maître pour les deux passes TechDraw, une à la fois, sans accord préalable pour chacune. Toute exécution au-delà demande mon autorisation par `fm-send`.
- Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`).
- Runtime hors bac à sable sur ce Mac (§12).

**Commandes de remise.** Celles de `method/worker.md` §8 et du contrat (« Commandes du worker »), selon que l'unité a ou non une exécution native.

Avant S4, le cas n'a pas de contrôle natif pour une unité d'assemblage. Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_coque.sh` (`DELIVERY-COQUE-NATIF`).

**Points propres au cas.**
- Le repère de la coque est x de 0 à 87, y de l'avant (0) à l'arrière (48), z = 0 au dessous posé sur la semelle. L'origine et les cotes viennent de `design/params.json` et de `design/interfaces.json`, sans seconde source.
- Cotes serrées connues, à ne pas arrondir ni choisir en silence. Ces valeurs viennent de ma lecture de la fiche de remise de la coque (`coque-2026-11-10.json`) et du modèle livré ; les chiffres gelés à `01b88f2` font foi. Si un chiffre ne tient pas, remonte-le en `needs-decision`.
  - Lèvre et paroi du logement de rainure : 2,0, au minimum de paroi de C8.
  - Plafond de rainure sous l'épaulement : environ 2,07.
  - Hauteur sur semelle : environ 49 mm, contre C5 ≤ 50.
- Plan de départ : si `docs/plans/coque/pages.json` existe à `01b88f2`, pars de lui. Sinon, écris-le.
- Vues attendues : vue de gauche, vue de dessous et coupe B-B de la rainure, cotes lues sur le modèle.
- Pas de vue de capture, pas d'autre pièce. Un besoin de modifier `scripts/techdraw_pages.py` ou un autre helper est un lot méthode séparé : arrête-toi en `blocked`.
