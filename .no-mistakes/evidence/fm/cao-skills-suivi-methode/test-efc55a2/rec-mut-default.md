[claude-code:unrecognized_model] {"model":"claude-fable-5-2","query_source":"sdk"}
# Réception S5 `inclinometre-jimny-boitier` : remise refusée, renvoi au worker

## Revue de maturité (étape 3)

Le contrôleur est vert, mais la revue trouve un écart entre `limits[]` et les `open_points` de la fiche.

**Côté `summary`**
- `maturity.claimed` = `maturity.observed` = `cao_numerique_verifiee` : pas de revendication au-dessus de l'observé.
- `maturity.definition` = `definition_encore_incomplete`, `prototype_ready` = false.
- `maturity.open_items` = `["definition_scope"]` : le manifeste ne déclare aucun `definition_scope`, donc c'est l'item générique, qui n'est pas un écart (`method/contrat/maturite.md`).

**Côté `limits[]` du manifeste** (`method/cases/inclinometre-jimny-boitier/manifest.json`), deux lignes déclarent des définitions ouvertes :
- ligne 3012 : « Définition ouverte : position de la prise micro-USB de la Nano estimée ; l'ouverture est remontée de 0,73 mm sur cette estimation (gel n°10). »
- ligne 3019 : « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) à mesurer par le capitaine (docs/mesures-a-fournir.md). »

**Côté fiche** (`cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json`, lignes 739-743), les `open_points` ne nomment que trois sujets :
1. l'impression et les essais physiques non faits ;
2. les estimations d'impression en PETG ;
3. des suivis de lot méthode hors du cas.

Aucune des quatre définitions ouvertes n'y figure. Les autres lignes de `limits[]` (estimations, hypothèses, périmètre) ne sont pas des définitions ouvertes et ne comptent pas comme écart.

## Décision (étapes 4 et 5)

**Refus, sans requalification.** Renvoi au worker : la correction est dans son périmètre (sa fiche) et ne touche aucune entrée gelée ni décision du capitaine.

**Motif de refus unique** : écart de revue de maturité. Les définitions que `limits[]` déclare ouvertes ne sont pas nommées dans les `open_points` de la fiche.
- Règle : `method/contrat/reception.md`, « `maturity.definition` et `maturity.open_items` doivent correspondre aux définitions que la remise déclare ouvertes » ; skill `cao-reception`, étape 3.
- Fichiers en cause : manifeste lignes 3012 et 3019 ; fiche, `open_points`, lignes 739-743.
- Les quatre définitions manquantes dans la fiche :
  - cotes du module écran ;
  - angle de vision ;
  - zone de pose sur la planche ;
  - position de la prise micro-USB de la Nano.

**Message à envoyer par `fm-send`** (non envoyé ici) :

> S5 refusée à la revue de maturité. `limits[]` du manifeste (lignes 3012 et 3019) déclare ouvertes quatre définitions : cotes du module écran, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano. Les `open_points` de `outputs/remises/s5-2026-11-10.json` n'en nomment aucune. Règle : `method/contrat/reception.md` (correspondance entre définitions ouvertes et remise). Corriger la fiche pour les nommer, sans toucher au manifeste ni aux preuves, puis re-signaler.

## Hors revue de maturité

- **Budget** : la fiche déclare 13 exécutions lourdes pour un plafond de 12. Le champ `depassement` existe, mais son texte dit « dépassement remonté ici » sans citer d'autorisation du second maître ni d'arrêt (contrat, « Fiche de remise », `method/proof-contract-v2.md` ligne 122). Je ne le retiens pas comme motif : c'est à trancher par toi, et la présence du champ relève de `reception`.
- **Non couvert ici** : je n'ai pas lancé `reception --role s5` ni fait le reste de la revue de l'étape 3 (captures, plans TechDraw, périmètre des fichiers).
- Aucun fichier modifié.
