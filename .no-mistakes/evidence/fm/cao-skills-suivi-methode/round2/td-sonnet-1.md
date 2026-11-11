## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pièce `facade`, cas `inclinometre-jimny-boitier`. Les règles communes sont dans `method/worker.md`, que tu appliques sans exception. Lis ensuite la colonne « Lire » de cette ligne et rien de plus :
- §5 « Fabrication » du noyau `method/methode-cao-operationnelle-v1.md`, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Je n'ajoute aucune lecture.

**Base** : le commit `7d74a39` de la branche du cas. Le worker se lance avec `--base-branch` sur cette branche.

**Entrées gelées, à ne pas modifier** :
- les fichiers gelés du cas à `7d74a39` (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/` ;
- `cases/inclinometre-jimny-boitier/cad/facade.FCStd` à `7d74a39`, rouvert en lecture seule et jamais enregistré. Son digest vient du manifeste du cas ;
- la spécification de pages `cases/inclinometre-jimny-boitier/docs/plans/facade/pages.json`, qui doit passer `python3 scripts/techdraw_pages.py --check` avant toute exécution.

Une entrée qui ne tient pas, ou une cote qui manque ou ne tient pas géométriquement : arrête-toi en `needs-decision` ou `blocked`, sans choisir de valeur.

**Livrable** : un SVG et un PDF par page, et `techdraw_report.json` en `verifie`. Les pages sont relues en image. Aucun FCStd n'est modifié.

**Fichiers que tu possèdes** :
- tout `cases/inclinometre-jimny-boitier/docs/plans/facade/` : `pages.json`, SVG, PDF et `techdraw_report.json`. Tu es seul propriétaire de ce dossier de sorties ;
- leurs lignes du manifeste, au sens de `method/worker.md` §4.

Tu ne touches ni `scripts/techdraw_pages.py`, ni aucun autre helper, ni une autre pièce.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-facade-2026-11-11-2.json`, puis `-3`. Les commandes de remise sont celles de `method/worker.md` §8 et du contrat (« Commandes du worker »).

**Budget** :
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` ;
- 3 itérations ;
- 2 exécutions lourdes au lieu de 6. Les passes TechDraw y comptent, et l'unité n'en demande pas davantage.

**Exécutions lourdes** : chacune attend l'autorisation du second maître, qui donne son délai maximal. Tu ne lances rien avant.

**Points propres au cas** :
- Le dossier contient déjà un jeu de pages de la façade à `7d74a39` (`facade-p1`, A4 paysage, échelle 1,5), avec son rapport. Ta reprise part de cette spécification. Ne change pas son contenu hors de ce que la passe exige.
- Le repère de la façade est celui de la note de `pages.json` : plaque dans XY, face avant à z = 0, arrière à z = -2,5, cadre 87 x 42, origine au coin bas gauche.
- Cotes serrées à porter lisibles : fenêtre 37,04 x 30,03, plaque 2,5, bouton Ø 18, trous des inserts. Elles viennent de `params.json`, sans seconde source.
- Le séparateur décimal des cotes suit la langue du système. Note dans la fiche celui que le rapport donne.
- Aucune vue de capture n'est exigée.
