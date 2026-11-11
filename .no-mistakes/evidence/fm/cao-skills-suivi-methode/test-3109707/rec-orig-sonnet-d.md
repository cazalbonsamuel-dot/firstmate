**Décision : refus de la remise S5, renvoi au worker par `fm-send`.** Le contrôleur est vert, mais la revue de maturité (étape 3) trouve des écarts. Je n'ai rien modifié ni requalifié, et je n'ai relancé ni `delivery` ni `summary`. Je n'ai pas non plus lancé `reception`, dont je n'ai pas la sortie, ni relu les captures ou les plans TechDraw : cette revue ne couvre que la maturité.

## Ce qui est conforme

- **Niveau de maturité :** revendiqué et observé sont tous deux `cao_numerique_verifiee`. Il n'y a donc pas de refus pour maturité observée sous le niveau revendiqué. Le manifeste ne revendique pas `prototype_fabricable`.
- **Prototype non prêt :** `prototype_ready` est à `false` et la fiche le dit. La maturité de la fiche (`results.maturite`) correspond à celle du contrôleur.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie`. La fiche les nomme dans `open_points`, et `limits[]` couvre l'absence d'essai et d'impression.
- **Listes d'invalidations :** `open_invalidations_before_execute` est vide, comme S5 l'exige.

## Écarts relevés, motifs de refus

1. **`definition_scope` absent du manifeste, et la fiche ne le dit pas.**
   - `maturity.definition` vaut `definition_encore_incomplete`, avec `open_items: ["definition_scope"]`. Dans `method/check_method.py:496-498`, cet item veut dire que le manifeste n'a pas de `definition_scope` (« Périmètre et définitions critiques non établis »). Je l'ai confirmé : le manifeste n'en contient aucun.
   - Ni `limits[]` ni les `open_points` de la fiche ne nomment cet item. C'est l'écart « ouvert au contrôleur, non nommé dans la fiche » de `method/contrat/reception.md`.
   - À l'inverse, la fiche déclare ouvertes quatre définitions précises (module UnVision, angle de vision, zone de pose, prise de la Nano) que le contrôleur ne voit pas. Il ne peut pas les voir sans `definition_scope`, `critical_items` ni contrôles annotés `definition_item`.
   - Résultat : le manifeste et la fiche ne décrivent pas les mêmes définitions ouvertes.

2. **Définitions ouvertes dans `limits[]` mais absentes des `open_points`.** Chacune est un écart au sens de l'étape 3 :
   - les enveloppes estimées de l'encodeur, du bouton, des supports de LED, de la fiche et du câble USB, et des réserves de câblage (`limits[]`, ligne « Enveloppes de composants estimées ») ; seuls l'écran et la Nano sont repris par la fiche, via les mesures à fournir ;
   - la masse des composants, estimée à 37 g (même ligne de `limits[]`) ;
   - le collage : pelage, traction, fatigue et adhérence sur la planche réelle non chiffrés, et 3 g d'accélération de calcul estimée ;
   - le verrou : propriétés du PC « typiques », facteur 0,5 en hypothèse, fluage et fatigue non calculés ;
   - le pare-brise non modélisé, donc le passage du câble USB à côté non vérifié ;
   - le dépassement thermique de l'écran (70 °C en marche et 80 °C au repos, pour une planche à 85 °C) ;
   - la planéité et la matière du dessus de planche, que la fiche ne reprend qu'implicitement dans « zone de pose ».

   La consigne Suzuki est un choix du capitaine, pas une définition : elle n'est pas en cause.

## Point à signaler, hors maturité

Le budget dépasse le plafond (13 exécutions lourdes pour 12 autorisées, et 20 cumulées sur S4 bis et S5). Le champ `depassement` est renseigné, mais il dit seulement « remonté ici » et ne cite aucune autorisation du second maître. Aucune preuve n'est non conforme, donc ce n'est pas une décision du capitaine pour l'instant. Je le note comme remontée, pas comme motif de refus.

## Message à envoyer au worker (`fm-send`)

- **Point 1 :** ajouter un `definition_scope` au manifeste (périmètre, `critical_items`, `source_artifacts`, applicabilité de `logiciel` et `electrique`), ou, à défaut, nommer dans `open_points` que le périmètre de définition n'est pas établi. Si tu l'ajoutes, annote des `controls[]` avec `definition_item` et `definition_aspect` pour que les définitions ouvertes de la fiche correspondent à `maturity.open_items` (`method/contrat/maturite.md`, adoption proportionnée).
- **Point 2 :** aligner `limits[]` et `open_points` sur les mêmes définitions ouvertes. Soit tu les nommes dans la fiche, soit tu retires de `limits[]` celles qui ne sont pas des définitions ouvertes.
- **Point 3 :** ne plus requalifier le budget après coup. Le champ `depassement` doit citer l'autorisation du second maître ou l'arrêt.
- Ce renvoi change le manifeste, donc son empreinte : il faudra re-pointer la fiche. Le contrôleur devra être rejoué, mais `--execute` ne l'est qu'avec une décision séparée.

Si les écarts 1 et 2 sont levés sans autre motif, je pourrai accepter. L'intégration de la PR relève ensuite du capitaine (décision 5).
