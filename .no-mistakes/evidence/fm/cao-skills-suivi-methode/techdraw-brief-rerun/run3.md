Je lis la méthode et le cas facade, pas de blocage. Voici le contenu de la section.

Unité : « Plans normatifs TechDraw », un jeu de pages pour la pièce `facade` du cas `inclinometre-jimny-boitier`. C'est une ligne du §13 de `method/methode-cao-operationnelle-v1.md`.

**Règles communes et lecture**
- Applique `method/worker.md` et le noyau du contrat de preuves (`method/proof-contract-v2.md`) sans les reformuler.
- Lis ensuite seulement la colonne « Lire » de la ligne du §13 :
  - du noyau, §5 « Fabrication » ;
  - `method/guides/techdraw.md` ;
  - `method/guides/freecad.md`.
- Lis aussi `cases/inclinometre-jimny-boitier/README.md`.
- Aucune lecture n'est ajoutée.

**Base et entrées gelées**
- La base est le commit `7d74a39` de la branche du cas. Les entrées gelées sont les fichiers gelés du cas à ce commit (`method/worker.md` §3).
- Les entrées propres à cette unité sont :
  - `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, au digest du manifeste à ce commit ;
  - `cases/inclinometre-jimny-boitier/design/params.json`, dont les cotes sont lues par pointeur ;
  - la spécification `cases/inclinometre-jimny-boitier/docs/plans/facade/pages.json`.
- Cette spécification doit passer `python3 scripts/techdraw_pages.py --check` avant toute exécution lourde.
- Le `facade.FCStd` n'est jamais enregistré ni modifié.
- Ne touche ni `coque` ni `semelle`, ni `assemblage`, ni `interfaces.json`, ni un helper de `scripts/`, ni `method/`.
- Si une cote manque, est incohérente ou ne tient pas, ou si un helper devrait changer, arrête-toi et remonte en `needs-decision` ou `blocked`.

**Livrable**
- Pour la page `facade-p1` : le SVG, le PDF et un `techdraw_report.json` en `verifie`.
- Ces fichiers sont accompagnés de la spécification qui les a produits (`pages.json`).
- Les pages sont relues en image.
- Tu possèdes seulement `cases/inclinometre-jimny-boitier/docs/plans/facade/` et les lignes du manifeste de ces fichiers.
- Ta fiche de remise est `cases/inclinometre-jimny-boitier/outputs/remises/plans-techdraw-facade-2026-11-11.json`. Une remise suivante le même jour s'appelle `-2`, `-3`, etc.

**Budget**
- Budget de `method/iteration_budget.json`, réduit à `max_iterations` = 2 et `max_heavy_runs_per_brief` = 3. Ces 3 exécutions couvrent les 2 exécutions TechDraw et le contrôle natif de la pièce.
- `max_techdraw_runs_per_page_set` reste à 2, comme dans ce fichier. Une troisième exécution TechDraw exige une justification dans la fiche (`depassement`) et mon autorisation écrite.
- Déclare les compteurs et leurs plafonds dans la fiche.

**Exécutions lourdes**
- Runtime hors bac à sable.
- Chaque exécution lourde attend mon autorisation, avec un délai maximal de 600 s (`FREECAD_TIMEOUT_S=600`).
- Demande-la en `needs-decision` avant de lancer, puis suis `method/worker.md` §5 pour l'attente.
- Les contrôles de mise en page avant et après exécution, sans FreeCAD, sont décrits dans `method/guides/techdraw.md` et ne demandent pas d'autorisation.

**Commandes de remise**
- Suis `method/worker.md` §8 et le contrat (« Commandes du worker »).
- L'unité a une exécution native : le contrôle natif de la pièce est `cases/inclinometre-jimny-boitier/scripts/check_facade.sh`, sorti dans `cases/inclinometre-jimny-boitier/outputs/check_facade.json`.
- Ce contrôle est écrit par le propriétaire du FCStd. Tu l'exécutes seulement pour contrôler qu'il reste conforme, sans régénérer ni re-pointer `check_facade.json`. Si ce rapport devait changer, remonte-le.
- `delivery --execute` est réservé au worker S5.

**Points propres au cas**
- La spécification existante porte 7 cotes : 4 distances, 2 diamètres libres et 1 épaisseur en coupe A-A. Elles doivent toutes sortir portées et conformes.
- L'épaisseur de plaque de 2,5 mm en coupe est une petite cote. Les cotes `percage_led`, `percage_encodeur` et `passage_vis` sont placées par `label_offset_mm`, donc non prévisibles par `--check`. La relecture en image de ces points est obligatoire.
- Garde `pages.json` et le `techdraw_report.json` de l'exécution précédente dans `docs/plans/facade/`, pour que `--check` prévoie les emprises.
- Le plan ne prouve pas les tolérances ni les états de surface, qui restent « non définies » au cartouche. Ne les ajoute pas.
