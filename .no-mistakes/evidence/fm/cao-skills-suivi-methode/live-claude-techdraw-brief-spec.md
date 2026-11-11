- **Unité** : plans normatifs TechDraw de la pièce `facade` du cas `inclinometre-jimny-boitier` (un jeu de pages), ligne « Plans normatifs TechDraw (un jeu de pages par pièce) » du §13. Applique `method/worker.md`, puis seulement la colonne « Lire » de cette ligne. Cette colonne cite : §5 « Fabrication » du noyau, `method/guides/techdraw.md` et `method/guides/freecad.md`. Lis aussi le noyau du contrat de preuves (`method/proof-contract-v2.md` : principes, commandes, remise d'un worker), comme toute unité. Tu n'ajoutes aucune autre lecture sans raison écrite dans ta fiche.

- **Base** : commit `7d74a39` de la branche du cas. Ne copie aucune empreinte.
  - Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), dont `cases/inclinometre-jimny-boitier/design/params.json`.
  - À ces fichiers s'ajoute le FCStd gelé `cases/inclinometre-jimny-boitier/cad/facade.FCStd`, rouvert en lecture seule sans jamais l'enregistrer.
  - Vérifie ces entrées au début, par `git diff --exit-code 7d74a39 -- <chemins>` (`method/worker.md` §3).
  - Tout gel complémentaire t'est transmis par `fm-send` sous forme d'un seul identifiant de commit. Rebase dessus et reprends la vérification à ce commit.

- **Livrable accepté** : SVG et PDF de chaque page, et `techdraw_report.json` au statut `verifie`.
  - Les pages sont relues en image.
  - Aucun FCStd n'est modifié, et le digest géométrique de `facade.FCStd` reste celui épinglé.
  - Toute cote vient de `params.json` ou du modèle, sans seconde source.

- **Fichiers que tu possèdes** : le dossier `cases/inclinometre-jimny-boitier/docs/plans/facade/` et lui seul, soit `pages.json`, les SVG et PDF des pages (`facade-p<n>.svg` et `.pdf`) et `techdraw_report.json`.
  - Pour le manifeste, seulement les lignes de ces fichiers et la preuve de plans `PLAN-FACADE` que tu rejoues (`method/worker.md` §4).
  - Garde `pages.json` dans ce dossier de sortie : `--check` y lit le `techdraw_report.json` de l'exécution précédente pour prévoir la mise en page.
  - Tu ne touches ni `scripts/` à la racine, ni les autres pièces, ni les autres cas.
  - Si une preuve d'une autre unité cite un fichier que tu re-pointes, déclare-la dans `invalidated_proofs`.

- **Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-techdraw-facade-<date>.json`, au schéma fixe du contrat. Une remise suivante le même jour s'appelle `plans-techdraw-facade-<date>-2.json`, puis `-3`, etc.

- **Budget** : lis les valeurs de `method/iteration_budget.json`, puis applique ces plafonds, réduits pour cette unité.
  - `max_iterations` : 2, soit une passe puis une reprise après le contrôle et la relecture.
  - `max_techdraw_runs_per_page_set` : 2, la valeur de `method/iteration_budget.json`. Une troisième exécution exige `depassement`, justifié dans la fiche et autorisé par le second maître.
  - `max_heavy_runs_per_brief` : 3. Les exécutions TechDraw y comptent, ainsi que le contrôle natif de la pièce.
  - Déclare les compteurs et leurs plafonds dans la fiche (`method/worker.md` §7).
  - Budget consommé sans preuve conforme : arrête-toi avec `stop_explanation` et remonte au second maître.

- **Exécutions lourdes** : chacune attend l'autorisation du second maître et le délai maximal qu'il fixe. Avant d'attendre, déclare `paused … until <début + délai>` (`method/worker.md` §5). Fais-les seulement par `scripts/run_freecad_capture.sh --script scripts/techdraw_pages.py`, depuis un runtime hors bac à sable, jamais par `freecadcmd` ni hors lanceur.

- **Commandes de remise** :
  - Applique `method/worker.md` §8 et le contrat (« Commandes du worker »).
  - L'unité a une exécution native, donc avant S4 le contrôle natif de ton cas est `cases/inclinometre-jimny-boitier/scripts/check_facade.sh` (preuve `check_facade.json`). Tu le rejoues sans modifier le FCStd.
  - `delivery --execute` est réservé à S5.

- **Contrôles propres à cette passe** : ceux de `method/guides/techdraw.md`.
  - Avant chaque exécution, `python3 scripts/techdraw_pages.py --check pages.json` doit sortir sans défaut prévu.
  - Après chaque exécution, relis `layout_defects` du rapport et refais `--check-svg` sur les pages exportées.
  - La relecture des pages rendues en image reste obligatoire pour la passe livrée.

- **Points propres au cas** :
  - Pour une coupe, `origin` doit être le centre de la boîte englobante de la pièce le long du trait de coupe. Sinon le trait et ses lettres sortent de la vue. C'est ce qui a fait perdre trois passes sur le boîtier (coque, origine en x = 0). `--check` donne l'origine centrée.
  - Référence chaque cote par un point intérieur à une seule arête, jamais une jonction d'arrondi.
  - Place chaque texte par `label_mm`.
  - Les petites cotes de 2 à 5 mm se placent au-delà de la ligne de cote ou à côté des lignes d'attache.
  - Une cote refusée ou non conforme n'est jamais corrigée en silence : une cote qui manque ou ne tient pas donne `needs-decision`.
  - Aucune tolérance ni état de surface n'est porté.

- **Hors périmètre** : ne modifie ni `design/params.json`, ni `design/interfaces.json`, ni les critères, ni aucun autre FCStd, ni les plans de la coque et de la semelle, ni un helper commun. Un besoin de modifier `scripts/techdraw_pages.py` est un lot méthode séparé : arrête-toi en `blocked` et remonte-le.
