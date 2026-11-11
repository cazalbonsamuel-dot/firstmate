**Décision : refuser la remise S5 et la renvoyer au worker par `fm-send`. Un des motifs relève du capitaine.** Le contrôleur n'est pas vert et la revue trouve des écarts.

Je n'ai pas d'outil shell dans cette session. Je n'ai donc pas lancé `reception`, ni `git status`, ni lu les captures en image. Tout ce qui suit vient de la vue `summary` fournie, de la fiche, du manifeste et du contrat.

## Motifs de refus

1. **Maturité observée en dessous de la maturité revendiquée.**
   - `summary` donne `claimed: ["cao_numerique_verifiee"]` et `observed: "non_etabli"`, avec `native_maturity_unestablished` (`manifest.lifecycle_status`) et `native_proofs: []`.
   - Le contrat refuse la remise quand la maturité observée est sous un niveau revendiqué (« Refus », 5e puce ; `reception.md`).
   - Le plus probable est que `freecadcmd` manque dans cette copie, ce qui rend `non_etabli` par construction. Dans ce cas je ne peux pas accepter de maturité, et je ne requalifie rien.
   - Si `freecadcmd` est présent ici, c'est la remise qui est en cause.

2. **La fiche contredit le contrôleur.**
   - La commande `summary` de la fiche note « conforme, controles_reussis, maturité revendiquée et observée cao_numerique_verifiee », et `results.maturite.observee` dit la même chose.
   - Ma copie donne `ok:false`, `verdict: a_corriger`, `numeric_verdict: controles_partiels` et `observed: non_etabli`.
   - Soit la fiche décrit un autre état que celui reçu, soit elle est fausse. Le worker doit expliquer l'écart.

3. **Écart sur les définitions ouvertes (étape 3).**
   - Le contrôleur ouvre `definition_scope` (`open_items`, `definition: definition_encore_incomplete`).
   - Le manifeste ne contient aucun `definition_scope`.
   - `limits[]` déclare des définitions ouvertes : prise micro-USB de la Nano estimée (l. 3012), et à mesurer par le capitaine : cotes du module écran, angle de vision, zone de pose, prise de la Nano (l. 3019).
   - Les `open_points` de la fiche ne nomment aucune de ces définitions ouvertes. Ils citent seulement CTRL-IMPRESSION, CTRL-ESSAIS-PHYSIQUES, le profil PETG et des suivis hors cas.
   - Le contrat exige que ces trois sources se correspondent (`reception.md`).
   - La fiche omet aussi `definition_scope` lui-même, que le contrôleur lui oppose.

4. **Copie non propre.**
   - Le `git status` de départ montre `M cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json`.
   - La fiche modifiée dans l'arbre de travail n'est donc pas celle du commit remis.
   - `reception` exige une copie propre et compare la fiche au commit. Une fiche intégrée est figée. À vérifier au `git diff` : qui a modifié la fiche, et quand.

5. **Budget dépassé.**
   - La fiche porte bien un `depassement`, et elle annonce 13 exécutions lourdes pour un plafond de 12, soit 20 au cumul sur S4 bis et S5. Ce n'est donc pas un refus mécanique.
   - Le texte dit qu'il est « remonté ici » et ne cite aucune autorisation du second maître (§13). Il porte surtout sur quatre passes de mise en page TechDraw, sans preuve non conforme.
   - Ce n'est pas à moi de l'accepter, **donc à remonter au capitaine** (décision 6 du §1).

## Points relevés qui ne motivent pas le refus

- Les limites de capture sont déclarées. Elles décrivent des vues relues, qui ne prouvent pas le fonctionnement.
- La fiche signale un `.FCBak` versionné sous `cases/electronique/cad/` et un décompte obsolète dans `method/README.md`. Ces points sont hors cas et ne bloquent pas la remise.
- Les plans TechDraw sont relus par le worker, avec un reste connu (cote 4 de la semelle au contact de l'arête de la lèvre). La mise en page n'a pas de valeur de preuve.
- Les chemins personnels absolus : aucun dans `cases/inclinometre-jimny-boitier`.

## À envoyer au worker

1. Dire pourquoi `observed` est `non_etabli` dans cette copie alors que la fiche dit `cao_numerique_verifiee`, et rejouer sur un poste avec `freecadcmd`.
2. Aligner les `open_points` de la fiche sur `limits[]` et sur `definition_scope` (définitions ouvertes à mesurer, prise de la Nano).
3. Expliquer l'écart de la fiche avec son commit et rendre une copie propre, avec une fiche de remise correcte (`s5-2026-11-10-2.json` si la première est déjà intégrée).

Je ne modifie aucun fichier et je ne baisse aucun critère.
