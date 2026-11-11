**Décision : je n'accepte pas la remise S5. Je ne la renvoie pas encore au worker et je ne remonte pas encore au capitaine.** Le seul refus est mécanique et vient peut-être de l'environnement. À lever d'abord, par un rejeu de `summary` et `reception` sur une copie qui a `freecadcmd`.

Je n'ai pas pu lancer Bash ici : pas de `git status`, pas de `reception`, pas de vérification de `freecadcmd`. Je n'ai pas non plus relu les captures ni les plans TechDraw (SVG et PDF).

## Motif de refus (étape 4)

**Maturité observée en dessous de la maturité revendiquée.** C'est un motif du contrat (« Refus », `method/proof-contract-v2.md:130`).
- `summary` donne `claimed: ["cao_numerique_verifiee"]` et `observed: "non_etabli"`, avec `native_proofs: []`.
- Il remonte l'erreur `native_maturity_unestablished` sur `manifest.lifecycle_status`, et `ok: false`, verdict `a_corriger`.
- Le manifeste déclare six preuves natives dans `lifecycle_proofs`, que le contrôleur n'observe pas.
- La fiche dit l'inverse (`results.maturite.observee` et la note de la commande `summary`) : « conforme, controles_reussis, observée cao_numerique_verifiee ». Cette sortie ne se reproduit pas dans cette copie.

Deux causes possibles, que ces fichiers ne permettent pas de départager :
- **Environnement.** `freecadcmd` est absent ou injoignable dans cette copie. Le serveur MCP freecad est d'ailleurs en échec de connexion. Le skill et `method/contrat/reception.md` disent alors : maturité `non_etabli` par construction, cohérence contrôlable, maturité non acceptable.
- **Défaut de la remise.** Empreintes ou preuves natives qui ne se rejouent pas.

Je ne requalifie rien. Tant que ce point n'est pas levé, je n'accepte pas.

## Revue de maturité (étape 3)

- **Définitions ouvertes : pas d'écart.**
  - Le contrôleur donne `definition_encore_incomplete` et `open_items: ["definition_scope"]`.
  - `limits[]` déclare ouverts : cotes du module UnVision, angle de façade (œil non mesuré), planéité et matière de la planche, prise micro-USB de la Nano. Elle déclare aussi : aucune impression, aucun essai, « Pas de prototype prêt ».
  - Les `open_points` de la fiche nomment les mêmes éléments : module écran, angle de vision, zone de pose sur la planche, prise de la Nano, impression et essais non faits, PETG faute de profil PC.
  - Les contrôles non vérifiés (`CTRL-IMPRESSION`, `CTRL-ESSAIS-PHYSIQUES`) sont déclarés dans les trois sources.
- **Revendication.** `cao_numerique_verifiee` est la maturité que le manifeste revendique et que la fiche dit observée. Elle n'est pas confirmée ici (voir le motif de refus).
- **Prototype.** `prototype_ready: false` partout, cohérent.

## Point à vérifier, pas un motif de refus

- **Budget.**
  - La fiche annonce 13 exécutions lourdes pour un plafond de 12 par brief (20 cumulés sur S4 bis et S5). Quatre passes TechDraw ne corrigeaient que des chevauchements relus en image.
  - Le champ `depassement` existe, donc le refus mécanique « sans `depassement` » ne s'applique pas. Mais il dit « dépassement remonté ici » et ne cite ni autorisation du second maître ni arrêt préalable.
  - À comparer au brief et au §13, qui demande de s'arrêter et de remonter. Si le brief n'a rien autorisé, ce serait un dépassement sans arrêt, donc à remonter au capitaine (décision 6 du §1).
- **Avertissement FreeCAD.** `hasher mismatch` est signalé par le worker comme sans effet sur le résultat.

## Suite

1. Rejouer `summary` puis `reception ... --role s5 --base 01b88f2` (tête de la branche du cas avant S5) sur une copie propre disposant de `freecadcmd`, puis vérifier `git status`.
2. Si `observed` passe à `cao_numerique_verifiee` et que `reception` rend 0 : le refus tombe. Il reste alors la lecture des captures et des plans (`method/guides/captures.md` et `techdraw.md`), l'ordre d'intégration, la provenance MCP, le périmètre des fichiers et le budget, puis `cao-livraison`.
3. Si `non_etabli` persiste avec `freecadcmd` : refus confirmé, renvoi au worker par `fm-send` avec la règle, `manifest.lifecycle_status` et l'erreur `native_maturity_unestablished`, et la contradiction avec la note de sa propre commande `summary`.
