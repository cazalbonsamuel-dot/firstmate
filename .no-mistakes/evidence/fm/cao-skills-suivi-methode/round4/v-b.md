## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw, un jeu de pages pour la pièce coque** du cas `inclinometre-jimny-boitier` (ligne « Plans normatifs TechDraw » de la table du §13). Applique `method/worker.md` (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus). La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher. Une cote qui manque ou qui ne tient pas géométriquement suit la même règle.

**Lecture.** Après `method/worker.md`, lis seulement la colonne « Lire » de ta ligne du §13 :
- §5 « Fabrication » du noyau, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Lis aussi le noyau du contrat de preuves, comme `method/worker.md` §2 le demande à toute unité. Ajoute le `README.md` du cas et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`. Pour tes lignes du manifeste, extrais-les au lieu de tout lire. Je n'ajoute aucune lecture.

**Base et entrées gelées.**
- Base : le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Lance-toi avec `--base-branch fm/cao-inclinometre-boitier`.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`.
- Le FCStd est rouvert en lecture seule et n'est jamais enregistré. Son digest est celui du contrôleur à ce commit, sans empreinte recopiée ici.
- Toute cote vient de `design/params.json` et `design/interfaces.json`.
- Vérifie le gel au début, comme le prévoit `method/worker.md` §3. Un écart donne `blocked`.

**Livrable.** Le jeu de pages de la coque est conforme à la colonne « Livrable accepté » :
- un SVG et un PDF par page ;
- `techdraw_report.json` en `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

La spécification de pages doit passer `--check` avant toute exécution.

**Fichiers que tu possèdes.** Tout `cases/inclinometre-jimny-boitier/docs/plans/coque/` (`pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`, et toute autre page de ce jeu).
- Aucun autre fichier du cas n'est modifié, et aucun autre cas non plus.
- Dans le manifeste, seulement les lignes de ces fichiers et la preuve `PLAN-COQUE` que tu rejoues.
- Aucun helper de `scripts/` n'est modifié : s'il te manque quelque chose, `blocked`.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour.

**Budget.** Il est réduit par rapport à `method/iteration_budget.json`, parce que l'unité ne comporte qu'une passe puis une reprise :
- `max_iterations` : 2 ;
- `max_heavy_runs_per_brief` : 2, qui comprend les passes TechDraw ;
- `max_techdraw_runs_per_page_set` : celui de `method/iteration_budget.json`.

Déclare les compteurs et leurs plafonds dans la fiche. Un dépassement n'est possible qu'avec l'autorisation écrite du second maître.

**Exécutions lourdes.** Chaque passe TechDraw est une exécution lourde. Elle n'a lieu que sur autorisation du second maître, que tu demandes avant de la lancer. Délai maximal par passe : 120 s. Tu déclares `paused … until <début + délai>` avant d'attendre. Le reste de l'attente est dans `method/worker.md` §5.

**Commandes de remise.** Voir `method/worker.md` §8 et le contrat (« Commandes du worker »). Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_coque.sh` (`DELIVERY-COQUE-NATIF`). `delivery --execute` est réservé au worker S5.

**Runtime.** Hors bac à sable sur ce Mac (§12).

**Points propres au cas.**
- Repère de la coque : x de 0 (gauche vu par le conducteur) à 87, y de l'avant (0) à l'arrière (48), z = 0 sur le dessous posé sur la semelle.
- Cotes serrées connues, à ne pas contredire ni arrondir :
  - hauteur de coque 46,05, soit 49,05 sur semelle (marge 0,95 sur C5) ;
  - parois au minimum de C8 : 2,0 pour la lèvre, 2,03 pour la paroi gauche du logement de rainure, 1,6 autour des inserts ;
  - plafond de rainure à 2,07 sous l'épaulement.
- Cotes d'interface attendues sur les plans :
  - ouverture micro-USB (`IF-USB-OUVERTURE`) ;
  - largeur hors tout 87 et profondeur 48 ;
  - rainure à queue d'aronde : rail plus 0,3 par face et chanfreins de 0,5 à 45° sur les arêtes basses (gel n°10).
  
  Chacune est portée sur le plan et conforme à `params.json`.
- La coque porte des tolérances générales non définies. Le plan ne prouve donc ni tolérances ni fabrication, et le cartouche le dit.
