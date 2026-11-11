## Firstmate spec

Tu es worker CAO en mode autonome sur une seule unité de travail : « Plans normatifs TechDraw (un jeu de pages par pièce) », pièce coque du cas `inclinometre-jimny-boitier` (ligne du §13 de `method/methode-cao-operationnelle-v1.md`).
Applique [`method/worker.md`](method/worker.md), puis la colonne « Lire » de cette ligne : §5 « Fabrication » du noyau, lu seul, [`method/guides/techdraw.md`](method/guides/techdraw.md) et [`method/guides/freecad.md`](method/guides/freecad.md).
Lis aussi le noyau du contrat de preuves, comme le demande `method/worker.md` §2.
La méthode et le contrat font foi.
Une question qui touche une entrée gelée, un compromis ou l'une des six décisions du §1 : arrête-toi et remonte-la au second maître, sans trancher.

**Base** : commit `01b88f2` de la branche du cas, à tenir comme tête gelée.
Entrées gelées, à ne pas modifier :
- les fichiers gelés du cas à ce commit, au sens de `method/worker.md` §3 ;
- le FCStd gelé `cases/inclinometre-jimny-boitier/cad/coque.FCStd`, à ce commit, rouvert en lecture seule et jamais enregistré. Son digest épinglé est celui de la ligne du manifeste. Le plan le relit dans sa session.

**Livrable** : un jeu de pages pour la coque, soit SVG et PDF par page, plus `techdraw_report.json` en `verifie`.
Les pages sont relues en image, et aucun FCStd n'est modifié.
La spécification de départ est `cases/inclinometre-jimny-boitier/docs/plans/coque/pages.json` (une page `coque-p1`, 7 cotes). Tu la reprends et l'ajustes seulement pour la mise en page.
Les valeurs attendues viennent de `params.json` ou du modèle, jamais d'une valeur choisie en silence.

**Fichiers que tu possèdes** :
- `cases/inclinometre-jimny-boitier/docs/plans/coque/pages.json`, `coque-p1.svg`, `coque-p1.pdf` et `techdraw_report.json`, seuls écrits de cette unité. Aucun autre fichier du cas n'est écrit, `docs/dossier-conception.md` compris.
- Dans le manifeste, uniquement les lignes `FILE-PLAN-COQUE-SPEC`, `-SVG`, `-PDF` et `-RAPPORT`, et la preuve `PLAN-COQUE` (que tu as rejouée).

Déclare dans ta fiche, sous `invalidated_proofs`, toute preuve d'un autre propriétaire qui cite l'un de ces fichiers.

**Fiche de remise** : `cases/inclinometre-jimny-boitier/outputs/remises/plans-coque-2026-11-11.json`, numérotée `-2`, `-3` pour une remise suivante le même jour.

**Budget** : 3 itérations (`max_iterations`, `method/iteration_budget.json`).
`max_techdraw_runs_per_page_set` est à 2, valeur du fichier.
`max_heavy_runs_per_brief` est réduit à 2, car ces deux exécutions sont les seules lourdes de l'unité.
Chaque exécution lourde n'a lieu que sur l'autorisation du second maître, avec un délai maximal de 600 s (`FREECAD_TIMEOUT_S=600`). La première est autorisée dès que tu me le demandes. La seconde est demandée après ton contrôle et ta relecture en image.
Une troisième exécution se justifie dans la fiche (`depassement`) et exige mon autorisation écrite.

**Points propres au cas** :
- Le plan existe déjà à la tête de la branche. Tu le refais sur le FCStd gelé au commit ci-dessus, et tu déclares dans la fiche si le FCStd a changé de digest depuis la preuve `PLAN-COQUE` actuelle.
- Le repère de la coque est x de 0 à 87, y de 0 (avant) à 48 (arrière), z = 0 au dessous posé sur la semelle.
- Dans `pages.json`, la vue de gauche a y vers la gauche de la page.
- L'origine de coupe `origin` est déjà centrée sur la boîte englobante (43,5 ; 24 ; 23,03). Le guide donne la règle et le contrôle, tu ne la recopies pas.

**Vues et cotes à conserver** : vues de gauche et de dessous à 1:1, et coupe B-B à 3:2.
- Gauche : hauteur 46,0532, ouverture USB 10,5 de hauteur et sa largeur de la partie rectangulaire (`params.json` `usb_ouverture_mm`).
- Dessous : largeur 87, profondeur 48, embouchure de la rainure 17,074.
- Coupe B-B : plafond de la rainure 21,0392, hauteur 4,3.

Les petites cotes sont à surveiller : le chanfrein de 0,5 mm, le jeu de rainure de 0,3 mm et la rainure de 4,3 mm.
Ne choisis pas de point de cote sur une jonction (arrondi fait de deux quarts d'arc).

**Commandes de remise** : `method/worker.md` §8 et le contrat, « Commandes du worker », code et durée de chacune dans ta fiche.
