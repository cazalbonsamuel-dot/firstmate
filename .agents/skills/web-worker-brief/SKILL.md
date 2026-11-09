---
name: web-worker-brief
description: Load in a web (firstmate-web) home before writing the brief of a web worker - design direction, page, content, technical fix, performance, measurement, or audit.
user-invocable: false
metadata:
  internal: true
---

# Brief d'un worker web

Le brief se génère par `bin/fm-brief.sh` (`AGENTS.md` section 11) ; ce skill fixe le contenu web à mettre dans son `## Firstmate spec`.
Les règles du domaine dans `data/captain.md` restent l'autorité ; le brief les applique, il ne les récrit pas.

## Quand charger

- Avant d'écrire ou de régénérer le brief de tout worker web : mesure, direction de design, page, contenu, correctif technique, performance, audit, revue de contenu.

## Faire

1. Choisir une seule unité de travail avec un livrable vérifiable de bout en bout ; un travail qui mélange direction de design, rédaction et code se redécoupe.
   La taille d'une unité suit le temps du rendu : une tâche d'exploration ou une direction (`web-design-direction`), une section de l'accueil ou sa relecture (`web-mise-au-point`), une page en construction.
   Une unité qui touche plus d'une section ou plus d'une page se redécoupe ; celui qui construit ne relit pas son propre livrable.
   Audit, mesure, revue de contenu, exploration et mise au point de la maquette sont des scouts, dont le code reste sous leur dossier de données ; toute unité qui écrit dans le projet est un ship.
2. Vérifier que ses entrées sont figées avant de lancer, et les nommer dans le brief avec leur chemin, à ne pas modifier :
   - rendu nouveau ou refait : le DESIGN.md retenu par le capitaine (`web-design-direction`) ; pendant la mise au point, le DESIGN.md en mise au point, que le worker ne modifie pas (`web-mise-au-point`) ;
   - tout rendu d'un site neuf : le plan de contenu (`web-intake`) ;
   - page de contenu : le plan de contenu (une intention par page, requête visée) et les sources fournies ;
   - tout texte : la fiche `VOIX.md` du site et les verbatims de clients du plan de contenu quand il en existe (`web-intake`) ;
   - toute modification : la mesure de l'état de départ par le kit de contrôles du projet (`web-intake`).
   Une entrée non figée interdit le lancement.
   Seule la PR qui crée le kit du projet (lot 3) part sans cette mesure ; elle montre la première sortie du kit, qui sert de mesure de départ aux PR suivantes.
3. Modèle et effort : Opus pour le code, la rédaction, l'audit et la revue (effort élevé pour l'audit, la revue et les textes publiés) ; effort selon `harness-adapters`.
4. Écrire dans le brief les consignes de l'unité :
   - toute unité : seulement les règles de `data/captain.md` qui s'appliquent à cette unité, pas la liste entière ; trois à cinq critères de fin vérifiables sur capture ; ce que le worker ne touche pas (le reste de la page, les tokens, le DESIGN.md, le plan de contenu) ; un compte rendu de dix lignes au plus ;
   - tout rendu : skills `frontend-design` et `website-design` (`web-design-system`, `landing-page`, `web-review`) ; aucune signature de design IA listée par `frontend-design` sans justification écrite dans le DESIGN.md ; tokens du DESIGN.md seulement, hors moments signature écrits dans le DESIGN.md ;
   - exploration et direction de design : les consignes de la tâche dans `web-design-direction` (étapes 2 à 7), une seule tâche par brief ; pour le scout « Planche », la forme de sa question de choix et l'identifiant de la tâche tenue (étape 7) ;
   - mise au point de l'accueil : les consignes de la tâche dans `web-mise-au-point`, une section ou une relecture par brief ;
   - tout code : ponytail, HTML natif avant une bibliothèque, aucune dépendance directe nouvelle sans justification dans la PR, zéro JavaScript client par défaut sur un site vitrine ;
   - tout texte : la fiche `VOIX.md` du site et les mots des verbatims de clients quand il en existe, les catégories de `web-content-review` (tournures interdites, langage clair, liens et titres), une source primaire datée par affirmation factuelle, aucune preuve sociale sans source fournie par le capitaine (emplacement marqué à la place) ;
   - données structurées : types de la Search gallery seulement, contenu visible seulement, ni FAQPage ni HowTo ;
   - lieu qui reçoit du public : infos pratiques du plan de contenu en texte HTML visibles depuis l'accueil, téléphone en lien `tel:`, carte et prix en HTML (un PDF n'est qu'un complément), identiques à la fiche Google d'entreprise et reprises en données structurées `LocalBusiness` ou `Restaurant` ;
   - polices auto-hébergées, en WOFF2 seulement, en sous-ensemble quand la licence le permet, avec un `font-display` choisi et écrit dans la PR, au plus un préchargement (la police du texte courant), et le nombre de fichiers de police compté dans size-limit ; aucun traceur ni service tiers sans accord du capitaine ;
   - un seul travail lourd à la fois : construction, Playwright et Lighthouse en série, jamais deux mesures simultanées ni pendant un travail lourd d'un autre home ; avant d'attendre une commande lourde, déclarer `paused` selon la règle de statut du brief.
5. Écrire la définition de fini avec ses preuves, jointes à la PR ou au rapport.
   Un scout d'exploration ou de mise au point rend seulement les captures 1440 et 375 px de son livrable (et de la page entière pour une section) : le kit attend la construction.
   Pour tout ship :
   - captures 375, 768 et 1440 px avant et après, prises sur le rendu, clair et sombre si le site a les deux ;
   - Lighthouse cinq passes en médiane avant et après (JSON), avec l'objectif LCP ≤ 2,5 s sur mobile dans la médiane ; rapport axe ;
   - sorties de html-validate, lychee, knip et size-limit ;
   - pour un texte : sorties de Vale et Grammalecte, la liste « affirmations et sources » et l'élément original de la page ;
   - pour une PR : l'URL d'aperçu ;
   - aucune affirmation sur le site décrite comme vérifiée à la seule lecture du code.
   Ces preuves sortent du kit de contrôles du projet et sont obligatoires sur toute PR d'un projet web ; seule la PR qui crée le kit (lot 3) en est dispensée, et elle montre leur première sortie.
   Un outil absent ou empêché est un blocage que le worker remonte au firstmate (`blocked:`), jamais un manque écrit dans la PR.
6. Hors périmètre, à écrire dans le brief : toute mise en production, toute fusion, tout compte, achat ou connecteur d'écriture en production (WordPress.com, domaine), tout autre projet.
7. Arrêt : une question qui touche le DESIGN.md retenu, le plan de contenu, une source manquante ou une ligne de la grille de `web-intake` donne `needs-decision` au firstmate.
8. Avant de lancer, relire le brief : une unité, des entrées figées, un livrable, des preuves.

## Refuser ou remonter

- **Capitaine** : rien directement ; une unité impossible sans nouvelle décision passe par la grille de `web-intake`.
- **Firstmate** : unité, entrées figées, modèle, ordre des travaux et des mesures, preuves exigées.
- **Worker** : détails d'implémentation sans effet sur le DESIGN.md, le plan de contenu ou les sources ; jamais le remplacement ni l'omission d'une preuve du kit.
- Refuser d'écrire un brief « site entier » quand le travail se découpe par page, un brief « accueil entier » ou « toutes les directions » quand le travail se découpe par section ou par direction, un brief qui autorise la mise en production, ou un brief de rédaction sans sources fournies ni consigne de source primaire.

## Références

- `data/captain.md` : règles du domaine (mesure avant/après, sources, design, GEO, polices, travail lourd, comptes).
- Skills `frontend-design` (signatures du design généré par IA) et `website-design` (`landing-page` : preuves inventées, mots interdits, contrôle à 375/768/1440 px).
- Google, galerie des données structurées : https://developers.google.com/search/docs/appearance/structured-data/search-gallery
- Google, politiques des données structurées : https://developers.google.com/search/docs/appearance/structured-data/sd-policies
- Google, données structurées d'entreprise locale : https://developers.google.com/search/docs/appearance/structured-data/local-business
- Google, carte de restaurant en HTML plutôt qu'en PDF : https://youtu.be/wJukFIpZybY?t=1299
- NN/g, éviter le PDF pour la lecture à l'écran (2020) : https://www.nngroup.com/articles/avoid-pdf-for-on-screen-reading/
- web.dev, LCP (seuil « bon » 2,5 s) : https://web.dev/lcp
- web.dev, Best practices for fonts (2022-10-04 ; WOFF2, sous-ensemble, `font-display`, préchargement) : https://web.dev/articles/font-best-practices
- GOV.UK, Use clear language et Use the right tone (mots des visiteurs, ton de conversation) : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/clear-language/
- NN/g, The Four Dimensions of Tone of Voice (2023-08-16) : https://www.nngroup.com/articles/tone-of-voice-dimensions/
- `bin/fm-brief.sh --help` pour la forme du brief.
