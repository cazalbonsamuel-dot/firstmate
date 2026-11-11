## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw** (ligne du §13 : un jeu de pages par pièce), pour la pièce **coque** du cas `inclinometre-jimny-boitier`.

**Règles et lectures**
- Applique `method/worker.md`, puis la colonne « Lire » de ta ligne du §13 : §5 « Fabrication » et §15 du noyau `method/methode-cao-operationnelle-v1.md`, lus seuls, `method/guides/techdraw.md` et `method/guides/freecad.md`.
- Tu ajoutes aucune autre lecture.
- La méthode et le contrat de preuves font foi.
- Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître, sans trancher.

**Base et entrées gelées**
- Base : le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus `cases/inclinometre-jimny-boitier/cad/coque.FCStd` à ce commit.
- Ce FCStd est ouvert en lecture seule et jamais enregistré. `params.json` est la seule source des cotes lues dans `params.json`.
- La spécification `cases/inclinometre-jimny-boitier/docs/plans/coque/pages.json` existe déjà à ce commit. Elle te sert de point de départ, et tu la possèdes.

**Livrable**
- Les pages du plan de la coque.
- Un SVG et un PDF par page.
- `techdraw_report.json` en `verifie`.
- Les pages relues en image, avec le FCStd source inchangé.
- Le livrable est accepté selon la colonne « Livrable accepté » de ta ligne.

**Fichiers que tu possèdes**
- Tout le dossier `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste, seulement les lignes de ces fichiers et la preuve `PLAN-COQUE` que tu rejoues.
- Tu ne touches ni la façade, ni la semelle, ni l'assemblage, ni un helper de `scripts/`.

**Fiche de remise**
- `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`.
- Une remise suivante le même jour est numérotée `-2`, `-3`.

**Budget** (`method/iteration_budget.json`, réduit pour cette unité)
- `max_iterations` : 2.
- `max_heavy_runs_per_brief` : 2.
- `max_techdraw_runs_per_page_set` : 2, comptées dans les exécutions lourdes.
- Une exécution de plus se justifie dans la fiche (`depassement`).
- Chaque exécution lourde n'a lieu qu'avec l'autorisation du second maître. Délai maximal par exécution : 600 s (`FREECAD_TIMEOUT_S=600`).

**Commandes de remise**
- Celles de `method/worker.md` §8 et du contrat (« Commandes du worker »).
- Le contrôle natif de la coque est `cases/inclinometre-jimny-boitier/scripts/check_coque.sh` (`DELIVERY-COQUE-NATIF`).

**Runtime**
- Hors bac à sable sur ce Mac, via `scripts/run_freecad_capture.sh --script`.

**Points propres au cas**
- La spécification de départ porte 8 cotes : `hauteur`, `ouverture_usb_hauteur`, `ouverture_usb_largeur`, `largeur`, `profondeur`, `rainure_bas_chanfreins`, `rainure_plafond`, `rainure_hauteur`.
- Elle contient une coupe B-B à l'échelle 3:2 d'origine `[43.5, 24, 23.03]`.
- Avant toute exécution, confirme qu'elle correspond au FCStd gelé à `01b88f2`.
  - Cotes lues à valeur littérale : `hauteur` 46,0532 (la coque seule, 49,05 sur semelle), `rainure_bas_chanfreins` 17,074, `rainure_plafond` 21,0392, `rainure_hauteur` 4,3.
  - Si une de ces valeurs ou une référence d'arête ne correspond plus au modèle gelé, ou si une cote ne tient pas géométriquement, remonte `needs-decision` au second maître. Ne choisis aucune valeur en silence.
- Cotes serrées sur la rainure, dont les chanfreins de 0,5 mm à 45° et le rail de 4,3 mm.
- Les cotes de rainure et d'ouverture USB sont lues sur des arêtes ou sommets proches de jonctions.
- Hors périmètre : tolérances et états de surface (la spécification les déclare « non définies »). Le cartouche reste « non approuvé ».
- Le dossier de conception (`docs/dossier-conception.md`) et le manifeste citent déjà ces plans. Une preuve d'un autre propriétaire qui cite un fichier que tu re-pointes se déclare dans `invalidated_proofs` (`method/worker.md` §4).
