Je rédige la section à partir de la méthode et du dossier du cas, sans rien modifier.

## Firstmate spec

**Unité** : « Plans normatifs TechDraw (un jeu de pages par pièce) », ligne du §13. Pièce `facade`, cas `inclinometre-jimny-boitier`. Un seul jeu de pages : la page `facade-p1`, avec la vue de face et la coupe A-A.

**Règles communes** : `method/worker.md`, appliquée telle quelle, sans exception.

**À lire** (colonne « Lire » de la ligne, après `method/worker.md` et le noyau du contrat) :
- §5 « Fabrication », lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

La section §15 est celle du lanceur de capture ; elle n'ajoute aucune lecture. Aucune lecture supplémentaire n'est demandée.

**Base** : le commit `7d74a39` de la branche du cas.

**Entrées gelées**, à ce commit (`method/worker.md` §3) :
- `cases/inclinometre-jimny-boitier/design/params.json`, `design/interfaces.json`, `design/acceptance_criteria/`, `design/recherche-options.md` et `design/recherche/` ;
- `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, ouvert en lecture seule et jamais enregistré. Son digest est celui épinglé dans le manifeste du cas.

La spécification de pages est `cases/inclinometre-jimny-boitier/docs/plans/facade/pages.json`, dans l'état du commit de base. Ses cotes attendues viennent de `params.json` ou de valeurs numériques écrites dans la spécification.

**Livrable accepté** :
- le SVG et le PDF de la page `facade-p1` ;
- `techdraw_report.json` au statut `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes**, et rien d'autre : le dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/` (`pages.json`, SVG, PDF, `techdraw_report.json`) et leurs lignes du manifeste. Tu en es l'unique propriétaire. `cad/facade.FCStd` est gelé. Aucun autre cas, aucune autre pièce, aucun helper commun ni `scripts/techdraw_pages.py` ne se modifie : un besoin de ce genre se remonte en `blocked`.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`. Une remise suivante le même jour devient `plans-facade-2026-11-11-2.json`.

**Budget** : celui de `method/iteration_budget.json`, sans réduction ni augmentation. Pour les plans, `max_techdraw_runs_per_page_set` limite les exécutions du jeu de pages. Elles comptent aussi dans `heavy_runs`. La fiche déclare le budget au schéma du contrat.

**Exécution lourde** :
- Chaque exécution lourde attend mon autorisation. Tu me la demandes par `needs-decision` avant de lancer.
- Je fixe le délai maximal dans l'autorisation. La durée mesurée est de 10,2 s (`method/performance.md`) ; le délai sera d'au plus 20 s, hors attente du bail.
- L'exécution se fait avec un runtime hors bac à sable.
- Le reste suit `method/worker.md` §5. Ce brief ne le répète pas.

**Commandes de remise** : `method/worker.md` §8 et le contrat, « Commandes du worker ». Avant S5, le contrôle natif de la pièce est le `delivery_check` de `facade` déclaré au manifeste du cas.

**Point propre au cas** : la seule petite cote de la spécification est `epaisseur_plaque`, de 2,5 mm, sur la coupe A-A.

**Refus et remontées** : `method/worker.md` §1, §4 et §10. Toute cote qui manque ou ne tient pas, ou toute entrée gelée qui ne se vérifie pas, remonte au second maître.
