**Décision : renvoyer au worker, je n'accepte pas S5.** La maturité est cohérente, mais la revue relève deux écarts : les `open_points` de la fiche sont incomplets, et le budget a été dépassé sans autorisation ni arrêt. Je n'ai pas pu faire le reste du contrôle (voir en fin de message).

## Maturité (étape 3)
- **Niveau :** `claimed` et `observed` valent tous deux `cao_numerique_verifiee`, sans écart. La fiche (`results.maturite`) dit la même chose que `summary`. Il n'y a donc pas de refus sur le niveau.
- **Définition :** `definition_encore_incomplete`, avec `open_items: ["definition_scope"]`. Le manifeste n'a aucun `definition_scope`, donc la définition reste non établie par construction (`maturite.md`). `prototype_ready` est à `false`. Le worker ne revendique pas plus, c'est cohérent.
- **Contrôles non vérifiés :** `CTRL-IMPRESSION` et `CTRL-ESSAIS-PHYSIQUES` sont nommés dans la fiche, donc concordants.

## Motifs de refus

**1. Écart `limits[]` / `open_points` (étape 3, `reception.md`).** La règle est qu'une définition ouverte dans `limits[]` ou au contrôleur doit être nommée dans les `open_points`. Les `open_points` de la fiche (lignes 739-744) nomment seulement quatre définitions : cotes UnVision, angle de vision, zone de pose et prise de la Nano. Restent absents de la fiche, alors que `limits[]` du manifeste (lignes 3004-3019) les déclare :
- le pare-brise non modélisé, avec le passage du câble USB non vérifié ;
- les enveloppes estimées de composants : écran, encodeur et bouton, supports de LED, fiche et câble USB, réserves de câblage, plus la masse de 37 g ;
- le collage : pelage, traction, fatigue et adhérence sur la planche réelle non chiffrés, l'accélération de 3 g étant estimée ;
- le verrou : propriétés PC « typiques », facteur 0,5 en hypothèse, fluage et fatigue non calculés ;
- la planéité et la matière du dessus de planche, que la fiche ne couvre que par « zone de pose » ;
- `definition_scope` absent, avec l'électronique et le firmware hors périmètre. Le contrôleur le liste en `open_items` et la fiche ne le nomme pas.

Le worker doit soit nommer ces points dans les `open_points`, soit montrer qu'ils sont fermés. Il ne doit pas retirer d'entrée de `limits[]`.

**2. Budget (méthode §13 et contrat, « Refus »).**
- La fiche déclare 13 exécutions lourdes pour S5, contre un plafond de 12. Le cumul S4 bis + S5 est de 20.
- Le `depassement` écrit lui-même « aucune [annoncée] pour S5 ». Il ne cite ni autorisation du second maître ni arrêt du worker. Il dit « remonté ici », c'est-à-dire après coup, alors que le contrat demande l'autorisation reçue ou l'arrêt suivi de la remontée.
- Le plafond TechDraw est de 2 exécutions par jeu de pages (`iteration_budget.json`). La fiche en compte 4 pour la façade, 4 pour la semelle et 3 pour la coque. Le guide n'admet une troisième que si elle est justifiée, et la quatrième ne l'est pas. Le motif « chevauchements relus en image » n'est pas une justification de dépassement.
- Le champ `depassement` existe, donc le contrôle mécanique du contrat ne refuse pas ce point. Mais il ne remplit pas ce que le contrat exige de lui, et c'est un écart de revue. Les exécutions sont déjà faites : le worker peut seulement reformuler le `depassement` pour dire qu'aucune autorisation n'existait et qu'il n'a pas arrêté.

Il n'y a pas de remontée au capitaine sur ce motif : les preuves sont conformes, donc la décision 6 du §1 ne s'applique pas. En revanche, je lui signale pour information que les limites « écran à 70/80 °C sur planche à 85 °C » et « consigne Suzuki en défaut » sont des choix déjà actés par lui.

## Ce que je n'ai pas pu faire
- Le Bash est désactivé dans cette session. Je n'ai donc pas pu faire le `git status` de l'étape 2, ni lancer `reception ... --role s5`. Vous ne m'avez transmis que la sortie de `summary`. Il me faut le code de sortie de `reception` et un `git status` propre avant toute acceptation.
- Je n'ai pas relu les captures ni les plans TechDraw. La fiche affirme que les pages ont été relues sans chevauchement, sauf la cote 4 de la semelle, au contact de l'arête de la lèvre, ce qui reste à confirmer en image.
- Je n'ai pas comparé les fichiers touchés au périmètre du brief.

Prochaine étape : un `fm-send` au worker avec les deux points ci-dessus. Ensuite, nouvelle réception avec `reception`, `git status` et la relecture des images.
