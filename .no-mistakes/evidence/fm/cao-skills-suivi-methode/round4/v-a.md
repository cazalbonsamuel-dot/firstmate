## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw » (ligne du §13 de `method/methode-cao-operationnelle-v1.md`), un jeu de pages pour la pièce **coque** du cas `inclinometre-jimny-boitier`.

Applique `method/worker.md` en entier. Ce sont les règles communes à toute unité : rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus. Applique ensuite la colonne « Lire » de ta ligne du §13, soit :
- §5 « Fabrication » du noyau, lu seul ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Tu n'y ajoutes aucune lecture. La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base.** Le commit `01b88f2` de la branche du cas. Lance-toi depuis la branche du cas (`--base-branch`), pas depuis la branche par défaut.

**Entrées gelées, à ne pas modifier.** Ce sont les fichiers gelés du cas à `01b88f2` (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit. Tu le rouvres en lecture seule, sans jamais l'enregistrer. Point de synchronisation : S3 est franchi et ce FCStd est gelé et hashé à `01b88f2`. Sinon, `blocked`.

**Livrable.** Un SVG et un PDF par page, `techdraw_report.json` en `verifie`, les pages relues en image. Aucun FCStd modifié.

**Fichiers que tu possèdes.**
- Tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/`, soit la spécification `pages.json`, les SVG et PDF des pages et `techdraw_report.json`.
- Les lignes du manifeste du cas qui portent ces fichiers et la preuve de plans qui les cite. Tu les déclares dans ta fiche.

Tu ne touches ni à la façade ni à la semelle, ni aux autres cas, ni à `scripts/` (`method/worker.md` §4).

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`, puis `-3`.

**Budget.**
- 2 itérations (`max_iterations` de `method/iteration_budget.json` réduit de 3 à 2, parce qu'une passe puis une reprise suffisent pour un seul jeu de pages).
- 2 exécutions lourdes (`max_heavy_runs_per_brief` réduit de 6 à 2, pour la même raison).
- Pour les plans, le budget `max_techdraw_runs_per_page_set` de `method/iteration_budget.json`. Ces exécutions comptent dans `heavy_runs`.
- Déclare les compteurs et leurs plafonds dans la fiche, au schéma fixe du contrat (« Fiche de remise »).

**Exécutions lourdes.**
- Le second maître autorise par ce brief les exécutions du jeu de pages, une à la fois et dans la limite du budget ci-dessus.
- Délai maximal de chacune : 600 s (`FREECAD_TIMEOUT_S=600`). La mesure du boîtier est de 10,2 s (`method/performance.md`).
- Une exécution hors de ce cadre ou au-delà du budget demande une nouvelle autorisation du second maître.
- Le runtime est hors bac à sable sur ce Mac. Tu passes seulement par les lanceurs du projet. Le reste de l'attente est dans `method/worker.md` §5.

**Commandes de remise.** Voir `method/worker.md` §8 et le contrat (« Commandes du worker »). L'unité est native avant S5 : tu lances le contrôle natif de ton cas (`delivery_checks[]`), pas `delivery --execute`, réservé à S5.

**Points propres au cas.**
- Le repère de la coque est fixé par `cases/inclinometre-jimny-boitier/scripts/build_coque.py`. Il est rappelé dans la `note` du `pages.json` existant. Tu pars de ce `pages.json` s'il est présent à `01b88f2`, sinon tu l'écris.
- Les cotes à porter sur le modèle sont celles qui définissent la coque :
  - hauteur de coque (CALC-ANGLE) ;
  - ouverture micro-USB, hauteur et largeur (IF-USB-OUVERTURE, remontée de 0,73 au gel n°10) ;
  - largeur hors tout et profondeur ;
  - rainure à queue d'aronde : embouchure avec ses chanfreins de 0,5 à 45° (gel n°10), plafond et hauteur en coupe.
- Les cotes serrées de la rainure sont l'embouchure, le plafond et la hauteur. Elles viennent du rail de la semelle augmenté de 0,3 par face et de 0,3 au-dessus.
- Chaque valeur attendue vient de `design/params.json` ou de `design/interfaces.json`, sans seconde source (`method/worker.md` §3). Une cote sans source gelée ou qui ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence.
- Pages : un jeu de pages pour la coque seule, au format A3 paysage de la spécification existante. Le modèle de page, le cartouche et le choix des vues (vue de gauche, vue de dessous, coupe B-B de la rainure) suivent le `pages.json` existant. Tu en changes seulement ce qu'exige la relecture des pages en image.
- Cartouche : date d'émission `2026-11-11`. La pièce est marquée « non approuvé » et les tolérances générales « non définies », car le cas n'a ni tolérances ni approbation.

Ne recopie ni ne modifie aucune règle de `method/worker.md`, du guide TechDraw ou du contrat.
