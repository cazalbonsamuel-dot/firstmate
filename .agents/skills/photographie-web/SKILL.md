---
name: photographie-web
description: >-
  Load in a web (firstmate-web) home when a site needs photos, before briefing a photo shoot, a stock image purchase or a retouch, and before accepting images for a site.
user-invocable: false
metadata:
  internal: true
---

# photographie-web

Ce skill porte la supervision des images, une part de la discipline `direction-artistique`, par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/direction-artistique/README.md` et sa compétence `photographie.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part des images.
L'export pour le web, les formats et le poids relèvent de `vitesse` (`performance-web`).

## Quand charger

- Un site a besoin de photos.
- Avant de briefer une séance photo, un achat en banque d'images ou une retouche.
- Avant d'accepter des images pour le site.

## Faire

1. Dans le brief, nommer la source des images retenue (photos du client, séance, banque gratuite ou payante) et le budget validé, puis les règles photo du site et la liste de plans (`photographie.md`).
2. Les photos manquantes et toute licence douteuse deviennent des questions au client.
3. À la réception, vérifier en plus de la réception commune :
   - `direction-artistique/images/releve.md` : chaque image avec sa page d'origine, son auteur, sa licence et son emplacement, et les fichiers maîtres ;
   - le contrôle `releve-images` : chaque image du site est au relevé et chaque ligne du relevé existe dans le site ;
   - la sincérité des images : l'image de banque donne l'ambiance, la photo du client prouve (`photographie.md`, « Accepter les images »).

## Refuser ou remonter

**Capitaine**
- Le budget photo et qui le paie : séance sur le devis, banque payée par le client.
- L'engagement d'un photographe.
- Un doute sur un droit d'usage.

**Firstmate**
- La source retenue dans le budget validé, les règles photo, la liste de plans et l'acceptation des images.

**Worker**
- Les réglages de retouche et le choix entre images qui passent les règles.

**Refus nets**
- Pas d'image générée pour un vrai produit.
- Pas d'image sans licence : « libre de droits » ne veut pas dire gratuit.

## Références

- `agence-web-ia` : `domaines/direction-artistique/README.md`, `domaines/direction-artistique/competences/photographie.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client ; `performance-web` pour l'export.
