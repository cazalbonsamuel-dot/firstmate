---
name: performance-web
description: Load in a web (firstmate-web) home before accepting a built site or putting it online, when images are exported for the web, when monitoring a live site's speed, and when a client complains about slowness or asks for a speed audit.
user-invocable: false
metadata:
  internal: true
---

# performance-web

Ce skill possède la vitesse du site : mesure, seuils, poids et formats d'images, CSS et JS, serveur, suivi ; elle a sa propre mesure et un mode audit sans construction.
Toute valeur marquée [daté] est gardée : valeur à vérifier au moment du projet, avant de l'appliquer.

## Quand charger

- Avant d'accepter un site construit ou de le mettre en ligne.
- Quand des images sont exportées pour le web.
- Pour suivre la vitesse d'un site en ligne.
- Quand un client se plaint de lenteur ou demande un audit de vitesse.

## Faire

### 1. Mesurer d'abord : la baseline

Mettre dans le brief du worker, avant toute correction :
1. Faire un rapport de référence (baseline) [5581394 M2 R30].
2. Avant chaque mesure, recharger sans cache et le vider à la main [5581394 M2 R29].
3. Simuler CPU faible et réseau lent : une machine de développement ne reflète pas les utilisateurs [5581394 M2 R28].
4. Si possible, les trois outils : Lighthouse, PageSpeed Insights, extension Web Vitals [5581394 M2 R25].
5. PageSpeed Insights n'analyse qu'un site en ligne, Lighthouse aussi le local [5581394 M2 R23] ; le score Lighthouse n'a de sens qu'en ligne [437398 S9 R119].
6. Données réelles (28 jours) et rapport simulé diffèrent [5581394 M2 R24] [daté : valeur à vérifier au moment du projet] ; les valeurs Lighthouse sont estimées [5581394 R26].

### 2. Juger contre les seuils

Seuils du cours dédié [5581394 M2 R9-R18] [daté : valeur à vérifier au moment du projet] :

| Mesure | Bon | À améliorer | Mauvais |
|---|---|---|---|
| LCP | ≤ 2,5 s | 2,5-4 s | > 4 s |
| INP | ≤ 200 ms | 200-500 ms | > 500 ms |
| CLS | < 0,1 | 0,1-0,25 | > 0,25 |
| TTFB | < 800 ms | 800 ms-1,8 s | > 1,8 s |
| TTI | ≤ 3,8 s | - | > 7,3 s |

- Autres positions : au-delà de 2 s on perd les utilisateurs [3828556 #110] [daté : valeur à vérifier au moment du projet] ; 2 à 3 s « OK » [417316 S8 R138] [préférence] [daté : valeur à vérifier au moment du projet]. Retenu 5581394, cours dédié.
- Poids de page et nombre de requêtes n'ont pas de seuil universel : cela dépend du site [5581394 M1 R19].
- Repère : moins de 500 kB par page [5581394 M2 R79] [daté : valeur à vérifier au moment du projet] ; R19, non daté, l'emporte.
- Pas de score parfait visé : recouper plusieurs outils, retester après chaque optimisation [2649302 VI P177].
- Autre position : viser le vert, l'orange est « très très bien » [3828556 #147] [préférence].

### 3. Images : export et contrôle

Ce que le worker applique à chaque image :
1. L'image est-elle nécessaire ? CSS et polices peuvent la remplacer [5581394 M2 R56].
2. SVG, minifié, pour logos, icônes et formes simples ; jamais pour une photo [5581394 R57-R58, R64, 3828556 #128, 4860984 N Exporter n°82, 1544922 L40 n°108].
3. Photo en WebP ou AVIF [5581394 R58, 437398 S9 R121].
   Autre position : JPEG pour le web, PNG dès qu'il faut la transparence [4860984 N Exporter n°81, 1544922 L40 n°110] ; règles non datées des deux côtés, retenu 5581394, cours dédié.
4. Dans `picture`, avec repli JPEG ou PNG [5581394 R63, R70, 437398 S9 R121] [daté : valeur à vérifier au moment du projet].
5. Exporter en sRGB, sans agrandir [2633036 PS/Enregistrement P145, 4044684 S8 P14].
6. Égalité :
   fichier deux fois plus grand que la taille affichée, pour les écrans haute densité [437398 S5 R61] ;
   la largeur d'affichage exacte [417316 S4 R65] ;
   firstmate choisit à l'admission du projet et l'écrit dans le brief.
7. Jamais plus de 1920 px de large [1544922 L58 n°113] ; autres largeurs : 800 ou 1000 px [2633036 P146], 1600 px [4044684 S8 Pr23] [daté : valeur à vérifier au moment du projet].

Poids, compression, métadonnées :
- Toujours compresser [437398 R61, R121] ; tester plusieurs compresseurs [3828556 #124].
- Compression avec perte souvent acceptable [3828556 #125], meilleur choix pour la plupart [5581394 R67] [préférence].
- Limiter le poids de chaque image, par exemple sous 500 Ko ou 1 Mo [2633036 P146].
- Autres positions, écartées comme datées : sous 100 Ko [417316 S9 R182] [daté : valeur à vérifier au moment du projet] ; qualité 100 %, sans limite [4044684 Pr23] [daté : valeur à vérifier au moment du projet].
- 72 ppp [4044684 Pr23, 2401332 S10·L42 P108] [daté : valeur à vérifier au moment du projet] ; autre position : 150 ppp, 72 accepté [2633036 P147] [daté : valeur à vérifier au moment du projet] ; JPEG en qualité 8 à 9 [2401332 P108] [préférence] [daté : valeur à vérifier au moment du projet].
- Retirer les métadonnées (Exif, géolocalisation) [5581394 R65].

Livraison dans la page :
- 3 à 5 versions par image, servies par `srcset`, `sizes` et `src` de repli [5581394 R61-R62, 3828556 #127].
- Largeur et hauteur explicites sur chaque image, contre le CLS [5581394 R16].
- `loading="lazy"` sur les images hors de la zone visible [3828556 #129, 3.13] [daté : valeur à vérifier au moment du projet].
- GIF animés convertis en vidéo, WebM avec repli MP4 [5581394 R69] [daté : valeur à vérifier au moment du projet].

### 4. CSS, JS et rendu

- Livrer en ligne le CSS et le JS critiques, différer le reste [5581394 R33].
- Autre position : CSS externe [437398 S3 R16], pas de style inline [3828556 #115] ; retenu 5581394, cours dédié, pour le seul CSS critique.
- Scripts en `defer` ou `async` [3828556 #119, 5581394 R34, R37].
- Minifier HTML, CSS et JS, source gardée sous Git ou en sauvegarde [3828556 #113, 5581394 R35, R50].
- Chasser CSS et JS inutilisés (Coverage, Network request blocking) [3828556 #118, 5581394 R86].
- Animer seulement `transform` et `opacity` [3828556 #116-#117, 437398 S8 R115] ; viser 60 FPS [5581394 R48].
- Réserver la place des contenus chargés plus tard [5581394 R15].
- Liens morts : `seo` ; les 404 ralentissent aussi [5581394 R83].

### 5. Serveur

- Compression gzip ou brotli [5581394 R68, R84, R127].
- Cache-Control pour les ressources statiques, invalidation pour ce qui change [5581394 R85, R130, R132, P6-P8].
- HTTP/2 ou HTTP/3 si possible [5581394 R128] [daté : valeur à vérifier au moment du projet].
- Sauvegarde et ajout des extensions : `construction-web`.

### 6. Corriger, puis suivre

1. Traiter une opportunité, refaire un rapport, comparer à la baseline [5581394 P3].
2. Intervention en trois volets : lister les métriques, les améliorer, les surveiller automatiquement [5581394 M5 R138].
3. Métriques de départ : LCP, INP, CLS, temps de réponse, CPU, mémoire ; liste réévaluée à intervalle régulier [5581394 R139-R140].
4. Collecter les Web Vitals des vrais visiteurs (package web-vitals) [5581394 P18].

### 7. Argumentaire

Préparer pour le capitaine des arguments chiffrés, en langage business, sans mentir [5581394 M6 R150-R151].

## Refuser ou remonter

**Capitaine** [autorité firstmate] :
- CDN, CDN d'images, changement ou montée d'hébergement [5581394 R71, R137, 3828556 #112].
- Mise à l'échelle du matériel et son budget [5581394 R119-R120].
- Outil de monitoring et son budget [5581394 R147].
- Plugin ou service payant [autorité firstmate].
- Tout argumentaire montré au client, par `agence-projet-client` [autorité firstmate].

**Firstmate** :
- Verdict d'acceptation contre les seuils de l'étape 2 [5581394 R9-R18].
- Ordre des corrections et retest après chacune [5581394 P3, 2649302 P177].

**Worker** :
- Compresseur, nombre de versions (3 si stockage payant, environ 5 sinon) [5581394 R61].
- `defer` ou `async`, durées de cache, outils de minification [3828556 #119, 5581394 R130, R50].
- Vérification des valeurs [daté] [décision du capitaine, option (a)].

Refus nets :
- Jamais un verdict tiré d'un seul outil, d'une machine de développement ou d'un score [5581394 R23-R30, 437398 R119].
- Jamais de correction sans baseline, jamais de mesure avec cache [5581394 R29-R30].
- Jamais une image plus grande que son emplacement [3828556 #123].

## Références

Cours sources :
- 5581394, Web Performance Optimization: Core Web Vitals & DevTools : entier.
- 437398, Build Responsive Real-World Websites : S3, S5, S8, S9.
- 3828556, Le SEO pour les développeurs : BONUS › Performances (#109-#129), #147, 3.13-3.14.
- 417316, Modern SEO : S8 R138, S9 R182, S4 R65.
- 2649302, Formation complète SEO : VI · Performances.
- 2633036, Photographie Masterclass : PS/Enregistrement, LrC/Exportation.
- 4044684, Product Photography for All : S8 · Exporting.
- 2401332, Logo Design Mastery : S10·L42.
- 1544922, formation de web design (titre non identifiable) : L40, L58.
- 4860984, formation Figma (titre non identifiable) : N Exporter.

Frontières :
- Le contenu et le choix des images relèvent de `photographie-web`.
- HTML et CSS, HTTPS, hébergement et domaine relèvent de `construction-web`.
- Le discours SEO sur la vitesse relève de `seo`.
- Le texte alternatif relève de `accessibilite`.
- La relation client relève de `agence-projet-client`.
