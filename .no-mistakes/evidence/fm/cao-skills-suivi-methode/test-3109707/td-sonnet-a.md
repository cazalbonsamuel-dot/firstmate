## Firstmate spec

**Unité.** Plans normatifs TechDraw (un jeu de pages par pièce, ligne du §13) : jeu de pages de la **coque** du cas `inclinometre-jimny-boitier`. Unité native lourde et courte, exécutée par un worker lancé hors bac à sable sur ce Mac (§12). Lancement avec `--base-branch` sur la branche du cas, car les artefacts gelés y vivent et pas sur `main` (`AGENTS.md` section 7).

**Règles communes.** Applique `method/worker.md`, puis le noyau du contrat (`method/proof-contract-v2.md`). Lis ensuite seulement la colonne « Lire » de ta ligne :
- méthode §5 « Fabrication » ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Lis aussi le `README.md` du cas et la synthèse du manifeste (`method/worker.md` §2). Aucune autre lecture. La méthode et le contrat font foi en cas d'écart avec ce brief, qui ne recopie ni n'assouplit leurs règles.

**Base.** Commit `01b88f2` de la branche du cas.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), dont `design/params.json`, et le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` (digest du manifeste à ce commit).
- Vérifie-les au début par `git diff --exit-code 01b88f2 -- <chemins>` ; si le code n'est pas 0, passe en `blocked`.
- Un gel complémentaire éventuel te sera transmis par `fm-send`, sous forme d'un identifiant de commit seul.

**Livrable** (colonne « Livrable accepté »).
- Un SVG et un PDF par page.
- `techdraw_report.json` en `verifie`.
- Pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes.**
- Le dossier de sorties `cases/inclinometre-jimny-boitier/docs/plans/coque/` en entier : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans `method/cases/inclinometre-jimny-boitier/manifest.json`, seulement les lignes de ces fichiers et de leur preuve de plans, selon `method/worker.md` §4.
- Rien d'autre : ni les plans de la façade ou de la semelle, ni un FCStd, ni les helpers `scripts/`.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour.

**Budget.**
- `max_techdraw_runs_per_page_set` = 2 (`method/iteration_budget.json`), sans augmentation.
- Je réduis `max_iterations` à 2 et `max_heavy_runs_per_brief` à 2. Le jeu de pages est unique et les exécutions TechDraw comptent dans les exécutions lourdes.
- Déclare les compteurs et leurs plafonds dans la fiche, comme le fixe le contrat.

**Exécutions lourdes.**
- Chaque exécution (`scripts/run_freecad_capture.sh --script scripts/techdraw_pages.py`) n'est lancée que sur l'autorisation expresse du second maître, une à la fois.
- Délai maximal par exécution : `FREECAD_TIMEOUT_S=600` (mesuré à environ 10 s pour ce cas).
- Ce que tu fais de ce délai est dans `method/worker.md` §5.

**Remise.** Commandes et fiche selon `method/worker.md` §8 et le contrat (« Commandes du worker »), unité native avant S5. `delivery --execute` est réservé au worker S5.

**Points propres au cas.**
- Le jeu de pages `coque-p1` existe déjà sur `main`, produit au S5 du 2026-11-10 sur un état antérieur de la coque. Pars de lui pour la spécification, sans le supposer valable pour le FCStd gelé à `01b88f2`.
- Chaque cote attendue vient de `design/params.json` (pointeurs JSON) ou d'une valeur écrite dans la spécification, sans seconde source (`method/worker.md` §3). Les valeurs écrites en dur de l'ancienne spécification viennent du gel n°10 : embouchure de la rainure 17,074, plafond 21,0392, hauteur 4,3, hauteur de coque 46,0532. Elles sont à revérifier contre `params.json` et les `interfaces.json` gelés à `01b88f2`. Ce commit fait foi.
- Si une cote attendue ne tient pas sur le modèle gelé, ou si une valeur d'un fichier gelé est incohérente avec l'ancienne spécification, ne choisis aucune valeur en silence : `needs-decision` au second maître, en nommant toutes les cotes voisines concernées en une seule question.
- La rainure et ses chanfreins de 0,5 mm, ainsi que l'ouverture micro-USB (`IF-USB-OUVERTURE`), sont les cotes serrées du cas. Elles sont déjà au plan sur la vue de dessous, la coupe B-B et la vue de gauche.
- Vues exigées : gauche, dessous et coupe B-B. Une vue ou une cote ajoutée est une décision du second maître.
- Le cartouche garde les champs de l'ancienne spécification (numéro de plan `INCLINO-COQUE`, indice `A`, date de la passe), sauf demande contraire du second maître.
