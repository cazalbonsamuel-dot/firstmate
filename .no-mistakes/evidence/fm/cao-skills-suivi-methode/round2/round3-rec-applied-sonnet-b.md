## Décision : refus de la remise S5, à renvoyer au worker. L'acceptation de la maturité est impossible dans l'état actuel.

J'ai fait la seule revue demandée, celle de l'étape 3 sur la maturité. Je n'ai lancé aucune commande d'écriture ni aucune commande de contrôle.

### Écarts relevés

**1. La maturité observée ne confirme pas la revendication.**
- Le `summary` de la copie isolée donne `observed: non_etabli`, avec `native_proofs: []` et l'erreur `native_maturity_unestablished`.
- La revendication est `cao_numerique_verifiee`. Selon `method/contrat/reception.md`, un `observed` en dessous de `claimed` est un refus.
- La fiche (lignes 304-308 et 576-584) dit le contraire : « conforme, controles_reussis, maturité observée cao_numerique_verifiee ».
- Deux causes sont possibles : `freecadcmd` absent de la copie de réception, ou preuves natives qui ne vérifient pas sur la copie. Je n'ai pas pu trancher.
- Dans le premier cas, le contrat dit que je ne peux contrôler que la cohérence et pas accepter de maturité. Il faut alors un `summary` dans un environnement avec `freecadcmd`, puis un nouvel avis.
- Dans le second cas, c'est un écart de la remise.
- Le verdict diffère aussi : la fiche annonce `controles_reussis`, alors que la réception voit `controles_partiels` et `verdict: a_corriger`.

**2. Les `open_points` de la fiche ne correspondent pas aux définitions ouvertes.**
- `definition_encore_incomplete` et `open_items: ["definition_scope"]` concordent avec la fiche (`results.maturite.definition`).
- Le champ `limits[]` du manifeste déclare pourtant ces définitions ouvertes (lignes 3007-3019) :
  - cotes du module UnVision non mesurées ;
  - angle de façade estimé à 20° ;
  - planéité et matière du dessus de planche ;
  - position de la prise micro-USB de la Nano, estimée ;
  - enveloppes de composants estimées ;
  - ligne finale : « Pas de prototype prêt : définitions ouvertes (…) à mesurer par le capitaine ».
- Les trois `open_points` de la fiche (lignes 739-743) ne nomment aucune de ces définitions :
  - le premier parle de l'impression et des essais physiques ;
  - le deuxième parle des estimations en PETG ;
  - le troisième concerne des suivis hors cas.
- Le critère du contrat est « une définition ouverte dans `limits[]` que la fiche ne nomme pas dans ses `open_points` est un écart ». Cet écart est donc établi.
- Autre détail : `definition_scope` n'est nommé nulle part dans la fiche.

**3. Point en ordre.** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` `non_verifie` sont bien déclarés dans la fiche et dans `limits[]`. Ils sont cohérents avec `unverified_controls`.

### Ce que je renvoie au worker par `fm-send`

1. Aligner les `open_points` de la fiche sur les définitions ouvertes de `limits[]`. Il faut nommer au minimum le module UnVision, l'angle de façade, la zone de pose sur la planche, la prise de la Nano et `definition_scope`.
2. Expliquer l'écart entre sa lecture du `summary` (`observed: cao_numerique_verifiee`, `controles_reussis`) et celle de la réception (`non_etabli`, `controles_partiels`).

### Ce qui reste à faire

- Je ne requalifie rien et je n'accepte aucune maturité.
- Il faut rejouer `reception ... --role s5` et `summary` dans un environnement avec `freecadcmd`, après correction de la fiche.
- Je n'ai pas exécuté `reception`. Il faudra donc encore revoir les captures, les plans et le périmètre.
- Le dépassement de budget (13 exécutions lourdes contre 12 annoncées) est remonté dans la fiche. C'est une décision de budget pour le capitaine, pas un critère de cette revue.
