[claude-code:unrecognized_model] {"model":"claude-fable-5-2","query_source":"sdk"}
Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce `facade` du cas `inclinometre-jimny-boitier`. C'est un ship.

**Règles et lecture.** Applique `method/worker.md`, puis la colonne « Lire » de cette ligne, et rien d'autre du noyau :
- §5 « Fabrication », lue seule ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître, sans trancher.

**Base.** Commit `7d74a39` de la branche du cas. Entrées gelées, à ne pas modifier :
- les fichiers gelés du cas à ce commit (`method/worker.md` §3) ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/facade.FCStd` à ce même commit, ouvert en lecture seule, jamais enregistré.

**Livrable.** Celui de la colonne « Livrable accepté » de la ligne, pour un jeu de pages de la façade, sans aucun FCStd modifié.

**Fichiers que tu possèdes.** Tu es seul propriétaire du dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/` :
- `pages.json` ;
- `facade-p1.svg` ;
- `facade-p1.pdf` ;
- `techdraw_report.json`.

Dans `method/cases/inclinometre-jimny-boitier/manifest.json`, tu écris seulement leurs lignes (`FILE-PLAN-FACADE-SPEC`, `-SVG`, `-PDF`, `-RAPPORT`) et la preuve `PLAN-FACADE` que tu rejoues. Tout le reste est hors périmètre : autres pièces, `docs/plans/coque/`, `docs/plans/semelle/`, autres cas, `scripts/` de la racine.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`, puis `-2`, `-3` pour une remise suivante le même jour.

**Budget.**
- 2 itérations, réduit depuis `max_iterations` = 3 : une passe, une reprise.
- 6 exécutions lourdes (`max_heavy_runs_per_brief` de `method/iteration_budget.json`, §13).
- Parmi elles, au plus 2 exécutions TechDraw pour ce jeu de pages (`max_techdraw_runs_per_page_set`).
- La fiche déclare ce budget au schéma du contrat (« Fiche de remise »).

**Exécutions lourdes.** Chacune attend mon autorisation, demandée une à la fois. Les délais maximaux se comptent hors attente du bail :
- 20 s par exécution TechDraw (10,2 s mesurées pour un jeu de pages de ce cas, `method/performance.md`) ;
- 60 s par contrôle natif de remise (`timeout_s` des `delivery_checks[]` du cas).

**Remise.** Commandes de `method/worker.md` §8 et du contrat (« Commandes du worker »), pour une unité native avant S5. Le cas a déjà ses contrôles natifs dans `delivery_checks[]`.

**Points propres au cas.**
- Un jeu de pages de la façade existe déjà à la base : révision A, preuve `PLAN-FACADE` en `verifie`, huit cotes. Tu pars de sa spécification, tu ne repars pas de zéro.
- Cinq cotes de cette spécification portent une valeur attendue littérale, sans pointeur vers `params.json` : `plaque_largeur` 83,9, `plaque_hauteur` 41,4, `fenetre_largeur` 37,04, `fenetre_hauteur` 30,03, `percage_encodeur` 7,6. Si l'une ne se retrouve ni dans `params.json` ni dans `interfaces.json` gelés, c'est un `needs-decision` qui les nomme toutes en une seule question, jamais une valeur corrigée en silence.
- Cotes serrées connues : les trois petits diamètres (`percage_led`, `percage_encodeur`, `passage_vis`) et l'épaisseur de plaque de 2,5 mm dans la coupe A-A.
- Le cartouche garde « tolérances générales : non définies » et « non approuvé » : aucune tolérance ni approbation n'est gelée pour ce cas.
