---
name: accessibilite
description: >-
  Load in a web (firstmate-web) home when scoping a client project, before briefing any mockup or build, before accepting any mockup or built site, and when a client is subject to an accessibility obligation or asks for a conformance level.
user-invocable: false
metadata:
  internal: true
---

# accessibilite

Ce skill porte la supervision de la discipline `accessibilite` par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/accessibilite/README.md` et sa compétence `controle.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de l'accessibilité.

## Quand charger

- Au cadrage d'un projet, pour fixer le niveau visé.
- Avant de briefer toute maquette ou construction.
- Avant d'accepter une maquette ou un site construit.
- Quand un client est soumis à une obligation d'accessibilité ou demande un niveau de conformité.

## Faire

1. Au cadrage, faire écrire le niveau visé et le statut légal du client dans la fiche client ; sans indication, le niveau est celui de `seuils.json` (`accessibilite.referentiel`).
2. Citer `controle.md` dans les briefs de `direction-artistique`, `textes` et `integration-cms` : ces disciplines en appliquent les règles dès leur tâche.
3. Briefer une tâche `accessibilite` sur la maquette avant sa remise à l'intégration, puis sur le site construit.
4. À la réception, vérifier en plus de la réception commune :
   - `niveau.md` avec sa ligne `FC-nn`, `audit.md` avec l'outil ou la commande de chaque contrôle, et `corrections.md` ;
   - les contrôles `axe`, `zoom`, `clavier` et `captures` (dont le mouvement réduit et les niveaux de gris) du README ;
   - chaque correction est demandée à sa discipline propriétaire ; la tâche d'accessibilité ne corrige pas elle-même le site.
5. Le test avec lecteur d'écran et personnes handicapées n'a pas de script : c'est une question au client, sinon l'exigence reste BLOQUÉ.

## Refuser ou remonter

**Capitaine**
- Le niveau visé, quand la fiche client ne le dit pas.
- Le statut légal, la déclaration d'accessibilité et toute dérogation : ni avis juridique ni décision de l'agence, le client consulte un avocat.
- Le coût des tests avec des personnes handicapées.

**Firstmate**
- Les critères à contrôler pour le projet et l'acceptation ou le renvoi de tout livrable qui porte un refus net.

**Worker**
- La technique suffisante pour chaque critère.

**Refus nets**
- Information portée par la seule couleur.
- Contour de focus supprimé sans remplacement.
- `tabindex` positif.
- Fonction accessible par un geste seul.
- Image sans `alt`.

## Références

- `agence-web-ia` : `domaines/accessibilite/README.md`, `domaines/accessibilite/competences/controle.md`, `methode/seuils.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client.
