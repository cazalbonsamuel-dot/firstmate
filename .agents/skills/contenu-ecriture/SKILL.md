---
name: contenu-ecriture
description: >-
  Load in a web (firstmate-web) home before briefing or accepting any text meant for a client site, whether a page, microcopy, a message, a button or link label, or brand text.
user-invocable: false
metadata:
  internal: true
---

# contenu-ecriture

Ce skill porte la supervision de la discipline `textes` par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/textes/README.md` et ses compétences `voix-et-langage-clair.md`, `microcopie.md` et `tester-et-localiser.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part des textes.

## Quand charger

- Avant de briefer une page, une microcopie, un message, un libellé de bouton ou de lien.
- Avant de briefer un texte de marque : voix, ton, slogan.
- Avant d'accepter ces textes ou de commander leur test.

## Faire

1. Lancer après `arborescence` et avant le design : les textes précèdent les maquettes et se montent ensuite mot pour mot (`agence-projet-client`).
2. Dans le brief, donner les faits du client avec leur source ; un fait manquant devient une question au client et un texte de remplacement entre crochets, jamais un fait inventé.
3. Exiger dans le brief que les textes soient relus par un sous-agent neuf qui chasse les formules creuses, le faux et le jargon [décision du capitaine, 11 novembre 2026].
4. À la réception, vérifier en plus de la réception commune :
   - `textes/pages/<page>.md` pour chaque page du plan, `voix.md`, `microcopie.md` et `notes.md` ;
   - les contrôles `premier-ecran`, `libelles`, `recherche-texte` et `captures` du README ;
   - chaque fait écrit retrouve sa source dans la fiche client ou une réponse du client citée ;
   - les textes de remplacement sont listés dans `notes.md` et restent visibles comme tels.
5. Un texte refusé à l'intégration parce qu'il ne tient pas revient ici comme nouvelle tâche, jamais réécrit par l'intégrateur.

## Refuser ou remonter

**Capitaine**
- La validation des textes par le client, et la vérité d'un fait qu'aucune source ne prouve.
- Textes juridiques (`rgpd-mentions-legales`) et traduction.
- Toute dépense : rédacteur, traducteur, contreparties de test.
- Copywriting de conversion, page de vente ou site multilingue : au cas par cas.

**Firstmate**
- La voix retenue, le test à commander et l'acceptation d'une remise.

**Worker**
- La formulation, dans la voix fixée.

**Refus nets**
- Jamais la clarté sacrifiée à la marque.
- Jamais un fait inventé.

## Références

- `agence-web-ia` : `domaines/textes/README.md`, `domaines/textes/competences/voix-et-langage-clair.md`, `domaines/textes/competences/microcopie.md`, `domaines/textes/competences/tester-et-localiser.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client.
