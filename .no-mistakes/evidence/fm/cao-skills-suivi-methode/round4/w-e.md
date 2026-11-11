## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (un jeu de pages par pièce), pièce **coque** du cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw » de la table du §13.

**Règles à appliquer**
- Applique `method/worker.md`, qui fait foi pour les règles communes. Ce brief ne les recopie pas et ne les assouplit pas.
- Lis ensuite le noyau du contrat de preuves, puis la colonne « Lire » de ta ligne du §13 :
  - noyau de la méthode, §5 « Fabrication » (section seule) ;
  - `method/guides/techdraw.md` ;
  - `method/guides/freecad.md`.
- Ne lis rien d'autre sans raison écrite.
- Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base et entrées gelées (à ne pas modifier)**
- Base : le commit `01b88f2` de la branche du cas. Pars de lui et vérifie tes entrées selon `method/worker.md` §3.
- Entrées gelées : les fichiers gelés du cas à ce commit (`params.json`, `interfaces.json`, `acceptance_criteria/`, `recherche-options.md`, `recherche/`).
- À ces fichiers s'ajoute le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit, avec son digest épinglé dans le manifeste. Tu le rouvres en lecture seule et ne l'enregistres jamais.

**Livrable**
- SVG et PDF de la page par le lanceur, avec `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.
- Ces plans sont le jeu de pages de la coque. Ils remplacent ceux de `docs/plans/coque/`, produits sur un état antérieur du modèle.

**Fichiers que tu possèdes**
- Dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste : seulement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF` et `FILE-PLAN-COQUE-RAPPORT`, et la preuve `PLAN-COQUE` que tu rejoues.
- Les plans de la façade et de la semelle, `cad/`, `design/` et les autres cas ne sont pas à toi.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.

**Budget**
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` : 2 exécutions TechDraw pour ce jeu de pages, sans dépassement prévu.
- Itérations : 3 (`method/iteration_budget.json`).
- Exécutions lourdes : 2 au lieu de 6, car l'unité n'a qu'un jeu de pages.
- Chaque exécution part seulement sur l'autorisation du second maître. Demande-la avant de lancer.
- Délai maximal par exécution : 600 s (`FREECAD_TIMEOUT_S=600`).
- Un dépassement se justifie dans la fiche (`depassement`) et demande l'autorisation du second maître.

**Remise**
- Commandes de remise : `method/worker.md` §8 et contrat, « Commandes du worker ».
- Fiche au schéma fixe du contrat (« Fiche de remise »).

**Points propres au cas**
- Point de départ : la spécification existante `docs/plans/coque/pages.json`. Une page A3 paysage avec trois vues (gauche, dessous, coupe B-B) et 8 cotes lues sur le modèle.
- Modèle gelé : la coque est au gel complémentaire n°10 (rainure à queue d'aronde avec chanfreins de 0,5, ouverture micro-USB remontée de 0,73). Les points de référence des cotes suivent la géométrie du FCStd gelé à `01b88f2`.
- Un point qui ne tombe plus sur une arête ou un sommet du modèle gelé se corrige seulement si la cote reste celle de `params.json`. Si une valeur attendue de `params.json` ou d'`interfaces.json` ne tient pas sur le modèle, remonte `needs-decision` sans changer la valeur.
- Cotes serrées connues, qui demandent un placement soigné :
  - `ouverture_usb_hauteur` : 10,5 mm ;
  - `rainure_hauteur` : 4,3 mm ;
  - `rainure_bas_chanfreins` : 17,074 mm.
- Lancement : lance le worker avec `--base-branch` sur la branche du cas, car les artefacts gelés n'y sont pas sur la branche par défaut. Runtime hors bac à sable sur ce Mac.
