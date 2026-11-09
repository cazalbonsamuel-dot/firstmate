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
   - l'action principale du visiteur (appeler, réserver, demander un devis...) ;
   - le public visé ;
   - la requête réelle que la page sert, une intention par page ;
   - les faits sourcés, les hypothèses bornées et les inconnues.
   Pour un site neuf, écrire aussi l'objectif du visiteur, ses freins, craintes et objections : ils forment le plan de contenu.
   Le plan de contenu classe la matière par priorité, sans ordre de sections, car la structure de la page est une décision de design : A, ce que le visiteur doit comprendre en cinq secondes, trois choses au plus ; B, ce qui le décide (preuves, prix d'appel, zone, délais, réalisations, avis) ; C, le détail (grille complète des tarifs, communes, majorations, justificatifs), qui va sur les pages et pas sur l'accueil.
   Il porte aussi trois mots pour l'impression voulue, ce que le métier a de concret à montrer (matières, outils, lieux, gestes, résultats) et la liste des photos nécessaires (sujet, cadrage, lumière, format), avec un portrait au travail, visage visible, en tête pour un artisan ou une petite équipe.
   Au premier travail de texte d'un site, quel que soit le classement (site neuf, refonte, contenu sur un site existant), le plan de contenu crée la fiche `VOIX.md` du site, reprise ensuite par tout travail de texte, avec les verbatims de clients quand il en existe, fournis par le capitaine ou le commerçant (avis, messages, questions posées au téléphone, entretien), jamais recueillis par un worker auprès d'un client ; la fiche suit le modèle de celle de l'agence : personne qui parle, vouvoiement ou non, ton sur les quatre échelles de NN/g (humour, formalité, respect, enthousiasme), mots à employer et à éviter, exemples avant/après.
   Pour un lieu qui reçoit du public, le plan de contenu inclut ses infos pratiques en texte HTML visibles depuis l'accueil : adresse et accès, horaires avec exceptions, téléphone en lien `tel:`, carte et prix en HTML (un PDF n'est qu'un complément), identiques à la fiche Google d'entreprise.
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
   - fiche Google d'entreprise d'un lieu qui reçoit du public, créée ou revendiquée par le capitaine ou le commerçant, jamais par un worker ;
   - page de mentions légales de tout site professionnel (éditeur, immatriculation, hébergeur), dont le capitaine fournit les données ;
   - outil payant, abonnement, achat ;
   - traceur, outil d'audience, service tiers, police non auto-hébergée, bandeau de consentement ;
   - direction de design (nouveau rendu ou rendu refait : `web-design-direction`), puis validation du premier écran et de l'accueil complet (`web-mise-au-point`) ;
   - fiche `VOIX.md` d'un site sans fiche, à son premier travail de texte : les choix de la fiche et les verbatims de clients, fournis par le capitaine ou le commerçant ;
   - texte à publier, métadonnées et textes alternatifs compris (relecture du capitaine, `web-content-review`) ;
   - preuve sociale (témoignage, logo, chiffre, note, prix, distinction) dont le capitaine doit fournir la source ;
   - robots d'entraînement IA, si le besoin change la matrice décidée ;
   - fusion d'une PR sur un site en ligne, qui vaut mise en production (`web-livraison`).
   Envoyer ensemble, une question concise par ligne « remonte », avec son effet sur la suite ; la relecture des textes et la fusion s'annoncent dès l'admission et se demandent à la livraison ; pendant l'attente, lancer seulement les travaux compatibles avec toutes les réponses possibles, dont la mesure de départ.
6. Résoudre le mode de livraison selon `AGENTS.md` section 7 ; `yolo` reste désactivé pour tout site en ligne, même si le registre du projet dit autre chose : dans ce cas, le signaler au capitaine.
7. Décider le premier découpage en unités de travail, chacune avec son livrable vérifiable de bout en bout (`web-worker-brief`).
   Pour un site neuf, le plan de contenu précède la direction de design (`web-design-direction`) ; le design ne se néglige pas pour autant, il sublime et sert ce contenu.
   Un rendu neuf ou refait suit trois temps, chacun en petites tâches confiées à des workers distincts : exploration (`web-design-direction`), mise au point de l'accueil section par section (`web-mise-au-point`), construction page par page (`web-worker-brief`) ; le capitaine tranche à la planche, au premier écran et à l'accueil complet.
   Une refonte commence par un inventaire des URL existantes (crawl et Search Console) qui porte pour chaque page son objectif, son trafic dans Search Console quand la propriété existe et une décision (garder, fusionner, supprimer) ; le plan de contenu et, quand des URL changent, la table de redirections 301 page à page, jamais vers l'accueil par défaut, sortent de cette même liste, entrée figée du worker de la refonte (`web-livraison`).
8. Tenir le besoin comme item du backlog du home ; la note dit le classement, l'objectif mesurable, la requête visée et les questions ouvertes.
   Tenir chaque question du capitaine selon `captain-hold-lifecycle`.

## Refuser ou remonter

- **Capitaine** : toute ligne « remonte » de la grille de l'étape 5, et toute inconnue qui change l'objectif, le public ou le périmètre.
- **Firstmate** : classement, objectif mesurable dérivé de la demande, hypothèses bornées, découpage, ordre des travaux et des mesures.
- **Worker** : aucun worker de modification avant la mesure de départ, hors celui de la PR qui crée le kit (lot 3) ; seuls mesure (dont la PR qui crée le kit du projet), audit et recherche peuvent partir avant les réponses du capitaine.
- Refuser une série de pages générées (villes, variantes, synonymes, traductions automatiques) et toute page qui ne nomme pas la requête réelle qu'elle sert et ce qu'elle apporte.
- Refuser tout connecteur d'écriture en production (WordPress.com, achat de domaine) pour un worker.
- Refuser toute surcouche ou tout widget d'accessibilité sur un site : ils ne remplacent jamais l'accessibilité du code.

## Références

- `data/captain.md` : règles du domaine et décisions du capitaine (hébergeur, domaine, comptes, audience, robots IA, conversion et contenu).
- Google, politiques anti-spam (scaled content abuse, doorway abuse) : https://developers.google.com/search/docs/essentials/spam-policies
- Google, canonicalisation : https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls
- Lighthouse, variabilité (médiane de cinq passes, pas de passes parallèles) : https://github.com/GoogleChrome/lighthouse/blob/main/docs/variability.md
- Google Business Profile, classement local (pertinence, distance, notoriété ; infos complètes et exactes) : https://support.google.com/business/answer/7091
- Google, données structurées d'entreprise locale (`Restaurant`, `menu`, `openingHoursSpecification`) : https://developers.google.com/search/docs/appearance/structured-data/local-business
- NN/g, éviter le PDF pour la lecture à l'écran (2020) : https://www.nngroup.com/articles/avoid-pdf-for-on-screen-reading/
- Google, déménagement de site avec changement d'URL (table des URL, redirections gardées au moins un an) : https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes
- Service-public, mentions obligatoires sur le site d'une entreprise : https://entreprendre.service-public.gouv.fr/vosdroits/F37351
- GOV.UK, Use clear language (les mots que les visiteurs emploient eux-mêmes) : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/clear-language/
- GOV.UK, Use the right tone (« Write conversationally ») : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/writing-guidelines/right-tone/
- NN/g, The Four Dimensions of Tone of Voice (2023-08-16) : https://www.nngroup.com/articles/tone-of-voice-dimensions/
- Mailchimp, Voice and Tone (voix constante, ton qui varie) : https://styleguide.mailchimp.com/voice-and-tone/
- GOV.UK, Manage existing GOV.UK content (audit de contenu, retrait du contenu obsolète) : https://guidance.publishing.service.gov.uk/writing-to-gov-uk-standards/plan-manage-content/manage-existing-govuk-content/
- NN/g, utilisateurs de lecteurs d'écran et surcouches d'accessibilité (2024) : https://youtu.be/mvKTItqsOCg
