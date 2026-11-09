---
name: web-mise-au-point
description: Load in a web (firstmate-web) home once the captain has chosen a design direction, before writing its DESIGN.md, before each task that builds or reviews the homepage mock-up, and before presenting the first screen or the full homepage to the captain.
user-invocable: false
metadata:
  internal: true
---

# Mise au point de l'accueil

Après le choix de la direction (`web-design-direction`), l'accueil se met au point en maquette, section par section : chaque section est construite par un scout et jugée par un autre, contre les références de la direction, jusqu'à ce qu'il ne reste plus d'écart visible.
C'est là que se fait la qualité ; les règles du rendu restent celles de `data/captain.md`, ce skill porte le découpage et la boucle.
Rien n'entre dans le projet avant l'accord du capitaine sur l'accueil complet (étape 8).

## Quand charger

- À la réponse du capitaine sur la planche, quand il retient une direction ou un mélange.
- Avant chaque tâche qui construit ou relit la maquette d'accueil.
- Avant de présenter au capitaine le premier écran ou l'accueil complet.

## Faire

1. Tâche « DESIGN.md » : un scout l'écrit sous son dossier de données, à partir du code de la direction retenue, de la note du capitaine et, s'il y a lieu, du DESIGN.md UXKIN d'une référence retenue (obtenu en cherchant le nom du site), dont il reprend la logique et jamais les valeurs telles quelles ni les composants propres à un autre type de site.
   Contenu selon `data/captain.md` et la trame de `website-design:web-design-system`, avec les deux ou trois moments signature et chaque écart aux repères de design avec sa raison.
   Il porte la citation de la réponse du capitaine, la version de la planche présentée, et la mention « en mise au point » jusqu'à l'étape 8.
   Seul le firstmate décide d'une modification ; un scout l'écrit, jamais un constructeur de section.
2. Le firstmate écrit dans la note de l'item du backlog la liste des sections de l'accueil, dans l'ordre de la page, tirée du schéma de la direction retenue : premier écran d'abord.
   La matière A du plan de contenu va au premier écran, B dans les sections ; C reste aux autres pages (`web-intake`).
   La maquette part du code de la direction retenue, copié depuis le dossier de données de son scout.
3. Tâche « Section : <nom> », une par section, dans l'ordre de la liste ; une section ne démarre pas avant que la précédente ait passé sa relecture.
   Un scout de construction, dans un contexte neuf. Entrées : le DESIGN.md en mise au point, la matière de cette section, `VOIX.md`, le chemin absolu de la maquette telle qu'elle est et ses captures, les captures des références de la direction.
   Il ne touche qu'à sa section ; s'il pense que le DESIGN.md ou le plan de contenu a tort, il le remonte avec captures sans les changer.
   Livrable : la maquette mise à jour sous son dossier de données, les captures 1440 et 375 px de la section et de la page entière.
   Le brief porte trois à cinq critères de fin vérifiables sur capture ; pas de kit de mesure à ce stade, seulement le contraste lisible et les signatures de `frontend-design`.
   Il remonte `needs-decision [key=relecture]` avec le chemin absolu de ses captures et reste ouvert jusqu'à la fin de la boucle de sa section.
4. Tâche « Relecture : <nom> » : un scout distinct, qui n'a rien construit, dans un contexte neuf. Entrées : les captures de la section et de la page entière, celles des références, le DESIGN.md en mise au point.
   Il compare à la même largeur et rend les trois écarts les plus visibles, chacun nommé précisément (où, quoi, valeur attendue), ou dit qu'il n'en voit plus ; jamais « à améliorer ».
   Pour une section, il juge aussi la page entière telle qu'elle est : rythme, alternance des compositions, densité.
   Impeccable (`critique`, `typeset`, `layout`, `bolder`, `quieter`, `colorize`, `polish`) et la porte taste lui servent d'aides, une commande à la fois.
   Il remonte `needs-decision [key=ecarts]` avec le chemin de son rapport et reste ouvert jusqu'à la fin de la boucle.
5. Boucle : le firstmate relaie les écarts au constructeur par `fm-send --resolve-key relecture`, puis les nouvelles captures au relecteur par `fm-send --resolve-key ecarts`, jusqu'à ce que le relecteur ne voie plus d'écart visible face aux références.
   Un à trois tours pour une section, trois à six pour le premier écran et la passe d'ensemble ; au-delà, montrer au capitaine où ça bloque, avec captures.
   Un écart écarté par le constructeur ne l'est qu'avec la capture qui montre pourquoi ; une règle de forme ou de format ne suffit pas (ordre des exigences de `data/captain.md`).
   La boucle finie, les deux scouts se closent ; le rapport du constructeur (chemin de la maquette et captures) devient l'entrée de la section suivante.
6. Premier écran : sa boucle finie, une tâche « Planche du premier écran » le présente au capitaine (captures 1440 et 375 à côté de celles des références, puis une seule question : valider, ou changer avec une note), selon le contrat de planche de `web-design-direction` (étapes 7 et 8), après avoir tenu la suite de l'accueil selon `captain-hold-lifecycle`.
   Les sections suivantes attendent sa réponse ; une note de changement relance la boucle du premier écran.
7. Une fois toutes les sections faites :
   - « Passe d'ensemble » : un constructeur et un relecteur neufs, sur la page entière face aux références (rythme, transitions, cohérence, densité), dans la boucle de l'étape 5 ;
   - « Mobile » : un scout reprend la page à 375 px, vérifiée à la main : la matière A et le bouton au premier écran, le reste en un défilement ; captures, puis un tour de relecture.
8. Accueil complet : une tâche « Planche de l'accueil » le présente au capitaine (page entière à 1440 et 375 à côté des références, puis une seule question : valider, ou changer avec une note), selon le même contrat.
   L'accord du capitaine fige le DESIGN.md : un scout retire la mention « en mise au point » et date l'accord ; toute modification ensuite passe par le capitaine et y est datée.
9. Construction : un ship écrit dans le projet le DESIGN.md figé et ses tokens, avec la citation de la réponse du capitaine, puis l'accueil à partir de la maquette validée, avec les preuves du kit (`web-worker-brief`).
   Les autres pages suivent ensuite, une page par ship (`web-worker-brief`), le texte avant la page (`web-content-review`), chacune avec un tour de relecture comparé aux références et à l'accueil validé.

## Refuser ou remonter

- **Capitaine** : la validation du premier écran, celle de l'accueil complet, toute modification du DESIGN.md après son accord.
- **Firstmate** : la liste et l'ordre des sections, les critères de fin de chaque tâche, le relais des écarts, le nombre de tours, l'acceptation d'un écart écarté, toute modification du DESIGN.md avant l'accord.
- **Worker** : sa seule section ou sa seule relecture ; jamais le DESIGN.md, le plan de contenu ni une autre section.
- Refuser une tâche qui construit plusieurs sections ou « l'accueil entier » d'un coup.
- Refuser un constructeur qui se relit, une relecture qui rend « à améliorer », un écart écarté sans capture.
- Refuser une section lancée avant que la précédente ait passé sa relecture, et toute page construite dans le projet avant l'accord sur l'accueil complet.

## Références

- `data/captain.md` : façon de travailler dans ce domaine (ordre des exigences, mise au point, repères de design, plancher technique).
- `web-design-direction` : contrat de planche (étapes 7 et 8) et acceptation d'un rendu (étape 10).
- `web-worker-brief` : forme des briefs et preuves du kit pour les ships.
- `captain-hold-lifecycle` et `scout-completion` : tenue des décisions du capitaine et fin des scouts.
- `AGENTS.md` section 7 : relais au worker par `fm-send`, clôture d'une décision par `--resolve-key`.
- Impeccable, commandes de reprise d'un rendu : https://impeccable.style
- Skill `frontend-design` : un seul élément mémorable, le reste calme ; critique sur captures pendant la construction.
