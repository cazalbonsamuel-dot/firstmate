Je rends la section « Firstmate spec », construite à partir de `method/worker.md`, du §13 et du guide TechDraw. Je n'ai pas pu vérifier le contenu du commit `01b88f2`, car aucune commande git n'est disponible ici.

## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`. Applique `method/worker.md` (règles communes à toute unité : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus), puis la colonne « Lire » de cette ligne du §13 : §5 « Fabrication » du noyau, lue seule, `method/guides/techdraw.md` et `method/guides/freecad.md`. La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base** : commit `01b88f2` de la branche du cas. Tes entrées gelées, à ne pas modifier, sont les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` (lecture seule, jamais enregistré, digest épinglé).

**Livrable** : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image ; aucun FCStd modifié.

**Fichiers que tu possèdes** : le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/`, soit la spécification `pages.json`, les SVG et PDF des pages, et `techdraw_report.json`. Tu possèdes aussi leurs lignes du manifeste `method/cases/inclinometre-jimny-boitier/manifest.json`, et seulement elles.
Les plans `facade/` et `semelle/`, tous les FCStd et `scripts/` sont hors périmètre.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`, puis `-3`.

**Budget** : 2 itérations et 3 exécutions lourdes, réduits par rapport à `method/iteration_budget.json` (3 et 6). Une unité TechDraw tient en deux exécutions, et la troisième couvre la seule relance après plantage de `method/worker.md` §5.
Le budget de plans est `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`.
Chaque exécution lourde attend l'autorisation du second maître et son délai maximal, fixé à 600 s (`FREECAD_TIMEOUT_S=600`).
Déclare ces compteurs dans ta fiche, au schéma du contrat.

**Commandes de remise** : `method/worker.md` §8 et le contrat (« Commandes du worker »).

**Points propres au cas** :
- La coque est gelée avec la rainure en queue d'aronde du rail plus 0,3 mm par face et les chanfreins de 0,5 mm à 45° sur ses arêtes basses (gel n°10). Les cotes de la rainure (embouchure avec chanfreins, plafond, hauteur) sont les plus serrées de la pièce.
- Toute cote vient de `design/params.json` et `design/interfaces.json`, sans seconde source (§2). Si une valeur attendue de la spécification est un littéral sans pointeur vers ces fichiers (hauteur de coque issue de CALC-ANGLE, cotes de rainure dérivées du rail), vérifie qu'elle s'en déduit. Sinon, ou si elle ne tient pas géométriquement, remonte `needs-decision` en une seule question qui nomme toutes les cotes voisines concernées, sans choisir de valeur en silence.
- Un besoin de modifier `scripts/techdraw_pages.py` ou un autre helper commun est un lot méthode séparé : arrête-toi en `blocked`.
