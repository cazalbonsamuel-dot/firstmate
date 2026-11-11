## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce `facade` du cas `inclinometre-jimny-boitier`. C'est un ship, car l'unité écrit dans le projet.

**À lire** : `method/worker.md`, puis le noyau du contrat de preuves (principes, commandes, remise d'un worker). Ensuite la colonne « Lire » de la ligne du §13, soit le §5 « Fabrication » du noyau, lu seul, `method/guides/techdraw.md` et `method/guides/freecad.md`. Ensuite le cas : son `README.md`, ses entrées gelées et `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`. Aucune lecture supplémentaire n'est requise.

**Base** : le commit `7d74a39` de la branche du cas. Lance le worker avec `--base-branch` sur la branche du cas, parce que les artefacts gelés y vivent et pas sur la branche par défaut.

**Entrées gelées**, à ce commit :
- les fichiers gelés du cas : `design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md`, `design/recherche/` ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, rouvert en lecture seule et jamais enregistré ;
- la spécification de pages `cases/inclinometre-jimny-boitier/docs/plans/facade/pages.json`, qui doit passer `python3 scripts/techdraw_pages.py --check` avant toute exécution lourde.

Vérifie ces entrées selon `method/worker.md` §3.

**Livrable accepté** : le jeu de pages `facade-p1` en SVG et PDF, et son `techdraw_report.json` en `verifie`. Les pages sont relues en image. Aucun FCStd n'est modifié.

**Fichiers que tu possèdes** (propriétaire unique) :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/` : `pages.json`, `facade-p1.svg`, `facade-p1.pdf`, `techdraw_report.json` ;
- leurs lignes `FILE-PLAN-FACADE-*` du manifeste du cas ;
- la preuve `PLAN-FACADE`, que tu rejoues toi-même.

Tout le reste est hors périmètre : les autres pièces, `scripts/` à la racine, les FCStd et STEP, les autres plans, les autres cas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`. Si une remise suit le même jour, elle est numérotée `-2`, `-3`.

**Budget** : celui de `method/iteration_budget.json`, soit `max_iterations` 3, `max_heavy_runs_per_brief` 6 et `max_techdraw_runs_per_page_set` 2.
- Le budget de plans compte dans `heavy_runs` : tu n'en consommeras donc pas plus de 2 pour ce jeu de pages.
- Une troisième exécution n'est possible que justifiée dans la fiche (`depassement`), avec l'autorisation du second maître.
- Déclare `budget` au schéma fixe du contrat.

**Exécution lourde** : l'exécution TechDraw (GUI, `scripts/run_freecad_capture.sh --script`) est autorisée par le second maître, avec un délai maximal de 600 s (`FREECAD_TIMEOUT_S=600`). Toute exécution supplémentaire demande une nouvelle autorisation. Respecte `method/worker.md` §5 pour l'attente.

**Commandes de remise** : `method/worker.md` §8 et le contrat, « Commandes du worker ». Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_facade.sh` (NAT-PIECE-FACADE). Consigne son code et sa durée dans la fiche.

**Points propres au cas** :
- Le FCStd gelé est inchangé : la preuve NAT-PIECE-FACADE et les autres preuves n'ont donc rien à re-pointer, et `invalidated_proofs` reste vide. Si ce n'est pas vrai, remonte au second maître au lieu de corriger.
- La première passe n'a pas de `techdraw_report.json` à côté de la spécification de la façade. Garde `pages.json` dans le dossier de sortie, pour que le contrôle de mise en page des passes suivantes dispose du rapport.
- Cotes serrées connues : `epaisseur_plaque` (2,5 mm, coupe A-A), `passage_vis` et les cotes de fenêtre. Pour les petites cotes, suis le guide TechDraw sur le placement du texte.
- Origine de la coupe A-A : elle doit rester centrée sur la boîte englobante le long du trait (`--check` donne l'origine centrée). Ne la change pas pour autre chose que cela.
- Une cote ou une valeur qui manque ou ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence. Ne modifie ni `params.json` ni les valeurs attendues pour faire passer une cote.

**Hors périmètre** : plans des autres pièces, dossier Markdown, captures, régénération ou modification du modèle, changement du modèle de page ISO ou d'un helper commun. Un besoin de modifier un helper est un lot méthode séparé : arrête-toi en `blocked`.

**Intégration** : seulement quand le second maître te le dit, selon `method/worker.md` §9.
