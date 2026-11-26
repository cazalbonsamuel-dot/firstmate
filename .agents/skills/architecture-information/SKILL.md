---
name: architecture-information
description: >-
  Load in a web (firstmate-web) home before briefing a site's content inventory, sitemap, navigation or wireframes, and before having any of them validated.
user-invocable: false
metadata:
  internal: true
---

# architecture-information

Ce skill porte la supervision de la discipline `arborescence` par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/arborescence/README.md` et ses compétences `contenu-arborescence-navigation.md` et `tests-structure-wireframes.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de l'arborescence.

## Quand charger

- Avant de briefer une stratégie, un audit ou un inventaire de contenu.
- Avant de briefer une arborescence, une navigation ou ses libellés.
- Avant de briefer un tri de cartes, un test d'arborescence ou un test du coffre.
- Avant de briefer des croquis ou des wireframes.
- Avant d'accepter ces livrables et avant de les faire valider.

## Faire

1. Lancer après `strategie-recherche` ; quand le client attend du trafic de recherche, la remise du plan de mots-clés de `seo-fiche-google` vient d'abord (`seo`).
2. Dans le brief, donner le contenu réel disponible ; un contenu absent devient une question au client, jamais un faux texte.
3. Les bornes de profondeur et de nombre d'entrées ne sont pas dans `seuils.json` : `chef-de-projet` les porte en exigences `EX-nn`, que le brief cite.
4. À la réception, vérifier en plus de la réception commune :
   - `inventaire.md`, `plan-du-site.md`, `navigation.md` et un wireframe par type de page sous `wireframes/`, bureau et mobile ;
   - les contrôles `structure-site`, `liens`, `recherche-texte` et `captures` du README ;
   - une navigation construite sur les besoins des visiteurs, pas sur l'organigramme du client.
5. Faire valider le plan du site par le client avant tout design ou code : question au client portée par le capitaine.

## Refuser ou remonter

**Capitaine**
- Tout envoi au client ou à des utilisateurs, et toute dépense.
- Un volume de contenu qui dépasse le périmètre, et une mise à jour du contenu qui retomberait sur l'agence sans être payée.
- Le contenu réel absent au moment des wireframes.

**Firstmate**
- L'acceptation d'une remise et l'envoi de la validation du plan par le circuit des questions au client.

**Worker**
- Les libellés proposés, les croquis et le montage des tests.

**Refus nets**
- Pas de design ni de code avant la validation de la structure.
- Pas de faux texte dans un wireframe.

## Références

- `agence-web-ia` : `domaines/arborescence/README.md`, `domaines/arborescence/competences/contenu-arborescence-navigation.md`, `domaines/arborescence/competences/tests-structure-wireframes.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client ; `seo` pour le plan de mots-clés.
