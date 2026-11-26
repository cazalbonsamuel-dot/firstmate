---
name: identite-marque-logo
description: >-
  Load in a web (firstmate-web) home when a client has no usable brand identity or asks for a logo or brand guidelines, before briefing their creation, and again before each presentation of logo concepts to the client.
user-invocable: false
metadata:
  internal: true
---

# identite-marque-logo

Ce skill porte la supervision de l'identité de marque, une part de la discipline `direction-artistique`, par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/direction-artistique/README.md` et sa compétence `identite-marque-logo.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de l'identité.

## Quand charger

- Le client n'a pas d'identité exploitable.
- Le client demande un logo, sa reprise ou une charte.
- Avant de briefer la création d'une identité.
- Avant chaque présentation de concepts au client.

## Faire

1. Partir de l'issue du test de l'identité existante tranchée au cadrage (conserver, faire évoluer ou remplacer) ; sans elle, ne rien lancer.
2. Briefer d'abord le brief de marque ; vérifier qu'il est complet avant toute création.
3. Fixer dans le brief le nombre de directions de style et de concepts attendus, et la date de présentation.
4. À la réception, vérifier en plus de la réception commune :
   - `direction-artistique/identite/*` : brief de marque, concepts, système de logo, palette de marque, kit de fichiers, charte ;
   - le contrôle `controles-logo` : le logo tient en noir et blanc et à 48 x 48 pixels en une encre ;
   - les tests, les versions, le kit et la charte de `identite-marque-logo.md` (« Réception »).
5. Les concepts de logo partent au client comme question, portée par le capitaine ; la réponse citée est leur validation.

## Refuser ou remonter

**Capitaine**
- Nom légal, ® ou TM.
- Manuel de marque facturé en plus, couleur d'impression qui ajoute une plaque.
- Toute dépense et tout envoi au client.

**Firstmate**
- La complétude du brief de marque, le nombre de directions et de concepts, l'acceptation d'une remise.
- Le renvoi du hors-périmètre à sa discipline.

**Worker**
- Croquis, polices essayées, ordre des concepts et retouches issues des tests.

**Refus nets**
- Jamais copier une référence.
- Jamais un logo qui dépend de la couleur.
- Jamais rendre public un tableau d'inspiration fait d'œuvres d'autrui.

## Références

- `agence-web-ia` : `domaines/direction-artistique/README.md`, `domaines/direction-artistique/competences/identite-marque-logo.md`.
- `agence-projet-client` pour le cadrage, le brief commun, la réception et les questions au client ; `design-visuel` pour la charte du site.
