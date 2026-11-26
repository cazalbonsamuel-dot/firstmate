---
name: performance-web
description: >-
  Load in a web (firstmate-web) home before accepting a built site or putting it online, when images are exported for the web, when monitoring a live site's speed, and when a client complains about slowness or asks for a speed audit.
user-invocable: false
metadata:
  internal: true
---

# performance-web

Ce skill porte la supervision de la discipline `vitesse` par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/vitesse/README.md` et ses compétences `mesure-seuils.md`, `images-web.md` et `css-js-serveur.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de la vitesse.

## Quand charger

- Avant d'accepter un site construit ou de le mettre en ligne.
- Quand des images sont exportées pour le web.
- Pour suivre la vitesse d'un site en ligne.
- Quand un client se plaint de lenteur ou demande un audit de vitesse.

## Faire

1. Briefer une tâche `vitesse` sur le site construit avant la recette ; elle mesure et ne reconstruit jamais : chaque correction est demandée à `integration-cms` ou à `direction-artistique`, puis remesurée.
2. Les seuils sont ceux de `methode/seuils.json` (`vitesse.*`), sauf exigence `EX-nn` tracée ; le brief n'en invente aucun.
3. Ne lancer qu'une mesure lourde à la fois sur la machine.
4. À la réception, vérifier en plus de la réception commune :
   - `baseline.md` avant toute correction, `mesures.md` avec la commande qui les rejoue, `corrections.md` avec chaque retest, et `images.md` ;
   - les contrôles `vitesse`, `images-web` et `tiers` du README ;
   - le contrôle `en-ligne` (compression et cache) reste BLOQUÉ jusqu'à la mise en ligne par le capitaine.
5. Pour un site en ligne, la surveillance relève de `maintenance`, avec les mêmes outils et les mêmes seuils (`agence-projet-client`).

## Refuser ou remonter

**Capitaine**
- CDN, CDN d'images, changement ou montée d'hébergement.
- Outil de suivi payant, extension ou service payant.
- Tout argumentaire montré au client.

**Firstmate**
- Le verdict contre les seuils et l'ordre des corrections, chacune suivie de son retest.

**Worker**
- Compresseur, nombre de versions d'image, `defer` ou `async`, durées de cache et outils de minification.

**Refus nets**
- Jamais un verdict tiré d'un seul outil, d'une machine de développement ou d'un score.
- Jamais de correction sans baseline, jamais de mesure avec cache.
- Jamais une image plus grande que son emplacement.

## Références

- `agence-web-ia` : `domaines/vitesse/README.md`, `domaines/vitesse/competences/mesure-seuils.md`, `domaines/vitesse/competences/images-web.md`, `domaines/vitesse/competences/css-js-serveur.md`, `methode/seuils.md`.
- `agence-projet-client` pour le brief commun, la réception, les questions au client et la maintenance.
