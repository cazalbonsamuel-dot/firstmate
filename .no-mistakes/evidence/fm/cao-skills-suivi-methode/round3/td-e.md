Je rédige le brief à partir de ce que j'ai lu dans le dépôt. Je n'ai rien modifié ni lancé. Un point reste non vérifié: l'existence du commit `01b88f2`, car je n'ai pas pu exécuter `git`.

## Firstmate spec

**Unité.** Plans normatifs TechDraw, un jeu de pages pour la pièce coque du cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13. Elle est lourde, courte, en GUI par `run_freecad_capture.sh --script`, et en série avec tout autre travail lourd.

**Règles communes.** Applique `method/worker.md` tel qu'il est écrit. Il couvre le rôle, la lecture, les entrées gelées, la propriété et le manifeste, FreeCAD, le commit, le budget, la remise, l'intégration et les refus. Ce brief ne le recopie pas et ne l'assouplit pas. Lis ensuite le noyau du contrat de preuves `method/proof-contract-v2.md` (principes, commandes du worker, remise). Lis enfin la colonne « Lire » de ta ligne du §13:
- §5 « Fabrication » du noyau, lu seul;
- `method/guides/techdraw.md`;
- `method/guides/freecad.md`.

Je n'ajoute aucune autre lecture. Dans le cas, lis son `README.md` et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

**Base.** Pars du commit `01b88f2` de la branche du cas (`fm/cao-inclinometre-boitier`, lancement avec `--base-branch` sur cette branche). Tes entrées gelées sont, à ce commit:
- les fichiers gelés du cas (`design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/`), vérifiés selon `method/worker.md` §3;
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, FCStd gelé à ce commit. Tu ne l'enregistres jamais: l'outil le rouvre en lecture seule.

**Point de départ.** Le dépôt contient déjà `docs/plans/coque/pages.json` et ses sorties. Reprends cette spécification (une page A3, trois vues, huit cotes) comme base.
- Compare le digest de `coque.FCStd` à `01b88f2` avec celui que consigne l'ancien `techdraw_report.json`.
- Si le modèle a changé, recale les valeurs attendues sur `params.json` ou sur la géométrie. Le chemin pointeur de `params.json` reste la source de chaque cote.
- Aucune cote n'est choisie en silence. Une cote qui manque ou ne tient pas géométriquement donne `needs-decision`.

**Livrable.**
- Un SVG et un PDF par page.
- `techdraw_report.json` en statut `verifie`.
- Les pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes.**
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/`: `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste, seulement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT`. Re-pointe aussi la preuve `PLAN-COQUE`, que tu rejoues toi-même.
- Le propriétaire de `coque.FCStd` reste hors de ce brief: tu ne le modifies pas. Déclare dans `invalidated_proofs` toute preuve d'un autre propriétaire qui cite un fichier que tu re-pointes.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Pour une remise suivante le même jour, utilise `-2`, puis `-3`.

**Budget.**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`: 2 exécutions pour ce jeu de pages, comprises dans `heavy_runs`.
- Je réduis `max_iterations` à 2 et `max_heavy_runs_per_brief` à 2, car il n'y a qu'un jeu de pages.
- Une troisième exécution TechDraw, ou une relance après plantage, n'a lieu qu'avec mon autorisation écrite. Tu la justifies alors dans la fiche (`depassement`).
- Déclare les compteurs et leurs plafonds dans la fiche, au schéma du contrat.

**Exécutions lourdes.**
- Chaque exécution TechDraw attend mon autorisation, avec un délai maximal de `FREECAD_TIMEOUT_S=600`.
- Avant d'attendre, déclare l'attente selon `method/worker.md` §5.
- Le runtime doit être hors bac à sable sur ce Mac.

**Commandes de remise.** Celles de `method/worker.md` §8 et du contrat (« Commandes du worker »), selon que l'unité a une exécution native. Le contrôle natif de la pièce est `DELIVERY-COQUE-NATIF` (`cases/inclinometre-jimny-boitier/scripts/check_coque.sh`). Aucun `delivery --execute`: il est réservé au worker S5.

**Points propres au cas.**
- Cotes serrées connues de la coque (`outputs/remises/coque-2026-11-10.json`):
  - hauteur sur semelle 49,05 (marge 0,95 sur C5);
  - paroi minimale 2,0;
  - plafond de rainure 2,07 sous l'épaulement.
  
  Le plan ne prouve ni tolérance ni capacité.
- Les cotes de rainure (`rainure_bas_chanfreins`, `rainure_plafond`, `rainure_hauteur`) viennent du gel n°10. Leurs valeurs attendues sont littérales dans la spécification: `17.074`, `21.0392` et `4.3`. Contrôle-les sur le modèle à `01b88f2`.
- Cotes sans valeur de `params.json`: `hauteur` (`46.0532`, `CALC-ANGLE`) et les trois cotes de rainure ci-dessus. Contrôle-les sur le modèle gelé, sans seconde source.
- Les huit cotes déclarées doivent toutes être portées et conformes pour le statut `verifie`.

**Intégration.** Seulement quand je te le dis: `method/worker.md` §9.
