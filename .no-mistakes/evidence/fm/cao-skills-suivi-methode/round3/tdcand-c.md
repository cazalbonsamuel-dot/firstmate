## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`. Tu es worker CAO en mode autonome sur cette seule unité.

**Règles et lecture**
- Applique `method/worker.md` en entier, sans exception. Il fixe le rôle, les entrées gelées, la propriété et le manifeste, les exécutions FreeCAD, les commits, le budget, la remise, l'intégration et les refus. Ce brief ne le recopie pas.
- Lis ensuite le noyau du contrat de preuves `method/proof-contract-v2.md` (principes, commandes, remise d'un worker).
- Lis la colonne « Lire » de ta ligne du §13, et seulement elle :
  - la section « Fabrication » du §5 de `method/methode-cao-operationnelle-v1.md`, lue seule ;
  - `method/guides/techdraw.md` ;
  - `method/guides/freecad.md`.
- Je n'ajoute aucune lecture.
- Lis ensuite le cas : `cases/inclinometre-jimny-boitier/README.md` et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

**Base**
- Commit `01b88f2` de la branche `fm/cao-inclinometre-boitier`.
- Tu es lancé avec `--base-branch fm/cao-inclinometre-boitier` : les entrées gelées vivent sur cette branche, pas sur `main`.
- Entrées gelées, à ne pas modifier :
  - les fichiers gelés du cas à ce commit (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/` ;
  - `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit. Tu le rouvres en lecture seule, sans jamais l'enregistrer.
- Une entrée qui diffère de ce commit te met en `blocked` (`method/worker.md` §3).

**Livrable** (colonne « Livrable accepté »)
- SVG et PDF de chaque page de la coque.
- `techdraw_report.json` en `verifie`.
- Pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes** (propriétaire unique)
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste, seulement :
  - les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF` et `FILE-PLAN-COQUE-RAPPORT` ;
  - la preuve `PLAN-COQUE`.
- Tu ne touches ni à la façade, ni à la semelle, ni à l'assemblage, ni à un autre cas, ni à un helper de `scripts/`.

**Fiche de remise**
- `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.
- Une remise suivante le même jour est numérotée `-2`, `-3`.

**Budget**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` : 2 exécutions pour le jeu de pages de la coque.
- 3 itérations (valeur du fichier, inchangée).
- 2 exécutions lourdes au lieu de 6 : un seul jeu de pages, deux exécutions TechDraw au plus, comptées dans `heavy_runs`.
- Une exécution supplémentaire exige mon autorisation écrite, que tu cites dans `depassement`.

**Exécutions lourdes**
- Chaque exécution TechDraw lourde n'est lancée qu'après mon autorisation explicite.
- Délai maximal de chacune : `FREECAD_TIMEOUT_S=600`.
- Pour l'attente, applique `method/worker.md` §5.

**Remise**
- Commandes : `method/worker.md` §8 et la section « Commandes du worker » du contrat. L'unité a une exécution native, elle n'est pas un scout.
- Le contenu de la fiche suit le schéma de la section « Fiche de remise » du contrat.

**Points propres au cas**
- Le jeu de pages existe déjà sous `docs/plans/coque/`, avec une page A3 `coque-p1`. Pars de cette spécification pour la reprendre, pas pour repartir de zéro.
- Les cotes viennent de `params.json` et `interfaces.json`, sans seconde source (§2). Une cote qui manque ou ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence.
- Ne propose aucune nouvelle décision de conception : le gel est à `01b88f2`.
- Cotes d'interface à porter, déjà déclarées dans la spécification actuelle :
  - ouverture micro-USB : hauteur et largeur (`usb_ouverture_mm`) ;
  - largeur hors tout (`facade_hors_tout_mm`) et profondeur de coque (`coque_profondeur_mm`) ;
  - hauteur de coque (`CALC-ANGLE`, `build_coque.py`) ;
  - rainure de la glissière, issue du gel n°10 : embouchure, plafond et hauteur.
- Le cartouche reste celui de la spécification actuelle (`INCLINO-COQUE`, révision A). Mets-le à jour seulement si une valeur change.
- Ces plans ne prouvent ni tolérances ni fabrication : la fiche et le rapport gardent cette limite.
- Le modèle de page ISO 5457 vient de FreeCAD 1.1.4, hors dépôt et non épinglé : cite-le comme le rapport actuel.
