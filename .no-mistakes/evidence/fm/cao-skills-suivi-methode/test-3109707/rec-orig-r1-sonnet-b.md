**Décision : renvoyer au worker par `fm-send`. Je n'accepte pas S5 et je ne remonte rien au capitaine pour l'instant.**

Je n'ai pas lancé `reception --role s5` : Bash est désactivé dans cette session et le brief me demandait de ne pas relancer `delivery`, que `reception` rejoue. Le refus mécanique reste donc à confirmer.

## Revue de maturité (étape 3)

- **Revendiqué contre observé :** `cao_numerique_verifiee` des deux côtés, donc pas de refus de niveau. `prototype_ready` est à false, ce que la fiche et les `limits[]` annoncent aussi.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` apparaissent dans `summary`, dans les `open_points` de la fiche et dans `limits[]` ("Impression non vérifiée", "Aucune qualification physique"). C'est cohérent.
- **Écart : `maturity.open_items` ne correspond pas aux définitions déclarées ouvertes.**
  - `summary` donne `open_items: ["definition_scope"]`. Le contrôleur n'a trouvé aucun `definition_scope` dans le manifeste (aucune occurrence de `definition_scope`, `definition_item` ou `critical_items`). Il sort donc la valeur générique « Périmètre et définitions critiques non établis » (`method/check_method.py:496-498`).
  - Le manifeste (`limits[]` et `case_state`) et la fiche (`open_points`, ligne 740) déclarent au contraire quatre définitions précises : cotes du module écran UnVision, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano.
  - La règle de `method/contrat/reception.md` ligne 24 dit : « `maturity.definition` et `maturity.open_items` doivent correspondre aux définitions que la remise déclare ouvertes ». Ici le périmètre n'est pas encodé : le texte est dans la prose, pas dans le contrôleur.
  - Le contrat (`maturite.md`) demande un `definition_scope` avec un inventaire exhaustif des items critiques pour un livrable borné.

## Motifs de refus (étape 4)

1. **Écart de revue sur les définitions ouvertes.** Le manifeste n'a pas de `definition_scope`, et `open_items` est le générique `definition_scope` au lieu des quatre définitions déclarées.
   - Le worker doit ajouter `definition_scope` (périmètre, `critical_items`, sources hashées, applicabilité logiciel et électrique avec justification).
   - Il doit aussi annoter les contrôles ou critères par `definition_item`, pour que `summary` liste les quatre définitions ouvertes.
   - Il ne doit retirer aucun item critique pour obtenir un résultat plus vert.
2. **Probable : manifeste non re-pointé par rapport à la fiche.**
   - La fiche (ligne 177) donne pour `method/cases/inclinometre-jimny-boitier/manifest.json` le sha256 `547682cd…`. `summary` donne `manifest_sha256 = 76bf6582…`.
   - Si ces deux valeurs désignent bien le fichier, c'est le motif du contrat « un fichier déclaré non re-pointé ». Je n'ai pas pu hasher le fichier moi-même.
   - À confirmer par `reception --role s5 --fiche … --base 01b88f2`. La correction du point 1 modifiera de toute façon le manifeste : le worker devra re-pointer la fiche après coup, puis relancer `delivery` et `summary`.

## Hors refus, à noter

- **Budget :** 13 exécutions lourdes en S5 pour un plafond de 12. Le dépassement est déclaré dans `budget.depassement`, avec le code et la durée de chaque commande. Ce n'est pas un motif de refus, et aucune preuve n'est non conforme, donc la décision 6 du §1 ne s'applique pas. Le capitaine peut en être informé.
- **Plans TechDraw :** j'ai relu les PDF de la façade, de la coque et de la semelle. Cotes lisibles, traits de coupe centrés, cartouches propres, pas de chevauchement gênant (le cartouche et les cotes se lisent bien).
- **Captures :** les six captures de S4 bis ne sont pas rejouées en S5. Leur digest d'assemblage est inchangé, ce que la fiche déclare. Je n'ai pas relu les PNG, ce qui reste à faire en revue ou par un worker de revue.
- **Provenance MCP, ordre d'intégration, périmètre des fichiers :** je n'ai rien relevé d'anormal dans la fiche. La vérification mécanique complète reste celle de `reception`.

## Suite (étape 5)

Après correction, le worker relance `delivery` puis `summary`. Il revient avec une fiche re-pointée, et le second maître relance `reception --role s5`. Si `open_items` liste alors les quatre définitions attendues et que `reception` rend 0, S5 est acceptable et on passe à `cao-livraison`.
