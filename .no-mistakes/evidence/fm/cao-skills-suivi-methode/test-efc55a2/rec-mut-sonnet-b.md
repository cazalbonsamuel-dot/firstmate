**Décision : refus, renvoi au worker S5. Je n'accepte pas.**

La revue de maturité (étape 3) a trouvé un écart. Il suffit à refuser (étape 4). Je n'ai rien modifié.

**Motif de refus : `limits[]` et `open_points` ne déclarent pas les mêmes définitions ouvertes** (`method/contrat/reception.md`, `method/contrat/maturite.md`).

- Le manifeste (`method/cases/inclinometre-jimny-boitier/manifest.json`, `limits[]`, vers les lignes 3004-3019) déclare des définitions ouvertes. La limite « Pas de prototype prêt » les liste : cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano. La limite « Définition ouverte : position de la prise micro-USB de la Nano estimée » en confirme une.
- Les `open_points` de la fiche (`cases/inclinometre-jimny-boitier/outputs/remises/s5-2026-11-10.json`, lignes 739-743) n'en nomment aucune. Ils ne citent que l'impression et les essais physiques, les estimations en PETG, et des suivis de la méthode hors de ce cas.
- `results.maturite.definition` de la fiche vaut pourtant `definition_encore_incomplete`. La fiche reconnaît donc que la définition est incomplète sans dire quoi.
- Le contrat compte cet écart dans les deux sens, y compris quand la fiche est muette sur une définition que `limits[]` déclare.

**Ce qui est conforme**
- **Maturité :** revendiquée et observée valent `cao_numerique_verifiee`, sans refus. `prototype_ready` est `false` et la fiche le dit.
- **`definition_scope` :** le manifeste n'en déclare pas, donc l'item générique `definition_scope` de `open_items` n'est pas un écart.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont nommés dans les `open_points` de la fiche. Ils concordent avec le `summary` et avec `limits[]`.
- **Estimations :** celles qui sont déclarées (PETG au lieu de PC, enveloppes de composants, collage, verrou) ne sont pas des définitions ouvertes. Elles ne comptent pas comme écart.

**Remarque sur le budget (ce n'est pas un motif de refus)**
- Le budget est de 13 exécutions lourdes pour un plafond de 12, avec un cumul de 20 sur les briefs S4 bis et S5.
- Le champ `depassement` est présent, ce qui est la condition du contrat. Il ne cite pourtant ni autorisation ni arrêt avant le dépassement, seulement « remonté ici », après coup.
- Aucune preuve n'est non conforme, donc la décision 6 du §1 ne remonte pas au capitaine. Je le signale au cas où tu juges que le dépassement mérite d'être remonté.

**Renvoi au worker S5 par `fm-send`**
Je n'ai pas `fm-send` ici, donc voici le message à lui envoyer :

> Refus S5. Les `open_points` de `outputs/remises/s5-2026-11-10.json` ne nomment pas les définitions que `limits[]` du manifeste déclare ouvertes : cotes du module écran (UnVision), angle de vision, zone de pose sur la planche, position de la prise micro-USB de la Nano. Ajoute-les aux `open_points`, relance l'étape de réception et republie la fiche avec son nouveau `commit`.

La correction touche seulement la fiche (pas encore intégrée), pas le manifeste ni les modèles. Elle ne devrait donc demander aucune exécution lourde.

**Ce que je n'ai pas fait**
- **Captures et plans TechDraw :** je n'ai pas relu les captures contre les vues du brief ni les plans (reste de l'étape 3).
- **`reception` :** je n'ai pas la sortie de `reception ... --role s5`. Elle devra être verte sur la fiche corrigée avant toute acceptation.
- **`git status` :** je n'ai pas vérifié que la copie est restée propre. Elle l'était au départ.
