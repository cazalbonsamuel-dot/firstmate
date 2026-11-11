Voici le texte de la section, prêt à coller. Je n'ai rien modifié ni lancé, et je n'ai pas pu vérifier que `01b88f2` existe, faute d'accès git. Les pièces de base du brief viennent de `method/` et du dossier du cas.

## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : **Plans normatifs TechDraw (un jeu de pages par pièce)**, pièce **coque** du cas `inclinometre-jimny-boitier`. C'est la ligne « Plans normatifs TechDraw » de la table du §13 de `method/methode-cao-operationnelle-v1.md`.

Applique `method/worker.md` en entier, puis la colonne « Lire » de cette ligne, rien de plus :
- §5 « Fabrication » du noyau, lu seul.
- `method/guides/techdraw.md`.
- `method/guides/freecad.md`.

Ces fichiers et la méthode font foi, et ce brief ne les recopie ni ne les assouplit. Une question qui touche une entrée gelée, une cote ou un compromis : arrête-toi et remonte-la au second maître (`needs-decision`), sans trancher.

**Base et entrées gelées**
- Base : le commit `01b88f2` de la branche du cas `fm/cao-inclinometre-boitier`. Lance le worker avec `--base-branch fm/cao-inclinometre-boitier`.
- Entrées gelées, à ne pas modifier : les fichiers gelés du cas à ce commit (`method/worker.md` §3). Y ajouter le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, rouvert en lecture seule et jamais enregistré. Vérifie-le avec `git diff --exit-code 01b88f2 -- <ces chemins>` avant de commencer.
- Les empreintes sont celles de ce commit, relues par toi. Ne les recopie pas.

**Livrable** (colonne « Livrable accepté »)
- Un SVG et un PDF par page, et `techdraw_report.json` en `verifie`.
- Les pages relues en image.
- Aucun FCStd modifié.

**Fichiers que tu possèdes** (seul propriétaire du dossier de sorties)
- `cases/inclinometre-jimny-boitier/docs/plans/coque/` : `pages.json`, `coque-p1.svg`, `coque-p1.pdf`, `techdraw_report.json`.
- Dans le manifeste, seulement les lignes `FILE-PLAN-COQUE-SPEC`, `FILE-PLAN-COQUE-SVG`, `FILE-PLAN-COQUE-PDF`, `FILE-PLAN-COQUE-RAPPORT` et la preuve `PLAN-COQUE`.
- Le `pages.json` existant est ton point de départ, pas une entrée gelée. Reprends-le sur le FCStd gelé de la base.
- Fiche de remise : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`. Une remise suivante le même jour s'appelle `-2`, `-3`.
- Déclare dans la fiche (`invalidated_proofs`) toute preuve d'un autre propriétaire que ton re-pointage invalide.

**Budget**
- Itérations : 2 (défaut 3, réduit : une passe, puis une reprise).
- Exécutions lourdes : 2 (défaut 6, réduit). Elles sont toutes TechDraw, car il n'y a qu'un jeu de pages.
- `max_techdraw_runs_per_page_set` : 2, valeur de `method/iteration_budget.json`, sans changement. Une troisième exécution se justifie dans `depassement`.
- Déclare les compteurs dans la fiche au schéma fixe du contrat (« Fiche de remise »).

**Exécutions lourdes**
- Chaque exécution TechDraw demande l'autorisation du second maître avant de partir. Sans elle, ne lance rien.
- Délai maximal de chaque exécution : 600 s (`FREECAD_TIMEOUT_S=600`). La déclaration `paused … until <début + délai>` avant d'attendre est dans `method/worker.md` §5.
- Runtime hors bac à sable obligatoire (§12).

**Commandes de remise**
- Celles de `method/worker.md` §8 et du contrat (« Commandes du worker »). Code et durée de chacune vont dans la fiche.
- Le lot ne touche ni le contrôleur, ni les fixtures, ni les helpers. `delivery --execute` est réservé au worker S5.

**Points propres au cas**
- Repère de la coque (`scripts/build_coque.py`) : x de 0 (gauche vu du conducteur) à 87, y de l'avant (0) à l'arrière (48), z = 0 au dessous posé sur la semelle. L'emprise est 87 x 48 x 46,05.
- Cotes déjà attendues au `pages.json` existant :
  - hauteur 46,0532 ;
  - ouverture USB : hauteur et largeur lues dans `params.json` ;
  - largeur 87 et profondeur 48 ;
  - rainure : embouchure avec chanfreins 17,074, plafond 21,0392, hauteur 4,3 (gel n°10).
- Cotes serrées connues, à ne pas trancher en silence :
  - hauteur sur semelle 49,05, marge 0,95 sur C5 ;
  - paroi minimale 2,0 ;
  - plafond de rainure sous l'épaulement 2,07.
- Les cotes viennent de `params.json` et du modèle, sans seconde source. Une cote qui manque, ou qui ne se place pas sans ambiguïté, donne `needs-decision`, jamais une valeur choisie.
