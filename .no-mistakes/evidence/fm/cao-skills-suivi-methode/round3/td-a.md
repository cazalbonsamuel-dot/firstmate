## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw » (un jeu de pages par pièce, §13), pour la pièce **coque** du cas `inclinometre-jimny-boitier`.

**Règles.**
- Applique `method/worker.md` en entier. Il fixe le rôle, la lecture, les entrées gelées, la propriété et les écrivains du manifeste, les exécutions FreeCAD, les règles de commit, le budget, la remise, l'intégration et les refus. Ce brief ne les recopie ni ne les assouplit.
- La méthode et le contrat de preuves font foi.
- Lis ensuite la colonne « Lire » de ta ligne du §13 : §5 « Fabrication », `method/guides/techdraw.md` et `method/guides/freecad.md`. N'ajoute aucune autre lecture sans en écrire la raison dans ta fiche.
- Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base.**
- Commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Travaille sur une branche issue de ce commit.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`.
- Tu rouvres ce FCStd en lecture seule et ne l'enregistres jamais.
- Si `git diff --exit-code 01b88f2 -- <entrées gelées>` ne rend pas 0, arrête-toi en `blocked`.

**Livrable** (colonne « Livrable accepté » de la ligne).
- SVG et PDF par page.
- `techdraw_report.json` en `verifie`.
- Pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes.**
- Tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/`, et lui seul : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Tu es l'unique propriétaire de ce dossier.
- Les plans de `facade/` et `semelle/` ne sont pas à toi.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour.

**Budget.**
- `max_iterations` : 3 (défaut de `method/iteration_budget.json`).
- `max_heavy_runs_per_brief` : 2, réduit du défaut (6), car l'unité est une seule exécution GUI courte.
- `max_techdraw_runs_per_page_set` : celui de `method/iteration_budget.json`.
- Chaque exécution lourde attend mon autorisation. Son délai maximal est de 300 s, que je confirme à chaque autorisation.
- Avant d'attendre, déclare `paused … until <début + délai>` (`method/worker.md` §5).
- Déclare le budget dans ta fiche au schéma fixe du contrat.

**Remise.**
- Commandes selon `method/worker.md` §8 et le contrat (« Commandes du worker »). Code et durée de chacune dans ta fiche.
- Fiche au format du contrat (« Fiche de remise »).
- Avant de signaler la remise, lance `python3 method/check_method.py reception` sur ta branche.
- N'intègre qu'à mon ordre (`method/worker.md` §9).

**Points propres au cas.**
- Un jeu de plans de la coque existe déjà sous `docs/plans/coque/` : une page A3 paysage, trois vues (gauche, dessous, coupe B-B) et huit cotes. Pars de lui. Les cotes `expected` qui pointent `design/params.json` en viennent sans seconde source. Ne règle aucun écart en changeant une valeur attendue sans remonter.
- Cotes fines à garder lisibles : jeu de rainure de 0,3, chanfreins de 0,5 à 45° et hauteur de rainure de 4,3. La coupe B-B est au 3:2.
- Le manifeste porte une preuve `techdraw_report.json` de la coque. Tu es l'écrivain de ses lignes et de celles de tes fichiers ; déclare dans ta fiche les preuves d'autres propriétaires que ton re-pointage invalide.
- Runtime hors bac à sable sur ce Mac (§12). Seul le lanceur du projet est admis (`method/worker.md` §5). Tu ne modifies aucun helper de `scripts/`, en particulier `scripts/techdraw_pages.py` : un besoin à ce sujet est un lot méthode séparé, donc `blocked`.

**Lancement** (réservé au second maître). `--base-branch fm/cao-inclinometre-boitier`, car les artefacts gelés vivent sur la branche du cas et pas sur la branche par défaut.
