Je rédige le brief, tout est lu.

## Firstmate spec

**Unité** : « Plans normatifs TechDraw » (un jeu de pages par pièce, ligne du §13 de `method/methode-cao-operationnelle-v1.md`), pièce **coque** du cas `inclinometre-jimny-boitier`. Un seul jeu de pages : la page `coque-p1`.

**Règles communes** : applique `method/worker.md` tel quel (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus). Rien ci-dessous ne l'assouplit ni ne le recopie.

**Lecture** (colonne « Lire » de ta ligne, rien d'autre) :
- `method/worker.md`, puis le noyau du contrat `method/proof-contract-v2.md` ;
- §5 « Fabrication » de la méthode, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md` ;
- ensuite `cases/inclinometre-jimny-boitier/README.md` et ta synthèse de manifeste (`method/worker.md` §2).

**Base** : le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Pars de lui. Lance-toi avec `--base-branch fm/cao-inclinometre-boitier`, car les artefacts gelés vivent sur cette branche et pas sur la branche par défaut.

**Entrées gelées**, à ce commit :
- `cases/inclinometre-jimny-boitier/cad/coque.FCStd`. Son digest épinglé est celui de la ligne `FILE-COQUE-FCSTD` du manifeste à ce commit ;
- `cases/inclinometre-jimny-boitier/design/params.json` ;
- `cases/inclinometre-jimny-boitier/design/interfaces.json` ;
- `cases/inclinometre-jimny-boitier/design/acceptance_criteria/`, `recherche-options.md` et `recherche/`.

Le FCStd se rouvre en lecture seule et ne s'enregistre jamais (`method/worker.md` §3 et §4). Tu ne modifies aucune de ces entrées.

**Spécification de départ** : `cases/inclinometre-jimny-boitier/docs/plans/coque/pages.json` existe déjà, avec ses sorties. Elle reflète le gel n°10. Rien ne garantit qu'elle corresponde au FCStd de `01b88f2`. Le rapport actuel porte un digest de document, `167cf6c3…`. Compare-le au digest épinglé du FCStd gelé avant de réutiliser quoi que ce soit.

La spécification est la tienne, tu l'ajustes si le modèle gelé l'exige. Toute cote vient de `params.json` ou de `interfaces.json`, sans seconde source. Une valeur attendue qui ne tient pas sur le modèle gelé, ou une cote qui manque, donne `needs-decision` (`method/worker.md` §1). Tu ne choisis jamais une valeur en silence.

**Livrable** : pour la page `coque-p1`, le SVG, le PDF et `techdraw_report.json` en statut `verifie`, pages relues en image, aucun FCStd modifié (colonne « Livrable accepté »). Statut `non_conforme` ou `echec` : ne livre pas, remonte.

**Fichiers que tu possèdes** (propriétaire unique) :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json` ;
- leurs lignes `delivered_files` du manifeste du cas et la preuve `PLAN-COQUE`, que tu rejoues et re-pointes.

Tu ne touches ni `cad/`, ni `outputs/check_*.json`, ni `scripts/`, ni les dossiers `plans/facade/` et `plans/semelle/`, ni un autre cas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Remise suivante le même jour : `-2`, `-3`. Elle déclare chaque preuve d'un autre propriétaire que ton re-pointage invaliderait. Tu n'en attends aucune, vérifie-le.

**Budget** :
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` : 2, la valeur par défaut, non modifiée ;
- `max_iterations` réduit à 2 et `max_heavy_runs_per_brief` réduit à 2, parce que le jeu de pages est unique et que ces exécutions sont les seules lourdes de l'unité ;
- déclare-les dans la fiche au schéma fixe du contrat (« Fiche de remise »).

**Exécutions lourdes** : le second maître autorise au plus **2** exécutions de `scripts/techdraw_pages.py` par `scripts/run_freecad_capture.sh --script`, comme exécutions lourdes. Délai maximal de chacune : **600 s** (`FREECAD_TIMEOUT_S=600`). La suite de l'attente est dans `method/worker.md` §5. Runtime hors bac à sable sur ce Mac.

**Cotes serrées et points propres au cas** :
- hauteur de la coque sur la semelle : 49,05 mm contre 50 mm (critère C5, marge 0,95), et 46,0532 mm sur la coque seule ;
- les cotes de l'ouverture micro-USB et de la rainure de la semelle, avec leurs chanfreins, sont les plus sensibles à la référence d'arête. Le guide dit comment les choisir ;
- aucune capture n'est exigée, aucune vue de capture n'est à fournir.

**Commandes de remise** : celles de `method/worker.md` §8 et du contrat (« Commandes du worker »). L'unité s'exécute en natif avant S5, donc le contrôle natif de la coque, `DELIVERY-COQUE-NATIF` (`cases/inclinometre-jimny-boitier/scripts/check_coque.sh`). `delivery --execute` est réservé au worker S5.

**Intégration** : seulement quand le second maître te le dit (`method/worker.md` §9).
