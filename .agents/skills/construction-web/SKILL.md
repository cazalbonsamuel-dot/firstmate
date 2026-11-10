---
name: construction-web
description: >-
  Load in a web (firstmate-web) home before briefing a site's integration, CMS, hosting or technical go-live, and before accepting a built site.
user-invocable: false
metadata:
  internal: true
---

# construction-web

Ce skill possède le passage de la maquette validée au site en ligne, sûr et testé.
Il donne à chaque brief d'intégration les mêmes règles et à chaque site la même recette.

## Quand charger

- Avant de briefer l'intégration d'une maquette validée.
- Avant de briefer un CMS : installation, thème, extensions, réglages, sauvegarde, mise à jour.
- Avant de briefer l'hébergement, le domaine, le HTTPS ou la mise en ligne technique.
- Avant d'accepter un site construit.

## Faire

Une règle [daté] : valeur à vérifier au moment du projet.
Les leçons 412738 L95-L161 datent de 2015 : écrans et options [daté : valeur à vérifier au moment du projet].

### 1. Avant le brief

1. Exiger la maquette validée, dont on reprend les valeurs sans les inventer [805992 HTML-CSS 22].
2. Exiger la liste convenue des navigateurs et appareils : hors du plan de test, rien n'est fait [412738 L26 P82].
3. Sans liste, la bâtir sur les appareils, navigateurs et connexions du public, d'après plusieurs sources [412738 L27 P84].
4. Retenir les 3 à 5 scénarios principaux [412738 L26 P83].
5. Classer chaque scénario [412738 L28 P86] :
   - pleinement supporté : tout fonctionne, écart minimal avec le design ;
   - partiellement supporté : contenu lisible, navigation sans impasse ;
   - non supporté : ni construit ni testé.
6. Faire trancher CMS ou code [805992 WordPress 119].

### 2. Brief du code

**Mise en place**

- index.html à la racine, puis css/, img/, js/ [437398 S7 P10].
- Reset `* { margin: 0; padding: 0; box-sizing: border-box; }` en premier [437398 S4 R37].
- Une fiche des valeurs du design avant de coder [412738 L130 P493].
- Head : doctype, `lang`, `charset="utf-8"` [437398 S2 R6, R7 ; 3828556 Balises meta #13].
- Meta viewport `width=device-width, initial-scale=1.0`, sinon pas de responsive sur téléphone [437398 S8 R113].

**CSS et mise en page**

- Une feuille externe ; l'inline n'est « pas une bonne pratique » [437398 S3 R16] ; seule exception, le CSS critique en ligne, qui relève de `performance-web`.
- Styler par classes, jamais par id [437398 S3 R20].
  - Autre : id pour un élément unique [805992 CSS 18] ; retenu le cours dédié.
- `!important` en dernier recours [437398 S3 R24].
  - Autre : forcer avec `!important` [805992 Bootstrap 63] ; retenu le cours dédié.
- Toute pile de polices finit par une famille générique [805992 CSS 16].
- Flexbox pour les composants, Grid pour la page, `gap` plutôt que margin [437398 S4 R42, R44].
- Conteneur en max-width, absolu jamais pour la mise en page, floats « dépassés » [437398 S3-S7 R31, R36, R95].

**Responsive**

- Unités rem avec `html { font-size: 62.5% }`, qui respecte la police choisie par l'utilisateur [437398 S7 R94].
  - Autre : em relatif, px absolu [805992 CSS 17] ; retenu le cours dédié.
- Media queries en em [437398 S8 R114].
- Mobile first en min-width [805992 Bootstrap 44 ; 437398 S8 R111 « plus moderne »] ; pas de contradiction : 437398 ne prend le desktop first que « pour le cours ».
- Points de rupture là où le design casse, jamais par appareil, peu nombreux [437398 S8 R112].
- Paliers Bootstrap 5 : 576 à 1400 px [805992 Bootstrap 43] [daté : valeur à vérifier au moment du projet].
- Image fluide (max-width 100 %), sans défilement horizontal, que Google note mal [805992 Bootstrap 50 ; 3828556 Site responsive #104].

### 3. Brief WordPress, si retenu

**Installation et réglages**

- wordpress.org : le site appartient au client [805992 WordPress 121].
- Installer selon PR41 : identifiant jamais « admin », mot de passe très sûr, gardé en lieu sûr [412738 L135 P504].
- Indexation découragée pendant le développement [412738 L136 P506], option décochée en ligne [805992 WordPress 123].
- Seulement les droits nécessaires ; « auteur » pour qui écrit sans toucher au site [412738 L155 P529 ; 805992 WordPress 134].

**Thème et extensions**

- Un thème qui implémente le design validé [412738 L150 P521] [préférence].
  - Hors cas : un thème d'abord si le client n'a pas d'idée [805992 WordPress 120] ; ici le design précède [805992 PHP 82].
- Thème facile, documenté, fonctions incluses, léger, compatible, vrai support, avis lus [412738 L150 P522].
- Thème payant à 0-15 ventes : méfiance [805992 WordPress 140].
- Extension populaire, bien notée, mise à jour récente, avis lus avant d'installer [805992 WordPress 133 ; 412738 L146 P517].
- Vidéos chez un service tiers, jamais sur son serveur [412738 L145 P515].

**Personnalisation**

- Toujours dans un thème enfant, jamais dans le parent [805992 Code 152, P15].
  - Autre : modifier la feuille du thème avec une copie [412738 L159 P534] ; retenu le non daté.
- Sans PHP, ne toucher ni aux fichiers du thème ni aux extensions [412738 L153 P526, L146 P517].
- Inspecter avant de modifier un CSS, copier l'original avant tout changement [412738 L158-L159 P533, P534].

### 4. Brief hébergement, domaine, HTTPS

- Les prix se valent, le service décide [412738 L97 P454] [daté : valeur à vérifier au moment du projet].
- Netlify par glisser-déposer [437398 S9 P20], ou cPanel et FTP [805992 Hébergement P5] [daté : valeur à vérifier au moment du projet].
- E-mail du compte valide et compte FTP à mot de passe fort [412738 L97-L98 P455, P456].
- Travailler seulement dans public_html [805992 Hébergement 69].
- Chaque dossier public a un index.html, sinon ses fichiers s'affichent [805992 Hébergement 70].
- Domaine externe pointé vers l'hébergement, propagation jusqu'à 48 h [805992 Hébergement 68, 71].
- HTTPS activé chez l'hébergeur : « non sécurisé » fait fuir [3828556 HTTPS #130, #131].
- Favicon jamais par défaut, en jeu complet plutôt qu'un seul .ico [437398 S9 R120 ; 3828556 Favicon #132, #133].
- Tailles : 64, 180, 192 et 512 px [437398 S9 P19].

### 5. Recette technique, à la réception

Firstmate accepte le site si :

1. chaque scénario atteint sa catégorie de support [412738 L28 P86] ;
2. Chrome, Firefox, Safari et Edge passent, en dernière version [437398 S7 P1 ; 412738 L99 P458] ;
3. le responsive passe sur de vrais appareils [437398 S8 R116] ;
4. le validateur HTML passe [437398 S3 R34, P16] ;
5. un service comme BrowserStack a suivi les bugs [412738 L134 P503] [préférence] ;
6. HTTPS et favicon s'affichent [3828556 HTTPS 3.5, Favicon 3.6] ;
7. sous WordPress, l'étape 3 est vérifiée.

Sinon, retour au worker, qui débogue : console, point d'arrêt, journal d'Apache [805992 JS-PHP P2].

### 6. Sauvegarde et mise à jour

- Sauvegarde complète et régulière, fichiers et base : le site tombera [412738 L156 P530].
- Mise à jour : sauvegarde, extensions désactivées, mise à jour, réactivation [412738 L157 P531].
- Nouvelle extension : sauvegarde d'abord, puis ajout un par un en vérifiant le site [2649302 VI P178].

## Refuser ou remonter

**Capitaine** [autorité firstmate]

- Achat d'hébergement, de domaine, de thème ou d'extension payants, et qui paie, agence ou client [412738 L97 PR32].
- CMS ou code pour un client qui édite lui-même [805992 WordPress 119].
- Mise en ligne sur le domaine du client, après sa validation.
- Changement de la liste des navigateurs convenue.
- Remise des accès au client, absente des cours.

**Firstmate**

- La liste des navigateurs et leurs catégories dans le brief.
- Le thème gratuit, ou les payants soumis au capitaine.
- L'acceptation du site, ou son retour au worker.
- Le rythme des sauvegardes et mises à jour.

**Worker**

- Flexbox ou Grid, et l'emplacement des points de rupture.
- Bootstrap ou non : « personne ne vous oblige » [805992 Bootstrap 46] [préférence].
- Une extension gratuite conforme à l'étape 3.

**Refus nets du cours**

- Jamais « admin », jamais de mot de passe faible [412738 L135 P504, L155 P529].
- Jamais de mise à jour sans sauvegarde [412738 L157 P531].
- Jamais toucher au thème parent [805992 Code 152].

## Références

**Cours sources**

- 437398, « Build Responsive Real-World Websites with HTML and CSS » : S2-S4, S7-S9.
- 805992, « Développement web (français, HTML/CSS/JS, mise en place) » : HTML-CSS, CSS, Bootstrap, Hébergement, WordPress, Code, PHP (82, P2).
- 412738, « UX & Web Design Master Course: Strategy, Design, Development » : L26-L28, L95-L161 [daté : valeur à vérifier au moment du projet].
- 3828556, « Le SEO pour les développeurs » : Balises meta, Site responsive, HTTPS, Favicon.

**Frontières**

- Formulaires, Netlify Forms compris : `formulaires`.
- Balisage sémantique, titres, liens et boutons, focus, texte alternatif, contraste : `accessibilite`.
- `<title>`, meta description, permaliens, robots.txt, sitemap, redirections, données structurées, nom de domaine : `seo`.
- Formats, poids et dimensions d'images, minification, Lighthouse : `performance-web`.
- Valeurs visuelles de la maquette : `design-visuel`.
- Validation signée, liste de mise en ligne, maintenance : `agence-projet-client`.
