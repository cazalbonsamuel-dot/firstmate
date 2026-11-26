---
name: formulaires
description: >-
  Load in a web (firstmate-web) home when a page contains a form (contact, quote, sign-up, login or payment), before briefing its build and again before accepting it.
user-invocable: false
metadata:
  internal: true
---

# formulaires

Ce skill porte la supervision des formulaires, une part de la discipline `integration-cms`, par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/integration-cms/README.md` et sa compétence `formulaires.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part des formulaires.
Les textes des libellés et des messages relèvent de `textes`, le droit de collecter et ce qui s'affiche de `rgpd-mentions-legales`.

## Quand charger

- Une page contient un formulaire (contact, devis, inscription, connexion, paiement) : avant le brief qui le construit ou le modifie, et avant d'accepter la maquette ou le site.

## Faire

1. Ne briefer aucun formulaire sans exigence tracée à la fiche client.
2. Avant le brief, obtenir de `rgpd-mentions-legales` si le formulaire est permis et ce qu'il affiche.
3. Dans le brief, fixer les champs, les champs requis, les étapes et le service d'envoi ; le reste suit `formulaires.md`.
4. À la réception, vérifier en plus de la réception commune :
   - `integration-cms/formulaires.md` : champs, obligatoire, erreurs, envoi, sécurité ;
   - le formulaire marche sans JavaScript, ses libellés sont reliés à leurs champs et la validation existe aussi côté serveur (`axe`, `validation-html`, essai d'envoi) ;
   - les points d'acceptation de `formulaires.md` (« Accepter »).

## Refuser ou remonter

**Capitaine**
- Données personnelles collectées et leur information, avec `rgpd-mentions-legales`.
- Service payant d'envoi ou de paiement, engagement envers un tiers, ajout ou retrait d'un champ voulu par le client.
- Anti-spam, captcha et protection contre la falsification de requête.

**Firstmate**
- Les champs, les champs requis et les étapes, et le refus de ce qui viole `formulaires.md`.

**Worker**
- Les types, les attributs et le code de validation dans ce cadre.

**Refus nets**
- Jamais de validation côté navigateur seule.
- Jamais le texte indicatif comme libellé.
- Jamais la couleur seule pour signaler le requis ou l'erreur.

## Références

- `agence-web-ia` : `domaines/integration-cms/README.md`, `domaines/integration-cms/competences/formulaires.md`, `domaines/rgpd-mentions-legales/README.md`.
- `agence-projet-client` pour le brief commun, la réception et les questions au client ; `construction-web`.
