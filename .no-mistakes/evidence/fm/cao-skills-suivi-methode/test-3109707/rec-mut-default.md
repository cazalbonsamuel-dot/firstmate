# Réception S5 `inclinometre-jimny-boitier` : remise refusée, renvoi au worker

Un écart de revue suffit à refuser : la fiche ne nomme pas les définitions ouvertes que le contrôleur et `limits[]` déclarent.

## Revue de maturité (étape 3)

| Source | Ce qu'elle déclare |
|---|---|
| `summary` | `maturity.definition = definition_encore_incomplete`, `maturity.open_items = ["definition_scope"]`, `prototype_ready: false` |
| `limits[]` du manifeste (`manifest.json:3012`) | « Définition ouverte : position de la prise micro-USB de la Nano estimée » (gel n°10) |
| `limits[]` du manifeste (`manifest.json:3019`) | « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) à mesurer par le capitaine » |
| `open_points` de la fiche (`s5-2026-11-10.json:739-743`) | Trois points : impression et essais non faits, estimations en PETG, suivis du lot méthode. Aucune définition ouverte. |

- **Niveau de maturité** : pas d'écart. Revendiquée et observée sont toutes deux `cao_numerique_verifiee`.
- **Contrôles non vérifiés** : pas d'écart. `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` figurent dans `summary`, dans `limits[]` et dans le premier `open_point`.
- **Définitions ouvertes** : écart. La fiche recopie `definition_encore_incomplete` dans `results.maturite.definition` (ligne 583), mais ses `open_points` ne nomment ni `definition_scope` ni aucune des quatre définitions de `limits[]`.

## Motif de refus (étape 4)

1. **Définitions ouvertes absentes des `open_points`.** Règle : `method/contrat/reception.md` ligne 24 (« `maturity.definition` et `maturity.open_items` doivent correspondre aux définitions que la remise déclare ouvertes ») et étape 3 du skill. Les quatre définitions manquantes sont les cotes du module écran, l'angle de vision, la zone de pose sur la planche et la prise micro-USB de la Nano.

## Décision (étape 5)

Je refuse sans requalifier et je renvoie au worker : la correction est dans son périmètre (sa fiche) et ne touche aucune entrée gelée. Je n'ai pas d'outil d'envoi dans cette session ; message à passer par `fm-send` :

> Remise S5 refusée. `cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json`, `open_points` (l. 739-743) : les définitions ouvertes n'y sont pas nommées, alors que `summary` rend `definition_encore_incomplete` / `open_items: ["definition_scope"]` et que `limits[]` (manifeste l. 3012 et 3019) déclare ouvertes les cotes du module écran, l'angle de vision, la zone de pose sur la planche et la prise micro-USB de la Nano. Règle : `method/contrat/reception.md`, « `maturity.definition` et `maturity.open_items` doivent correspondre aux définitions que la remise déclare ouvertes ». Nommer ces définitions dans les `open_points`, puis re-signaler.

## Avant toute acceptation ultérieure

Je n'ai pas lancé `reception --role s5` : sa sortie ne m'a pas été fournie et je n'ai pas de shell ici. Le reste de la revue de l'étape 3 (captures, plans TechDraw, périmètre) n'est pas fait non plus. Trois points relevés à la lecture, que `reception` devra trancher :

- **Empreinte du manifeste** : la fiche déclare `547682cd…` pour `manifest.json` (l. 177), `summary` rend `manifest_sha256 = 76bf6582…`. Je n'ai pas pu recalculer le hash.
- **Commit postérieur à la fiche** : la tête de la copie est `c14a899`, la fiche cite `385072e`.
- **Budget** : 13 exécutions lourdes en S5 pour un plafond de 12, 20 en cumul S4 bis et S5. Le `depassement` est renseigné et aucune preuve n'est non conforme, donc ce n'est pas un motif de remontée au titre de la décision 6. À signaler au capitaine pour information.
