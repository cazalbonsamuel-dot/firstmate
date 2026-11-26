---
name: ux-recherche-tests
description: >-
  Load in a web (firstmate-web) home before commissioning user research, a UX audit of an existing site, a usability test, an A/B test or post-launch measurement, and before presenting their results.
user-invocable: false
metadata:
  internal: true
---

# ux-recherche-tests

Ce skill porte la supervision de la discipline `strategie-recherche` par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/strategie-recherche/README.md` et ses compétences `recherche-avant-conception.md` et `audit-tests-mesure.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de la recherche.

## Quand charger

- Avant de commander une recherche utilisateur, des visiteurs types, l'audit UX d'un site existant, un test d'utilisabilité, un test A/B ou la mesure d'un site en ligne.
- Avant d'en présenter les résultats.

## Faire

1. Dans le brief, nommer l'objectif de l'étude et la compétence à lire : `recherche-avant-conception.md` avant la conception, `audit-tests-mesure.md` pour un audit, un test ou une mesure après mise en ligne.
2. Donner l'accès réel aux utilisateurs ou aux données, ou dire qu'il manque : le worker en fait alors une question au client, jamais une supposition.
3. Pour un site existant, exiger `strategie-recherche/audit.md` ; pour une étude, `etude.md` avec la méthode, les participants et la grille ; pour la conception, `visiteurs.md` et `concurrence.md` avec les cinq principaux concurrents.
4. À la réception, vérifier en plus de la réception commune :
   - chaque visiteur type s'appuie sur une donnée ou sur une question au client ;
   - chaque constat d'audit porte sa capture et son rang de gravité et de fréquence ;
   - aucun « pourquoi » n'est tiré de l'analytique seule.
5. Présenter au capitaine les résultats en décisions à prendre pour la suite de la chaîne, et faire suivre ce qui relève d'une autre discipline par sa propre tâche (« Frontières » du README).

## Refuser ou remonter

**Capitaine**
- Budget, temps et contreparties d'une étude.
- Consentement et données des participants, et tout outil de mesure d'audience (son choix relève de `rgpd-mentions-legales`).
- Toute dépense ou tout engagement envers un tiers : panel, recrutement, contact des clients du client, observation sur place.

**Firstmate**
- La méthode, l'ordre des études et le nombre de participants dans les bornes du dépôt.
- Le refus d'une remise non conforme.

**Worker**
- Guides, relances, grille de notes et analyse.

**Refus nets**
- Jamais l'équipe du projet comme participants.
- Jamais design et texte changés dans le même test A/B.

## Références

- `agence-web-ia` : `domaines/strategie-recherche/README.md`, `domaines/strategie-recherche/competences/recherche-avant-conception.md`, `domaines/strategie-recherche/competences/audit-tests-mesure.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client.
