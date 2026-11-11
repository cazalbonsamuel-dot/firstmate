**Revue de maturité du cas inclinometre-jimny-boitier**

Je n'ai modifié aucun fichier. Deux de mes commandes ont été refusées (hash du manifeste, `git status`), donc la propreté de la copie n'est pas vérifiée.

**Ce qui concorde**
- **Définitions ouvertes :** `maturity.definition` vaut `definition_encore_incomplete`, avec `open_items: ["definition_scope"]`. Le manifeste n'a pas de `definition_scope`, ce qui donne une définition non établie et `prototype_ready=false`, sans erreur de migration (`method/contrat/maturite.md`).
- **`limits[]` et fiche :** les `limits[]` déclarent les mêmes définitions ouvertes que la fiche. Ce sont les cotes du module écran, l'angle de façade, la zone de pose sur la planche et la prise micro-USB de la Nano. Elles déclarent aussi qu'il n'y a ni prototype prêt, ni essai physique, ni impression vérifiée.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont `non_verifie`. La fiche les reprend dans `open_points`.
- **Niveau revendiqué :** `cao_numerique_verifiee` seulement, sans `prototype_fabricable`. C'est cohérent avec les définitions ouvertes.

**Ce qui bloque**
- **Écart de maturité :** `summary` donne `observed: non_etabli` pour `claimed: [cao_numerique_verifiee]`, avec l'erreur `native_maturity_unestablished`, `ok:false` et `native_proofs: []`.
- **Fiche contredite :** la fiche annonce l'inverse (`summary` rc 0, `conforme`, maturité observée `cao_numerique_verifiee`, `delivery --execute` rc 0).
- **Règle de refus :** une maturité observée sous la maturité revendiquée est un refus (`method/contrat/reception.md`).
- **Cause probable :** `freecadcmd` est introuvable dans cet environnement. La règle de `reception.md` dit alors que la maturité reste `non_etabli` par construction. On peut contrôler la cohérence, pas accepter une maturité. Les preuves natives ne sont donc pas relues ici.
- **Écart à signaler :** le `manifest_sha256` de `summary` (76bf6582…) diffère de celui de la fiche pour le manifeste (547682cd…). Je n'ai pas pu recalculer le hash du fichier. Les deux hashs ne sont peut-être pas calculés de la même façon, mais il faut régénérer `summary` et comparer.

Je ne peux donc pas accepter la maturité ni requalifier la remise. La suite relève du second maître : rejouer `delivery` puis `summary` dans une copie propre où `freecadcmd` existe (en attendant le bail), ou remonter au capitaine. Cela ne se règle pas avec le worker, tant que la cause est l'environnement et non sa remise.

VERDICT : refuser - maturité observée `non_etabli` (sans `freecadcmd`, `native_proofs` vide) sous la maturité revendiquée `cao_numerique_verifiee`, en contradiction avec la fiche ; à rejouer avec FreeCAD avant toute acceptation.
