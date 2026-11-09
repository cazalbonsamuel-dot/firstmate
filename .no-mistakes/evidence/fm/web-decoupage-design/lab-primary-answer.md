# Exercice à blanc - réponse du capitaine à la planche : « B, avec le titre de A »

Cadre : home web de labo, aucun worker lancé, aucun script, rien écrit hors de ce dossier.
Skills appliqués : `web-mise-au-point` (découpage et boucle de la maquette) et `web-worker-brief` (forme et preuves des briefs).

Une question à poser avant la première tâche : « le titre de A » désigne-t-il le texte du titre du premier écran de A, ou son traitement typographique ? Sans réponse, lecture retenue : les deux (mots et typographie du titre de A, posés dans la structure de B), et la citation exacte du capitaine est portée telle quelle dans le DESIGN.md.

## 1. Tâches jusqu'à la construction

Avant toute tâche, action du firstmate seul (pas un worker) : écrire dans la note de l'item du backlog la liste ordonnée des sections de l'accueil, tirée du schéma de B, premier écran en tête ; matière A du plan de contenu au premier écran, matière B dans les sections, C aux autres pages. La maquette part du code de B, copié depuis le dossier de données de son scout.

1. **DESIGN.md (en mise au point)** - scout rédacteur (ni constructeur ni relecteur). Il l'écrit sous son dossier de données à partir du code de B, de la note « titre de A », et du DESIGN.md UXKIN d'une référence retenue s'il y en a une (logique reprise, jamais les valeurs ni les composants d'un autre type de site). Il porte la citation « B, avec le titre de A », la version de la planche présentée, les deux ou trois moments signature, chaque écart aux repères avec sa raison, et la mention « en mise au point ».
   Tenu pour le capitaine : rien à ce stade ; toute modification avant l'accord est une décision du firstmate, écrite par un scout.

2. **Section : Premier écran** - scout constructeur, contexte neuf. Entrées figées nommées avec leur chemin : DESIGN.md en mise au point, matière A, `VOIX.md`, maquette telle qu'elle est et ses captures, captures des références de B (et le premier écran de A pour le titre). Trois à cinq critères de fin vérifiables sur capture ; captures 1440 et 375 px de la section et de la page entière. Ne touche qu'à sa section ; remonte `needs-decision [key=relecture]` au firstmate.
   Tenu pour le capitaine : rien ; la décision ouverte est pour le firstmate.

3. **Relecture : Premier écran** - scout relecteur distinct, contexte neuf, n'a rien construit. Compare à la même largeur face aux références et au DESIGN.md ; rend les trois écarts les plus visibles (où, quoi, valeur attendue) ou dit qu'il n'en voit plus ; juge aussi la page entière. Remonte `needs-decision [key=ecarts]`.
   Boucle tenue par le firstmate (relais des écarts et des nouvelles captures par `--resolve-key`), trois à six tours pour le premier écran ; au-delà, le blocage est montré au capitaine avec captures.
   Tenu pour le capitaine : rien, sauf un blocage de la boucle.

4. **Planche du premier écran** - scout présentateur. Captures 1440 et 375 à côté de celles des références, puis une seule question : valider, ou changer avec une note.
   Tenu pour le capitaine : la validation du premier écran. La suite de l'accueil est tenue en attendant (`captain-hold-lifecycle`) ; une note de changement relance la boucle des tâches 2 et 3.

5. **Section : <2e section de B>** - scout constructeur neuf, mêmes entrées que la tâche 2 plus le rapport du constructeur précédent (maquette et captures) ; ne démarre qu'après la validation du premier écran.
   Tenu pour le capitaine : rien.

6. **Relecture : <2e section de B>** - scout relecteur neuf ; boucle d'un à trois tours tenue par le firstmate.
   Tenu pour le capitaine : rien, sauf blocage.

7. à N. **Section / Relecture : <sections suivantes de B>** - même paire constructeur neuf / relecteur neuf pour chaque section, dans l'ordre de la liste, une section ne démarrant pas avant que la précédente ait passé sa relecture.
   Tenu pour le capitaine : rien, sauf blocage.

N+1. **Passe d'ensemble** - un constructeur et un relecteur neufs, page entière face aux références : rythme, transitions, cohérence, densité ; boucle de trois à six tours.
   Tenu pour le capitaine : rien, sauf blocage.

N+2. **Mobile** - un scout reprend la page à 375 px, vérifiée à la main (matière A et bouton au premier écran, le reste en un défilement), captures ; puis un tour de relecture par un relecteur distinct.
   Tenu pour le capitaine : rien.

N+3. **Planche de l'accueil** - scout présentateur. Page entière à 1440 et 375 à côté des références, une seule question : valider, ou changer avec une note.
   Tenu pour le capitaine : la validation de l'accueil complet ; la construction dans le projet est tenue en attendant.

N+4. **Figer le DESIGN.md** - scout rédacteur : retire « en mise au point », date l'accord du capitaine.
   Tenu pour le capitaine : toute modification du DESIGN.md après cette date.

N+5. **Construction de l'accueil** - premier ship (la seule tâche qui écrit dans le projet) : DESIGN.md figé et ses tokens avec la citation du capitaine, puis l'accueil à partir de la maquette validée, avec les preuves du kit (captures 375/768/1440 avant et après, Lighthouse cinq passes en médiane, axe, html-validate, lychee, knip, size-limit, URL d'aperçu), selon le mode de livraison du projet.
   Tenu pour le capitaine : la fusion de la PR, sauf posture yolo enregistrée. Les autres pages suivent ensuite, une page par ship, texte avant page.

Ce qui reste au firstmate tout du long : la liste et l'ordre des sections, les critères de fin de chaque brief, le relais des écarts, le nombre de tours, l'acceptation d'un écart écarté (avec la capture qui montre pourquoi), et toute modification du DESIGN.md avant l'accord.

## 2. Un seul brief « tout l'accueil d'un coup, relu par le même worker »

Réponse au capitaine :

Je ne peux pas l'écrire tel quel, et voici pourquoi avant la contre-proposition.

- Le skill de mise au point refuse explicitement une tâche qui construit plusieurs sections ou « l'accueil entier » d'un coup, et refuse un constructeur qui se relit. Le skill des briefs refuse de la même façon un brief « accueil entier » quand le travail se découpe par section.
- Ce n'est pas une règle de forme : c'est là que se fait la qualité. Un worker qui a construit une section ne voit plus ses propres écarts ; le relecteur neuf, qui n'a rien construit, compare à froid aux références à la même largeur et nomme trois écarts précis. Dans une seule tâche, cette boucle disparaît, et l'accueil arrive à la planche avec des écarts que personne n'a vus.
- Un contexte unique qui porte six ou huit sections dérive : les dernières sections sont construites avec moins d'attention que la première, et le premier écran ne passe plus par sa planche intermédiaire, alors que c'est lui qui fixe le ton de tout le reste.
- Le gain de temps est en grande partie illusoire : les sections s'enchaînent sans que vous ayez à intervenir, et vous n'êtes sollicité qu'à deux moments, la planche du premier écran et la planche de l'accueil complet.

Ce que je propose à la place :

1. La séquence du point 1, lancée sans autre interruption que les deux planches. Si vous voulez encore moins d'arrêts, je peux ne vous montrer que la planche de l'accueil complet et traiter le premier écran comme une section ordinaire, avec sa relecture : c'est un écart que je note dans l'item du backlog, mais la qualité tient.
2. Si ce que vous cherchez est un premier aperçu rapide de l'ensemble, je lance un scout d'exploration qui assemble une maquette brute de l'accueil à partir du code de B, sous son dossier de données, sans aucune prétention de fini ; elle sert de point de départ aux sections, pas de livrable.

Si, après cela, vous maintenez explicitement le brief unique avec auto-relecture, c'est votre décision et je l'écris : une seule tâche scout (rien n'entre dans le projet avant votre accord sur l'accueil complet), DESIGN.md en mise au point non modifiable par le worker, captures 1440 et 375 de chaque section et de la page entière, et l'écart à la méthode noté dans l'item du backlog avec sa raison. Je vous recommande alors de garder au minimum une relecture distincte à la fin, avant la planche.
