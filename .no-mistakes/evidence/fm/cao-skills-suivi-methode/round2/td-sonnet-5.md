**Firstmate spec**

**Unité.** Plans normatifs TechDraw, jeu de pages de la pièce `facade`, cas `inclinometre-jimny-boitier`. Cette ligne du §13 est la seule : un jeu de pages, une pièce, un FCStd, lourde et courte (GUI).

**Règles et lectures.**
- Applique `method/worker.md` en entier, puis le noyau de `method/proof-contract-v2.md`. Rien de ces règles n'est recopié ici.
- Colonne « Lire » de la ligne : §5 « Fabrication » du noyau, lu seul ; `method/guides/techdraw.md` ; `method/guides/freecad.md`.
- Pas de partie de `method/contrat/` : la ligne n'en cite aucune.
- Aucune lecture ajoutée.
- Côté cas : `cases/inclinometre-jimny-boitier/README.md`, tes entrées gelées, et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

**Base.** Le commit `7d74a39` de la branche du cas.
- Entrées gelées, à ne pas modifier : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md` et `design/recherche/` du cas à ce commit.
- À cela s'ajoute le FCStd gelé `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, à son digest du commit.
- Vérifie-les au début par `git diff --exit-code 7d74a39 -- <ces chemins>` : un code non nul donne `blocked`.
- Ces chemins sont ceux de l'arbre au commit de base. Tu les lis à ce commit, pas sur `main`.

**Livrable accepté.**
- Un SVG et un PDF par page, `techdraw_report.json` en `verifie`, et les pages relues en image.
- Aucun FCStd modifié.
- Lignes du manifeste : tu re-pointes uniquement celles de tes fichiers, `facade-p1.svg`, `facade-p1.pdf`, `pages.json` et `techdraw_report.json`.
- Déclare dans ta fiche, par `invalidated_proofs` avec `cites`, les preuves d'un autre propriétaire que ce re-pointage invalide. `PLAN-FACADE` est déjà dans le manifeste, c'est la tienne.

**Fichiers que tu possèdes.**
- Tout `cases/inclinometre-jimny-boitier/docs/plans/facade/` (le jeu de pages et son dossier de sortie, dont `pages.json`), et rien d'autre.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`. Si une remise existe déjà ce jour, numérote `-2`, `-3`.
- Les pièces `coque` et `semelle`, l'assemblage et tout autre cas sont hors périmètre. Les helpers de `scripts/` aussi : un besoin de les modifier est un lot méthode séparé, donc `blocked`.

**Budget.**
- Celui de `method/iteration_budget.json` : `max_iterations` 3, `max_heavy_runs_per_brief` 6.
- `max_techdraw_runs_per_page_set` : 2.
- Les exécutions TechDraw comptent aussi dans `heavy_runs`. Une troisième exécution exige mon autorisation écrite préalable, puis `depassement` dans la fiche.
- Chaque exécution lourde attend mon autorisation, avec son délai maximal. Tu me la demandes, tu ne la déduis pas. `FREECAD_TIMEOUT_S=600` est le plafond habituel, et je fixe le délai exact à l'autorisation. Je donne la première autorisation après `--check` sans défaut.

**Remise.**
- Commandes : `method/worker.md` §8 et le contrat (« Commandes du worker »).
- Avant S4, le cas n'a pas de contrôle natif par pièce autre que `check_facade.sh`, dont tu n'as pas à relancer le script de construction.
- Le contrôle natif de ta pièce est donc `cases/inclinometre-jimny-boitier/scripts/check_facade.sh --json cases/inclinometre-jimny-boitier/outputs/check_facade.json`.
- Il ne doit pas modifier le FCStd. Le lancer demande mon autorisation, comme toute exécution native.

**Points propres au cas.**
- Le jeu de pages existe déjà dans l'arbre (`docs/plans/facade/`, une page `facade-p1`, 7 cotes, une coupe A-A). C'est une reprise de ces plans : pars de la spécification existante, n'en refais pas une.
- Chaque cote reste lue sur le modèle ouvert, comparée à `params.json` ou à une valeur propre. Aucune valeur n'est choisie en silence : une cote qui manque ou ne tient pas donne `needs-decision`.
- Origine de coupe : le long du trait, `origin` est le centre de la boîte englobante, `--check` le vérifie.
- Cotes serrées connues : les fenêtres au dos (37,04 × 30,03) et les petits perçages Ø7,6 et Ø3 sont près des arêtes. L'épaisseur de plaque de 2,5 mm en coupe est une petite cote : texte au-delà de la ligne de cote.
- Aucune capture exigée.
