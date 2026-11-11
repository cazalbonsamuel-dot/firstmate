Je rédige le texte du brief à partir de ce que j'ai lu : ligne §13 de l'unité, `method/worker.md`, guide TechDraw, budget et README du cas.

## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`.
Applique `method/worker.md` (règles communes à toute unité), puis la colonne « Lire » de cette ligne du §13, sans rien y ajouter :
- §5 « Fabrication » du noyau `method/methode-cao-operationnelle-v1.md`, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base**
- Commit `01b88f2` de la branche du cas.
- Tu es lancé avec `--base-branch <branche-du-cas>`, car les artefacts gelés vivent sur cette branche et non sur la branche par défaut.

**Entrées gelées (à ne pas modifier)**
- Les fichiers gelés du cas à `01b88f2` (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/`.
- Le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, à ce commit, rouvert en lecture seule et jamais enregistré. Son digest est celui du manifeste du cas à `01b88f2`.

**Livrable** (colonne « Livrable accepté »)
- SVG et PDF par page, et `techdraw_report.json` en `verifie`.
- Pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes** (seul propriétaire)
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : spécification `pages.json`, pages SVG et PDF, `techdraw_report.json`.
- Les lignes du manifeste du cas pour ces fichiers et pour la preuve de plan de la coque que tu rejoues (`method/worker.md` §4).
- Tu ne touches ni aux plans de la façade et de la semelle, ni à `scripts/`, ni à un autre cas.

**Fiche de remise**
- `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, au format du contrat.
- Si une remise suit le même jour : `plans-coque-2026-11-11-2.json`, puis `-3.json`.

**Budget** (`method/iteration_budget.json`, réduit)
- `max_iterations` : 3.
- `max_heavy_runs_per_brief` : 3, soit les passes TechDraw plus le contrôle natif de la coque de ta remise.
- `max_techdraw_runs_per_page_set` : 2.
- Le budget est celui de `method/iteration_budget.json`. Toute exécution de plus passe par une autorisation écrite du second maître, citée dans `depassement` de ta fiche.

**Exécutions lourdes**
- Autorisation du second maître : une passe de plans à la fois, le bail `freecad` étant garanti par les lanceurs.
- Délai maximal de chaque exécution : 600 s (`FREECAD_TIMEOUT_S=600`).
- Le même délai de 600 s vaut pour le contrôle natif de la coque.
- Une exécution lourde au-delà de ces trois n'est pas autorisée.

**Remise**
- Commandes : `method/worker.md` §8 et contrat, « Commandes du worker ».
- Cette unité a une exécution native avant S5, donc le contrôle natif de la coque déclaré dans les `delivery_checks[]` du manifeste du cas.
- `delivery --execute` est réservé au worker S5.

**Points propres au cas**
- Un seul jeu de pages, pour la coque seule (objet `Coque` de `coque.FCStd`).
- Toute cote attendue vient de `params.json` et de `interfaces.json`, sans seconde source.
- Une cote qui manque, ou qui ne se lit pas sur le modèle gelé, donne `needs-decision`, jamais une valeur choisie en silence.
- Intégration : seulement quand le second maître te le dit, selon `method/worker.md` §9.
