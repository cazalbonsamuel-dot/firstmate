## Firstmate spec

**Unité** : « Plans normatifs TechDraw » (ligne du §13, un jeu de pages par pièce), pièce `facade` du cas `inclinometre-jimny-boitier`. Ship : l'unité écrit dans le projet.

**Règles communes** : applique `method/worker.md` en entier, sans exception ni assouplissement. Ce brief ne les recopie pas.

**À lire** (colonne « Lire » de la ligne, rien d'autre sans raison écrite) :
- noyau de `method/proof-contract-v2.md` (principes, commandes, remise d'un worker) ;
- §5 « Fabrication » de `method/methode-cao-operationnelle-v1.md`, lu seul ;
- `method/guides/techdraw.md` et `method/guides/freecad.md` ;
- le `README.md` du cas, puis la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

**Base** : commit `7d74a39` de la branche du cas.
- Entrées gelées à ce commit : `cases/inclinometre-jimny-boitier/design/params.json`, `interfaces.json`, `acceptance_criteria/`, `recherche-options.md`, `recherche/`.
- Le FCStd gelé est `cases/inclinometre-jimny-boitier/cad/facade.FCStd`. Tu le rouvres en lecture seule et ne l'enregistres jamais.
- Vérifie ces entrées selon `method/worker.md` §3 avant de commencer.
- Aucune empreinte n'est recopiée ici.

**Livrable accepté** (colonne « Livrable accepté » de la ligne) :
- SVG et PDF de chaque page du jeu de pages de la façade ;
- `techdraw_report.json` en `verifie` ;
- pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes** (propriétaire unique) :
- le dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/` : `pages.json`, `facade-p1.svg`, `facade-p1.pdf`, `techdraw_report.json` ;
- leurs lignes du manifeste du cas et celles des preuves que tu rejoues toi-même ;
- ta fiche de remise.

Tu ne touches ni aux autres pièces, ni à `scripts/` (helpers et lanceurs), ni aux entrées gelées, ni à un autre cas.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/techdraw-facade-2026-11-11.json`. Si ce nom existe déjà, utilise `-2`, `-3`, etc.

**Budget** :
- `max_iterations` et `max_heavy_runs_per_brief` de `method/iteration_budget.json`, sans changement ;
- `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` ;
- une troisième exécution TechDraw se justifie par écrit dans la fiche (`depassement`).

**Exécution lourde** :
- GUI, via `scripts/run_freecad_capture.sh --script scripts/techdraw_pages.py` ;
- chaque exécution attend l'autorisation du second maître ;
- délai maximal par exécution : `FREECAD_TIMEOUT_S=600` ;
- hors de ce délai ou de cette autorisation, tu ne lances rien.

**Remise** : commandes de `method/worker.md` §8 et du contrat (« Commandes du worker »). Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_facade.sh`.

**Points propres au cas** :
- le jeu de pages porte les cotes serrées de la façade (fenêtre de l'écran, perçages de la LED et de l'encodeur, passage de vis, épaisseur de plaque) ;
- aucune cote ne vient d'ailleurs que de `params.json` et `interfaces.json` ;
- une cote qui manque ou ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence ;
- hors périmètre : tolérances et états de surface (non définis au cartouche), modification du modèle, des paramètres ou des autres pièces.
