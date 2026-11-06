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
   Audit, mesure et revue de contenu sont des scouts ; toute unité qui écrit dans le projet est un ship.
2. Vérifier que ses entrées sont figées avant de lancer, et les nommer dans le brief avec leur chemin, à ne pas modifier :
   - rendu nouveau ou refait : le DESIGN.md retenu par le capitaine (`web-design-direction`) ;
   - page de contenu : le plan de contenu (une intention par page, requête visée) et les sources fournies ;
   - toute modification : la mesure de l'état de départ (`web-intake`).
   Une entrée non figée interdit le lancement.
3. Modèle et effort : Opus pour le code et la rédaction, Fable pour l'audit et la revue ; effort selon `harness-adapters`.
4. Écrire dans le brief les consignes de l'unité :
   - tout rendu : skills `frontend-design` et `website-design` (`web-design-system`, `landing-page`, `web-review`) ; aucune signature de design IA listée par `frontend-design` sans justification écrite dans le DESIGN.md ; tokens du DESIGN.md seulement ;
   - tout code : ponytail, HTML natif avant une bibliothèque, aucune dépendance directe nouvelle sans justification dans la PR, zéro JavaScript client par défaut sur un site vitrine ;
   - tout texte : les catégories de tournures interdites de `web-content-review`, une source primaire datée par affirmation factuelle, aucune preuve sociale sans source fournie par le capitaine (emplacement marqué à la place) ;
   - données structurées : types de la Search gallery seulement, contenu visible seulement, ni FAQPage ni HowTo ;
   - polices auto-hébergées, aucun traceur ni service tiers sans accord du capitaine ;
   - un seul travail lourd à la fois : construction, Playwright et Lighthouse en série, jamais deux mesures simultanées ni pendant un travail lourd d'un autre home ; avant d'attendre une commande lourde, déclarer `paused` selon la règle de statut du brief.
5. Écrire la définition de fini avec ses preuves, jointes à la PR ou au rapport :
   - captures 375, 768 et 1440 px avant et après, prises sur le rendu, clair et sombre si le site a les deux ;
   - Lighthouse cinq passes en médiane avant et après (JSON) ; rapport axe ;
   - sorties des contrôles du kit du projet quand il existe (html-validate, lychee, knip, size-limit, Vale, Grammalecte ou LanguageTool), sinon le manque est écrit ;
   - pour un texte : la liste « affirmations et sources » et l'élément original de la page ;
   - pour une PR : l'URL d'aperçu ;
   - aucune affirmation sur le site décrite comme vérifiée à la seule lecture du code.
6. Hors périmètre, à écrire dans le brief : toute mise en production, toute fusion, tout compte, achat ou connecteur d'écriture en production (WordPress.com, domaine), tout autre projet.
7. Arrêt : une question qui touche le DESIGN.md retenu, le plan de contenu, une source manquante ou une ligne de la grille de `web-intake` donne `needs-decision` au firstmate.
8. Avant de lancer, relire le brief : une unité, des entrées figées, un livrable, des preuves.

## Refuser ou remonter

- **Capitaine** : rien directement ; une unité impossible sans nouvelle décision passe par la grille de `web-intake`.
- **Firstmate** : unité, entrées figées, modèle, ordre des travaux et des mesures, preuves exigées.
- **Worker** : détails d'implémentation sans effet sur le DESIGN.md, le plan de contenu ou les sources, et manière de produire ses preuves.
- Refuser d'écrire un brief « site entier » quand le travail se découpe par page, un brief qui autorise la mise en production, ou un brief de rédaction sans sources fournies ni consigne de source primaire.

## Références

- `data/captain.md` : règles du domaine (mesure avant/après, sources, design, GEO, polices, travail lourd, comptes).
- Skills `frontend-design` (signatures du design généré par IA) et `website-design` (`landing-page` : preuves inventées, mots interdits, contrôle à 375/768/1440 px).
- Google, galerie des données structurées : https://developers.google.com/search/docs/appearance/structured-data/search-gallery
- Google, politiques des données structurées : https://developers.google.com/search/docs/appearance/structured-data/sd-policies
- `bin/fm-brief.sh --help` pour la forme du brief.
