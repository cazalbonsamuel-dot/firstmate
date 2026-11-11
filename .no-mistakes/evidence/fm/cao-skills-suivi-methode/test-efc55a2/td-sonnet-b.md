## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`. Tu es un worker CAO en mode autonome sur cette seule unité. Ce brief ne couvre ni la façade, ni la semelle, ni l'assemblage.

**Règles communes** : applique `method/worker.md` en entier (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus). Ce brief ne les répète pas et ne les assouplit pas. La méthode et le contrat de preuves font foi.

**Lecture** : `method/worker.md`, puis le noyau du contrat de preuves, puis la colonne « Lire » de ta ligne du §13, sans rien y ajouter :
- méthode §5 « Fabrication », lue seule ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Ensuite lis le cas : son `README.md`, ses entrées gelées, et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`. Pour tes lignes du manifeste, extrais-les avec `jq` plutôt que de lire tout le fichier.

**Base** :
- Commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Ce brief ne donne aucune empreinte. Le worker est lancé avec `--base-branch fm/cao-inclinometre-boitier`.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit.
- Vérifie-les au début comme le prescrit `method/worker.md` §3 : `git diff --exit-code 01b88f2 -- <ces chemins>` doit rendre 0, sinon arrête-toi en `blocked`.
- Le FCStd reste ouvert en lecture seule : tu ne l'enregistres jamais.

**Livrable** (colonne « Livrable accepté » de ta ligne) :
- un SVG et un PDF par page, et `techdraw_report.json` en `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes** :
- tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p*.svg`, `coque-p*.pdf`, `techdraw_report.json` ;
- dans le manifeste du cas, seulement les lignes de ces fichiers, dont la preuve `PLAN-COQUE`, et rien d'autre.

Tu es le seul propriétaire de ce dossier de sorties. Tu ne touches ni `scripts/techdraw_pages.py` ni aucun autre helper, ni les plans de la façade et de la semelle, ni un autre cas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`, puis `-3`, etc.

**Commandes de remise** : `method/worker.md` §8 et le contrat, « Commandes du worker », qui s'appliquent à une unité native avant S5. Le cas a déjà un contrôle natif de la pièce : la commande `DELIVERY-COQUE-NATIF` de son `delivery_checks[]`. Tu ne lances jamais `delivery --execute`.

**Budget** (`method/iteration_budget.json`, réduit pour cette unité) :
- `max_iterations` : 2 ;
- `max_heavy_runs_per_brief` : 4 ;
- `max_techdraw_runs_per_page_set` : 2 (valeur de `method/iteration_budget.json`, inchangée).

Les 4 exécutions lourdes couvrent les 2 passes TechDraw, le contrôle natif de la coque et une relance après plantage. Toute exécution de plus se justifie dans la fiche (`depassement`) après autorisation du second maître.

**Exécutions lourdes** : le second maître autorise ici chacune des exécutions suivantes, une à la fois, en série avec tout autre travail lourd.

| Exécution | Délai maximal |
|---|---|
| Passe TechDraw (`TECHDRAW_SPEC=docs/plans/coque/pages.json TECHDRAW_OUTPUT_DIR=docs/plans/coque scripts/run_freecad_capture.sh --script scripts/techdraw_pages.py`) | 600 s (`FREECAD_TIMEOUT_S=600`) |
| Contrôle natif de la coque | 60 s |

Pour attendre le lanceur, suis `method/worker.md` §5.

**Points propres au cas** :
- Le dossier `docs/plans/coque/` contient déjà un jeu de pages avec sa spécification, qui a été déposé pour une version précédente du modèle. Pars de cette spécification et de son rapport. Rejoue-la sur le FCStd gelé au commit de base, sans présumer qu'elle tient encore.
- Les cotes à valeur attendue écrite en dur dans `pages.json` (`hauteur` 46,0532, `rainure_bas_chanfreins` 17,074, `rainure_plafond` 21,0392, `rainure_hauteur` 4,3) n'ont pas de seconde source dans `params.json`. Relis-les sur le modèle gelé. Une valeur qui ne tient plus, ou une cote qui n'a pas de source dans `params.json` ou `interfaces.json`, donne `needs-decision` au second maître, jamais une valeur choisie en silence.
- Cotes serrées de la coque, à ne pas cacher derrière un plan flatteur :
  - hauteur sur semelle 49,05 pour un maximum de 50 (C5) ;
  - lèvre à 2,0 et paroi gauche du logement de rainure à 2,03 (C8) ;
  - plafond de rainure à 2,07 sous l'épaulement.
- Lis aussi les `open_points` de `outputs/remises/coque-2026-11-10.json` : l'ouverture USB (chevron autoportant) et les bossages octogonaux de 7,2 y sont décrits.
- Le plan est un plan de définition sans tolérances ni états de surface. Les `general_tolerances` du cartouche restent « non définies » tant qu'aucune décision ne les fixe. N'invente pas de tolérance.
- Si une preuve d'un autre propriétaire cite un fichier que tu re-pointes, déclare-la dans `invalidated_proofs` (`method/worker.md` §4).
- Dans la fiche, déclare dans `open_points` toute limite des pages ou des cotes, avec le `budget` au schéma du contrat.
