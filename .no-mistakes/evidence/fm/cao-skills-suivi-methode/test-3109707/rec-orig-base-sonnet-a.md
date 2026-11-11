**Décision : aucun motif de refus de l'étape 4 n'est établi. Je n'accepte pas encore, car deux vérifications restent ouvertes (ci-dessous). Je remonte au capitaine le dépassement de budget.**

## Revue de maturité (étape 3)

- **`maturity.claimed`** est `cao_numerique_verifiee`, et `observed` aussi (preuve du contrôleur). Le niveau observé n'est donc pas en dessous du niveau revendiqué. `prototype_ready` est à `false`, ce qui est cohérent.
- **`maturity.definition`** vaut `definition_encore_incomplete`, et `open_items` vaut `["definition_scope"]`. Ces deux valeurs correspondent à ce que déclarent `limits[]` du manifeste (lignes 3004 à 3019) et les `open_points` de la fiche :
  - `limits[]` déclare une définition ouverte : position de la prise micro-USB de la Nano estimée, et enveloppes de composants estimées. Il déclare aussi les cotes UnVision non mesurées, l'angle de façade estimé à 20°, la zone de pose, et « Pas de prototype prêt ».
  - `open_points` reprend les mêmes éléments : cotes UnVision, angle de vision, zone de pose, prise de la Nano.
- **`unverified_controls`** liste `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` en `non_verifie`. `limits[]` (« Impression non vérifiée », « Aucune qualification physique ») et les `open_points` les déclarent aussi, donc pas d'écart.

## Étape 4, motif par motif

- **Fiche absente, commande sans code ni durée :** aucun cas. Toutes les commandes ont un `rc` et un `duration_s`.
- **`delivery` différent de 0 :** non. Le `delivery` que tu as fourni est `ok`. La fiche donne `rc` 0 pour `delivery` et `delivery --execute`.
- **Liste des invalidations ouvertes :** `open_invalidations_before_execute` est vide, ce qui est conforme au prérequis de S5. Les `invalidated_proofs` sont tous couverts par `repointed_proofs` (9 sur 9).
- **`delivery --execute` :** lancé par le worker de S5, ce qui est autorisé.
- **`architecture_decision_not_validated`, `decision_record_malformed` :** aucun (`error_count` à 0). `DEC-ARCHI` est en `option_validee`.
- **`.FCBak` :** aucun trouvé dans cette copie. La fiche en signale un sous `cases/electronique/cad/` ; je n'en trouve pas ici et il est hors du cas de ce brief.
- **Captures :** les 7 PNG listés existent. Chacune a document, digest, vue, état et date, et le digest de `assemblage.FCStd` est identique pour les 7.
- **Chemin personnel absolu :** aucune occurrence dans le dossier du cas ni dans son manifeste.
- **Budget :** la fiche déclare `max_heavy_runs_per_brief` à 12 et 13 exécutions lourdes en S5. Le cumul S4 bis plus S5 est de 20, avec « aucune annoncée pour S5 ». Les itérations sont à 3 sur 3, donc dans la limite.
  - Le motif de refus est « dépassé sans arrêt ni remontée ». Ici il y a une remontée, mais seulement après coup dans la fiche, et le worker ne s'est pas arrêté.
  - Les 4 passes de mise en page TechDraw rendaient déjà `verifie` : le dépassement vient de reprises de lisibilité, pas de preuves non conformes.
  - Je ne tranche pas cela moi-même. Je remonte la question au capitaine, car elle relève de la décision 6 du §1.
- **Reste du motif sur les écrivains du manifeste, entrées gelées, autre cas, helpers `scripts/` :** non vérifié (voir ci-dessous).

## Ce que je n'ai pas pu vérifier

- **Git :** Bash est désactivé dans cette session. Je n'ai donc pas pu lancer `git merge-base --is-ancestor`, `git diff --name-only <commit> <branche>` (les commits après le `commit` de la fiche ne doivent toucher que la fiche), ni `git diff --stat <base>...<branche>`. Je n'ai pas non plus vérifié `git status` ni le périmètre du brief (entrées gelées, autres cas, `scripts/`). Cette moitié de l'étape 4 reste à faire par quelqu'un qui dispose d'un shell.
- **Étape 5 :** je n'ai pas ouvert les captures. Les 7 vues n'ont pas été rejouées en S5 (digest identique à S4 bis). Les plans TechDraw ont été relus par le worker lui-même, donc le concepteur. Le skill demande une lecture par un worker de revue distinct, et c'est ce que je recommande. Deux points à lui signaler :
  - la cote 4 de la semelle reste « au contact de l'arête de la lèvre » (lourde 9) ;
  - la fiche ne dit pas si la semelle livrée, celle de la lourde 11, a été relue.

## Suite

- Je n'accepte ni ne renvoie rien tant que les vérifications git et la revue des captures ne sont pas faites.
- Le capitaine doit décider du dépassement (13 pour 12). Les autres motifs de refus que j'ai pu contrôler sont tous négatifs.
- Si la revue des captures et les contrôles git sont propres, la remise S5 passe à `cao-livraison`.
