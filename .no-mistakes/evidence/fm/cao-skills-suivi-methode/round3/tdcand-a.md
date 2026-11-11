Je rends le texte, après lecture du §13, de `method/worker.md`, du budget et de la spécification de pages existante de la coque. Je n'ai rien lancé ni modifié.

```markdown
## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw » (un jeu de pages par pièce), pièce `coque` du cas `inclinometre-jimny-boitier`. Une seule ligne du §13 s'applique, celle de cette unité.

**Règles communes.** Applique `method/worker.md` en entier (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus). La méthode (`method/methode-cao-operationnelle-v1.md`) et le contrat de preuves (`method/proof-contract-v2.md`) font foi. Ce brief ne les assouplit pas.

**Lecture.** Après `method/worker.md` et le noyau du contrat, lis seulement la colonne « Lire » de la ligne « Plans normatifs TechDraw » du §13 :
- la section « Fabrication » du §5 de la méthode, lue seule ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Aucune lecture ajoutée. Pour le cas, lis `cases/inclinometre-jimny-boitier/README.md`, tes entrées gelées, et la synthèse du manifeste plutôt que le manifeste entier.

**Base.** Commit `01b88f2` de la branche du cas. Le worker est lancé avec `--base-branch` sur cette branche (`AGENTS.md` section 7), car les artefacts gelés n'y vivent pas sur la branche par défaut.

**Entrées gelées, à ne pas modifier.**
- Les fichiers gelés du cas à `01b88f2` (`method/worker.md` §3) : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/`.
- Le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à `01b88f2`, rouvert en lecture seule et jamais enregistré. Hash et digest sont relus sur ce commit, sans empreinte recopiée dans ce brief.

**Livrable.** Un jeu de pages pour la coque : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.

**Fichiers que tu possèdes** (un seul propriétaire par dossier de sorties) :
- `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json` ;
- dans `method/cases/inclinometre-jimny-boitier/manifest.json`, seulement les lignes de ces fichiers et la preuve `PLAN-COQUE` que tu rejoues.

Hors périmètre : `scripts/techdraw_pages.py` et les autres helpers, les plans de `facade` et de `semelle`, les autres pièces. Un besoin de modifier un helper se remonte en `blocked`.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`, puis `-3`. Elle suit le schéma fixe du contrat (« Fiche de remise »).

**Commandes de remise.** Celles de `method/worker.md` §8 et du contrat (« Commandes du worker ») pour une unité à exécution native avant S5.

**Budget.**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` : 2 exécutions pour ce jeu de pages.
- `max_iterations` : 3.
- `max_heavy_runs_per_brief` réduit à 2, parce que les exécutions TechDraw comptent dans ce compteur et qu'il n'y a qu'un jeu de pages.

Déclare `budget` dans la fiche avec les deux compteurs et leurs plafonds. Toute exécution au-delà demande une justification écrite et l'autorisation du second maître (`depassement`).

**Exécutions lourdes.**
- Autorisation : chaque exécution `scripts/run_freecad_capture.sh --script` est autorisée une à une par le second maître, par `fm-send`. N'en lance aucune sans cette autorisation.
- Délai maximal : 600 s par exécution (`FREECAD_TIMEOUT_S=600`). Une exécution dure une vingtaine de secondes en général (`method/performance.md`).

**Points propres au cas.**
- `docs/plans/coque/pages.json` existe déjà : une page A3, trois vues (gauche, dessous, coupe B-B) et huit cotes. Pars-en, sans présumer que ses références d'arêtes valent pour le FCStd gelé à `01b88f2` : relis-les contre ce modèle avant la première exécution.
- Toute cote vient de `design/params.json`, sans seconde source. Les cotes de forme propres au modèle (hauteur de coque 46,0532 ; rainure de 17,074 à l'embouchure, 21,0392 au plafond, 4,3 de hauteur) sont déjà dans `pages.json` avec leurs valeurs attendues. Elles viennent du gel n°10 : si une valeur ne tient plus, `needs-decision`.
- Cotes serrées du cas : l'ouverture micro-USB (remontée de 0,73, gel n°10) et la rainure en queue d'aronde (rail plus 0,3 par face, chanfreins de 0,5 à 45°). Ce sont les plus petites cotes de la page.
- Repère du modèle : x de 0 à 87, y de l'avant (0) à l'arrière (48), z = 0 dessous posé sur la semelle. Vue de gauche : y vers la gauche de la page.
- Cartouche existant : `INCLINO-COQUE`, révision A, matériau « PC (repli ASA) », tolérances générales « non définies ». Ne change aucune de ces mentions sans décision du second maître.
```
