---
name: seo
description: >-
  Load in a web (firstmate-web) home before briefing the site structure, the content, or the launch of a site whose client expects search traffic, and before any SEO audit.
user-invocable: false
metadata:
  internal: true
---

# seo

Ce skill porte la supervision du référencement naturel, une part de la discipline `seo-fiche-google`, par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/seo-fiche-google/README.md` et sa compétence `seo.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part du référencement.
La fiche Google relève de `seo-local-fiche-google`.

## Quand charger

- Avant de briefer l'arborescence d'un site dont le client attend du trafic de recherche : le plan de mots-clés la précède.
- Avant de briefer les contenus de ce site.
- Avant de briefer ou d'accepter sa mise en ligne.
- Avant tout audit SEO.

## Faire

1. Quand le client attend du trafic de recherche, lancer une première tâche `seo-fiche-google` avant son rang, sur brief explicite : elle remet `mots-cles.md` avant `arborescence`.
2. Valider le plan de mots-clés avant de briefer l'arborescence et les textes, qui le citent.
3. Choisir le schéma de données structurées de chaque page, en commençant par les pages qui rapportent le plus, et l'écrire dans le brief de la tâche des balises.
4. À la réception, vérifier en plus de la réception commune :
   - `mots-cles.md` avec ses sources datées, puis `balises.md`, `redirections.md`, robots.txt et sitemap quand le brief en retient, et `assistants.md` ;
   - les contrôles `balises-seo`, `sitemap-donnees`, `recherche-texte` et `liens` du README ;
   - le contrôle `en-ligne` et la Search Console restent BLOQUÉ jusqu'à l'action du capitaine, puis se rejouent sur le domaine final.

## Refuser ou remonter

**Capitaine**
- Le nom de domaine, sur les critères de `seo.md` ; une égalité se tranche dans `chef-de-projet/choix.md`.
- Search Console, soumission du sitemap et tout compte.
- Tout désaveu de liens et toute demande de réexamen.
- Tout contact avec un site tiers : campagne de liens, retrait d'un contenu copié.
- Toute dépense : outil payant, publicité.

**Firstmate**
- La validation du plan de mots-clés, le schéma de chaque page et le refus d'une remise qui viole un refus net.

**Worker**
- Titles, méta descriptions, adresses, robots.txt, sitemap, redirections et JSON-LD, testés.

**Refus nets**
- Jamais d'achat ou d'échange de liens, ni de liens en masse.
- Jamais de bourrage, de texte caché ni de page satellite.
- Jamais de promesse de classement ni d'affichage enrichi.
- Jamais de balisage de ce qui n'est pas sur la page.

## Références

- `agence-web-ia` : `domaines/seo-fiche-google/README.md`, `domaines/seo-fiche-google/competences/seo.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client ; `architecture-information`, `contenu-ecriture`, `seo-local-fiche-google`.
