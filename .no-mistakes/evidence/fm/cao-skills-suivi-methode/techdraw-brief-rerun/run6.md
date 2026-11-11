Tu es worker CAO sur une seule unité : « Plans normatifs TechDraw », un jeu de pages pour la pièce `facade` du cas `inclinometre-jimny-boitier` (ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13).

Applique `method/worker.md`, puis la colonne « Lire » de cette ligne : §5 « Fabrication », §15, `method/guides/techdraw.md` et `method/guides/freecad.md`. Le noyau du contrat de preuves (`method/proof-contract-v2.md`) fait foi, comme pour toute unité. Ne lis rien d'autre sans raison écrite dans ta fiche.

**Base et entrées gelées**
- Base : commit `7d74a39` de la branche du cas. Vérifie les entrées gelées à ce commit selon `method/worker.md` §3. Tu ne les modifies jamais.
- Entrées gelées :
  - les fichiers gelés du cas à ce commit ;
  - `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, rouvert en lecture seule et jamais enregistré. Son digest est celui de sa ligne `delivered_files` du manifeste, sans empreinte recopiée ici.
- Spécification de pages : `cases/inclinometre-jimny-boitier/docs/plans/facade/pages.json` à ce commit (page `facade-p1`, vue de face et coupe A-A, 8 cotes d'interface). C'est ton point de départ.
  - Tu ne changes que la mise en page : positions, placement des textes, cartouche.
  - Toute valeur attendue vient de `design/params.json` et de `design/interfaces.json`. Une cote qui manque ou ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence.

**Livrable**
- Un jeu de pages pour la façade : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.
- Fichiers que tu possèdes : le dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/` (`pages.json`, `facade-p1.svg`, `facade-p1.pdf`, `techdraw_report.json`), et dans le manifeste du cas seulement les lignes de ces fichiers et de leurs preuves.
- Tu n'écris rien d'autre : ni les autres pièces, ni `scripts/`, ni les entrées gelées.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour.

**Budget** (`method/iteration_budget.json`, réduit : un seul jeu de pages)
- `max_iterations` : 2.
- `max_heavy_runs_per_brief` : 2, relances comprises.
- `max_techdraw_runs_per_page_set` : 2 (compris dans les exécutions lourdes).
- Un dépassement n'est possible qu'avec l'autorisation écrite du second maître, citée dans `depassement`.

**Exécutions lourdes**
- Chaque exécution TechDraw attend l'autorisation du second maître, qui fixe son délai maximal.
- Tu ne lances rien avant de l'avoir reçue.
- L'attente suit `method/worker.md` §5.

**Points propres au cas**
- La façade est une plaque de 2,5 mm avec une fenêtre au dos, vue de face puis coupe A-A.
- La cote d'épaisseur de plaque (2,5 mm) est une petite cote, déjà portée avec flèches retournées dans la spécification.
- Les plans existants du dépôt à ce commit servent de référence de mise en page, pas de preuve : la preuve de cette unité est le rapport que tu génères sur le modèle gelé.

**Remise**
- Commandes de remise : `method/worker.md` §8 et le contrat (« Commandes du worker »). Le cas a déjà son contrôle natif de la pièce, `scripts/check_facade.sh`.
- Intégration : seulement quand le second maître te le dit (`method/worker.md` §9).
