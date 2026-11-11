Je finis la revue et je rends ma décision. Je n'ai rien modifié et n'ai relancé ni `delivery` ni `summary`.

## Revue de maturité (étape 3)

**`summary`**
- La maturité observée est `cao_numerique_verifiee`, égale à la maturité revendiquée. Ce n'est donc pas un motif de refus.
- `prototype_ready` est à false.
- `definition` vaut `definition_encore_incomplete`.
- `open_items` contient seulement `definition_scope`.
- Le manifeste n'a pas de bloc `definition_scope`. Le contrôleur ouvre donc l'item générique « Périmètre et définitions critiques non établis » (`method/check_method.py:494-498`). Il ne nomme aucune définition concrète.

**`limits[]` du manifeste (lignes 3004-3020) comparé aux `open_points` de la fiche**
- Les quatre définitions que la fiche déclare ouvertes sont aussi dans `limits[]` : module écran UnVision, angle de vision, zone de pose sur la planche, prise de la Nano. Ce sens-là est cohérent.
- Dans `limits[]`, des définitions ou hypothèses ouvertes ne figurent pas dans les `open_points` de la fiche :
  - Les enveloppes de composants estimées : écran, Nano, encodeur et bouton, supports de LED, fiche et câble USB, réserves de câblage. La masse de 37 g est aussi estimée.
  - Le pare-brise non modélisé, avec le passage du câble USB non vérifié.
  - Le collage non chiffré (pelage, traction, fatigue), avec 3 g comme accélération estimée.
  - Le verrou : propriétés du PC « typiques », facteur 0,5 en hypothèse, fluage et fatigue non calculés.
- L'item `definition_scope` du contrôleur (périmètre et inventaire critique non établis) n'est pas nommé non plus dans les `open_points`. La fiche ne le nomme pas et n'explique pas pourquoi le manifeste n'a pas de `definition_scope`.
- Le troisième `open_point` ne parle que du PETG. Le quatrième concerne un lot méthode hors du cas, ce qui est du bruit sans être un écart.

## Décision (étapes 4 et 5)

**Je ne peux pas accepter. Je renvoie au worker par `fm-send`.**

Motif 1, écart entre `limits[]` et `open_points` (étape 3, `method/contrat/reception.md`, `maturity.definition` et `open_items` doivent correspondre aux définitions déclarées ouvertes). À corriger :
- Nommer dans les `open_points` les enveloppes de composants estimées, le pare-brise et le câble USB, le collage et le verrou.
- Ou bien retirer ces entrées de `limits[]` si elles ne sont pas des définitions ouvertes, en le justifiant.
- Dire explicitement que `definition_scope` est absent et que le contrôleur ouvre donc cet item. Ne pas en ajouter un pour faire disparaître l'item : ce serait baisser un critère.

Motif 2, budget. C'est un point à vérifier, pas un refus mécanique.
- `heavy_runs` est à 13 pour un plafond de 12. Le cumul S4 bis et S5 est de 20.
- La fiche porte un champ `depassement`, donc la règle mécanique du contrat (ligne 136) est satisfaite sur la forme.
- Le texte dit « remonté ici ». Il ne cite ni autorisation du second maître ni arrêt. Le worker a continué jusqu'à 13 exécutions lourdes avant de remonter.
- Je n'ai pas relu le brief S5 ni le §13 pour trancher.
- Les preuves sont conformes, donc la décision 6 du capitaine (budget consommé sans preuve conforme) ne s'applique pas. Je signale quand même le dépassement au capitaine pour information.

**Ce qui reste à confirmer avant toute acceptation**
- Je n'ai pas vu la sortie de `reception ... --role s5` (code de retour) ni de `git status`. Il me faut `reception` à 0 et la copie propre.
- Il faut aussi la relecture des captures et des plans TechDraw. Les captures n'ont pas été rejouées en S5 : le digest de l'assemblage est inchangé, ce qui est cohérent. La lecture des images est à confier à un worker de revue si mon runtime ne les lit pas de façon sûre.
- Les captures de S4 bis ont été relues, mais pas par moi.

Après correction, S5 repart sur `cao-livraison`. Je ne l'accepte pas d'ici là.
