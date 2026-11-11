**Décision : refuser et renvoyer au worker par `fm-send`.** Je n'ai pas requalifié le statut ni corrigé la fiche.

Je n'ai pas pu faire trois contrôles. `Bash` est désactivé dans cette session, donc je n'ai ni lancé `reception ... --role s5` ni lu `git status` et `git diff 01b88f2..HEAD`. Le périmètre des fichiers touchés, la copie propre et la provenance MCP restent donc non vérifiés. Je n'ai pas relu les captures non plus. La revue ci-dessous porte sur les fichiers lus.

## Motif de refus 1 : écart de définitions ouvertes (étape 3, `method/contrat/reception.md`)

- **Contrôleur :** `summary` donne `maturity.definition = definition_encore_incomplete`. `open_items` contient `definition_scope`, et la maturité observée est `cao_numerique_verifiee`.
- **Manifeste :** `limits[]` déclare quatre définitions ouvertes (`manifest.json` lignes 3007 à 3019) :
  - cotes du module UnVision non mesurées ;
  - angle de façade de 20° estimé, œil du capitaine non mesuré ;
  - zone de pose sur la planche (planéité et matière non établies) ;
  - position de la prise micro-USB de la Nano estimée.
- **Fiche :** les `open_points` ne nomment aucune de ces quatre définitions. Ils parlent seulement de :
  - impression et essais physiques non faits ;
  - estimations en PETG ;
  - un lot méthode hors cas (README, `.FCBak`).
- **Règle :** le skill et `reception.md` qualifient d'écart une définition ouverte au contrôleur ou dans `limits[]` que la fiche ne nomme pas dans ses `open_points`. La fiche doit donc ajouter ces quatre définitions, avec une référence à `docs/mesures-a-fournir.md`. Le manifeste dit déjà « Pas de prototype prêt » pour cette raison, et la fiche affiche `prototype_ready: false` sans en donner les causes.

## Motif de refus 2 : budget dépassé sans arrêt ni autorisation (contrat, « Refus », avant-dernier motif)

- **Les chiffres :** `heavy_runs` vaut 13 pour un plafond `max_heavy_runs_per_brief` de 12. Le cumul S4 bis et S5 atteint 20.
- **Ce que dit la fiche :** le champ `depassement` existe, mais il écrit « dépassement remonté ici ». Il ne cite ni autorisation du second maître ni arrêt suivi d'une remontée.
- **Ce que montrent les commandes :**
  - la fiche indique que S5 avait annoncé aucune exécution lourde ;
  - onze passes TechDraw ont été lancées de suite, et la fiche précise que « toutes rendaient 'verifie' » ;
  - les reprises ne corrigeaient que des chevauchements relus en image.
- **Conclusion :** le worker a continué après le plafond au lieu de s'arrêter et de remonter, ce que le §13 de la méthode exige. Aucune preuve n'est non conforme, donc ce n'est pas encore une décision capitaine au sens du skill. Le worker doit citer l'autorisation reçue, ou le second maître doit trancher le dépassement.

## Ce qui est correct

- **Maturité :** `observed` est égale à `claimed` (`cao_numerique_verifiee`) et le verdict est `conforme`.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` apparaissent à la fois au contrôleur, dans `limits[]` et dans les `open_points`, avec la raison.
- **Invalidations :** `open_invalidations_before_execute` est vide, et `delivery --execute` est à 0.
- **Plans :** le dernier jeu a été relu sans chevauchement, sauf la cote 4 de la semelle au contact de l'arête de la lèvre. La fiche la signale, mais je n'ai pas vu les images, et ces plans n'ont pas de valeur de preuve.

## Message à envoyer au worker

1. Compléter les `open_points` avec les quatre définitions ouvertes de `limits[]` (module écran, angle de vision, zone de pose, prise Nano).
2. Réécrire `budget.depassement` pour citer l'autorisation reçue, ou l'arrêt suivi de la remontée.
3. Régénérer la fiche et re-pointer le manifeste si besoin, sans nouvelle exécution lourde. Ces corrections ne touchent que la fiche.

Après la correction, j'ai deux choses à faire. Je dois repasser `reception ... --role s5` avec `Bash` disponible, puis lire la copie propre avec `git status`. Si le dépassement n'a jamais été autorisé, je le remonte au capitaine.
