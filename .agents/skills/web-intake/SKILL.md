---
name: web-intake
description: Load in a web (firstmate-web) home when a web need arrives - a site, a page, a redesign, a fix, content, or an audit - before writing any brief for it.
user-invocable: false
metadata:
  internal: true
---

# Entrée d'un besoin web

Ce skill porte le comment de l'admission ; les 63 règles de `data/regles-design.md` (invariants [I] jamais enfreints, défauts [D] que le DESIGN.md retenu peut écarter avec sa raison écrite), la documentation officielle des moteurs et les décisions du capitaine dans `data/captain.md` restent l'autorité sur le quoi.
Une règle qui ne vaut que pour un site va dans sa fiche d'admission, pas dans les règles.
Le firstmate n'écrit jamais dans le projet (`AGENTS.md` règle 1) : il décide et un worker mesure, écrit et livre (`web-worker-brief`).

## Quand charger

- À l'arrivée d'un besoin web (site, page, refonte, correctif, contenu, audit), avant tout brief de worker.
- Quand une réponse du capitaine change l'objectif, le public ou le périmètre d'un besoin en cours : reprendre les étapes 2 à 7.

## Faire

1. Classer le besoin : site neuf, page ou refonte, correctif technique, contenu rédactionnel, audit SEO ou GEO.
   Un audit seul se traite avec `seo-geo-audit` et ne produit pas de PR.
2. Citer la demande mot pour mot, puis écrire séparément la fiche d'admission :
   - l'objectif mesurable (ce qui doit changer, sur quelle mesure) ;
   - l'action principale du site, une seule, définie ici (appeler, réserver, demander un devis...) (règle 7) ;
   - le public visé ;
   - la requête réelle que la page sert, nommée, une intention par page (règle 9) ;
   - trois mots pour l'impression voulue (par exemple : précis, chaleureux, haut de gamme) (règle 10a) ;
   - ce que le métier a de concret à montrer (matières, outils, lieux, gestes, résultats), d'où viennent les choix visuels distinctifs (règle 10b) ;
   - la liste des photos nécessaires (sujet, cadrage, lumière, format), pour savoir dès le départ quelles images le site aura (règle 10c) ;
   - les faits sourcés, les hypothèses bornées et les inconnues.
   Les remarques du capitaine sont une direction, jamais un texte ni un gabarit : en tirer ce qu'un professionnel ferait, à partir de vrais sites, sans recopier ses mots ni transformer une remarque en section, en liste ou en règle générale (règle 2).
   Pour un site neuf, le contenu précède le design (règle 5) : écrire le public, l'objectif du visiteur, ses freins, craintes et objections, puis, dans la peau du client, la liste de ses questions pour choisir (vient-il chez moi ? sait-il faire mon cas ? est-il fiable ? comment le joindre ? combien ça coûte ?) ; ils forment le plan de contenu, qui part de ce que le visiteur cherche, pas de celui qui vend (règle 6).
   Au premier travail de texte d'un site, quel que soit le classement (site neuf, refonte, contenu sur un site existant), le plan de contenu crée la fiche `VOIX.md` du site, une par site, reprise ensuite par tout texte (règle 8), avec les verbatims de clients quand il en existe, fournis par le capitaine ou le commerçant (avis, messages, questions posées au téléphone, entretien), jamais recueillis par un worker auprès d'un client ; la fiche suit le modèle de celle de l'agence : personne qui parle, vouvoiement ou non, ton sur les quatre échelles de NN/g (humour, formalité, respect, enthousiasme), mots à employer et à éviter, exemples avant/après.
   Pour un lieu qui reçoit du public, le plan de contenu inclut ses infos pratiques en texte HTML visibles depuis l'accueil : adresse, horaires, téléphone en lien `tel:`, carte et prix en HTML, identiques à la fiche Google d'entreprise et repris en données structurées `LocalBusiness` (règle 27).
   Ne pas élargir l'intention ni inventer de préférence.
3. Avant toute nouvelle page, faire vérifier dans Search Console qu'aucune URL existante ne sert déjà cette requête ; sinon consolider par redirection ou canonique plutôt que créer.
   Sans propriété Search Console (site neuf), le consigner et vérifier sur le plan du site.
4. Prévoir la mesure de l'état de départ avant toute modification (règle 58), par un premier worker ou en tête du worker de la modification : captures 375, 768 et 1440 px sur le rendu, Lighthouse cinq passes en médiane, axe, export Search Console quand la propriété existe.
   Ces mesures sortent du kit de contrôles du projet (Playwright avec axe, Lighthouse CI) ; un projet sans kit commence par la PR qui le crée (lot 3), seule PR dispensée de mesure de départ, dont la première sortie du kit devient la mesure de départ des suivantes ; un outil empêché est un blocage remonté au firstmate, pas un manque accepté (`web-worker-brief`).
   Un seul travail lourd à la fois sur ce Mac (règle 59), jamais une mesure pendant un travail lourd d'un autre home.
5. Dresser la liste de ce qui remonte au capitaine en passant chaque ligne de cette grille, marquée « remonte » avec la question concrète ou « sans objet » :
   - nom de domaine, registraire (règle 63) ;
   - hébergeur, compte, CGU (règle 63) ;
   - comptes Search Console, Bing Webmaster Tools ou autre service ;
   - fiche Google d'entreprise d'un lieu qui reçoit du public, créée ou revendiquée par le capitaine ou le commerçant, jamais par un worker (règle 63) ;
   - page de mentions légales de tout site professionnel (éditeur, immatriculation, hébergeur), dont le capitaine fournit les données (règle 54) ;
   - outil payant, abonnement, achat, référence ou ressource payante hors UXKIN (règle 3) ;
   - traceur, service tiers, bandeau, chacun sur l'accord du capitaine ; aucune mesure d'audience au lancement (règle 47) ;
   - direction de design (nouveau rendu ou rendu refait, choisie par le capitaine sur planche : `web-design-direction`) et tout changement de direction en cours de projet (règles 1 et 3) ;
   - fiche `VOIX.md` d'un site sans fiche, à son premier travail de texte : les choix de la fiche et les verbatims de clients, fournis par le capitaine ou le commerçant ;
   - texte à publier, métadonnées et textes alternatifs compris (relecture du capitaine, règle 4, `web-content-review`) ;
   - preuve sociale (témoignage, logo, chiffre, note, prix, distinction) dont le capitaine doit fournir la source (règle 43) ;
   - robots d'entraînement IA, si le besoin change la matrice décidée ;
   - fusion d'une PR, qui attend le mot du capitaine et vaut mise en production sur un site en ligne (règles 4 et 63, `web-livraison`).
   Envoyer ensemble, une question concise par ligne « remonte », avec son effet sur la suite ; la relecture des textes et la fusion s'annoncent dès l'admission et se demandent à la livraison ; pendant l'attente, lancer seulement les travaux compatibles avec toutes les réponses possibles, dont la mesure de départ.
6. Résoudre le mode de livraison selon `AGENTS.md` section 7 ; `yolo` reste désactivé pour tout site en ligne, même si le registre du projet dit autre chose : dans ce cas, le signaler au capitaine.
7. Décider le premier découpage en unités de travail, chacune avec son livrable vérifiable de bout en bout (`web-worker-brief`).
   Pour un site neuf, le plan de contenu précède la direction de design (`web-design-direction`) ; le design sert ce contenu et lui donne du caractère (règle 5).
   Une refonte commence par un inventaire des URL existantes (crawl et Search Console) qui porte pour chaque page son objectif, son trafic dans Search Console quand la propriété existe et une décision (garder, fusionner, supprimer) ; le plan de contenu et, quand des URL changent, la table de redirections 301 page à page, jamais vers l'accueil par défaut, sortent de cette même liste, entrée figée du worker de la refonte (`web-livraison`).
8. Tenir le besoin comme item du backlog du home ; la note dit le classement, l'objectif mesurable, la requête visée et les questions ouvertes.
   Tenir chaque question du capitaine selon `captain-hold-lifecycle`.

## Refuser ou remonter

- **Capitaine** : toute ligne « remonte » de la grille de l'étape 5, et toute inconnue qui change l'objectif, le public ou le périmètre.
- **Firstmate** : classement, objectif mesurable dérivé de la demande, hypothèses bornées, découpage, ordre des travaux et des mesures.
- **Worker** : aucun worker de modification avant la mesure de départ, hors celui de la PR qui crée le kit (lot 3) ; seuls mesure (dont la PR qui crée le kit du projet), audit et recherche peuvent partir avant les réponses du capitaine.
- Refuser une série de pages générées (villes, variantes, synonymes, traductions automatiques) et toute page qui ne nomme pas la requête réelle qu'elle sert et ce qu'elle apporte (règle 9).
- Refuser tout connecteur d'écriture en production (WordPress.com, achat de domaine) pour un worker (règle 63).
- Refuser toute surcouche ou tout widget d'accessibilité sur un site (règle 55).
- Refuser une fiche d'admission sans action principale, sans les trois mots, sans ce que le métier a de concret à montrer ou sans la liste des photos (règles 7 et 10).

## Références

- `data/regles-design.md` : les 63 règles du capitaine, autorité du design et de la méthode web.
- `data/captain.md` : décisions du capitaine (hébergeur, domaine, comptes, robots IA).
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
