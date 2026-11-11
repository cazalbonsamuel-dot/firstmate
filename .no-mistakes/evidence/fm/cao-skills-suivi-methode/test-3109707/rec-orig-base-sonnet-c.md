**Décision : refuser la remise S5 et la renvoyer au worker par `fm-send`.** Je ne l'accepte pas et je ne remonte pas au capitaine.

**Motif de refus unique (étape 4, 5ᵉ puce)** : `maturity.definition` et `maturity.open_items` ne correspondent pas aux définitions déclarées ouvertes.

- **Ce que le contrôleur observe :** `definition: "definition_encore_incomplete"` et `open_items: ["definition_scope"]`.
  - Dans `method/check_method.py:496-498`, cet identifiant sort quand le manifeste n'a pas de bloc `definition_scope`. Le message est alors « Périmètre et définitions critiques non établis ».
  - Le manifeste n'a effectivement aucun `definition_scope`, aucun `definition_item` ni aucun `definition_aspect` (recherche à 0 occurrence dans `method/cases/inclinometre-jimny-boitier/`).
- **Ce que le worker déclare ouvert :** quatre définitions précises.
  - Les `limits[]` du manifeste le disent à deux endroits : la ligne « Définition ouverte : position de la prise micro-USB de la Nano estimée… », et la ligne « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) ».
  - Les `open_points` de la fiche reprennent les mêmes quatre définitions.
  - Le `case_state` du manifeste aussi.
- **L'écart :** aucune de ces quatre définitions n'est portée par le contrôleur. L'état « incomplet » vient d'un périmètre jamais déclaré, pas des définitions ouvertes que le worker invoque. Les `limits[]` et les `open_points` ne se recoupent donc pas avec `maturity.open_items`.
- **Ce qui est cohérent par ailleurs :** `claimed` et `observed` valent tous deux `cao_numerique_verifiee`. Les deux `open_items` de contrôle (`CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES`, `non_verifie`) sont bien repris dans les `limits[]` et dans les `open_points`. Aucune preuve n'est en échec.

**Ce que le worker doit corriger, dans son périmètre (S5 est l'écrivain du manifeste final) :**
- Déclarer un `definition_scope` : périmètre, sources hashées, `critical_items` incluant module écran, angle de vision, zone de pose sur la planche et prise de la Nano, et applicabilité de `logiciel` et `electrique` avec justification.
- Poser les contrôles `definition_item` et `definition_aspect` correspondants, en `non_verifie` avec raison, pour que `maturity.open_items` nomme ces quatre définitions.
- Relancer `delivery` et `summary`, puis réécrire la fiche. La revendication reste `cao_numerique_verifiee`, et aucun critère n'est baissé.

**Points relevés qui ne motivent pas le refus :**
- **Budget :** 13 exécutions lourdes pour une limite de 12. Le dépassement est remonté dans la fiche (`budget.depassement`), sans preuve non conforme. Le refus d'étape 4 vise un dépassement sans arrêt ni remontée, donc il ne s'applique pas. Il reste à porter à la connaissance du capitaine, mais seulement s'il y a un budget supplémentaire à décider.
- **Non vérifiés par moi :** l'étape 1 (ancêtre du commit, diffs suivants) et l'étape 2 (périmètre du diff). Je me suis limité à la revue de maturité demandée.
- **Étape 5 (lecture des captures) :** elle aurait lieu après la correction. Les six captures sont des captures de S4 bis, non rejouées, et leur identité est déclarée.
- **Hors cas :** le `.FCBak` sous `cases/electronique/cad/` est signalé par le worker comme un suivi de lot méthode, pas un défaut de ce cas.
