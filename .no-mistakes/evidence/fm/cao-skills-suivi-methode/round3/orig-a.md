**Décision : je refuse l'acceptation de S5. Je ne l'accepte pas et je ne la requalifie pas.**

Bash est désactivé dans cette session. Je n'ai donc pas lancé `reception` (étape 2) ni vérifié `git status`. Ma décision repose sur la sortie de `summary` que tu m'as donnée et sur la lecture des fichiers.

## Motifs de refus

1. **Maturité observée en dessous de la maturité revendiquée.**
   - `summary` donne `claimed: ["cao_numerique_verifiee"]` et `observed: "non_etabli"`. Le contrôleur remonte l'erreur `native_maturity_unestablished`, sur `manifest.lifecycle_status`.
   - C'est le refus du contrat « delivery différent de 0 côté superviseur, ou maturité observée en dessous d'un niveau revendiqué ». `reception.md` le dit aussi : un `observed` inférieur à `claimed` est un refus.
   - La fiche affirme l'inverse : `results.maturite.observee = cao_numerique_verifiee`, et la note de la commande `summary` écrit « conforme, controles_reussis ». Ma sortie donne `verdict: a_corriger` et `numeric_verdict: controles_partiels`. La fiche et la copie reçue se contredisent.
   - Je n'ai pas pu établir la cause de `non_etabli`. `freecadcmd` existe sur ce poste (`/Applications/FreeCAD.app/Contents/Resources/bin/freecadcmd`), mais je ne sais pas s'il était accessible au contrôleur dans cette copie.
   - Quelle que soit la cause, je ne peux pas accepter une maturité que le contrôleur n'établit pas. Je ne l'ai pas non plus requalifiée en « excusée par l'environnement ».

2. **Budget dépassé sans arrêt préalable.**
   - Le budget annonce 13 exécutions lourdes pour un plafond de 12, et 20 cumulées sur S4 bis et S5. Le champ `depassement` est présent, donc le contrôle mécanique de présence passera.
   - Sur le fond, il constate le dépassement après coup (« remonté ici »). Il ne cite ni autorisation du second maître ni arrêt avec remontée, comme l'exige le contrat (§13).
   - Onze exécutions lourdes ont servi à lisser la mise en page TechDraw, dont quatre passes dont les seules reprises portaient sur des chevauchements. Aucune preuve n'est non conforme.
   - Ce point relève d'une décision, pas de ma requalification. Je le remonte au capitaine (décision 6 du §1) avec la fiche, plutôt que de le trancher.

## Revue de maturité (étape 3)

- **Définitions ouvertes : pas d'écart bloquant.**
  - `maturity.definition` vaut `definition_encore_incomplete` et `open_items` vaut `["definition_scope"]`. Le manifeste n'a pas de `definition_scope`, d'où `prototype_ready=false`.
  - `limits[]` et les `open_points` de la fiche déclarent les mêmes définitions ouvertes : cotes du module UnVision, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano. Ils déclarent aussi les mêmes absences d'impression et d'essais, et `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie`.
- **Deux limites sans équivalent dans `open_points`.**
  - Le pare-brise non modélisé (passage du câble USB non vérifié) n'a pas d'entrée correspondante. Les enveloppes estimées de l'encodeur, du bouton, des LED et du câble n'en ont pas non plus, la fiche ne nommant que l'écran et la Nano.
  - Ce ne sont pas des « Définition ouverte » au sens de `limits[]`. Je les signale pour que le worker les aligne, sans en faire un motif de refus à part.
- **Captures.**
  - Les sept captures datent de S4 bis et n'ont pas été rejouées (digest d'assemblage inchangé, ce que la fiche déclare).
  - Je ne les ai pas relues contre les vues exigées par le brief, qui n'est pas dans la copie. Les images sont à relire par un worker de revue distinct, comme le prévoit le skill.
- **Plans TechDraw.** Les rapports sont « verifie » et le worker a relu les pages. Je n'ai pas relu les SVG et PDF en image, et cette relecture n'a de toute façon pas valeur de preuve.

## Suite

- **Renvoyer au worker** (`fm-send`), avec le point exact : `native_maturity_unestablished` sur `manifest.lifecycle_status`. La note de la commande `summary` dans la fiche (« controles_reussis, observée cao_numerique_verifiee ») contredit la sortie reçue. Il doit relancer `delivery`, `summary` et `reception --role s5` là où `freecadcmd` fonctionne, avec le bail si un travail lourd tourne, et corriger sa fiche si le résultat diffère. Il peut aussi nommer dans `open_points` le pare-brise et les enveloppes estimées.
- **Remonter au capitaine** le dépassement de budget (13 pour 12, 20 cumulées).
- **Pas de passage à `cao-livraison`** tant que S5 n'est pas acceptée.

Tu veux que j'envoie le renvoi au worker et la remontée au capitaine ?
