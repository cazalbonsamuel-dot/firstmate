**Décision : refus de la remise, à renvoyer au worker. Je n'accepte aucune maturité.** Je n'ai lancé aucune commande d'écriture.

**1. Maturité observée en dessous de la maturité revendiquée.**
- Le `summary` que tu as passé donne `claimed: cao_numerique_verifiee`, `observed: non_etabli`, `native_proofs: []` et l'erreur `native_maturity_unestablished`.
- Selon `method/contrat/reception.md:24`, un `observed` sous un niveau de `claimed` est un refus.
- La fiche affirme le contraire. Elle note, pour `summary`, « conforme, controles_reussis, maturité revendiquée et observée cao_numerique_verifiee ». Elle donne aussi `results.maturite.observee = cao_numerique_verifiee` et `delivery` à 0. Ce n'est pas ce que je vois dans la copie isolée.
- Je ne sais pas d'où vient cet écart. Si la copie isolée n'a pas `freecadcmd`, `non_etabli` est attendu par construction, et je ne peux alors qu'attester la cohérence. Si `freecadcmd` y est présent, la fiche est fausse ou ses preuves natives ne se relisent pas. Dans les deux cas, je ne peux pas accepter une maturité.
- Il faut donc rejouer `delivery` puis `summary` là où `freecadcmd` tourne, après le bail de `cao-freecad-execution`, et vérifier d'abord que `freecadcmd` existe dans la copie isolée. Si l'écart persiste, c'est un refus ferme.

**2. Définitions ouvertes non déclarées dans les `open_points` de la fiche.**
- **Côté contrôleur :** `maturity.definition = definition_encore_incomplete` et `open_items` contient `definition_scope`. Le manifeste n'a pas de `definition_scope`. Les `open_items` restants, `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES`, sont bien nommés dans les `open_points`.
- **Côté `limits[]` du manifeste :**
  - cotes du module UnVision non mesurées (l. 3007) ;
  - angle de façade estimé (l. 3008) ;
  - planéité et matière du dessus de planche non établies (l. 3009) ;
  - « Définition ouverte : position de la prise micro-USB de la Nano estimée » (l. 3012) ;
  - « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) » (l. 3019).
- **Côté fiche :** les trois `open_points` parlent de l'impression et des essais physiques, des estimations en PETG, et des suivis du lot méthode. Aucun ne nomme ces définitions ouvertes ni l'absence de `definition_scope`.
- Selon l'étape 3 du skill, une définition ouverte dans `limits[]` ou au contrôleur que la fiche ne nomme pas dans ses `open_points` est un écart.

**Ce que je renvoie au worker avec `fm-send` :**
- Lister dans les `open_points` de la fiche les définitions ouvertes de `limits[]` (module écran, angle de vision, zone de pose, prise Nano) et l'absence de `definition_scope`. Cela doit coïncider avec `maturity.definition` et `maturity.open_items`.
- Expliquer l'écart entre la fiche (« observée cao_numerique_verifiee ») et le `summary` (`non_etabli`, `native_proofs: []`).
- Ne pas baisser la revendication à `non_etabli` pour faire passer la remise. C'est à moi d'accepter ou de refuser. Si `native_maturity_unestablished` persiste là où `freecadcmd` tourne, le cas retourne au worker et le point remonte au capitaine.

Le reste de l'étape 3 n'était pas dans ma demande : captures, plans TechDraw, ordre d'intégration, provenance MCP et périmètre des fichiers restent à faire. Le dépassement de budget (13 exécutions lourdes contre 12 prévues) est déclaré dans la fiche. C'est une décision du capitaine, pas de la revue de maturité.
