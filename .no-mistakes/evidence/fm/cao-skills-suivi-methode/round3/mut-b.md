Je lis la fiche, le manifeste et le contrat sans modifier de fichier. Mon outil Bash est désactivé : je n'ai donc ni `reception` ni `git status`, ni relu les captures en image. Voici ma décision d'après ce que j'ai lu.

## Décision : refus, la remise n'est pas acceptée

Le contrôleur n'est pas vert, et la revue trouve un écart. Je ne requalifie rien.

### Motifs de refus

1. **Maturité observée en dessous de la maturité revendiquée** (contrat, « Refus », `delivery` ou maturité).
   - `summary` rend `ok:false`, verdict `a_corriger`, erreur `native_maturity_unestablished` (`manifest.lifecycle_status`).
   - Il rend aussi `observed: non_etabli`, `native_proofs: []`, alors que le manifeste revendique `cao_numerique_verifiee` avec six `lifecycle_proofs` (`manifest.json:6-14`).
   - La fiche affirme l'inverse : « maturité revendiquée et observée cao_numerique_verifiee ».
   - Je ne peux pas dire si l'écart vient d'une absence de `freecadcmd` dans cette copie ou d'une preuve réellement périmée.
   - Dans les deux cas, la règle de `reception.md` interdit d'accepter une maturité que le contrôleur n'observe pas.
   - Le worker doit expliquer l'écart. Si la cause est mon environnement, il faut rejouer `delivery` et `summary` dans une copie avec `freecadcmd` avant toute acceptation.

2. **Empreinte du manifeste incohérente.**
   - `summary` donne `manifest_sha256` = `76bf6582…`.
   - La fiche déclare `547682cd…` pour `method/cases/inclinometre-jimny-boitier/manifest.json`.
   - C'est un fichier déclaré non re-pointé ou différent, motif de refus du contrat.
   - Je n'exclus pas une différence de méthode de calcul : à vérifier avec `reception`.

3. **Définitions ouvertes non alignées entre contrôleur, `limits[]` et fiche** (étape 3).
   - `limits[]` (`manifest.json:3012-3019`) déclare ouvertes quatre définitions : cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano.
   - Les `open_points` de la fiche ne nomment aucune de ces définitions. Ils parlent d'impression et d'essais non faits, du PETG à la place du PC, et de suivis de la méthode.
   - Côté contrôleur, `maturity.open_items` ne contient que `definition_scope`. Le manifeste n'a aucun `definition_scope` (recherche vide), donc le contrôleur ne voit pas ces quatre définitions.
   - Seuls CTRL-IMPRESSION et CTRL-ESSAIS-PHYSIQUES concordent entre `limits[]`, la fiche et le contrôleur.
   - Les deux sens de l'écart sont à corriger : la fiche doit nommer les définitions ouvertes, et le manifeste doit les porter dans un `definition_scope` ou une justification.

4. **Copie non propre.**
   - Le `git status` initial montre `M cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json`.
   - La fiche est modifiée dans la copie, alors que `reception` exige une copie propre et une fiche conforme au commit remis.
   - Une fiche réécrite est un motif de refus. Je ne peux pas relancer `git status` pour confirmer l'état actuel.

### À remonter au capitaine (décision 6 du §1)

- **Budget dépassé.** S5 a pris 13 exécutions lourdes pour un plafond de 12, soit 20 en cumul sur S4 bis et S5.
- Onze de ces exécutions sont des passes TechDraw de mise en page, qui rendaient toutes `verifie`.
- Le champ `depassement` existe, mais il constate l'excès après coup : il ne cite aucune autorisation du second maître et ne montre pas d'arrêt à 12.
- La fiche note qu'aucune exécution lourde n'était annoncée pour S5.
- Le capitaine doit trancher : régulariser ou refuser ce dépassement.

### Renvoi au worker, via `fm-send`

- Expliquer et corriger l'écart `native_maturity_unestablished` : `observed` doit atteindre `cao_numerique_verifiee`, ou la revendication doit être ramenée à ce qui est observé.
- Re-pointer l'empreinte du manifeste dans la fiche, ou expliquer la différence entre `547682cd…` et `76bf6582…`.
- Nommer dans `open_points` les quatre définitions ouvertes, et aligner `definition_scope` ou `open_items` avec `limits[]`.
- Remettre la fiche dans l'état du commit remis.

### Non fait

- Je n'ai pas relu les captures ni les plans TechDraw en image (étape 3). Les captures sont celles de S4 bis, non rejouées, avec un digest d'assemblage égal.
- Je n'ai pas contrôlé le périmètre des fichiers touchés ni la provenance MCP.

Ces relectures restent à faire à la prochaine remise.
