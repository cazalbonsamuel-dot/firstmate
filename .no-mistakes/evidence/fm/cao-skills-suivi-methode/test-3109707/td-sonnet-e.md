## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw**, jeu de pages de la pièce **coque**, cas `inclinometre-jimny-boitier` (ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13 de `method/methode-cao-operationnelle-v1.md`).
Applique `method/worker.md` (règles communes à toute unité : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration), puis la colonne « Lire » de cette ligne : §5 « Fabrication » du noyau, lue seule, `method/guides/techdraw.md` et `method/guides/freecad.md`.
Aucune autre lecture n'est ajoutée.
La méthode et le contrat de preuves font foi.
Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.
Cette unité est un ship : elle écrit dans le projet, et son exécution native est lourde.

**Base.**
- Commit `01b88f2` de la branche du cas.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), soit `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md` et `design/recherche/`.
- Plus `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit, gelé et lu en lecture seule.
- Aucune preuve `DEC-...` n'est consommée par cette unité.
- Les entrées étant sur la branche du cas et non sur la branche par défaut, ta branche d'unité part de la branche du cas.

**Livrable.**
- Le livrable de la ligne du §13 : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.
- Le jeu de pages est celui de la pièce coque, sous `docs/plans/coque/`.
- Il se déclare dans le manifeste par les lignes qu'il possède : `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT` et la preuve `PLAN-COQUE`.

**Fichiers que tu possèdes.**
- Tout `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Tu es le seul propriétaire de ce dossier de sorties.
- Tu ne touches ni `docs/plans/facade/` ni `docs/plans/semelle/`, ni aucun FCStd, ni `scripts/`.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json` (`-2`, `-3` pour une remise suivante le même jour).

**Budget.**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` : 2, sans augmentation.
- `max_iterations` : 2, réduit du défaut de 3.
- `max_heavy_runs_per_brief` : 2, réduit du défaut de 6.
- Chaque exécution TechDraw est autorisée une à une par le second maître, avec un délai maximal de 600 s (`FREECAD_TIMEOUT_S=600`).
- Une exécution non autorisée ne se lance pas.
- Déclare les compteurs et leurs plafonds dans la fiche, au schéma fixe du contrat.

**Remise.**
- Commandes de remise : `method/worker.md` §8 et le contrat (« Commandes du worker »).
- Exécution native avant S5 : le contrôle natif du cas pour la pièce est `DELIVERY-COQUE-NATIF`.
- `delivery --execute` est réservé au worker S5.

**Points propres au cas.**
- Le FCStd gelé de la coque intègre le gel complémentaire n°10 : rainure à queue d'aronde, rail plus 0,3 par face, chanfreins de 0,5 à 45° sur ses arêtes basses.
- Le plan existant `docs/plans/coque/pages.json` est ton point de départ, mais ses points de référence ne sont pas supposés valides sur ce commit.
  - Tu ne repars pas de son rapport ni de ses sorties comme d'une preuve.
  - Les cotes dont la valeur attendue est un nombre en dur (hauteur 46,0532 ; embouchure de rainure 17,074 ; plafond 21,0392 ; hauteur de rainure 4,3) sont à relire sur le modèle et contre `params.json` et `interfaces.json`.
  - Une valeur attendue qui ne s'y retrouve pas donne `needs-decision`, jamais une valeur choisie en silence.
- Cotes serrées connues, à ne pas faire passer pour libres :
  - hauteur sur semelle 49,05 pour un maximum de 50 (C5) ;
  - parois de 2,0 mm (minimum de C8) ;
  - plafond de rainure sous l'épaulement 2,07.
- Le plan ne porte aucune tolérance, et le cartouche déclare « non définies ». Ne les invente pas.
- Aucune vue de capture n'est exigée : cette unité n'est pas une capture.
- Un FCStd, un STEP ou un STL régénérés à digest géométrique égal ne se recommittent pas (`method/worker.md` §6).
