---
name: design-visuel
description: >-
  Load in a web (firstmate-web) home before briefing a visual direction, a mockup or a design system for a site, and before accepting a mockup for handoff to integration.
user-invocable: false
metadata:
  internal: true
---

# design-visuel

Ce skill porte la supervision du design visuel, une part de la discipline `direction-artistique`, par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/direction-artistique/README.md` et sa compétence `design-visuel.md`, dont la charte de l'agence.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part du design visuel.
L'identité de marque relève de `identite-marque-logo`, les images de `photographie-web`.

## Quand charger

- Avant de briefer une direction visuelle, une maquette ou un design system.
- Avant d'accepter une maquette et de la remettre à l'intégration.

## Faire

1. Lancer après `textes` : les maquettes se font sur les textes réels.
2. Briefer d'abord les ambiances [décision du capitaine, 11 novembre 2026] :
   - trois ambiances vraiment différentes pour ce client (images, couleurs, ton), pas trois mises en page ;
   - aucun site passé ne sert de gabarit ;
   - chacune rendue sur quelques écrans, ordinateur et téléphone, avec sa fiche pour l'intégration et le relevé de ses images ;
   - le worker recommande sans choisir ; le choix est une question au client, portée par le capitaine.
3. Une fois la réponse du client reçue, briefer le système et les maquettes de l'ambiance choisie, réponse citée.
4. À la réception, vérifier en plus de la réception commune :
   - `direction.md`, `systeme.md`, `maquettes/*` bureau et mobile, `passation.md` et `images/releve.md` ;
   - les contrôles `systeme-visuel`, `premier-ecran`, `captures` (dont la version en gris), `axe` et `releve-images` du README ;
   - la charte d'abord, écran par écran à chaque taille, dont le fait que le site ne pourrait pas être celui d'un autre client (`design-visuel.md`, « Contrôler la maquette rendue ») ;
   - la direction visuelle validée par le client, réponse citée : c'est la preuve de ce qui reste subjectif.
5. Faire contrôler la maquette par `accessibilite` avant de la remettre à `integration-cms`.

## Refuser ou remonter

**Capitaine**
- Le choix de l'ambiance et de la direction visuelle, par question au client.
- Toute dépense, comme une police ou une image payante.
- Tout écart à la charte du client, avec `identite-marque-logo`, et toute modification de la palette déjà présentée au client.
- L'habillage d'un site ancien n'est pas une charte : ce qui se garde suit l'issue choisie au cadrage [décision du capitaine, 10 novembre 2026].

**Firstmate**
- Le nombre d'écrans par ambiance et l'acceptation d'une maquette.

**Worker**
- Les valeurs, dans les échelles fixées par le système, et les corrections faites dans le composant.

**Refus nets**
- Aucune décision visuelle arbitraire ; « cool » n'est jamais une justification.
- Pas de construction complète avant le choix de l'ambiance.

## Références

- `agence-web-ia` : `domaines/direction-artistique/README.md`, `domaines/direction-artistique/competences/design-visuel.md`.
- `agence-projet-client` pour le brief commun, la réception, les questions au client et les règles de production ; `identite-marque-logo`, `photographie-web`, `accessibilite`.
