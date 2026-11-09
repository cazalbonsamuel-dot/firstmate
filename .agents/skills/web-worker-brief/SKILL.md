---
name: web-worker-brief
description: Load in a web (firstmate-web) home before writing the brief of a web worker - design direction, page, content, technical fix, performance, measurement, or audit.
user-invocable: false
metadata:
  internal: true
---

# Brief d'un worker web

Le brief se génère par `bin/fm-brief.sh` (`AGENTS.md` section 11) ; ce skill fixe le contenu web à mettre dans son `## Firstmate spec`.
Les 63 règles de `data/regles-design.md` et les décisions du capitaine dans `data/captain.md` restent l'autorité ; le brief les applique, il ne les récrit pas, et nomme pour chaque règle si elle est un invariant [I] ou un défaut [D] que le DESIGN.md retenu peut écarter avec sa raison écrite ; les seuls défauts sont les règles 14, 24, 28 à 32 et 37, toutes les autres sont des invariants.

## Quand charger

- Avant d'écrire ou de régénérer le brief de tout worker web : mesure, direction de design, page, contenu, correctif technique, performance, audit, revue de contenu.

## Faire

1. Choisir une seule unité de travail avec un livrable vérifiable de bout en bout ; un travail qui mélange direction de design, rédaction et code se redécoupe.
   Audit, mesure et revue de contenu sont des scouts ; toute unité qui écrit dans le projet est un ship.
2. Vérifier que ses entrées sont figées avant de lancer, et les nommer dans le brief avec leur chemin, à ne pas modifier :
   - rendu nouveau ou refait : le DESIGN.md retenu par le capitaine (`web-design-direction`) ;
   - tout rendu d'un site neuf : le plan de contenu et la fiche d'admission, dont la liste des photos (`web-intake`) ;
   - page de contenu : le plan de contenu (une intention par page, requête visée) et les sources fournies ;
   - tout texte : la fiche `VOIX.md` du site et les verbatims de clients du plan de contenu quand il en existe (`web-intake`) ;
   - toute modification : la mesure de l'état de départ par le kit de contrôles du projet (`web-intake`).
   Une entrée non figée interdit le lancement.
   Seule la PR qui crée le kit du projet (lot 3) part sans cette mesure ; elle montre la première sortie du kit, qui sert de mesure de départ aux PR suivantes.
3. Modèle et effort : Opus pour le code et la rédaction, Opus en effort élevé pour l'audit et la revue, par un worker distinct de l'auteur ; Fable n'est jamais un modèle de worker ; sinon effort selon `harness-adapters`.
4. Écrire dans le brief les consignes de l'unité :
   - tout rendu : skills `frontend-design` et `website-design` (`web-design-system`, `landing-page`, `web-review`) ; les invariants priment sur leurs règles maison et, pour l'apparence, le DESIGN.md retenu tranche (règle 33) ; aucune signature de design IA de la liste de référence (`web-design-direction` étape 3) sans une raison écrite propre au brief (règle 16) ; toute valeur récurrente par un token du DESIGN.md, hors les moments signature qu'il écrit ; une décision du DESIGN.md qui ne tient pas au rendu se signale avec captures, sans la changer (règle 19) ; les défauts [D] d'apparence et de réassurance du DESIGN.md (`web-design-direction` étape 6, règles 24, 28 à 32 et 37), texte sur image seulement avec le contraste de 4,5:1 mesuré sur le rendu à 375 et 1440 px (règle 31) ;
   - Impeccable, quand le brief le nomme : sans hook, sans mode `live` ni `generate`, télémétrie coupée ; `critique`, `typeset`, `layout`, `bolder`, `quieter`, `colorize` ou `polish` sur un rendu, une commande à la fois, avec captures avant et après (règle 34) ;
   - images : chaque image apporte ou clarifie une information (règle 35) ; sur le site, des photos de qualité faites pour le site, avec des humains, pas de banque d'images (règle 36) ; en attendant la vraie, une photo provisoire sous licence, de qualité, choisie d'après la liste des photos (même sujet, cadrage et format), marquée comme telle, à remplacer par une photo réelle (règle 38) ; une image générée publiée porte les métadonnées IPTC `trainedAlgorithmicMedia` exactes (règle 39) ; dimensions explicites, texte alternatif, hero chargé en premier (règle 40) ;
   - accessibilité : les points de la règle 49 (moins de 80 caractères par ligne, contraste, cibles de 44 px, pas de défilement horizontal à 375 px, focus visible, mouvement réduit), le zoom de la règle 50, les formulaires de la règle 51, aucune surcouche d'accessibilité (règle 55) ;
   - maquette non publiée : `noindex`, badge fixe discret dans un coin qui ne masque pas le premier écran, données fictives sûres (règle 56) ;
   - tout ce qui a l'air faux à l'écran, même hors sujet, est signalé et corrigé (règle 61) ;
   - direction de design : les consignes du scout de `web-design-direction` étapes 1 à 4, écrites en entier dans le brief : identité relevée pour une refonte, deux jeux de références par direction (niveau visé, métier), matrice de structure, élément mémorable, page de planche par direction, deux passes de `frontend-design`, maquette à contenu réaliste capturée à 375 et 1440 px et passée au contrôle de `web-review`, code source des maquettes sous son dossier de données (point de départ, jamais à la place du DESIGN.md retenu), planche construite, hébergée et armée avant de remonter `needs-decision [key=board-review]` avec le chemin absolu du fichier de la planche et son URL, sans s'adresser au capitaine, et question de choix dans la forme de l'étape 4 ;
   - tout code : ponytail ; zéro JavaScript client par défaut : HTML et CSS natifs d'abord (`details`, `dialog`, `popover`, `:has()`, requêtes de conteneur, transitions, animations liées au défilement en amélioration progressive) ; un script court est permis pour une interaction justifiée ; aucune bibliothèque ni dépendance nouvelle sans justification dans la PR (règle 48) ;
   - tout texte : la fiche `VOIX.md` du site et les mots des verbatims de clients quand il en existe (règle 8), les catégories de `web-content-review` (tournures interdites, langage clair, liens et titres, règles 41 et 42), une source primaire datée par affirmation factuelle (règle 44), aucune preuve sociale sans source fournie par le capitaine : en maquette un exemple réaliste marqué « exemple fictif », sur le site un emplacement marqué tant que la source manque (règle 43) ; le texte passe par le skill `humanizer` avant sa revue (règle 45) ;
   - données structurées : types de la Search gallery seulement, contenu visible seulement, ni FAQPage ni HowTo (règle 52) ;
   - lieu qui reçoit du public : adresse, horaires, téléphone en lien `tel:`, carte et prix en HTML visibles depuis l'accueil, identiques à la fiche Google d'entreprise et repris en données structurées `LocalBusiness` ou un sous-type (`Restaurant`) (règle 27) ;
   - polices auto-hébergées, en WOFF2, en sous-ensemble, avec un `font-display` écrit dans la PR et un seul préchargement (règle 46), le nombre de fichiers de police compté dans size-limit ; aucun traceur, service tiers ni bandeau sans accord du capitaine, aucune mesure d'audience au lancement (règle 47) ;
   - un seul travail lourd à la fois sur ce Mac (règle 59) : construction, Playwright et Lighthouse en série, jamais deux mesures simultanées ni pendant un travail lourd d'un autre home ; avant d'attendre une commande lourde, déclarer `paused` selon la règle de statut du brief.
5. Écrire la définition de fini avec ses preuves, mesurées avant et après et jointes à la PR ou au rapport (règle 58) :
   - captures 375, 768 et 1440 px avant et après, prises sur le rendu, clair et sombre si le site a les deux ;
   - Lighthouse cinq passes en médiane avant et après (JSON), avec LCP ≤ 2,5 s sur mobile dans la médiane (règle 53) ; rapport axe ;
   - sorties de html-validate, lychee, knip et size-limit ;
   - pour un texte : sorties de Vale et Grammalecte, la liste « affirmations et sources » et l'élément original de la page ;
   - pour une PR : l'URL d'aperçu ;
   - aucune affirmation sur le site décrite comme vérifiée à la seule lecture du code (règle 57).
   Ces preuves sortent du kit de contrôles du projet et sont obligatoires sur toute PR d'un projet web ; seule la PR qui crée le kit (lot 3) en est dispensée, et elle montre leur première sortie.
   Un outil absent ou empêché est un blocage que le worker remonte au firstmate (`blocked:`), jamais un manque écrit dans la PR.
6. Hors périmètre, à écrire dans le brief : toute mise en production, toute fusion, tout compte, achat, domaine, hébergeur, fiche Google ou connecteur d'écriture en production (WordPress.com), tout autre projet (règle 63).
7. Arrêt : une question qui touche le DESIGN.md retenu, le plan de contenu, une source manquante ou une ligne de la grille de `web-intake` donne `needs-decision` au firstmate.
8. Avant de lancer, relire le brief : une unité, des entrées figées, un livrable, des preuves ; les remarques du capitaine y sont traduites en ce qu'un professionnel ferait, jamais recopiées en texte, en section ou en règle générale (règle 2) ; chaque consigne de rendu nomme des écarts précis, jamais « fais au mieux » ni « rends ça plus moderne » (règle 62).

## Refuser ou remonter

- **Capitaine** : rien directement ; une unité impossible sans nouvelle décision passe par la grille de `web-intake`.
- **Firstmate** : unité, entrées figées, modèle, ordre des travaux et des mesures, preuves exigées.
- **Worker** : détails d'implémentation sans effet sur le DESIGN.md, le plan de contenu ou les sources ; jamais le remplacement ni l'omission d'une preuve du kit.
- Refuser d'écrire un brief « site entier » quand le travail se découpe par page, un brief qui autorise la mise en production, un brief de rédaction sans sources fournies ni consigne de source primaire, ou un brief qui confie l'audit ou la revue à l'auteur.

## Références

- `data/regles-design.md` : les 63 règles du capitaine.
- `data/captain.md` : décisions du capitaine (modèles des workers, GEO, comptes).
- Skills `frontend-design` et `website-design:web-design-system` (liste de référence des signatures du design généré par IA), `website-design` (`landing-page` : preuves inventées, mots interdits, contrôle à 375/768/1440 px), `impeccable` et `humanizer`.
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
