## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (un jeu de pages, pièce **coque**), ligne « Plans normatifs TechDraw » du tableau de la section « Travail parallèle sous un superviseur » du §13. Applique `method/worker.md` (règles communes à toute unité), puis seulement la colonne « Lire » de cette ligne :
- noyau, §5 « Fabrication » ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Section appliquée en plus : §15. La méthode et le contrat de preuves font foi. Toute question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base.** Le commit `01b88f2` de la branche `fm/cao-inclinometre-boitier`, cas `inclinometre-jimny-boitier`. Pars de ce commit.

**Entrées gelées, à ne pas modifier.**
- Les fichiers gelés du cas à ce commit (`method/worker.md` §3). Vérifie-les au début avec `git diff --exit-code 01b88f2 -- <chemins>`.
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit. Tu le rouvres en lecture seule, sans jamais l'enregistrer.

**Livrable** (colonne « Livrable accepté »).
- Un SVG et un PDF par page, plus `techdraw_report.json` en `verifie`.
- Les pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes** (propriétaire unique).
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, les SVG et PDF des pages, `techdraw_report.json`.
- Les lignes du manifeste de ces fichiers, et elles seules.
- Aucune autre pièce et aucun autre dossier de plans (`facade/`, `semelle/`), aucun helper de `scripts/`.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Si une remise suit le même jour, numérote-la `-2`, `-3`.

**Budget.**
- `max_iterations` : 3, valeur de `method/iteration_budget.json` inchangée.
- `max_heavy_runs_per_brief` : 2, réduit des 6 par défaut. Une exécution TechDraw est une exécution lourde et l'unité n'en a pas d'autre.
- `max_techdraw_runs_per_page_set` : 2, valeur de `method/iteration_budget.json`.
- Un dépassement se justifie dans la fiche (`depassement`) et exige l'autorisation préalable du second maître.

**Exécutions lourdes.** Chaque exécution TechDraw se lance seulement quand le second maître l'autorise, avec un délai maximal de **600 s** (`FREECAD_TIMEOUT_S=600`).

**Remise.** Commandes et fiche selon `method/worker.md` §8 et le contrat (« Commandes du worker », « Fiche de remise »).

**Points propres au cas.**
- `docs/plans/coque/` contient déjà un jeu de pages, avec sa spécification `pages.json` (une page A3, vues de gauche, de dessous et coupe B-B). Il sert de point de départ. Il n'est pas gelé : refais la passe sur le FCStd gelé à `01b88f2`.
- Garde la spécification dans le dossier de sortie. Les `input_hashes` et `source_artifacts` du rapport portent sur le FCStd et sur `params.json` à ce commit.
- Les cotes viennent de `params.json` et du modèle, sans seconde source. Une cote qui manque ou qui ne tient pas donne `needs-decision`, jamais une valeur choisie en silence.
- Cotes serrées connues, à ne pas masquer sur les plans :
  - hauteur de coque 46,05 (49,05 sur semelle, marge 0,95 sur C5) ;
  - plafond de rainure 21,04 ;
  - hauteur de rainure 4,3.
- Si une preuve d'un autre propriétaire cite un fichier que tu re-pointes, déclare-la dans `invalidated_proofs` de ta fiche (`method/worker.md` §4).
