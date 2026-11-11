[claude-code:unrecognized_model] {"model":"claude-fable-5-2","query_source":"sdk"}
Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) », ligne de la table du §13 de `method/methode-cao-operationnelle-v1.md`, pour la pièce `facade` du cas `inclinometre-jimny-boitier`.
Le jeu de pages est unique : celui de la façade.

**Règles et lecture**

- Applique `method/worker.md` : il porte les règles communes à toute unité, et ce brief ne les recopie ni ne les assouplit.
- Lis ensuite la colonne « Lire » de ta ligne, et rien de plus : §5 « Fabrication » (lue seule), `method/guides/techdraw.md`, `method/guides/freecad.md`.
- La méthode et le contrat de preuves (`method/proof-contract-v2.md`) font foi.
- Une question qui touche une entrée gelée, une interface, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître, sans trancher.

**Base et entrées gelées**

- Base : commit `7d74a39` de la branche du cas.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus le FCStd gelé `cases/inclinometre-jimny-boitier/cad/facade.FCStd` à ce même commit.
- Ce FCStd s'ouvre en lecture seule et ne s'enregistre jamais ; son digest est celui épinglé par le manifeste du cas à ce commit.

**Livrable accepté**

- Un SVG et un PDF par page.
- `techdraw_report.json` au statut `verifie`.
- Les pages relues en image.
- Aucun FCStd modifié.
- La spécification de pages est validée par `--check` avant toute exécution lourde.

**Fichiers que tu possèdes**

- Le dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/`, dont tu es le seul propriétaire : `pages.json`, les SVG et PDF de chaque page, `techdraw_report.json`.
- Les lignes de ces seuls fichiers dans `method/cases/inclinometre-jimny-boitier/manifest.json`.
- Ta fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-facade-2026-11-11.json`, à la date réelle de la remise ; une remise suivante le même jour est numérotée `-2`, `-3`.
- Rien d'autre : ni les autres pièces, ni l'assemblage, ni `scripts/` à la racine, ni un autre cas.

**Budget** (`method/iteration_budget.json`, §13 « Budget par brief », réduit pour cette unité)

- `max_iterations` : 2.
- `max_heavy_runs_per_brief` : 4.
- `max_techdraw_runs_per_page_set` : 2 pour ce jeu de pages (une passe, puis une reprise après le contrôle et la relecture) ; ces exécutions comptent aussi dans les exécutions lourdes.
- Une troisième exécution TechDraw demande mon autorisation écrite avant d'être lancée, et la fiche la cite dans `depassement`.
- La fiche déclare le budget au schéma fixe du contrat (« Fiche de remise »).

**Exécutions lourdes**

- Chacune attend l'autorisation du second maître, donnée avec son délai maximal : demande-la avant chaque lancement.
- Ton attente suit `method/worker.md` §5.
- Les contrôles de la passe, avant et après l'exécution, sont ceux de `method/guides/techdraw.md`.

**Remise**

- Les commandes sont celles de `method/worker.md` §8 et du contrat (« Commandes du worker ») pour une unité native avant S5.
- Si, à la base, le cas n'a pas encore de contrôle natif dans ses `delivery_checks[]`, le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_facade.sh`.

**Points propres au cas**

- Le plan porte les cotes de définition de la façade et celles de ses entrées dans `design/interfaces.json`.
- Chaque valeur attendue est un pointeur JSON dans `design/params.json` quand la cote y figure.
- Une cote absente de `params.json` et de `interfaces.json` se remonte ; elle ne se choisit pas.
- Aucune tolérance ni aucun état de surface n'est gelé pour cette pièce : le plan n'en porte pas, et le cartouche le dit.
- Hors périmètre : toute retouche de la géométrie de la façade, les plans de la coque et de la semelle, le dossier, la nomenclature, les captures.
