---
name: web-design-direction
description: Load in a web (firstmate-web) home before having a design direction chosen for a site, and before accepting a new or redone rendering.
user-invocable: false
metadata:
  internal: true
---

# Direction de design web

Le choix de la direction revient au capitaine (`data/captain.md`) ; le firstmate fait produire les candidates, les présente et vérifie le rendu contre la direction retenue.

## Quand charger

- Avant de faire choisir une direction de design pour un site neuf ou une refonte visuelle.
- Avant d'accepter un rendu nouveau ou refait, à la réception de la remise du worker.
- Pas pour un correctif qui ne change pas le rendu : vérifier seulement qu'il respecte le DESIGN.md retenu.

## Faire

1. Pour une refonte, écrire dans le brief du scout de garder l'identité visuelle en place et de la moderniser, sauf demande contraire du capitaine : il relève d'abord, depuis le code du site actuel (feuille de style, images, captures) et avec la preuve de chaque valeur, ses couleurs, son logo, son mot-symbole et ses messages clés, ainsi que les règles en place (consignes du site, plan de contenu).
2. Écrire dans le brief du scout de réunir les références d'abord du thème du site : son métier et les métiers voisins.
   UXKIN d'abord quand il est connecté (`find_ui_materials`, `find_ui_references`, packs listés avec leur lien), puis les galeries gratuites, avec les trois à cinq sites réels que donne le capitaine ; aucune autre référence payante (`data/captain.md` Q8).
   Les sites de SaaS et d'agence ne servent qu'à une technique de structure.
   Le rapport liste les bibliothèques essayées et celles qui n'ont pas pu être lues.
3. Tenir d'abord pour le capitaine, selon `captain-hold-lifecycle`, le travail que le choix conditionne, puis lancer le scout, brief écrit avec `web-worker-brief` et portant les consignes des étapes 1, 2 et 4 ainsi que l'identifiant de cette tâche tenue comme clé `question` de la planche, qui produit deux ou trois DESIGN.md différents de structure, pas seulement de couleurs et de polices :
   - une matrice de structure dans le rapport (archétype du premier écran, grille, en-tête et navigation, accès à l'action principale, traitement des photos, densité, contraste typographique) ; chaque direction diffère des autres et des maquettes déjà faites du projet sur au moins trois axes ; une direction volontairement audacieuse par planche ;
   - chaque DESIGN.md fondé sur trois à cinq sites réels nommés avec URL et date de consultation, et ce qui en est retenu (principe, pas copie) ;
   - quatre à six couleurs nommées avec leurs rôles, polices et rôles, échelle typographique, espacements, mise en page, clair et sombre si le site a les deux ;
   - pour chaque direction, le processus en deux passes de `frontend-design` en entier, écrit avant tout code : plan avec concept de mise en page et wireframe ASCII, revue d'unicité contre une demande voisine, révisions écrites ; toute signature du design généré par IA conservée justifiée par écrit ;
   - une maquette de la page d'accueil rendue et capturée, marquée « proposition non validée », passée au contrôle du design générique de `website-design:web-review` ; son code source reste sous le dossier de données du scout, point de départ que le worker de construction peut reprendre, jamais à la place du DESIGN.md retenu.
   Pour un site neuf, les maquettes partent du plan de contenu retenu (`web-intake`) ; le design sublime et sert ce contenu.
   Le skill `website-design:web-design-system` sert de trame ; sans UXKIN, le DESIGN.md dit qu'il ne s'appuie pas sur sa base.
   Un rapport précédent sert de format, jamais de modèle de design.
4. Le scout construit et héberge une seule planche Lavish de comparaison (`lavish-axi`) : par direction, captures, palette, typographie, sites de référence, signatures justifiées ; puis une seule question de choix.
   La question suit la forme produite par `.agents/skills/bearings/assets/board-template.html` : une invite marquée `choice` dont le Context data JSON porte `schema` `fm-bearings-answer.v1`, `question` égal à l'identifiant de la tâche tenue donné par le brief, une `selection` en forme de slug, une `note` présente même vide et `close` `release`, pour que le choix libère le travail tenu au lieu de le clore comme fait.
   Cette libération ne se fait qu'en session suivie : tant que la posture d'absence est posée, `bin/fm-captain-hold.sh answers` la refuse et la tâche reste tenue.
   Une ligne à laquelle manque `schema`, `question`, `selection` ou `note` est écartée sans message par `bin/fm-procevent-lavish.sh answers`, et la réponse du capitaine ne ferme alors pas la décision.
   Le scout arme la planche avec `bin/fm-procevent-lavish.sh arm <planche> --for <id de sa tâche>` et remonte `needs-decision [key=board-review]` avec le chemin absolu du fichier de la planche et son URL ; il ne s'adresse jamais au capitaine.
5. Avant de présenter la planche, le firstmate lie sa source à la tâche tenue : `bin/fm-procevent-lavish.sh source-id <chemin remonté par le scout>`, puis `bin/fm-captain-hold.sh bind <source-id>`.
   Il présente ensuite la question au capitaine avec l'URL de la planche et enregistre sa réponse selon `captain-hold-lifecycle` ; pendant l'attente, seuls les travaux indépendants du design continuent (contenu, mesure, technique).
6. À la réponse, faire écrire dans le projet, par un worker, le DESIGN.md retenu et ses tokens, avec la citation ou la référence de la réponse du capitaine et la version de la planche présentée.
   Ce DESIGN.md devient une entrée figée de tout worker de rendu et reste l'autorité de la construction ; le code de la maquette retenue n'en est qu'un point de départ.
7. À la réception d'un rendu nouveau ou refait :
   - comparer les captures 375, 768 et 1440 px au DESIGN.md retenu (couleurs, polices, échelle, espacements, mise en page) ;
   - chercher les signatures de `frontend-design` non justifiées et toute valeur hors tokens ;
   - vérifier les points mesurables : longueur de ligne inférieure à 80 caractères, contraste au moins 4,5:1, cibles tactiles d'au moins 44 px, aucun défilement horizontal à 375 px, focus visible, `prefers-reduced-motion` respecté ;
   - premier écran à 375 et 1440 px sans défiler : ce que propose le site en une phrase, un élément de confiance sourcé, le bouton de l'action principale, et le début de la section suivante qui dépasse ; aucune information critique seulement dans un carrousel ;
   - action principale à un clic depuis tout endroit du site (en-tête qui suit le défilement ou bouton répété) ;
   - chaque image apporte ou clarifie une information ; une image décorative qui répète le texte voisin est renvoyée ;
   - chaque formulaire : étiquette visible liée à son champ, `type` et `autocomplete` adaptés, erreur annoncée près du champ sans effacer la saisie, ce qui se passe après l'envoi et sous quel délai, usage des données collectées ;
   - renvoyer au worker avec des écarts précis (capture, élément, valeur attendue, valeur vue), jamais avec un « à améliorer » ;
   - signaler aussi tout défaut visuel hors sujet vu à l'écran (exigence visuelle du capitaine).
8. La revue des signatures et des tokens de l'étape 7 se fait toujours sur les captures et le code, pour tout rendu nouveau ou refait.
   Recherche de motifs et Stylelint sont des aides facultatives qui ne la remplacent pas ; Impeccable `detect` viendra au lot 8.

## Refuser ou remonter

- **Capitaine** : le choix de la direction, tout changement de direction en cours de projet, toute référence ou ressource payante hors UXKIN.
- **Firstmate** : références complémentaires, nombre de directions (deux ou trois), forme de la planche écrite dans le brief, présentation de la question au capitaine et enregistrement de sa réponse, acceptation ou renvoi d'un rendu contre le DESIGN.md retenu.
- **Worker** : le contenu de ses directions, la construction, l'hébergement et l'armement de la planche, sans recommander de choix ni s'adresser au capitaine.
- Refuser comme candidates : des directions qui ne diffèrent que par les couleurs et les polices, une refonte qui abandonne la DA en place sans demande du capitaine.
- Refuser comme choix : une direction par défaut, une recommandation reprise telle quelle, un « fais au mieux », une planche non présentée.
- Refuser un rendu jugé sur le code seul, sans captures du rendu.

## Références

- `data/captain.md` : règle de design, directions différentes de structure, décision sur les références visuelles (Q8 et son exception UXKIN), conversion et contenu.
- Skill `frontend-design` : signatures du design généré par IA, processus en deux passes (plan, revue d'unicité, révisions) avant le code.
- UXKIN, systèmes de design tirés de vrais sites (plugin `website-design`, compte du capitaine) : https://uxkin.com
- Skills `website-design:web-design-system` (trame du DESIGN.md) et `website-design:web-review` (revue du rendu).
- WCAG 2.2 : https://www.w3.org/TR/WCAG22/ (contraste 4,5:1 au critère 1.4.3 ; 44 px est le critère AAA 2.5.5, retenu par `landing-page` ; formulaires aux critères 1.3.5, 3.3.1 et 3.3.2).
- NN/g, Scrolling and Attention (2018, 57 % du temps de lecture au-dessus de la ligne de flottaison) : https://www.nngroup.com/articles/scrolling-and-attention/
- NN/g, Homepage Design: 4 Common Mistakes (faux plancher, carrousel) : https://youtu.be/lSwwFqWqZqQ
- web.dev, bonnes pratiques des formulaires (`type`, `autocomplete`) : https://web.dev/articles/payment-and-address-form-best-practices
- Service-public, information des personnes dont les données sont collectées : https://entreprendre.service-public.gouv.fr/vosdroits/F24270
- `lavish-axi --help` pour la planche.
