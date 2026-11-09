---
name: web-design-direction
description: Load in a web (firstmate-web) home before having a design direction chosen for a site, and before accepting a new or redone rendering.
user-invocable: false
metadata:
  internal: true
---

# Direction de design web

Le choix de la direction revient au capitaine (`data/captain.md`) ; le firstmate découpe l'exploration en petites tâches confiées à des scouts distincts, présente la planche et vérifie chaque rendu contre la direction retenue et ses références.
Aucun scout ne fait seul références, directions, maquettes et planche : un même contexte qui conçoit plusieurs directions les fait converger vers la même page.

## Quand charger

- Avant de faire choisir une direction de design pour un site neuf ou une refonte visuelle.
- Avant d'accepter un rendu nouveau ou refait, à la réception de la remise du worker.
- Pas pour un correctif qui ne change pas le rendu : vérifier seulement qu'il respecte le DESIGN.md retenu.
- Après le choix, la mise au point de l'accueil relève de `web-mise-au-point`.

## Faire

1. Avant la première tâche d'exploration, tenir pour le capitaine, selon `captain-hold-lifecycle`, le travail que le choix conditionne ; l'identifiant de cette tâche tenue sera la clé `question` de la planche (étape 7).
   Chaque tâche ci-dessous a son propre brief, écrit avec `web-worker-brief`, et part dans un contexte neuf.
2. Refonte : une tâche « Identité en place » d'abord.
   Son brief dit de garder l'identité visuelle en place et de la moderniser, sauf demande contraire du capitaine : le scout relève, depuis le code du site actuel (feuille de style, images, captures) et avec la preuve de chaque valeur, ses couleurs, son logo, son mot-symbole et ses messages clés, ainsi que les règles en place (consignes du site, plan de contenu).
   Son rapport devient une entrée de chaque tâche « Direction ».
3. Tâche « Références » : un scout réunit les références selon `data/captain.md` (références et Q8), pour le public du site plutôt que pour son métier.
   - Il part des collections UXKIN du capitaine (`list_collections`, `get_collection`) et dit s'il n'en existe pas pour ce public.
   - Il interroge ensuite `find_ui_materials` par public voisin et par impression (« e-commerce chaleureux photo », « restaurant éditorial »), jamais par le nom du métier, qui dérive vers des SaaS ; il écarte les résultats de catégorie SaaS, IA, fintech ou outil pour développeurs et ceux dont la section Imagery dit qu'il n'y a pas de photographie, sauf raison écrite.
   - Il complète avec les galeries gratuites, puis trouve par recherche web deux ou trois sites du métier, pour les attentes des clients seulement.
   - Il ouvre et capture chaque site retenu à 1440 et 375 px, avec la date ; aucun site n'est retenu sur la seule lecture de son DESIGN.md.
   Livrable : un dossier de captures datées, une ligne par site sur ce qu'il en retient, la liste des bibliothèques essayées et de celles qui n'ont pas pu être lues.
4. Tâche « Pistes » : un scout propose six pistes d'une phrase, aussi différentes que possible par la structure de toute la page (suite des sections, place et taille des photos, façon de montrer les prix, les réalisations et les avis, densité, contraste typographique), chacune avec son élément mémorable tiré du monde du métier et utile à la décision du visiteur.
   Entrées : le plan de contenu (matières A et B, trois mots, ce que le métier a de concret à montrer, `web-intake`), le rapport « Références », et celui de l'étape 2 pour une refonte.
   Le firstmate en retient trois, quatre au plus, celles qui diffèrent le plus par la structure, dont au moins une qui prend un vrai risque, et attribue à chacune trois sites de référence.
5. Tâche « Direction : <nom> », une par direction retenue, chacune confiée à un scout qui ne voit ni les autres pistes ni les autres directions.
   Entrées : le plan de contenu (matières A et B), `VOIX.md`, la phrase de sa direction, les captures de ses références, le rapport de l'étape 2 pour une refonte.
   Consignes :
   - le processus en deux passes de `frontend-design`, écrit avant tout code : plan avec concept de mise en page et wireframe ASCII, revue d'unicité contre une demande voisine, révisions écrites ; toute signature du design généré par IA conservée justifiée par écrit ;
   - livrable : le premier écran à 1440 et 375 px, une section signature et le schéma de la page entière, en HTML rendu et capturé, avec la vraie matière A et B et des photos provisoires cohérentes (`data/captain.md`), marqué « proposition non validée » par un badge discret ; son code source reste sous le dossier de données du scout ;
   - contrôles : clarté du premier écran, contraste lisible sur le rendu, contrôle du design générique de `website-design:web-review` ;
   - ni page entière construite, ni DESIGN.md complet, ni mesures, ni notes.
   Les scouts de direction rendent et capturent l'un après l'autre (travail lourd, `data/captain.md`) ; chacun remonte `needs-decision [key=relecture]` avec le chemin absolu de ses captures et reste ouvert jusqu'à la planche.
6. Tâche « Revue croisée » : un scout distinct pose les captures des directions côte à côte, avec celles de leurs références.
   Il signale deux directions qui partagent la même suite de sections, une direction générique ou interchangeable avec un concurrent, un premier écran qui ne dit pas l'essentiel ; au plus trois écarts par direction (où, quoi, valeur attendue).
   Le firstmate relaie les écarts à chaque scout de direction par `fm-send` avec `--resolve-key relecture` ; un tour de correction, nouvelles captures.
7. Tâche « Planche » : un scout construit et héberge une seule planche Lavish (`lavish-axi`) : par direction, ses captures posées à côté de celles de ses références, à la même largeur, sa phrase et son schéma de page ; puis une seule question de choix.
   Rien d'autre sur la planche : ni matrice, ni notes, ni mesures. Une planche précédente sert de format, jamais de modèle.
   La question suit la forme produite par `.agents/skills/bearings/assets/board-template.html` : une invite marquée `choice` dont le Context data JSON porte `schema` `fm-bearings-answer.v1`, `question` égal à l'identifiant de la tâche tenue donné par le brief, une `selection` en forme de slug, une `note` présente même vide et `close` `release`, pour que le choix libère le travail tenu au lieu de le clore comme fait.
   Cette libération ne se fait qu'en session suivie : tant que la posture d'absence est posée, `bin/fm-captain-hold.sh answers` la refuse et la tâche reste tenue.
   Une ligne à laquelle manque `schema`, `question`, `selection` ou `note` est écartée sans message par `bin/fm-procevent-lavish.sh answers`, et la réponse du capitaine ne ferme alors pas la décision.
   Le scout arme la planche avec `bin/fm-procevent-lavish.sh arm <planche> --for <id de sa tâche>` et remonte `needs-decision [key=board-review]` avec le chemin absolu du fichier de la planche et son URL ; il ne s'adresse jamais au capitaine.
   Ce contrat de planche sert aussi aux points de décision de `web-mise-au-point`.
8. Avant de présenter la planche, le firstmate lie sa source à la tâche tenue : `bin/fm-procevent-lavish.sh source-id <chemin remonté par le scout>`, puis `bin/fm-captain-hold.sh bind <source-id>`.
   Il présente ensuite la question au capitaine avec l'URL de la planche et enregistre sa réponse selon `captain-hold-lifecycle` ; pendant l'attente, seuls les travaux indépendants du design continuent (contenu, mesure, technique).
9. À la réponse :
   - « aucune » relance les étapes 4 à 8, avec la note du capitaine comme direction ;
   - une direction ou un mélange ouvre la mise au point de l'accueil (`web-mise-au-point`), qui part du code de la direction retenue.
   Les scouts de direction se closent ensuite ; leur code reste sous leur dossier de données.
10. À la réception d'un rendu nouveau ou refait :
   - comparer les captures 375, 768 et 1440 px au DESIGN.md retenu (couleurs, polices, échelle, espacements, mise en page) et aux captures des références de la direction, à la même largeur ;
   - chercher les signatures de `frontend-design` non justifiées et toute valeur hors tokens, hors moments signature écrits dans le DESIGN.md ;
   - vérifier les points mesurables : longueur de ligne inférieure à 80 caractères, contraste au moins 4,5:1, cibles tactiles d'au moins 44 px, aucun défilement horizontal à 375 px, focus visible, `prefers-reduced-motion` respecté ;
   - vérifier le zoom : tailles de texte en `rem` (un `clamp()` garde une part en `rem`, jamais d'unité viewport seule), zoom à 200 % sans perte, aucune perte à 320 px CSS de large ni avec l'espacement de texte de WCAG 1.4.12 ;
   - chaque lien, bouton et entrée de menu dit où il mène ou ce qu'il fait, compréhensible seul, et chaque page a un `<title>` qui dit sa fonction (`web-content-review`) ;
   - premier écran à 375 et 1440 px sans défiler, selon `data/captain.md` : ce qui est proposé, pour qui et où, deux ou trois preuves dites avec les mots du visiteur, leurs justificatifs à un clic et jamais au premier écran, le bouton de l'action principale, pas de faux bas de page ; aucune information critique seulement dans un carrousel ;
   - action principale à un clic depuis tout endroit du site (en-tête qui suit le défilement ou bouton répété) ;
   - chaque image apporte ou clarifie une information, au même ratio et au même étalonnage que les autres ; une image décorative qui répète le texte voisin est renvoyée ;
   - chaque formulaire : étiquette visible liée à son champ, `type` et `autocomplete` adaptés, erreur annoncée près du champ sans effacer la saisie, texte de l'erreur qui dit ce qui ne va pas et comment corriger, sans reproche ni plaisanterie, une phrase de réassurance à côté de chaque donnée sensible demandée (pourquoi le téléphone, pas de prospection), ce qui se passe après l'envoi et sous quel délai, usage des données collectées ;
   - un constat d'une revue de qualité (Impeccable, porte taste, `web-review`) n'est écarté qu'avec la capture qui montre pourquoi ; une règle de forme ou de format ne suffit pas à l'écarter (ordre des exigences de `data/captain.md`) ;
   - renvoyer au worker avec des écarts précis (capture, élément, valeur attendue, valeur vue), jamais avec un « à améliorer » ;
   - signaler aussi tout défaut visuel hors sujet vu à l'écran (exigence visuelle du capitaine).
11. La revue des signatures et des tokens de l'étape 10 se fait toujours sur les captures et le code, pour tout rendu nouveau ou refait.
   Recherche de motifs et Stylelint sont des aides facultatives qui ne la remplacent pas ; Impeccable `detect` viendra au lot 8.

## Refuser ou remonter

- **Capitaine** : le choix de la direction, tout changement de direction en cours de projet, toute référence ou ressource payante hors UXKIN.
- **Firstmate** : découpage de l'exploration, choix des pistes retenues et de leurs références, nombre de directions (trois, quatre au plus), relais des écarts, présentation de la question au capitaine et enregistrement de sa réponse, acceptation ou renvoi d'un rendu.
- **Worker** : le contenu de sa seule tâche, la construction, l'hébergement et l'armement de la planche pour le scout « Planche », sans recommander de choix ni s'adresser au capitaine.
- Refuser une tâche qui mélange références, directions et planche, ou un scout qui conçoit plusieurs directions.
- Refuser comme candidates : des directions qui ne diffèrent que par les couleurs et les polices, des directions qui partagent la même suite de sections, une refonte qui abandonne la DA en place sans demande du capitaine.
- Refuser comme choix : une direction par défaut, une recommandation reprise telle quelle, un « fais au mieux », une planche non présentée.
- Refuser un rendu jugé sur le code seul, sans captures du rendu.

## Références

- `data/captain.md` : façon de travailler dans ce domaine (ordre des exigences, références, directions, repères de design), décision sur les références visuelles (Q8 et son exception UXKIN), conversion et contenu.
- `web-mise-au-point` : mise au point de l'accueil après le choix.
- Skill `frontend-design` : signatures du design généré par IA, processus en deux passes (plan, revue d'unicité, révisions) avant le code.
- UXKIN, systèmes de design tirés de vrais sites (plugin `website-design`, compte du capitaine) : https://uxkin.com
- Skills `website-design:web-design-system` (trame du DESIGN.md) et `website-design:web-review` (revue du rendu).
- WCAG 2.2 : https://www.w3.org/TR/WCAG22/ (contraste 4,5:1 au critère 1.4.3 ; 44 px est le critère AAA 2.5.5, retenu par `landing-page` ; formulaires aux critères 1.3.5, 3.3.1, 3.3.2 et 3.3.3 ; zoom aux critères 1.4.4, 1.4.10 et 1.4.12 ; liens et titres aux critères 2.4.2, 2.4.4 et 2.4.6).
- NN/g, Error-Message Guidelines (2023-05-14) : https://www.nngroup.com/articles/error-message-guidelines/
- GOV.UK, Write effective links : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/add-links/
- Kevin Powell, tailles de texte en unités viewport et zoom : https://youtu.be/G1buM51f09s
- NN/g, Scrolling and Attention (2018, 57 % du temps de lecture au-dessus de la ligne de flottaison) : https://www.nngroup.com/articles/scrolling-and-attention/
- NN/g, Homepage Design: 4 Common Mistakes (faux plancher, carrousel) : https://youtu.be/lSwwFqWqZqQ
- web.dev, bonnes pratiques des formulaires (`type`, `autocomplete`) : https://web.dev/articles/payment-and-address-form-best-practices
- Service-public, information des personnes dont les données sont collectées : https://entreprendre.service-public.gouv.fr/vosdroits/F24270
- `lavish-axi --help` pour la planche.
