---
name: web-intake
description: Load in a web (firstmate-web) home when a web need arrives - a site, a page, a redesign, a fix, content, or an audit - before writing any brief for it.
user-invocable: false
metadata:
  internal: true
---

# Entrée d'un besoin web

Ce skill porte le comment de l'admission ; la documentation officielle des moteurs et les règles du domaine dans `data/captain.md` (section « Façon de travailler dans ce domaine » et décisions du capitaine) restent l'autorité sur le quoi.
Le firstmate n'écrit jamais dans le projet (`AGENTS.md` règle 1) : il décide et un worker mesure, écrit et livre (`web-worker-brief`).

## Quand charger

- À l'arrivée d'un besoin web (site, page, refonte, correctif, contenu, audit), avant tout brief de worker.
- Quand une réponse du capitaine change l'objectif, le public ou le périmètre d'un besoin en cours : reprendre les étapes 2 à 7.

## Faire

1. Classer le besoin : site neuf, page ou refonte, correctif technique, contenu rédactionnel, audit SEO ou GEO.
   Un audit seul se traite avec `seo-geo-audit` et ne produit pas de PR.
2. Citer la demande mot pour mot, puis écrire séparément :
   - l'objectif mesurable (ce qui doit changer, sur quelle mesure) ;
   - le public visé ;
   - la requête réelle que la page sert, une intention par page ;
   - les faits sourcés, les hypothèses bornées et les inconnues.
   Ne pas élargir l'intention ni inventer de préférence.
3. Avant toute nouvelle page, faire vérifier dans Search Console qu'aucune URL existante ne sert déjà cette requête ; sinon consolider par redirection ou canonique plutôt que créer.
   Sans propriété Search Console (site neuf), le consigner et vérifier sur le plan du site.
4. Prévoir la mesure de l'état de départ avant toute modification, par un premier worker ou en tête du worker de la modification : captures 375, 768 et 1440 px sur le rendu, Lighthouse cinq passes en médiane, axe, export Search Console quand la propriété existe.
   Ces mesures sortent du kit de contrôles du projet (Playwright avec axe, Lighthouse CI) ; un projet sans kit commence par la PR qui le crée (lot 3), seule PR dispensée de mesure de départ, dont la première sortie du kit devient la mesure de départ des suivantes ; un outil empêché est un blocage remonté au firstmate, pas un manque accepté (`web-worker-brief`).
   Une mesure à la fois sur ce Mac, jamais pendant un travail lourd d'un autre home.
5. Dresser la liste de ce qui remonte au capitaine en passant chaque ligne de cette grille, marquée « remonte » avec la question concrète ou « sans objet » :
   - nom de domaine, registraire ;
   - hébergeur, compte, CGU ;
   - comptes Search Console, Bing Webmaster Tools ou autre service ;
   - outil payant, abonnement, achat ;
   - traceur, outil d'audience, service tiers, police non auto-hébergée, bandeau de consentement ;
   - direction de design (nouveau rendu ou rendu refait : `web-design-direction`) ;
   - texte à publier, métadonnées et textes alternatifs compris (relecture du capitaine, `web-content-review`) ;
   - preuve sociale (témoignage, logo, chiffre, note, prix, distinction) dont le capitaine doit fournir la source ;
   - robots d'entraînement IA, si le besoin change la matrice décidée ;
   - fusion d'une PR sur un site en ligne, qui vaut mise en production (`web-livraison`).
   Envoyer ensemble, une question concise par ligne « remonte », avec son effet sur la suite ; la relecture des textes et la fusion s'annoncent dès l'admission et se demandent à la livraison ; pendant l'attente, lancer seulement les travaux compatibles avec toutes les réponses possibles, dont la mesure de départ.
6. Résoudre le mode de livraison selon `AGENTS.md` section 7 ; `yolo` reste désactivé pour tout site en ligne, même si le registre du projet dit autre chose : dans ce cas, le signaler au capitaine.
7. Décider le premier découpage en unités de travail, chacune avec son livrable vérifiable de bout en bout (`web-worker-brief`).
8. Tenir le besoin comme item du backlog du home ; la note dit le classement, l'objectif mesurable, la requête visée et les questions ouvertes.
   Tenir chaque question du capitaine selon `captain-hold-lifecycle`.

## Refuser ou remonter

- **Capitaine** : toute ligne « remonte » de la grille de l'étape 5, et toute inconnue qui change l'objectif, le public ou le périmètre.
- **Firstmate** : classement, objectif mesurable dérivé de la demande, hypothèses bornées, découpage, ordre des travaux et des mesures.
- **Worker** : aucun worker de modification avant la mesure de départ, hors celui de la PR qui crée le kit (lot 3) ; seuls mesure (dont la PR qui crée le kit du projet), audit et recherche peuvent partir avant les réponses du capitaine.
- Refuser une série de pages générées (villes, variantes, synonymes, traductions automatiques) et toute page qui ne nomme pas la requête réelle qu'elle sert et ce qu'elle apporte.
- Refuser tout connecteur d'écriture en production (WordPress.com, achat de domaine) pour un worker.

## Références

- `data/captain.md` : règles du domaine et décisions du capitaine (hébergeur, domaine, comptes, audience, robots IA).
- Google, politiques anti-spam (scaled content abuse, doorway abuse) : https://developers.google.com/search/docs/essentials/spam-policies
- Google, canonicalisation : https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls
- Lighthouse, variabilité (médiane de cinq passes, pas de passes parallèles) : https://github.com/GoogleChrome/lighthouse/blob/main/docs/variability.md
