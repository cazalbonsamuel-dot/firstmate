## Firstmate spec

**Unité.** Plans normatifs TechDraw, un jeu de pages pour la pièce coque du cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13 de `method/methode-cao-operationnelle-v1.md`.

Tu es worker CAO en mode autonome sur cette seule unité. Applique `method/worker.md` tel qu'il est écrit : rôle, lecture, entrées gelées, propriété et manifeste, exécutions FreeCAD, commit, budget, remise, intégration, refus. Le brief n'en change aucune règle. La méthode et le contrat de preuves font foi.

**Lecture** (colonne « Lire » de la ligne, après `method/worker.md`, plus ce que `worker.md` §2 impose à toute unité) :
- §5 « Fabrication » du noyau, lue seule ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md` ;
- le noyau du contrat de preuves `method/proof-contract-v2.md` (principes, commandes, remise d'un worker) ;
- puis `cases/inclinometre-jimny-boitier/README.md`, les entrées gelées et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

Aucune lecture ajoutée.

**Base.** Le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`.
- Lance et travaille sur une branche issue de cette branche du cas (`--base-branch fm/cao-inclinometre-boitier`), pas de la branche par défaut, car les artefacts gelés n'y vivent pas.
- Entrées gelées, à ne pas modifier : à ce commit, `cases/inclinometre-jimny-boitier/design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md` et `design/recherche/`.
- FCStd gelé de la pièce, lu en lecture seule et jamais enregistré : `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, tel qu'il est à `01b88f2`.
- Vérifie ces entrées au début avec `git diff --exit-code 01b88f2 -- <chemins>`. Un écart donne `blocked`.
- Si le gel change en cours d'unité, tu reçois un nouveau commit par `fm-send`. Repars alors de lui selon `worker.md` §3.

**Livrable** (colonne « Livrable accepté »). SVG et PDF de chaque page, `techdraw_report.json` en `verifie`, pages relues en image. Aucun FCStd n'est modifié.

**Fichiers que tu possèdes** (un seul propriétaire, toi) :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`, et toute page ajoutée dans ce dossier ;
- dans le manifeste du cas, uniquement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT` et la preuve `PLAN-COQUE`, que tu as toi-même rejouée.

Tout le reste est hors périmètre : FCStd, STEP, STL, scripts du cas, autres pièces, `scripts/` communs, `method/` hors manifeste du cas. Un besoin de modifier un helper ou le lanceur est un lot méthode séparé : `blocked`.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, au format du contrat (« Fiche de remise »). Pour une remise suivante le même jour : `plans-coque-2026-11-11-2.json`, puis `-3`.

**Budget.** 2 itérations et 2 exécutions lourdes par rapport au défaut de `method/iteration_budget.json` (3 et 6), réduits car l'unité est un seul jeu de pages. Le budget `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` s'applique au jeu de pages. Déclare le tout dans `budget` de ta fiche au schéma fixe du contrat. Un dépassement n'a lieu que sur autorisation écrite du second maître, qui s'y cite.

**Exécutions lourdes.**
- Runtime hors bac à sable sur ce Mac (§12).
- Chaque exécution attend l'autorisation du second maître. Le délai maximal est de 120 s par exécution, le travail étant d'une vingtaine de secondes.
- Demande l'autorisation avant chacune, puis déclare ton attente selon `worker.md` §5.
- Un seul travail lourd à la fois, sous le bail `freecad` des lanceurs.

**Commandes de remise.** Celles de `worker.md` §8 et du contrat (« Commandes du worker »), pour une unité avec exécution native avant S5. Le contrôle natif de la pièce est `DELIVERY-COQUE-NATIF` (`cases/inclinometre-jimny-boitier/scripts/check_coque.sh`). `delivery --execute` est réservé au worker S5.

**Points propres au cas.**
- Le dossier contient déjà un jeu de pages pour la coque, produit sur un gel antérieur : une seule page `coque-p1` (vues de gauche et de dessous, coupe B-B). Le FCStd gelé à `01b88f2` fait foi, pas ce plan. Remets le jeu de pages en conformité avec lui et avec `params.json`.
- Toute cote vient de `params.json` et de `interfaces.json`, sans seconde source. Une cote qui manque, ou qui diffère de ce que le modèle donne, est `needs-decision` : jamais une valeur choisie en silence, jamais un FCStd modifié pour s'y conformer.
- Cotes serrées connues de la coque (`outputs/remises/coque-2026-11-10.json`) :
  - hauteur sur semelle 49,05 pour un critère C5 de 50 au plus (marge 0,95) ;
  - paroi de lèvre et de logement de rainure 2,0, égale au minimum de C8 ;
  - paroi des bossages autour des inserts 1,6, égale au minimum de C8.
- Les plans documentent ces cotes sans les arrondir au-delà du format du plan. Un écart entre le modèle et `params.json` sur l'une d'elles est à remonter.
- Cartouche : reprends celui de la page existante (`INCLINO-COQUE`, indice de révision à incrémenter si le gel a changé la géométrie). Toute autre valeur de cartouche passe par `needs-decision`.
- Une preuve d'un autre propriétaire qui cite l'un de tes fichiers re-pointés se déclare dans `invalidated_proofs` (`worker.md` §4).

**Refus et remontées.** Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître. Ne la tranche pas, ne passe jamais par le capitaine.
