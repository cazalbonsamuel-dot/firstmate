Je finalise le brief : j'ai lu le §13, `method/worker.md`, le guide TechDraw, le budget et les plans existants de la coque, et il me reste à rédiger la section.

## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **« Plans normatifs TechDraw (un jeu de pages par pièce) »** du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`. Applique [`method/worker.md`](method/worker.md) (règles communes à toute unité), puis la colonne « Lire » de cette ligne, sans autre lecture :
- noyau `method/methode-cao-operationnelle-v1.md` : §5 « Fabrication », lu seul ;
- guides : [`method/guides/techdraw.md`](method/guides/techdraw.md) et [`method/guides/freecad.md`](method/guides/freecad.md).

La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base.** Le commit `01b88f2`, sur la branche du cas `fm/cao-inclinometre-boitier` (lance le worker avec `--base-branch fm/cao-inclinometre-boitier`).

**Entrées gelées, à ne pas modifier :**
- les fichiers gelés du cas à ce commit (`method/worker.md` §3) ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit, rouvert en lecture seule et jamais enregistré. Son digest est celui de la ligne `FILE-COQUE-FCSTD` du manifeste à ce commit.

**Livrable** (colonne « Livrable accepté ») : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image ; aucun FCStd modifié.

**Fichiers que tu possèdes** : le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` et lui seul : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`. Le dossier existe déjà sur la base, et son contenu vient d'un passage antérieur : reprends-le comme point de départ, sans le présumer à jour du FCStd gelé. Tu y re-pointes seulement les lignes du manifeste de ces fichiers et de la preuve qui consomme le rapport. Tu ne touches ni aux plans de la façade et de la semelle, ni à `scripts/techdraw_pages.py`.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json` (`-2`, `-3` pour une remise suivante le même jour).

**Budget** (`method/iteration_budget.json`, réduit : un seul jeu de pages) :
- `max_techdraw_runs_per_page_set` : 2 ;
- `max_iterations` : 2 ;
- `max_heavy_runs_per_brief` : 2.

Les exécutions TechDraw comptent dans `heavy_runs`. Une troisième exécution n'est permise que si le second maître l'autorise ; elle se justifie alors dans `depassement` de ta fiche.

**Exécutions lourdes.** Chaque exécution TechDraw n'a lieu qu'avec l'autorisation explicite du second maître, délai maximal **600 s** (`FREECAD_TIMEOUT_S=600`). Ce que tu fais de ce délai est dans `method/worker.md` §5.

**Commandes de remise** : `method/worker.md` §8 et le contrat (« Commandes du worker »).

**Points propres au cas :**
- Le plan existant porte une seule page (`coque-p1`, A3 paysage) : une vue de gauche, une vue de dessous et la coupe B-B.
- Ses cotes citent `params.json` par pointeur et le gel n°10 (rainure et chanfreins). Après un éventuel nouveau gel, vérifie que ces références restent exactes à `01b88f2`.
- Cotes serrées connues, à ne pas laisser dériver d'un passage à l'autre : hauteur de coque 46,05 (49,05 sur semelle, marge 0,95 sur C5), largeur 87, profondeur 48, ouverture USB, et la rainure avec ses chanfreins de 0,5.
