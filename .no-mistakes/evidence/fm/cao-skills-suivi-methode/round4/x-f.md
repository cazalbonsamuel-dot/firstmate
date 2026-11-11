## Firstmate spec

**Unité** : « Plans normatifs TechDraw », jeu de pages de la pièce **coque** du cas `inclinometre-jimny-boitier` (§13, ligne « Plans normatifs TechDraw (un jeu de pages par pièce) »). Unité native, lourde, ship : elle écrit dans le projet.

**Règles communes** : applique `method/worker.md` tel quel, sans l'assouplir. Il fixe le rôle, la lecture, les entrées gelées, la propriété et les écrivains du manifeste, FreeCAD, le commit, le budget, la fiche de remise, l'intégration et les refus. Le brief ne les répète pas.

**Lire**, après `method/worker.md` et le noyau du contrat de preuves, seulement :
- noyau `method/methode-cao-operationnelle-v1.md` : §5 « Fabrication », lue seule ;
- §15 « Captures FreeCAD » ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Aucune lecture ajoutée.

**Base** : branche du cas `fm/cao-inclinometre-boitier`, commit `01b88f2`. Lance ce worker avec `--base-branch fm/cao-inclinometre-boitier`.

**Entrées gelées**, à ce commit :
- les fichiers gelés du cas, selon `method/worker.md` §3 ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, ouvert en lecture seule et jamais enregistré. Son digest est celui du manifeste à ce commit.

Vérifie ces entrées au début, selon `method/worker.md` §3. Si une entrée est incomplète, ou si une cote manque ou ne tient pas, ne choisis aucune valeur : `needs-decision`.

**Livrable accepté** : un jeu de pages de la coque, comme la ligne du §13 le définit.
- SVG et PDF par page ;
- `techdraw_report.json` en `verifie` ;
- pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes** (propriétaire unique, rien d'autre) :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, SVG, PDF, `techdraw_report.json`, et tout autre fichier de sortie du jeu de pages ;
- les lignes du manifeste de ces fichiers et de la preuve de plans de la coque, que tu as rejouée.

Le cas fournit une base de plans de la coque dans ce dossier. Reprends-la si elle est à ce commit, sinon crée-la. Chaque fichier que tu modifies est re-pointé dans le manifeste selon `method/worker.md` §4.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Si une remise de cette unité existe déjà le même jour, numérote `-2`, `-3`.

**Budget**, de `method/iteration_budget.json`, réduit :
- `max_techdraw_runs_per_page_set` : 2, la valeur du fichier ;
- `max_iterations` : 3, la valeur du fichier ;
- `max_heavy_runs_per_brief` : 3 au lieu de 6, soit les 2 exécutions TechDraw et une relance après plantage.

Tout dépassement exige une autorisation écrite du second maître, déclarée dans `depassement`.

**Exécutions lourdes** : le second maître autorise au plus 2 exécutions TechDraw, une passe puis une reprise, et la relance après plantage comprise dans le plafond de 3. Délai maximal de chaque exécution : 600 s (`FREECAD_TIMEOUT_S=600`). L'unité dure une vingtaine de secondes par passe.

**Runtime** : hors bac à sable sur ce Mac (§12), car l'unité ouvre la GUI de FreeCAD. Ne la lance pas dans un profil dont le bac à sable bloque Qt.

**Commandes de remise** : `method/worker.md` §8 et le contrat, « Commandes du worker ». Unité native avant S4 : le contrôle natif de la coque est `DELIVERY-COQUE-NATIF`, via `cases/inclinometre-jimny-boitier/scripts/check_coque.sh`.

**Points propres au cas** : aucun au-delà de ce qui précède. Une cote qui manque pour les pages se remonte en une seule question, qui nomme aussi les cotes voisines incomplètes.

**Hors périmètre** :
- les plans des autres pièces, `facade` et `semelle` ;
- l'assemblage ;
- les helpers de `scripts/` ;
- tout autre cas.

Un besoin de modifier un helper est un lot méthode séparé : arrête-toi en `blocked`.
