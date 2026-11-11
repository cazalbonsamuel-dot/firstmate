## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (un jeu de pages pour la pièce **coque**), cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » de la table du §13. Applique `method/worker.md`, puis la colonne « Lire » de cette ligne. La méthode et le contrat de preuves font foi. Le brief ne recopie aucune règle de `method/worker.md` et n'en assouplit aucune.

**Lecture**
- `method/worker.md`.
- Le noyau `method/proof-contract-v2.md` (principes, commandes du worker, remise d'un worker).
- Dans `method/methode-cao-operationnelle-v1.md` : §5 « Fabrication », lu seul.
- Les guides `method/guides/techdraw.md` et `method/guides/freecad.md`.
- Aucune lecture ajoutée.
- Pour le cas : son `README.md` et la synthèse `python3 method/check_method.py summary method/cases/inclinometre-jimny-boitier/manifest.json`.

**Base et entrées gelées**
- Base : le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Le worker est lancé avec `--base-branch fm/cao-inclinometre-boitier`.
- Entrées gelées, à ne pas modifier :
  - les fichiers gelés du cas à ce commit (`method/worker.md` §3) ;
  - `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, rouvert en lecture seule sans jamais être enregistré.
- Si la vérification des entrées gelées échoue, arrête-toi en `blocked`.

**Livrable** (colonne « Livrable accepté »)
- Un SVG et un PDF par page.
- Un `techdraw_report.json` en `verifie`.
- Des pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes**
- Tu es seul propriétaire du dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste, seulement les lignes de ces fichiers (`FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT`) et la preuve `PLAN-COQUE`, que tu as rejouée toi-même.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`, puis `-3`.
- Hors périmètre :
  - les plans de la façade et de la semelle ;
  - `docs/dossier-conception.md` ;
  - `scripts/techdraw_pages.py` et les autres helpers communs ;
  - les autres pièces et les autres cas.
- Un besoin de modifier un helper est un lot méthode séparé : arrête-toi en `blocked`.

**Budget** (`method/iteration_budget.json`, réduit)
- `max_iterations` : 2.
- `max_heavy_runs_per_brief` : 3.
- `max_techdraw_runs_per_page_set` : 2.
- La fiche déclare ces compteurs et leurs plafonds au schéma fixe du contrat (« Fiche de remise »).
- Un dépassement n'est possible qu'avec l'autorisation écrite du second maître, citée dans `depassement`.

**Exécutions lourdes**
- Le second maître autorise par ce brief deux exécutions du lanceur de plans, soit les deux du budget `max_techdraw_runs_per_page_set`.
- Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`).
- Toute autre exécution lourde, y compris une relance après plantage, demande une autorisation neuve du second maître avant de partir.
- Pour l'attente, applique `method/worker.md` §5.

**Remise**
- Commandes de remise : `method/worker.md` §8 et le contrat (« Commandes du worker »).
- Pour une unité qui n'est pas native avant S5, le brief ne nomme pas de contrôle natif de pièce.

**Points propres au cas**
- Le jeu de pages `coque-p1` existe déjà dans le dossier. Pars de lui, sans supposer qu'il correspond au FCStd gelé à `01b88f2` : son accord avec le digest gelé est à établir par ta propre exécution.
- Ses cotes sont des valeurs attendues du modèle, de `params.json` ou de la sortie de `build_coque.py`. Si une cote manque dans `params.json`, ou qu'une valeur ne tient pas sur le modèle gelé, remonte `needs-decision`. Ne choisis jamais une valeur en silence.
- Cotes serrées connues de la coque, à ne pas masquer sur le plan :
  - hauteur sur la semelle 49,05 mm (marge 0,95 mm sur C5 ≤ 50) ;
  - parois des bossages 1,6 mm ;
  - lèvre 2,0 mm ;
  - plafond de rainure 2,07 mm sous l'épaulement.
- Les cotes que le plan doit déjà porter sont :
  - la hauteur ;
  - l'ouverture micro-USB (IF-USB-OUVERTURE) ;
  - la largeur hors tout 87 mm ;
  - la profondeur 48 mm ;
  - la rainure (embouchure, plafond, hauteur).
- Autres jeux de pages du cas : `facade` et `semelle`, d'autres unités. Les exécutions TechDraw restent en série par le bail `freecad`.
