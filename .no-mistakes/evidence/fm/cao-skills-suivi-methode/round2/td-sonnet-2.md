## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) », §13, pièce `facade` du cas `inclinometre-jimny-boitier`. Applique `method/worker.md`, puis la colonne « Lire » de cette ligne. Ces lectures s'ajoutent à `method/worker.md` §2 :
- §5 « Fabrication » du noyau, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Je n'ajoute aucune autre lecture.

**Base** : commit `7d74a39` de la branche du cas. Les entrées gelées sont les fichiers gelés du cas à ce commit (`method/worker.md` §3). S'y ajoute le FCStd gelé `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, que tu rouvres en lecture seule sans jamais l'enregistrer. Son digest est celui du manifeste du cas. Fais la vérification de `method/worker.md` §3 avant toute exécution. Si elle échoue, arrête-toi en `blocked`.

**Livrable accepté** : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image. Aucun FCStd n'est modifié.

**Fichiers que tu possèdes** :
- `cases/inclinometre-jimny-boitier/docs/plans/facade/` : `pages.json`, les SVG et PDF des pages (`facade-p1.*` et les suivantes s'il y en a), `techdraw_report.json` ;
- les lignes correspondantes de `method/cases/inclinometre-jimny-boitier/manifest.json`, selon la liste fermée des écrivains du contrat.

Tu es le seul propriétaire de ce dossier de sorties. Les plans de `coque` et de `semelle` sont hors périmètre, comme tout autre cas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`. Numérote `-2`, `-3` pour une remise suivante le même jour.

**Budget** : `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` (2). Ces exécutions comptent dans `heavy_runs`, plafonné ici à 2. Chaque exécution lourde attend mon autorisation, avec son délai maximal. Déclare le budget dans ta fiche au schéma du contrat. Une troisième passe se justifie dans `depassement`, avec mon autorisation citée.

**Remise** : commandes selon `method/worker.md` §8 et le contrat (« Commandes du worker »). L'unité a une exécution native, donc elle suit le contrôle natif de la pièce, `delivery_checks[]` du cas.

**Runtime** : hors bac à sable obligatoire (§12).

**Points propres au cas** :
- Des plans existent déjà sous `docs/plans/facade/`. Tu les remplaces seulement si ta passe est conforme, et tu le dis dans ta fiche.
- `facade.FCStd` porte des cotes d'écran provisoires et des cotes serrées (remise `facade-2026-11-10.json`). Une cote qui manque ou qui ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence.
