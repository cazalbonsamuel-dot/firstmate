**Décision : pas de refus à ce stade, mais je n'accepte pas encore. La revue de maturité est sans écart. Il reste quatre contrôles de l'étape 3 qui ne figurent pas dans ce que j'ai lu.**

## Revue de maturité (étape 3)

- **Revendiqué et observé :** ils sont tous deux à `cao_numerique_verifiee`. Aucun niveau observé ne tombe sous le niveau revendiqué, donc pas de refus sur ce motif du contrat.
- **`maturity.open_items` :** il ne contient que `definition_scope`. Une recherche dans le manifeste donne zéro occurrence de `definition_scope`, donc c'est l'item générique d'un manifeste qui n'en déclare pas. Selon `method/contrat/maturite.md`, ce n'est pas un écart.
- **`maturity.definition` :** elle vaut `definition_encore_incomplete`. `limits[]` déclare des définitions ouvertes (lignes 3007, 3012, 3008 et 3019 du manifeste). La fiche les nomme dans son premier `open_points`, avec les mêmes quatre définitions :
  - les cotes du module écran UnVision ;
  - l'angle de vision ;
  - la zone de pose sur la planche ;
  - la prise micro-USB de la Nano.
- **Cohérence dans l'autre sens :** `limits[]` et la fiche s'accordent sur les deux contrôles non vérifiés (`CTRL-IMPRESSION`, `CTRL-ESSAIS-PHYSIQUES`). Ils correspondent à `unverified_controls` dans `summary`.
- **Limites hors définition :** les autres limites (PETG faute de profil PC, collage, verrou, pare-brise, enveloppes estimées, périmètre électronique) ne sont pas des définitions ouvertes, donc elles n'ont pas à figurer dans `open_points`. Celles d'impression et d'hypothèses y figurent quand même, ce qui est correct.
- **`prototype_ready` :** il est à `false`, ce qui est cohérent avec les définitions ouvertes. La remise ne revendique rien de plus.

## Budget

La fiche déclare 13 exécutions lourdes contre 12 par brief, et 20 en cumul S4 bis plus S5. Elle porte un champ `depassement` qui explique l'écart. Le motif de refus du contrat est « un budget dépassé sans arrêt ni remontée, c'est-à-dire sans `depassement` ». Ce n'est pas le cas ici, donc pas de refus. La règle du capitaine (décision 6 du §1) vise un budget consommé sans preuve conforme, ce qui ne s'applique pas puisque `summary` rend `conforme` et `failing_proofs: []`.

Je signale quand même le dépassement au capitaine pour information. Onze des treize exécutions sont des reprises de mise en page TechDraw.

## Ce que je n'ai pas fait

- **`reception` :** le résultat de `reception ... --role s5 --base <tête avant S5>` n'est pas dans ce que tu m'as donné. Seuls `delivery` (rc 0) et `summary` l'étaient. Je ne l'ai pas relancé, puisque tu m'as demandé de ne pas relancer `delivery`, qu'il rejoue en interne. Son code de retour doit être 0 pour accepter. Il couvre les refus mécaniques : chemins personnels, manifeste, re-pointage, rebase, liste des invalidations vide pour S5.
- **`git status` :** je ne l'ai pas vérifié après les commandes.
- **Captures :** je ne les ai pas relues contre les vues exigées par le brief. Les six captures sont celles de S4 bis, non rejouées en S5, avec un digest d'assemblage inchangé.
- **Plans TechDraw :** je n'ai pas relu les plans en image. Le worker déclare avoir relu la page « sans chevauchement » pour la façade et la coque, mais pas pour la semelle. Pour la semelle, la lourde 9 notait la cote 4 au contact de l'arête de la lèvre. Celle de la lourde 11 dit seulement « sans chevauchement ». Cette relecture est à confirmer, car la relecture en image n'a pas valeur de preuve.
- **Périmètre et provenance :** je n'ai pas comparé les fichiers touchés au périmètre du brief, ni vérifié la provenance MCP.

## Étapes 4 et 5

- **Étape 4 :** aucun motif de refus du contrat n'est établi sur ce que j'ai examiné.
- **Étape 5 :** j'accepterai si `reception` rend 0, si `git status` est propre et si la relecture des captures et des plans est sans écart. Si la relecture en image révèle un chevauchement, ce sera un renvoi au worker par `fm-send`, avec le fichier et la cote en cause. Je ne vois rien à remonter au capitaine, sauf le dépassement de budget pour information. La suite d'une remise S5 acceptée est `cao-livraison`.

Le point 4 des `open_points` de la fiche mentionne un `.FCBak` versionné sous `cases/electronique/cad/`. Un glob sur `**/*.FCBak` ne trouve rien dans cette copie. Ce point est hors cas, donc sans effet sur la décision, mais la fiche est peut-être périmée sur ce point.
