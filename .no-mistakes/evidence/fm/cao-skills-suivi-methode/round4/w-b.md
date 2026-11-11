## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (un jeu de pages par pièce), pièce **coque** du cas `inclinometre-jimny-boitier`. Ligne du §13 de `method/methode-cao-operationnelle-v1.md`.

**Règles communes.** Applique `method/worker.md` en entier (rôle, lecture, entrées gelées, propriété et manifeste, FreeCAD, commit, budget, remise, intégration, refus). Ce brief ne le recopie ni ne l'assouplit. La méthode et le contrat de preuves font foi.

**Lecture.** Après `method/worker.md`, lis seulement la colonne « Lire » de ta ligne :
- §5 « Fabrication » du noyau, lue seule ;
- `method/guides/techdraw.md` ;
- `method/guides/freecad.md`.

Je n'ajoute aucune lecture. Ajoute ensuite les fichiers du cas que `method/worker.md` §2 te désigne.

**Base.** Commit `01b88f2` de la branche du cas (lancement avec `--base-branch` sur cette branche).

**Entrées gelées, à ne pas modifier.** Les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`. Tu le rouvres en lecture seule et ne l'enregistres jamais.

**Livrable** (colonne « Livrable accepté ») : SVG et PDF par page, `techdraw_report.json` en `verifie`, pages relues en image, aucun FCStd modifié.

Tu écris toi-même la spécification de pages `pages.json` (une page A3 pour la coque), qui doit passer `python3 scripts/techdraw_pages.py --check` avant toute exécution lourde.

**Fichiers que tu possèdes.**
- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` et lui seul : `pages.json`, SVG, PDF, `techdraw_report.json`.
- Leurs lignes `delivered_files` du manifeste `method/cases/inclinometre-jimny-boitier/manifest.json`, plus la preuve que tu rejoues si une preuve `json_metrics` consomme le rapport.

Tu ne touches ni la façade, ni la semelle, ni l'assemblage, ni `scripts/`.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json` (`-2`, `-3` pour une remise suivante le même jour).

**Budget.**
- `max_iterations` : 3, valeur de `method/iteration_budget.json`.
- `max_heavy_runs_per_brief` : 2, réduit de 6 car l'unité ne comporte que ses exécutions TechDraw.
- `max_techdraw_runs_per_page_set` : valeur de `method/iteration_budget.json`, sans dépassement autorisé d'avance.

**Exécutions lourdes.** Chaque exécution de `techdraw_pages.py` sous `scripts/run_freecad_capture.sh --script` est autorisée seulement quand le second maître te l'autorise, une à la fois. Délai maximal par exécution : 600 s (`FREECAD_TIMEOUT_S=600`).

**Commandes de remise.** Voir `method/worker.md` §8 et le contrat (« Commandes du worker »). L'unité a une exécution native et on est avant S5. Le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_coque.sh` (le rapport est `outputs/check_coque.json`) : tu ne le lances que pour vérifier que le FCStd est inchangé. Pas de `delivery --execute`, réservé à S5.

**Points propres au cas.**
- Repère de la coque : x de 0 (gauche vu par le conducteur) à 87, y de l'avant (0) à l'arrière (48), z = 0 sur le dessous posé sur la semelle. Objet à planter : `Coque`.
- Les cotes viennent de `params.json` et `interfaces.json` sans seconde source. Une cote qui manque ou qui ne tient pas géométriquement donne `needs-decision`, jamais une valeur choisie en silence.
- Cotes serrées ou délicates à référencer, à porter avec un point sur une seule arête :
  - ouverture micro-USB (`IF-USB-OUVERTURE`) : hauteur et largeur de la partie rectangulaire. Le chevron autoportant agrandit l'ouverture vers l'avant, ce qui ne doit pas fausser la cote ;
  - rainure à queue d'aronde de la glissière : embouchure au pied (rail plus 0,3 mm par face, chanfreins de 0,5 mm à 45° sur les arêtes basses), plafond et hauteur lus sur une coupe. Les chanfreins de 0,5 mm rendent l'appariement des arêtes ambigu : tolérance de 0,05 mm ;
  - hauteur de coque (`CALC-ANGLE`, 46,05 mm contre 49,05 mm sur la semelle) : ne pas confondre avec les cotes de la semelle.
- Vues demandées : une vue de gauche (y vers la gauche de la page, lue depuis le conducteur), une vue de dessous, une coupe transversale de la rainure. Cotes à lire sur ces vues.
- Cartouche : matière PC (repli ASA), tolérances générales « non définies » (aucune tolérance n'est portée), plan non approuvé.
