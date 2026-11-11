**Décision : refus, remise renvoyée au worker par `fm-send`. Pas d'acceptation et pas de remontée au capitaine.** Je n'ai rien modifié.

Le contrôleur est vert : `conforme`, `controles_reussis`, maturité revendiquée et observée à `cao_numerique_verifiee`, aucune erreur. L'écart vient de la revue humaine de l'étape 3. Je n'ai pas relu les captures ni les plans TechDraw. Je n'ai pas non plus la sortie de `reception --role s5` ni de `git status`, que tu ne m'as pas donnés.

## Motif de refus 1 : définitions ouvertes absentes des `open_points`

Le contrat (`method/contrat/reception.md`, ligne 24) exige que `maturity.definition` et `maturity.open_items` correspondent aux définitions que la remise déclare ouvertes. Le skill classe tout désaccord dans un sens ou dans l'autre comme un écart.

- **Côté contrôleur** : `definition: definition_encore_incomplete` et `maturity.open_items: ["definition_scope"]`. Le manifeste n'a pas de `definition_scope`.
- **Côté `limits[]` du manifeste** (lignes 3004-3020), les définitions ouvertes sont :
  - les cotes du module UnVision non mesurées ;
  - l'angle de façade estimé à 20° ;
  - la planéité et la matière du dessus de planche non établies ;
  - la position de la prise micro-USB de la Nano estimée (« Définition ouverte », gel n°10) ;
  - la dernière ligne, « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) ».
- **Côté `open_points` de la fiche** (lignes 739-743), il y a seulement trois points :
  - impression et essais physiques non faits ;
  - estimations d'impression en PETG ;
  - suivis du lot méthode hors du cas.
  
  Aucun ne nomme ces définitions ni l'absence de `definition_scope`. La fiche déclare pourtant `definition: definition_encore_incomplete` dans `results.maturite`.

**À renvoyer au worker** : ajouter aux `open_points` les quatre définitions ouvertes (module écran, angle de vision, zone de pose, prise de la Nano) et l'absence de `definition_scope`. Cela reste dans son périmètre. Comme la fiche n'est pas encore intégrée, elle suit sa branche, et il devra la re-pointer (commit et empreinte du manifeste si besoin).

## Point à trancher : budget dépassé

Le plafond est de 12 exécutions lourdes par brief et S5 en a pris 13. La fiche porte bien un `depassement`, mais ce texte est un compte rendu après coup. Il ne cite aucune autorisation du second maître ni arrêt suivi d'une remontée, comme l'exige le contrat (« un budget dépassé sans arrêt ni remontée », §13).

Il dit aussi « 12 exécutions lourdes annoncées pour S4 bis, aucune pour S5 », ce qui confirme que S5 n'avait pas de plafond annoncé.

- **Si tu n'as pas autorisé ce dépassement**, c'est un second motif de refus (arrêt et remontée non faits).
- **Si tu l'avais autorisé**, le worker doit citer cette autorisation dans `depassement`.

Aucune preuve n'est non conforme. Ce n'est donc pas le cas « budget consommé sans preuve conforme » qui remonte au capitaine (décision 6). La décision reste au second maître.

## Ce qui est en ordre

- **Maturité** : revendiquée et observée sont identiques, et `prototype_ready: false` est cohérent partout.
- **Contrôles non vérifiés** : CTRL-IMPRESSION et CTRL-ESSAIS-PHYSIQUES (`non_verifie`) sont bien repris dans `open_points` et dans `limits[]` (« Impression non vérifiée », « Aucune qualification physique »).
- **Estimations PETG** : l'écart par rapport au PC figure à la fois dans les `open_points` et dans `limits[]`.
- **Autres limites** (collage, verrou, pare-brise, enveloppes estimées) : elles ne sont pas dans les `open_points`. Ce ne sont pas des définitions de composant ouvertes au sens du contrôleur, donc je ne les compte pas comme écart. Le worker peut les nommer en même temps.

## Après correction par le worker

Relancer l'étape 2 (`delivery`, `summary`, `reception --role s5`, `git status`) sur la nouvelle tête. Puis relire les captures et les plans TechDraw selon `method/guides/captures.md` et `method/guides/techdraw.md`, et enfin décider. Si tout est vert, la remise S5 continue avec `cao-livraison`.
