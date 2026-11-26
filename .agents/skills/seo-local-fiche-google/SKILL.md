---
name: seo-local-fiche-google
description: >-
  Load in a web (firstmate-web) home when a client receives customers on site or serves a local area, before briefing the creation, takeover, or optimization of their Google business profile, and before any work on their customer reviews.
user-invocable: false
metadata:
  internal: true
---

# seo-local-fiche-google

Ce skill porte la supervision de la fiche Google, une part de la discipline `seo-fiche-google`, par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/seo-fiche-google/README.md` et sa compétence `fiche-google.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de la fiche.

## Quand charger

- Le client reçoit du public ou dessert une zone locale.
- Avant de briefer la création, la reprise ou l'optimisation de la fiche.
- Avant tout travail sur ses avis.

## Faire

1. Dans le brief, citer les réponses du client sur l'accès à la fiche, le lieu visitable et les zones desservies ; ce qui manque devient une question au client (`fiche-google.md`, « Questions au client »).
2. Le worker prépare tout et n'agit jamais sur la fiche : il remet le texte, les informations, la liste de photos, les réponses types aux avis et la marche à suivre pour le capitaine.
3. À la réception, vérifier en plus de la réception commune :
   - `seo-fiche-google/fiche-google.md` ;
   - le contrôle `recherche-texte` : nom, adresse, téléphone et adresse du site de la fiche identiques à ceux d'une page du site ;
   - les points de `fiche-google.md` (« Réception »).
4. Porter au capitaine la marche à suivre ; la fiche créée et vérifiée reste BLOQUÉ jusqu'à son action.

## Refuser ou remonter

**Capitaine**
- Toute action sur la fiche : création, demande de propriété, vérification, publication.
- Tout message au client.
- La réponse à un avis insultant et son signalement.
- Une remise contre un avis, qui est une dépense.
- Nommer un propriétaire, qui peut supprimer la fiche.
- Plusieurs établissements, non traités par le dépôt.

**Firstmate**
- Une catégorie principale peu évidente, la relecture des réponses négatives et le rythme des publications.

**Worker**
- Les textes de la fiche, des publications et des réponses, le test des catégories et le tri entre compte suspect et vrai client.

**Refus nets**
- Jamais d'identifiants partagés.
- Jamais une catégorie qui n'est pas réellement proposée.
- Jamais attaquer dans une réponse.

## Références

- `agence-web-ia` : `domaines/seo-fiche-google/README.md`, `domaines/seo-fiche-google/competences/fiche-google.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client ; `seo`.
