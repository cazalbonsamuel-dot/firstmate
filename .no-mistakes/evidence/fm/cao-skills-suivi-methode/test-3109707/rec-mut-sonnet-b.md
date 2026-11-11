**Décision : refuser et renvoyer au worker S5 par `fm-send`, sans requalifier. Je n'accepte pas.**

Je n'ai relu que la fiche, les `limits[]` du manifeste (lignes 3004-3020) et les règles de réception. Je n'ai pas relu les captures, et je n'ai pas vu les sorties de `delivery` ni de `reception`, que tu m'as dit avoir déjà passés. Je n'ai pas non plus vérifié `git status`.

**Motif de refus : écart entre les définitions ouvertes et les `open_points` (étape 3, `method/contrat/reception.md` §24)**

- **Ce que dit le contrôleur.** `maturity.definition` vaut `definition_encore_incomplete`, et `maturity.open_items` contient `definition_scope`, avec `prototype_ready: false`.
- **Ce que déclarent les `limits[]`.** Elles nomment des définitions ouvertes :
  - ligne 3012 : « Définition ouverte : position de la prise micro-USB de la Nano estimée » ;
  - ligne 3019 : « définitions ouvertes (cotes du module écran, angle de vision, zone de pose sur la planche, prise de la Nano) ».
- **Ce que déclare la fiche** (`s5-2026-11-10.json` lignes 739-743). Ses trois `open_points` sont :
  - l'impression et les essais physiques non faits ;
  - les estimations en PETG ;
  - les suivis du lot méthode (README à sept cas, un `.FCBak`).
  
  Aucun ne nomme une définition ouverte : ni la prise micro-USB de la Nano, ni les cotes du module écran, ni l'angle de vision, ni la zone de pose, ni `definition_scope`.

Le skill classe l'écart dans les deux sens comme un refus. Ici, la définition est ouverte au contrôleur et dans `limits[]`, mais absente des `open_points`.

**Ce qui est conforme**

- `maturity.observed` (`cao_numerique_verifiee`) égale `claimed`. `prototype_ready` est à `false`, ce que la fiche reconnaît (`results.maturite`).
- Les deux contrôles `non_verifie` du résumé (`CTRL-IMPRESSION`, `CTRL-ESSAIS-PHYSIQUES`) sont bien nommés dans `open_points`.
- `open_invalidations_before_execute` est vide.

**À renvoyer au worker**

Compléter `open_points` pour nommer les définitions ouvertes déclarées dans `limits[]` : cotes du module écran, angle de vision, zone de pose, prise micro-USB de la Nano, et `definition_scope` absent. C'est du périmètre du worker. Si une `limits[]` ou une revendication devait changer, ce serait à lui de le faire aussi, pas à moi.

**Point à garder en vue, sans refus mécanique**

- **Budget.** La fiche indique 13 exécutions lourdes pour un plafond de 12 (`max_heavy_runs_per_brief`, lignes 726-738), et 20 cumulées sur S4 bis et S5.
- **Pourquoi ce n'est pas un refus mécanique.** `depassement` est présent, ce qui est la condition du contrat (ligne 136). Toutes les preuves sont conformes.
- **Réserve.** Le texte dit « dépassement remonté ici » : il ne cite ni autorisation du second maître ni arrêt. Le worker a continué à relancer des passes de mise en page TechDraw. Je le signale en même temps que le renvoi, car ce n'est pas un cas de remontée au capitaine, qui vise un budget consommé sans preuve conforme.

Après correction de la fiche, il faudra repasser `reception ... --role s5` et vérifier que la copie reste propre. Je n'ai lancé aucune commande et modifié aucun fichier.
