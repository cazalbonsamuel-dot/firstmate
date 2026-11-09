---
name: seo-geo-audit
description: Load in a web (firstmate-web) home before commissioning or presenting an SEO or GEO audit, and before presenting any SEO or GEO recommendation, even outside an audit; in that home it replaces marketing:seo-audit.
user-invocable: false
metadata:
  internal: true
---

# Audit SEO et GEO

Dans ce home, ce skill remplace `marketing:seo-audit`, partiellement périmé (il propose FAQ et HowTo et cite FID).
La documentation officielle des moteurs et les mesures du site sont l'autorité ; un audit est un scout, il ne produit jamais de PR.

## Quand charger

- Avant de commander un audit SEO ou GEO, complet ou ciblé, et avant d'en présenter les résultats au capitaine.
- Avant de présenter toute recommandation SEO ou GEO, même hors audit.

## Faire

1. Écrire le brief du scout avec `web-worker-brief` ; modèle Opus, effort élevé ; le site rendu est la source, pas le code seul.
2. Méthode imposée au scout :
   - chaque constat marqué [F] mesuré (outil, version, date, commande ou export) ou [H] hypothèse ;
   - chaque recommandation marquée [R], avec l'URL officielle et sa date « Last updated », une donnée Search Console ou Bing, ou un test reproductible ;
   - toute affirmation non vérifiable dite comme telle, jamais présentée comme établie.
3. Contrôles SEO :
   - indexabilité : `noindex`, codes HTTP, rendu sans JavaScript ou pré-rendu ;
   - robots.txt, jamais utilisé pour désindexer ; sitemap cohérent quand il existe (pas nécessaire sous 500 pages bien maillées) ;
   - canoniques et redirections ; plusieurs URL sur une même requête dans Search Console (la « cannibalisation » n'est pas une notion Google) ;
   - données structurées : types de la Search gallery, contenu visible, ni FAQPage ni HowTo ; Rich Results Test et Schema Markup Validator à la main (pas d'API) ;
   - Core Web Vitals : labo (Lighthouse cinq passes en médiane) et terrain (Search Console, CrUX quand le site a assez de trafic), seuils LCP 2 500 ms, INP 200 ms, CLS 0,1 au 75e percentile ;
   - hreflang seulement pour de vraies variantes de langue ou de région ;
   - fiche Google d'entreprise d'un lieu qui reçoit du public, lue sans la modifier : complète et cohérente avec le site, nom réel sans mot-clé ajouté, catégorie principale exacte, horaires y compris exceptionnels, lien vers la page qui sert la requête ;
   - avis : demandés à tous les clients par le lien ou le QR code de la fiche, sans contrepartie, sans tri et sans texte suggéré, chacun avec une réponse.
4. Contrôles GEO, limités à ce que les moteurs déclarent ou à ce qui est mesuré sur le site :
   - indexation et éligibilité au snippet (Google ne déclare aucune optimisation spéciale pour AI Overviews et AI Mode) ;
   - matrice des robots IA : robots de recherche autorisés (Googlebot, Bingbot, OAI-SearchBot, Claude-SearchBot, Claude-User, PerplexityBot, Applebot), robots d'entraînement selon la décision du capitaine, vérifiée aussi côté CDN ;
   - contrôles d'affichage (`nosnippet`, `data-nosnippet`, `max-snippet`) cohérents avec l'intention ;
   - mesure : rapport IA de Search Console (impressions seulement), Bing Webmaster Tools « AI Performance » (citations), chacun daté ;
     Clarity Citations demande d'installer Microsoft Clarity, traceur tiers : jamais sans l'accord du capitaine (aucune mesure d'audience au lancement, Q5).
5. Ne jamais présenter comme levier llms.txt, des miroirs Markdown ou des « versions pour agents » : Google déclare les ignorer et aucun moteur ne déclare les utiliser.
   Ne jamais utiliser un « rang IA » ponctuel comme mesure : les réponses des IA varient presque à chaque exécution.
   Refuser texte caché et injection de prompt.
6. Livrable : `data/<id>/report.md` avec constats [F] et [H] et recommandations [R] (étape 2), tableau avant/après quand il y a une mesure de départ, et liste de recommandations priorisée, chacune avec sa source et son effort.
   Aucune promesse de position, de trafic ni de citation.
7. Présenter au capitaine les constats et les recommandations, pas seulement la fin de l'audit (`scout-completion`) ; une recommandation à mettre en œuvre repart par `web-intake`.

## Refuser ou remonter

- **Capitaine** : tout compte (Search Console, Bing, Google Cloud, fiche Google d'entreprise, que seul le capitaine ou le commerçant modifie), tout outil payant (Ahrefs, Semrush, DataForSEO, suivi GEO), tout traceur ou service tiers sur le site (Microsoft Clarity compris), tout changement de la matrice des robots d'entraînement, la mise en œuvre des recommandations.
- **Firstmate** : périmètre de l'audit, contrôles retenus, priorisation présentée.
- **Worker scout** : ses constats et leur statut, sans recommander d'achat ni contacter le capitaine.
- Refuser une recommandation sans source ou une source non officielle présentée comme règle de moteur ; une étude de vendeur d'outils se cite avec son conflit d'intérêts.
- Refuser toute recommandation d'avis orientés, achetés ou filtrés, et de mots-clés ajoutés au nom de la fiche.

## Références

- `data/captain.md` : règle GEO, données structurées, décisions sur les comptes, outils payants et robots IA.
- Google, fonctionnalités IA : https://developers.google.com/search/docs/appearance/ai-features
- Google, guide d'optimisation IA (fichiers « pour IA » ignorés) : https://developers.google.com/search/docs/fundamentals/ai-optimization-guide
- Google, galerie des données structurées : https://developers.google.com/search/docs/appearance/structured-data/search-gallery
- Google, robots.txt : https://developers.google.com/search/docs/crawling-indexing/robots/intro
- Seuils Core Web Vitals : https://web.dev/articles/vitals
- Google Business Profile, classement local : https://support.google.com/business/answer/7091
- Google Business Profile, règles de représentation (nom réel, catégories) : https://support.google.com/business/answer/3038177
- Google Business Profile, demander des avis et y répondre : https://support.google.com/business/answer/3474122
- Google Maps, règles des contributions (ni contrepartie ni sollicitation sélective) : https://support.google.com/contributionpolicy/answer/7400114
- Bing, AI Performance : https://blogs.bing.com/webmaster/2026/2/Introducing-AI-Performance-in-Bing-Webmaster-Tools-Public-Preview/
- Robots des moteurs IA : https://developers.openai.com/api/docs/bots ; https://support.claude.com/en/articles/8896518 ; https://docs.perplexity.ai/guides/bots ; https://support.apple.com/en-us/119829
