---
name: web-design-direction
description: Load in a web (firstmate-web) home before having a design direction chosen for a site, and before accepting a new or redone rendering.
user-invocable: false
metadata:
  internal: true
---

# Direction de design web

Les 63 règles de `data/regles-design.md` font autorité : un invariant [I] n'est jamais enfreint, un défaut [D] s'applique tant que le DESIGN.md retenu ne dit pas autre chose et tout écart y est écrit avec sa raison ; les seuls défauts sont les règles 14, 24, 28 à 32 et 37, marqués [D] ci-dessous.
Le but : un site clair, qui convertit, et qu'on ne confond pas avec celui d'un concurrent ; les règles fixent le plancher, la direction de design fixe le plafond.
Le choix de la direction revient au capitaine, sur planche, parmi deux ou trois directions (règle 1) ; le firstmate fait produire les candidates, les présente et vérifie le rendu contre la direction retenue.

## Quand charger

- Avant de faire choisir une direction de design pour un site neuf ou une refonte visuelle.
- Avant d'accepter un rendu nouveau ou refait, à la réception de la remise du worker.
- Pas pour un correctif qui ne change pas le rendu : vérifier seulement qu'il respecte le DESIGN.md retenu.

## Faire

1. Pour une refonte, écrire dans le brief du scout de garder l'identité en place et de la moderniser, sauf demande contraire du capitaine (règle 20) : il relève d'abord, depuis le code du site actuel (feuille de style, images, captures) et avec la preuve de chaque valeur, ses couleurs, son logo, son mot-symbole et ses messages clés, ainsi que les règles en place (consignes du site, plan de contenu).
2. Écrire dans le brief du scout de réunir, pour chaque direction, deux jeux de références, dont il retient un principe, jamais une copie (règle 12) :
   - niveau visé : trois à cinq sites remarquables, de tout secteur, pris dans UXKIN quand il est connecté (`find_ui_materials`, `find_ui_references`, packs listés avec leur lien) ou dans des galeries gratuites (Godly, Siteinspire, Land-book, Lapa Ninja, Minimal Gallery, Awwwards...), nommés avec URL et date de consultation ; ils fixent la qualité visuelle à atteindre ;
   - métier : deux ou trois sites du métier ou des métiers voisins, pour ce que les clients s'attendent à trouver (informations, conventions), jamais pour l'apparence.
   Aucune autre référence ni ressource payante hors UXKIN sans le capitaine (règle 3).
   Le rapport liste les bibliothèques essayées et celles qui n'ont pas pu être lues.
3. Tenir d'abord pour le capitaine, selon `captain-hold-lifecycle`, le travail que le choix conditionne, puis lancer le scout, brief écrit avec `web-worker-brief` et portant les consignes des étapes 1, 2 et 4 ainsi que l'identifiant de cette tâche tenue comme clé `question` de la planche, qui produit deux ou trois directions :
   - différentes de structure sur au moins trois axes (premier écran, grille, en-tête et navigation, accès à l'action, photos, densité, contraste typographique), avec la matrice de ces axes dans le rapport ; chacune doit pouvoir être retenue, sans direction « sûre » de remplissage, et au moins une prend un vrai risque (règle 11) ;
   - chacune avec son élément mémorable, la seule chose dont le visiteur se souviendra (un traitement typographique, une photo, une composition, une couleur, un détail d'interaction), tiré du monde du métier de la fiche d'admission (`web-intake`) ; l'audace se dépense là, tout le reste est calme et discipliné (règle 13) ;
   - [D] chacune tenant en une page sur la planche : quatre à six couleurs avec rôles, polices et rôles, concept de mise en page en wireframe, élément mémorable, références ; le DESIGN.md complet n'est écrit qu'à l'étape 6, pour la direction retenue (règle 14) ;
   - pour chaque direction, le processus `frontend-design` en deux passes, écrit avant tout code : plan et wireframe ; revue d'unicité (« aurais-je produit la même chose pour un autre client du même métier ? » ; si oui, réviser et dire quoi) ; révisions (règle 15) ;
   - aucune signature de design IA sans une raison écrite propre au brief ; la liste de référence est celle des skills `frontend-design` et `website-design:web-design-system`, par exemple fond crème, serif et accent terre cuite ; fond presque noir et un seul accent acide ; cartes arrondies identiques avec la même ombre grise ; surtitre en capitales espacées au-dessus de chaque titre ; numéros 01 / 02 / 03 hors séquence ; un seul mot du titre en couleur ou en italique ; dégradés violet-bleu ; verre dépoli partout ; tout centré ; trois cartes identiques ; emoji en icônes ; flèche → ajoutée aux boutons ; ce qui n'est pas dans la liste n'est pas suspect : grande typographie, photo pleine largeur, fonds de section alternés, couleur franche restent permis (règle 16) ;
   - une maquette d'accueil par direction, rendue et capturée à 375 et 1440 px, passée au contrôle du design générique de `website-design:web-review` (règle 17) ; elle est montée avec un contenu réaliste : vraies longueurs de texte, photos provisoires de qualité choisies d'après la liste des photos (règle 38), avis et chiffres d'exemple marqués « exemple fictif » (règle 43) ; jamais de rectangles gris, de lorem ipsum ni de [À FOURNIR] dans la page ;
   - chaque maquette non publiée : `noindex`, marqueur « proposition non validée » visible mais discret (badge fixe dans un coin, qui ne masque pas le premier écran), données fictives sûres (règle 56) ; son code source reste sous le dossier de données du scout, point de départ que le worker de construction peut reprendre, jamais à la place du DESIGN.md retenu.
   Pour un site neuf, les maquettes partent du plan de contenu retenu (`web-intake`) ; le design sert ce contenu et lui donne du caractère (règle 5).
   Les skills installés nourrissent les directions ; les invariants priment sur leurs règles maison (règle 33).
   Un rapport précédent sert de format, jamais de modèle (règle 18).
4. Le scout construit et héberge une seule planche Lavish de comparaison (`lavish-axi`) : par direction, la page de l'étape 3 (couleurs, polices, wireframe, élément mémorable, références des deux jeux), les captures 375 et 1440 px de sa maquette et ses signatures justifiées ; puis une seule question de choix.
   La question suit la forme produite par `.agents/skills/bearings/assets/board-template.html` : une invite marquée `choice` dont le Context data JSON porte `schema` `fm-bearings-answer.v1`, `question` égal à l'identifiant de la tâche tenue donné par le brief, une `selection` en forme de slug, une `note` présente même vide et `close` `release`, pour que le choix libère le travail tenu au lieu de le clore comme fait.
   Cette libération ne se fait qu'en session suivie : tant que la posture d'absence est posée, `bin/fm-captain-hold.sh answers` la refuse et la tâche reste tenue.
   Une ligne à laquelle manque `schema`, `question`, `selection` ou `note` est écartée sans message par `bin/fm-procevent-lavish.sh answers`, et la réponse du capitaine ne ferme alors pas la décision.
   Le scout arme la planche avec `bin/fm-procevent-lavish.sh arm <planche> --for <id de sa tâche>` et remonte `needs-decision [key=board-review]` avec le chemin absolu du fichier de la planche et son URL ; il ne s'adresse jamais au capitaine.
5. Avant de présenter la planche, le firstmate lie sa source à la tâche tenue : `bin/fm-procevent-lavish.sh source-id <chemin remonté par le scout>`, puis `bin/fm-captain-hold.sh bind <source-id>`.
   Il présente ensuite la question au capitaine avec l'URL de la planche et enregistre sa réponse selon `captain-hold-lifecycle` ; pendant l'attente, seuls les travaux indépendants du design continuent (contenu, mesure, technique).
6. À la réponse, faire écrire dans le projet, par un worker, le DESIGN.md complet de la direction retenue (échelle typographique, espacements, rayons, composants, clair et sombre si besoin) et ses tokens, avec la citation ou la référence de la réponse du capitaine et la version de la planche présentée.
   Ce DESIGN.md fait autorité pour toute construction et devient une entrée figée de tout worker de rendu (règle 19) : toute valeur récurrente passe par un token ; deux ou trois moments signature (le premier écran, une section) peuvent avoir leurs propres valeurs, écrites dans le DESIGN.md ; le code de la maquette retenue n'en est qu'un point de départ.
   Il tranche l'apparence (règle 33) et reprend ces défauts [D], dont tout écart y est écrit avec sa raison :
   - couleur : une base neutre (fonds, texte, bordures), une couleur d'action, au plus un accent, chacune avec son rôle ; deux ou trois surfaces de fond (claire, teintée, sombre par exemple) peuvent alterner pour rythmer les sections (règle 28) ;
   - typographie : elle porte la personnalité du site ; polices choisies pour ce sujet, pas celles qu'on prendrait pour n'importe quel projet ; une ou deux familles, nettement distinctes si deux ; échelle à fort contraste, le titre principal de l'ordre de trois à cinq fois le corps sur grand écran (`clamp()`), interlignage et approche resserrés ; texte courant de 16 px au moins (règle 29) ;
   - mise en page : espacements tirés d'une seule échelle, généreux entre les sections ; deux sections qui se suivent n'ont pas la même composition ; l'alignement (gauche, centré) est décidé dans le DESIGN.md, rien n'est centré par défaut (règle 30) ;
   - texte sur image permis si le contraste de 4,5:1 est mesuré sur le rendu à 375 et 1440 px (voile, dégradé de lisibilité ou zone unie sous le texte) (règle 31) ;
   - mouvement : un seul moment orchestré (chargement ou révélation) plutôt que des effets sur chaque section ; le mouvement qui répond à une action (ouvrir, valider) est bienvenu (règle 32) ;
   - images : mêmes formats et même rendu (lumière, couleur) sur tout le site ; légendes de contexte sous les photos de réalisations, d'équipe et de lieu, pas sous la photo du premier écran (règle 37) ;
   - réassurance sur chaque page ; réalisations avec contexte (client, travail fait, photo) ; ce qui rassure (gratuit, délai, sans engagement) tient en une ligne à côté du bouton principal et de chaque formulaire, pas sous chaque bouton (règle 24).
   Quand le rendu montre qu'une décision ne tient pas, le worker le signale avec captures ; la modification passe par le capitaine et est datée dans le DESIGN.md (règle 19).
7. À la réception d'un rendu nouveau ou refait, le juger sur ses captures (règle 57) en deux temps, puis renvoyer au worker des écarts précis (capture, élément, valeur attendue, valeur vue), jamais un « à améliorer » (règle 60) :
   - a. conformité : captures 375, 768 et 1440 px comparées au DESIGN.md retenu, signatures IA non justifiées et valeurs hors tokens cherchées ;
   - b. niveau : captures posées à côté des sites « niveau visé » de la direction retenue (étape 2), à la même largeur ; chaque écart est nommé (échelle et graisses, rythme des espacements, traitement des photos, alignements, densité, finition des états survol et focus).
   Vérifier aussi, sur le rendu :
   - premier écran à 375 et 1440 px sans défiler : le visiteur comprend ce qui est proposé, pour qui et où, et voit le bouton principal ; un élément de confiance sourcé au premier écran ou juste en dessous ; pas de faux bas de page ; la forme (photo, typographie, composition) vient de la direction, pas d'un gabarit commun à tous les sites ; rien de critique en carrousel seul (règle 22) ;
   - un site clair mais interchangeable avec celui d'un concurrent est aussi un échec ; un seul objectif, la conversion (règle 21) ;
   - action principale à un clic de partout, en-tête fixe ou bouton répété (règle 23) ;
   - une idée par page hors accueil (règle 25) ;
   - mobile pensé à part : l'essentiel et le bouton au premier écran, le reste en un défilement, vérifié à la main (règle 26) ;
   - chaque image apporte ou clarifie une information ; montrer le lieu, l'équipe, le geste ou le résultat en est une, une image qui ne fait que répéter le texte est renvoyée (règle 35) ; dimensions explicites, texte alternatif, hero chargé en premier (règle 40) ;
   - texte courant de moins de 80 caractères par ligne, contraste 4,5:1 (3:1 pour les grands textes), cibles de 44 px, aucun défilement horizontal à 375 px, focus visible, `prefers-reduced-motion` respecté (règle 49) ;
   - zoom : texte en `rem` (un `clamp()` garde une part en `rem`, jamais d'unité viewport seule), 200 % sans perte, 320 px sans perte, espacement de texte WCAG tenu (règle 50) ;
   - chaque lien, bouton et entrée de menu dit où il mène, chaque page a un `<title>` qui dit sa fonction (règle 41, `web-content-review`) ;
   - chaque formulaire : étiquette visible, `type` et `autocomplete` adaptés, erreur près du champ qui dit comment corriger, réassurance à côté des données sensibles, suite et délai annoncés (règle 51) ;
   - tout ce qui a l'air faux à l'écran, même hors sujet, est signalé et corrigé (règle 61).
8. La recherche de motifs et Stylelint aident la revue de conformité de l'étape 7 sans la remplacer.
   Impeccable s'utilise sans hook, sans mode `live` ni `generate`, télémétrie coupée ; ses commandes `critique`, `typeset`, `layout`, `bolder`, `quieter`, `colorize` et `polish` s'appliquent sur un rendu, une à la fois, avec captures avant et après (règle 34).

## Refuser ou remonter

- **Capitaine** : le choix de la direction sur planche, tout changement de direction en cours de projet, toute référence ou ressource payante hors UXKIN, toute modification du DESIGN.md retenu (règles 1, 3 et 19).
- **Firstmate** : nombre de directions (deux ou trois), forme de la planche écrite dans le brief, présentation de la question au capitaine et enregistrement de sa réponse, acceptation ou renvoi d'un rendu après la revue en deux temps.
- **Worker** : le contenu de ses directions, la construction, l'hébergement et l'armement de la planche, sans recommander de choix ni s'adresser au capitaine.
- Refuser comme candidates : des directions qui ne diffèrent que par couleurs et polices, une direction de remplissage, une refonte qui abandonne l'identité en place sans demande du capitaine (règles 11, 20 et 62).
- Refuser comme choix : une direction par défaut, une direction que le capitaine n'a pas choisie sur la planche (règles 1 et 62).
- Refuser un rendu jugé sur le code, sans captures du rendu (règles 57 et 62).
- Refuser de transmettre à un worker une consigne vague (« fais au mieux », « rends ça plus moderne ») au lieu d'écarts précis (règle 62).

## Références

- `data/regles-design.md` : les 63 règles du capitaine, autorité du design.
- `data/captain.md` : décision sur UXKIN (Q8 et son exception).
- Skills `frontend-design` et `website-design:web-design-system` : liste de référence des signatures du design généré par IA ; processus en deux passes de `frontend-design` ; trame du DESIGN.md de `web-design-system`.
- Skill `website-design:web-review` : contrôle du design générique sur le rendu.
- Skill `impeccable` : commandes de revue sur un rendu (règle 34).
- UXKIN, systèmes de design tirés de vrais sites (plugin `website-design`, compte du capitaine) : https://uxkin.com
- Galeries gratuites : https://godly.website, https://www.siteinspire.com, https://land-book.com, https://www.lapa.ninja, https://minimal.gallery, https://www.awwwards.com
- WCAG 2.2 : https://www.w3.org/TR/WCAG22/ (contraste 4,5:1 au critère 1.4.3 ; 44 px est le critère AAA 2.5.5, retenu par `landing-page` ; formulaires aux critères 1.3.5, 3.3.1, 3.3.2 et 3.3.3 ; zoom aux critères 1.4.4, 1.4.10 et 1.4.12 ; liens et titres aux critères 2.4.2, 2.4.4 et 2.4.6).
- NN/g, Error-Message Guidelines (2023-05-14) : https://www.nngroup.com/articles/error-message-guidelines/
- GOV.UK, Write effective links : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/add-links/
- Kevin Powell, tailles de texte en unités viewport et zoom : https://youtu.be/G1buM51f09s
- NN/g, Scrolling and Attention (2018, 57 % du temps de lecture au-dessus de la ligne de flottaison) : https://www.nngroup.com/articles/scrolling-and-attention/
- NN/g, Homepage Design: 4 Common Mistakes (faux plancher, carrousel) : https://youtu.be/lSwwFqWqZqQ
- web.dev, bonnes pratiques des formulaires (`type`, `autocomplete`) : https://web.dev/articles/payment-and-address-form-best-practices
- `lavish-axi --help` pour la planche.
