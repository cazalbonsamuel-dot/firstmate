[claude-code:unrecognized_model] {"model":"claude-fable-5-2","query_source":"sdk"}
**Décision : je n'accepte pas la remise S5 en l'état, et je la renvoie au worker.** La revue de maturité est sans écart, mais l'empreinte du manifeste ne correspond pas à la fiche, et `reception` n'a pas été lancé.

## Revue de maturité (étape 3)

Aucun écart entre `summary`, `limits[]` et les `open_points` de la fiche.

- **Niveau** : revendiqué `cao_numerique_verifiee`, observé `cao_numerique_verifiee`, donc pas d'observé sous le revendiqué. `prototype_ready: false` et `definition_encore_incomplete` sont identiques dans `results.maturite` de la fiche.
- **`open_items: ["definition_scope"]`** : le manifeste ne déclare aucun `definition_scope` ni `definition_item`. C'est l'item générique, pas un écart (`method/contrat/maturite.md`).
- **Définitions ouvertes** : `limits[]` en déclare quatre (manifeste lignes 3012 et 3019), et le premier `open_point` de la fiche nomme les quatre.

| Définition ouverte dans `limits[]` | Nommée dans `open_points` |
|---|---|
| Cotes du module écran UnVision | oui |
| Angle de vision (œil) | oui |
| Zone de pose sur la planche | oui |
| Prise micro-USB de la Nano | oui |

- **Sens inverse** : la fiche ne nomme aucune définition ouverte que `limits[]` ignore.
- **Autres limites** (consigne Suzuki, température de l'écran, enveloppes estimées, collage, verrou, pare-brise, impression en PETG, électronique hors périmètre) : ce sont des estimations et hypothèses, pas des écarts.
- **Contrôles non vérifiés** : `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` de `summary` sont repris dans le deuxième `open_point`.

## Motifs de refus (étape 4)

1. **Le manifeste n'est pas celui que la fiche déclare.**
   - La fiche donne pour `method/cases/inclinometre-jimny-boitier/manifest.json` le sha256 `547682cd…cacd24f` (`delivered_files`, ligne 177).
   - `summary` donne `manifest_sha256: 76bf6582…df3553`, qui est le hash brut du fichier (`method/check_method.py:1012`).
   - Le manifeste a donc changé après la fiche, ou la fiche n'a pas été re-pointée. Règle : contrat, « Refus », « modification du manifeste […] hors des lignes des fichiers déclarés dans la fiche, ou un fichier déclaré non re-pointé ».
   - Je n'ai pas recalculé le hash moi-même (pas de shell dans cette session) : le constat repose sur la sortie `summary` que tu m'as donnée.

2. **`reception` n'a pas tourné.**
   - L'étape 2 exige `check_method.py reception … --fiche cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json --base 01b88f2 --role s5`, et seuls `delivery` et `summary` ont été lancés.
   - Les refus mécaniques ne sont donc pas contrôlés : commits postérieurs au commit `385072e` de la fiche, hash de preuve réécrit, chemins personnels, identité des captures.
   - Ce n'est pas un défaut du worker, mais je ne peux pas accepter sans.

## Budget : pas un refus, mais à signaler

- **Exécutions lourdes** : 13 pour un plafond de 12, et 20 en cumul S4 bis + S5.
- **Plans TechDraw** : 4 exécutions pour la façade, 4 pour la semelle, 3 pour la coque, contre 2 par jeu de pages (`method/iteration_budget.json`).
- `budget.depassement` est présent et toutes les preuves sont conformes : le motif mécanique du contrat (« sans `depassement` ») ne joue pas, et la décision 6 du capitaine non plus.
- En revanche le texte ne cite ni autorisation du second maître ni arrêt, alors que le contrat le demande (ligne 122) : le worker a continué et déclare après coup. À faire corriger dans la même reprise.

## Suite (étape 5)

- **Renvoi au worker** par `fm-send` (non envoyé depuis cette session) avec le point exact : empreinte du manifeste de la fiche `547682cd…` différente de celle du fichier `76bf6582…` ; re-pointer dans une nouvelle remise cohérente avec son commit, et compléter `depassement`.
- **À la nouvelle remise** : relancer l'étape 2 en entier, `reception --role s5` compris, puis vérifier que la copie est propre.
- **Pas de remontée au capitaine** : rien ici ne relève de ses décisions.
- **Hors de cette revue** : la relecture des captures et des plans TechDraw n'a pas été faite ; elle reste due avant acceptation.
