## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13 de `method/methode-cao-operationnelle-v1.md`, pour la pièce `facade` du cas `inclinometre-jimny-boitier`.

**Règles et lectures**
- Applique `method/worker.md`, puis le noyau de `method/proof-contract-v2.md`.
- Lis ensuite la colonne « Lire » de ta ligne : §5 « Fabrication », `method/guides/techdraw.md` et `method/guides/freecad.md`. Aucune lecture ajoutée.
- La méthode et le contrat font foi.
- Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base et entrées gelées (à ne pas modifier)**
- Base : commit `7d74a39` de la branche du cas.
- Fichiers gelés du cas à ce commit (`method/worker.md` §3) :
  - `design/params.json` ;
  - `design/interfaces.json` ;
  - `design/acceptance_criteria/` ;
  - `design/recherche-options.md` ;
  - `design/recherche/`.
- Preuve `DEC-ARCHI` (`option_validee`).
- FCStd gelé : `cases/inclinometre-jimny-boitier/cad/facade.FCStd` à ce commit, rouvert en lecture seule, jamais enregistré.
- Un jeu de pages existe déjà à ce commit sous `cases/inclinometre-jimny-boitier/docs/plans/facade/` (page `facade-p1`). Pars de sa `pages.json`. Les cotes attendues viennent de `params.json` (pointeurs) ou de valeurs de la spécification déjà présentes. Une valeur qui ne tient pas est un `needs-decision`.

**Livrable**
- SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes**
- `cases/inclinometre-jimny-boitier/docs/plans/facade/` : `pages.json`, `facade-p1.svg`, `facade-p1.pdf`, `techdraw_report.json`.
- Leurs lignes du manifeste : `FILE-PLAN-FACADE-*` et la preuve `PLAN-FACADE`.
- Rien d'autre : ni `cad/`, ni les plans de la coque ou de la semelle, ni `scripts/` de la racine.

**Fiche de remise**
- `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`.
- Si une remise de cette unité existe déjà ce jour-là : `-2`, `-3`, etc.

**Budget**
- 2 itérations et 2 exécutions lourdes, réduit des valeurs par défaut de `method/iteration_budget.json` (3 et 6) parce que le jeu de pages existe déjà.
- Les 2 exécutions lourdes sont les 2 passes de `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`.
- Une troisième passe n'est possible qu'avec une autorisation écrite du second maître, justifiée dans `depassement` de la fiche.
- Chaque exécution lourde attend l'autorisation du second maître, qui en fixe le délai maximal.

**Commandes de remise**
- `method/worker.md` §8 et le contrat (« Commandes du worker »).

**Points propres au cas**
- L'épaisseur de plaque (`epaisseur_plaque`, 2,5 mm, vue en coupe A-A) est la cote la plus petite du jeu.
- Trois cotes (`percage_led`, `percage_encodeur`, `passage_vis`) sont placées par `label_offset_mm`, donc non prévisibles par `--check`.
- Les cotes de fenêtre sont prises sur les arêtes du dos de la plaque (z = -2,5).
- Aucune vue de capture exigée.
