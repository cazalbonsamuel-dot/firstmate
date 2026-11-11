**Décision : je renvoie la remise au worker (`fm-send`), je n'accepte pas encore. Je ne remonte pas au capitaine.** Le seul point retenu est le budget. La revue de maturité ne relève aucun écart.

Je n'ai pas de Bash dans cette session. Je n'ai donc pas la sortie de `reception` (code de retour, `--fiche`, `--base`, `--role s5`) et je n'ai pas revérifié `git status`. Ma décision repose sur la sortie de `summary` que tu m'as donnée, la fiche, le manifeste, le contrat et la méthode.

## Revue de maturité (étape 3) : aucun écart

- **Niveau :** revendiqué et observé sont tous deux `cao_numerique_verifiee`, avec `prototype_ready: false`. La fiche (`results.maturite`) dit la même chose. Il n'y a ni refus de maturité ni écart.
- **`definition_scope` :** le manifeste n'en déclare pas (aucune occurrence). L'item `definition_scope` de `maturity.open_items` est donc l'item générique, qui n'est pas un écart (`method/contrat/maturite.md`).
- **Définitions ouvertes, `limits[]` contre `open_points` :**

| Définition ouverte | `limits[]` (manifeste) | `open_points[0]` (fiche) |
|---|---|---|
| Cotes du module UnVision | l. 3007 | cotes du module écran |
| Angle de façade estimé | l. 3008 | angle de vision |
| Planche : planéité et matière | l. 3009 | zone de pose |
| Prise micro-USB de la Nano | l. 3012 ("Définition ouverte") | prise de la Nano |

  La limite de synthèse (l. 3019) reprend les quatre, comme la fiche. Les deux listes correspondent dans les deux sens.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont dans `open_items` et dans `open_points[1]`.
- **Autres limites :** estimations, collage, verrou, pare-brise, PETG et périmètre ne sont pas des définitions. Leur absence des `open_points` n'est pas un écart.
- **Plans TechDraw**, relus en image (sans valeur de preuve) :
  - **Semelle :** la cote 4 touche l'arête de la lèvre, ce que la fiche admet.
  - **Façade :** les libellés Ø7 et Ø3,4 frôlent les perçages. Ce n'est pas un chevauchement franc, mais la fiche écrit "sans chevauchement" pour la façade.
  - **Coque :** rien à signaler.

## Motif de refus (étape 4) : budget dépassé sans autorisation ni arrêt

La remise n'a pas de motif mécanique : le champ `depassement` existe. Mais son contenu ne remplit pas la règle du contrat (« Fiche de remise »). Il doit citer l'autorisation du second maître ou l'arrêt et la remontée (§13).

- **Exécutions lourdes :** 13 contre un plafond de 12 dans la fiche. Au cumul S4 bis et S5, 20 contre 12 annoncées.
- **Plans TechDraw :** `method/iteration_budget.json` et le guide `method/guides/techdraw.md` fixent 2 exécutions par jeu de pages, et une troisième se justifie dans la fiche. Le worker en a fait 4 pour la façade, 4 pour la semelle et 3 pour la coque.
- **Cause évitable :** trois passes ont été perdues sur l'origine de coupe en x = 0, un piège que `--check` détecte et que le guide documente.
- **Autorisation :** le `depassement` ne cite aucune autorisation de ma part, et je n'en ai aucune trace.
- **Arrêt :** le worker n'a pas arrêté. Il a poursuivi et écrit "dépassement remonté ici" après coup.

Les preuves sont conformes et la maturité observée égale la maturité revendiquée. Ce n'est donc pas la décision 6 du §1, et rien ne remonte au capitaine.

## Autres remarques

- **Fiche :** `open_points[3]` signale un `.FCBak` versionné sous `cases/electronique/cad/`. `Glob **/*.FCBak` ne trouve aucun fichier sous `cases/`. Le worker doit confirmer ce point ou le retirer.
- **Non vérifié :**
  - les 7 captures de S4 bis, dont le digest est inchangé, ne sont pas relues contre les vues du brief ;
  - l'ordre d'intégration, la provenance MCP et le périmètre du brief n'ont pas pu être comparés, car le brief n'est pas dans le dépôt.

## Ce que j'envoie au worker (étape 5)

1. Corriger `budget.depassement` dans `s5-2026-11-10.json` : dire qu'aucune autorisation n'a été reçue et que le plafond a été franchi sans arrêt. Détailler les 13 exécutions lourdes (plafond 12) et les 4/4/3 passes TechDraw (plafond 2).
2. Confirmer ou retirer le point `.FCBak`.
3. Ensuite, `reception --role s5` sera relancée sur la nouvelle tête.

## À trancher de ton côté

Si tu préfères que je donne une autorisation a posteriori du dépassement, dis-le : ce serait ma décision de second maître, à consigner. Je ne la prends pas de moi-même, parce que ce serait baisser un critère pour accepter.
