## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`.
Applique `method/worker.md`, puis la colonne « Lire » de cette ligne :
- §5 « Fabrication » et §15 du noyau, lus seuls ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Le noyau du contrat de preuves est lu comme `method/worker.md` §2 le prévoit.
Aucune lecture n'est ajoutée.

**Base** : commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`.
- Lance-toi avec `--base-branch` sur cette branche : les artefacts gelés n'y sont pas sur la branche par défaut.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit.
- Le FCStd est rouvert en lecture seule et jamais enregistré.

**Livrable** (colonne « Livrable accepté »), pour la seule coque :
- le SVG et le PDF de chaque page ;
- `techdraw_report.json` en `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes** :
- tout `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json` ;
- leurs lignes du manifeste `method/cases/inclinometre-jimny-boitier/manifest.json`, et seulement elles.

Les plans de la façade et de la semelle ne sont pas à toi.
La spécification `pages.json` présente à la base est ton point de départ.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.
Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`.

**Budget** (réduit par rapport à `method/iteration_budget.json`, l'unité le permet) :
- `max_iterations` 2 ;
- `max_heavy_runs_per_brief` 3 : les deux exécutions TechDraw et le contrôle natif du cas ;
- `max_techdraw_runs_per_page_set` 2, valeur du fichier, inchangée.

Une troisième exécution de plans se justifie par `depassement` dans la fiche, avec l'autorisation du second maître.

**Exécutions lourdes** :
- Chaque exécution TechDraw (`run_freecad_capture.sh --script`, GUI) attend l'autorisation du second maître, demandée avant de la lancer.
- Délai maximal : 600 s par exécution (`FREECAD_TIMEOUT_S=600`).
- Le contrôle natif de remise (`delivery_checks[]` du manifeste du cas) suit la même règle, avec un délai maximal de 600 s.

**Remise** : commandes selon `method/worker.md` §8 et le contrat (« Commandes du worker »).

**Points propres au cas** :
- `pages.json` porte 8 cotes, dont les cotes serrées du gel n°10 : ouverture micro-USB remontée de 0,73 mm, et rainure avec chanfreins de 0,5 mm à 45°. Leurs valeurs attendues viennent de `params.json` ou des valeurs déclarées dans la spécification. N'en change aucune, ni aucun libellé de cartouche, sans question au second maître.
- Une cote refusée, ou une valeur qui s'écarte du modèle, remonte en `needs-decision`. Tu ne modifies ni le modèle ni `params.json` pour la faire passer.
- Aucune vue de capture n'est exigée.
