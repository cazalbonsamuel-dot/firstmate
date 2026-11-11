**Décision : je refuse la remise S5 et je ne l'accepte pas. Je la renvoie au worker, avec un point à confirmer côté poste avant l'envoi.** Je ne requalifie rien. Je n'ai ni relancé de commande ni modifié de fichier.

## Motifs de refus

**1. Maturité observée en dessous de la maturité revendiquée.**
- `summary` donne `claimed: ["cao_numerique_verifiee"]` et `observed: "non_etabli"`, avec `native_proofs: []`.
- L'erreur est `native_maturity_unestablished` sur `manifest.lifecycle_status`. Le verdict est `a_corriger` et le numérique `controles_partiels`.
- Le contrat (`method/proof-contract-v2.md:130`) et `method/contrat/reception.md` en font un refus.
- La fiche affirme l'inverse. La commande `summary` y figure avec rc 0, la note « conforme, controles_reussis, maturité observée cao_numerique_verifiee », et `results.maturite.observee` reprend cette valeur. Ma vue de réception ne la reproduit pas.
- Cause possible : `freecadcmd` absent de cette copie. Dans ce cas la maturité reste `non_etabli` par construction, et le skill m'interdit alors d'accepter une maturité.
- Je n'ai pas pu vérifier si `freecadcmd` est présent, car Bash est désactivé dans cette session. Que l'écart vienne du worker ou de l'environnement, je ne peux pas accepter la maturité sur cette base.

**2. Définitions ouvertes déclarées dans `limits[]` mais absentes des `open_points`.**
- Le contrôleur donne `definition: definition_encore_incomplete` et `open_items: ["definition_scope"]`.
- `limits[]` du manifeste nomme des définitions ouvertes précises :
  - cotes du module UnVision non mesurées ;
  - angle de façade estimé à 20° ;
  - planéité et matière du dessus de planche, et zone de pose ;
  - « Définition ouverte : position de la prise micro-USB de la Nano » ;
  - « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose, prise de la Nano) ».
- Les `open_points` de la fiche ne nomment aucune de ces définitions. Ils parlent seulement de l'impression, des essais physiques, du PETG à la place du PC, et de suivis de méthode.
- La fiche reconnaît pourtant `definition_encore_incomplete` dans `results.maturite`. Une définition ouverte au contrôleur ou dans `limits[]` et absente des `open_points` est un écart (étape 3).
- Le manifeste n'a pas de `definition_scope`, donc le contrôleur ne peut pas lister ces items un par un. Cela renforce le besoin de les nommer dans la fiche.

## Anomalie à lever avant l'envoi

Le `git status` initial montre `M cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json`. La copie n'est donc pas propre, et la fiche que j'ai lue peut différer de la fiche commitée. `reception` lit la copie pour les fichiers et exige qu'elle soit propre. Il faut inspecter ce diff, ce que je n'ai pas pu faire sans Bash. Si la fiche a été retouchée après le commit, c'est un motif de refus de plus.

## Pour information

- **Budget.** S5 a pris 13 exécutions lourdes pour un plafond de 12, et 20 en cumul avec S4 bis. Un `depassement` est bien déclaré, donc ce n'est pas un refus mécanique. Les 4 passes de mise en page TechDraw n'ont corrigé que des chevauchements.
- **Décision du capitaine.** Si le point 1 se confirme (maturité non établie), le budget est consommé sans preuve conforme. C'est alors une décision du capitaine (décision 6 du §1).
- **Non fait.** Je n'ai pas relu les captures ni les plans TechDraw, hors du périmètre de cette revue. Je n'ai pas lancé `reception --role s5`, que tu n'as pas mentionné et que je ne pouvais pas exécuter.

## Message à envoyer au worker (`fm-send`)

1. `summary` donne `observed: non_etabli` pour `claimed: cao_numerique_verifiee` (`native_maturity_unestablished`), alors que la fiche note un `summary` conforme. Fournis la sortie réelle du contrôleur, ou rends la preuve native vérifiable.
2. Nomme dans `open_points` les définitions ouvertes de `limits[]` : cotes UnVision, angle de façade, zone de pose et planéité, prise micro-USB de la Nano.
3. Explique la modification non commitée de `outputs/remises/s5-2026-11-10.json`.

Avant l'envoi, vérifie `freecadcmd` et le diff de la fiche. Si `freecadcmd` manque ici, relance `summary` dans une copie qui l'a avant d'en faire un grief au worker.
