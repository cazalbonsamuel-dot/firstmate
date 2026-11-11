Décision : je refuse la remise S5 et la renvoie au worker (`fm-send`). La maturité elle-même est en ordre. Je n'ai pas accès à Bash dans ce poste : je n'ai pas pu lancer `reception ... --role s5` ni `git status`, ni relire les captures. Je me suis donc limité à la lecture de la fiche, du manifeste et du contrat.

## Revue de maturité (étape 3)

- **Niveau revendiqué et observé :** `cao_numerique_verifiee` des deux côtés, sans écart de niveau. `delivery --execute` est fait (fiche, ligne `S5 lourde 13`).
- **`definition_encore_incomplete` contre `limits[]` et `open_points` :** les définitions ouvertes de `limits[]` sont les cotes du module UnVision, l'angle de façade, la planéité et la matière de la planche, et la prise micro-USB de la Nano. Le premier `open_points` de la fiche nomme le module écran, l'angle de vision, la zone de pose et la prise de la Nano. Il n'y a pas d'écart dans un sens ni dans l'autre.
- **`definition_scope` :** le manifeste n'en déclare aucun (aucune occurrence dans `method/cases/inclinometre-jimny-boitier/manifest.json`). L'item `definition_scope` de `open_items` est donc générique, et `method/contrat/maturite.md` dit que ce n'est pas un écart.
- **`CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` non vérifiés :** la fiche les cite dans son deuxième `open_points`.
- **Estimations PETG, enveloppes estimées, collage et verrou :** ces limites figurent dans `limits[]` et dans la fiche. Ce sont des hypothèses, pas des définitions ouvertes.
- **`prototype_ready` :** `false` partout, ce qui est cohérent.

## Motifs de refus

1. **Empreinte du manifeste différente de celle de la fiche.**
   - `summary` donne `manifest_sha256` = `76bf6582cd3bd670d8aaa5fb860eb6e73892a2cc2b2082240e39a70917df3553`. C'est le sha256 du fichier (`method/check_method.py:1012`).
   - La fiche déclare pour `method/cases/inclinometre-jimny-boitier/manifest.json` : `547682cd56baa87f51897793d79dc9eb91c0820127df04020c9264f92cacd24f` (`delivered_files`).
   - Si ces deux valeurs portent bien sur le même fichier, le manifeste a été modifié après le re-pointage de la fiche. C'est le motif « fichier déclaré non re-pointé » du contrat, section « Refus ».
   - Je n'ai pas pu recalculer le hash moi-même. Il faut le confirmer par `reception` ou `shasum`, y compris l'écart de commit entre le `385072e` de la fiche et `HEAD`.

2. **Budget dépassé sans arrêt ni autorisation citée.**
   - Le plafond du brief est de 12 exécutions lourdes (`max_heavy_runs_per_brief`). La fiche en compte 13 pour S5 et 20 au cumul S4 bis plus S5.
   - Le champ `depassement` existe, mais il ne cite ni autorisation du second maître ni arrêt. Il dit seulement « dépassement remonté ici ».
   - Le worker a donc continué après le plafond. La règle du contrat (« un budget dépassé sans arrêt ni remontée ») et la méthode §13 attendent un arrêt et une remontée avant de poursuivre.
   - Quatre passes TechDraw rendaient déjà « verifie » et ne servaient qu'à lisser la mise en page.

## Ce que je n'ai pas pu relire

- **Captures et plans TechDraw :** ils sont à relire contre les vues du brief par un worker de revue distinct du concepteur. Les captures sont des reprises de S4 bis à digest égal. La seule réserve visible dans la fiche est « cote 4 au contact de l'arête de la lèvre » sur la semelle.
- **Entrée hors périmètre :** la fiche signale un `.FCBak` versionné sous `cases/electronique/cad/`, et `Glob` n'en trouve aucun dans cette copie. À confirmer par la liste des fichiers touchés contre le périmètre du brief.

## Renvoi au worker

Le renvoi porte sur ces deux points, qui relèvent du second maître et non du capitaine : les preuves sont conformes, donc la décision 6 du §1 ne s'applique pas.
- **Point 1 :** re-pointer la fiche et le manifeste de façon cohérente (même hash), puis vérifier que `reception --role s5` rend 0.
- **Point 2 :** reformuler `depassement` pour dire ce qui s'est réellement passé. Le worker n'a pas d'autorisation à citer ; si elle manque, la remontée appartient au second maître.

Je n'ai pas requalifié la maturité et je n'ai modifié aucun fichier.
