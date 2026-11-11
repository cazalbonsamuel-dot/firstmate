**Décision : refuser la remise S5 et la renvoyer au worker par `fm-send`. Pas d'acceptation, et rien à remonter au capitaine pour l'instant.** Je n'ai pas pu lancer `git status` : Bash est désactivé dans cette session. Je n'ai pas non plus de sortie de `reception`. Ces deux points restent à vérifier avant toute acceptation.

## Revue de maturité (étape 3)

- **`maturity` : cohérent.** Revendiqué et observé valent tous deux `cao_numerique_verifiee`, donc pas de refus pour maturité observée en dessous du revendiqué. Les cinq preuves natives sont retenues, `prototype_ready` est `false`, `definition` vaut `definition_encore_incomplete`.
- **`open_items`.** `definition_scope` est l'item générique d'un manifeste qui n'en déclare pas (aucune occurrence dans le manifeste) : ce n'est pas un écart. `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont déclarés `non_verifie` avec raison, et la fiche les nomme.
- **`limits[]` : plusieurs définitions déclarées ouvertes.**
  - « Définition ouverte : position de la prise micro-USB de la Nano estimée » (gel n°10).
  - « Pas de prototype prêt : définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) à mesurer par le capitaine ».
  - Les autres lignes (enveloppes estimées, collage, verrou, pare-brise, impression, périmètre) sont des estimations ou hypothèses, pas des définitions.
- **`open_points` de la fiche : aucune de ces définitions n'est nommée.** La fiche ne cite que l'impression et les essais, les estimations en PETG, et des suivis hors du cas.

## Motifs de refus

1. **Écart `limits[]` / `open_points`** (étape 3, `method/contrat/reception.md` et `method/contrat/maturite.md`). Quatre définitions ouvertes dans `limits[]` ne figurent pas dans les `open_points` de la fiche : cotes du module écran, angle de vision, zone de pose sur la planche, prise micro-USB de la Nano. Le contrat dit qu'une définition déclarée ouverte dans un seul des deux est un écart, et c'est un refus par l'étape 4. La correction relève du worker : compléter `open_points` ou aligner `limits[]`, puis re-pointer la fiche. Il ne doit pas fermer ces définitions pour la forme.
2. **Budget dépassé sans arrêt** (contrat « Refus » et §13). Le plafond est de 12 exécutions lourdes et le worker en a pris 13. Le champ `depassement` existe, donc le contrôle mécanique passe probablement. Mais le texte dit seulement « dépassement remonté ici » : il ne cite ni autorisation du second maître ni arrêt, alors que le brief annonçait aucune exécution lourde pour S5. Le worker a continué au lieu de s'arrêter.
   - **Plafond TechDraw non déclaré.** Le défaut de `method/iteration_budget.json` est de 2 exécutions par jeu de pages. La fiche en montre 4 pour la façade, 4 pour la semelle et 3 pour la coque, et le `depassement` ne les mentionne pas. Il faut le comparer à ce que le brief a fixé.
   - **Pas de décision 6 du §1.** Les preuves sont conformes, donc je ne remonte pas ce point au capitaine. En revanche je n'ai donné aucune autorisation. Le worker doit citer cette situation dans `depassement`, ou je la ratifie explicitement dans mon message.

## Points non bloquants

- **Captures et plans non relus.** Je n'ai relu aucune des six captures de S4 bis (non rejouées, digest égal) ni les PDF/SVG de plans. La fiche dit seulement que les dernières pages sont « relues sans chevauchement ». La comparaison avec les vues exigées par le brief reste à faire par un worker de revue distinct du concepteur si mon runtime ne lit pas les images de façon sûre.
- **Un `.FCBak` hors du cas.** La fiche signale un `.FCBak` versionné sous `cases/electronique/cad/`. Il n'existe pas dans cette copie, donc cette mention de la fiche est à corriger ou à justifier.

Après correction par le worker, je relance l'étape 2 sur la nouvelle tête de branche (`reception --role s5` y compris) avant de décider à nouveau.
