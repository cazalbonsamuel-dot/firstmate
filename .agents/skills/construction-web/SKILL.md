---
name: construction-web
description: >-
  Load in a web (firstmate-web) home before briefing a site's integration, CMS, hosting or technical go-live, and before accepting a built site.
user-invocable: false
metadata:
  internal: true
---

# construction-web

Ce skill porte la supervision de la discipline `integration-cms` par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut : `domaines/integration-cms/README.md` et ses compétences `construction-web.md`, `cms.md` et `hebergement-mise-en-ligne.md`.
Le brief commun, la réception commune d'une remise et le circuit des questions au client sont dans `agence-projet-client` ; ce skill n'y ajoute que la part de l'intégration.
Un formulaire relève aussi de `formulaires`.

## Quand charger

- Avant de briefer l'intégration d'une maquette validée.
- Avant de briefer un CMS : installation, thème, extensions, réglages, sauvegarde, mise à jour.
- Avant de briefer l'hébergement, le domaine, le HTTPS ou la mise en ligne technique.
- Avant d'accepter un site construit.

## Faire

1. Lancer quand l'ambiance choisie par le client, les maquettes et les textes sont remis ; le brief cite la réponse du client sur l'ambiance.
2. Le défaut du dépôt est un site statique Astro, sans JavaScript ni CMS (README, « Choix de départ ») ; un CMS n'entre que si une exigence tracée dit que le client édite lui-même.
3. Dans le brief, rappeler que les textes se montent mot pour mot et que les valeurs visuelles viennent du système ; un texte ou une valeur qui ne tient pas se signale dans la remise, jamais réécrit.
4. À la réception, vérifier en plus de la réception commune :
   - `site/*` avec sa commande de construction rejouée, `plan-de-test.md` et `choix-technique.md` ;
   - les contrôles `validation-html`, `captures` (dont sans JavaScript et écran court), `liens`, `tiers`, `recherche-texte`, `balises-seo` et `impression-pdf` du README ;
   - le contrôle `en-ligne` reste BLOQUÉ tant que le capitaine n'a pas fait la mise en ligne, puis se rejoue sur le domaine final.
5. Le constructeur ne se relit pas : l'acceptation repose sur les contrôles et sur la recette, worker neuf (`agence-projet-client`).

## Refuser ou remonter

**Capitaine**
- CMS ou code, quand le client édite lui-même : question au client.
- Achat d'hébergement, de domaine, de thème ou d'extension, et qui paie.
- Création de comptes, DNS, mise en ligne sur le domaine du client et remise des accès au client.
- Changement de la liste des navigateurs convenue.

**Firstmate**
- La liste des navigateurs et leurs catégories de support dans le brief, le rythme des sauvegardes et l'acceptation du site ou son renvoi.

**Worker**
- Les choix de mise en page, de points de rupture et d'outils dans le cadre du brief.

**Refus nets**
- Jamais de mise à jour sans sauvegarde.
- Jamais de domaine tiers, de cookie ni de JavaScript sans exigence tracée.

## Références

- `agence-web-ia` : `domaines/integration-cms/README.md`, `domaines/integration-cms/competences/construction-web.md`, `domaines/integration-cms/competences/cms.md`, `domaines/integration-cms/competences/hebergement-mise-en-ligne.md`.
- `agence-projet-client` pour le brief commun, la réception, les questions au client et la recette ; `formulaires`.
