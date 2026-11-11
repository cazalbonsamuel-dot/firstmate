Je termine la relecture des règles du §13 et de `method/worker.md`, puis je rends la section.

## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13, pour la pièce **coque** du cas `inclinometre-jimny-boitier`. Applique `method/worker.md` (règles communes à toute unité), puis la colonne « Lire » de cette ligne : §5 « Fabrication » du noyau `method/methode-cao-operationnelle-v1.md`, lu seul (titres : `grep -n '^#' method/methode-cao-operationnelle-v1.md`), `method/guides/techdraw.md` et `method/guides/freecad.md`. Le noyau du contrat de preuves `method/proof-contract-v2.md` est lu comme le demande `method/worker.md` §2 ; aucune partie de `method/contrat/` n'est demandée. Je n'ajoute aucune lecture.

La méthode et le contrat de preuves font foi. Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base.** Le commit `01b88f2` de la branche `fm/cao-inclinometre-boitier` (tête S5 du cas). Tes entrées gelées, à ne pas modifier, sont :
- les fichiers gelés du cas à ce commit (`method/worker.md` §3) ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, que tu rouvres en lecture seule sans jamais l'enregistrer.

Les plans déjà présents sous `docs/plans/coque/` à ce commit sont un point de départ, pas une entrée gelée : tu les possèdes et tu peux les remplacer. Vérifie qu'ils correspondent au FCStd gelé avant de les réutiliser.

**Livrable.** Un jeu de pages pour la coque :
- un SVG et un PDF par page, plus `techdraw_report.json` en `verifie` ;
- les pages relues en image ;
- aucun FCStd modifié.

**Fichiers que tu possèdes.** Seulement :
- `cases/inclinometre-jimny-boitier/docs/plans/coque/` (`pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`, pages supplémentaires éventuelles) ;
- leurs lignes du manifeste du cas : `FILE-PLAN-COQUE-*` et la preuve `PLAN-COQUE`.

Tu ne touches ni aux plans de la façade ni à ceux de la semelle.

**Fiche de remise.** `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `plans-coque-2026-11-11-2.json`, puis `-3`.

**Budget.**
- `max_iterations` : 2 (réduit du défaut de 3).
- `max_heavy_runs_per_brief` : 4 (réduit du défaut de 6). Ce plafond couvre toute exécution d'un lanceur FreeCAD, y compris le contrôle natif de la remise.
- `max_techdraw_runs_per_page_set` : celui de `method/iteration_budget.json`, sans modification.

Chaque exécution lourde n'a lieu que sur autorisation du second maître. Le délai maximal de chacune est de 600 s (`FREECAD_TIMEOUT_S=600`). Passe-le à la première exécution et à toute reprise. Le second maître te l'accorde au cas par cas ; ne lance rien sans elle. Une troisième exécution pour ce jeu de pages exige une justification écrite dans la fiche (`depassement`), citant l'autorisation du second maître.

**Commandes de remise.** Celles de `method/worker.md` §8 pour une unité à exécution native avant S5. Tu n'as pas à lancer `delivery --execute`, réservé au worker S5. Je n'en recopie rien ici.

**Runtime.** Hors bac à sable sur ce Mac (§12). Si ton profil bloque Qt, arrête-toi en `blocked` et remonte-le.

**Points propres au cas.**
- **Repère de la coque** (`scripts/build_coque.py`) : x de 0 (gauche vu par le conducteur) à 87, y de l'avant (0) à l'arrière (48), z = 0 sur le dessous posé sur la semelle. Emprise 87 x 48 x 46,05 mm.
- **Source des cotes** : chaque cote vient de `params.json` ou de `interfaces.json` par pointeur JSON, sans seconde source (`method/worker.md` §3). Une cote qui manque ou ne tient pas géométriquement donne `needs-decision`.
- **Cotes serrées à porter lisiblement** (remise `coque-2026-11-10.json`, point ouvert « Cotes serrées »). Relis chaque valeur sur le modèle gelé avant de la porter :
  - hauteur sur semelle, marge faible sur C5 (≤ 50) ;
  - paroi des bossages autour des inserts, égale au minimum de C8 (1,6) ;
  - lèvre et paroi gauche du logement de rainure, au minimum de paroi de C8 (2,0) ;
  - plafond de rainure sous l'épaulement (2,07).
- **Géométrie propre à la coque** :
  - bossages octogonaux sur plats, pas des cylindres : ne pas porter de `Diameter` sur eux, utiliser des distances entre plats ;
  - chanfreins de 1 mm à 45° sur les quatre arêtes parallèles à y, à la place de congés ;
  - chanfreins de 0,5 à 45° sur les arêtes basses de la rainure à queue d'aronde.
- **Vues exigées** : vue de gauche (y vers la gauche de la page), vue de dessous, et au moins une coupe qui montre le logement de rainure, l'épaulement et le cran.
- **Cartouche** : numéro `INCLINO-COQUE`, pièce `coque`, matière « PC (repli ASA) », tolérances générales « non définies » (aucune tolérance n'est portée par le plan).
