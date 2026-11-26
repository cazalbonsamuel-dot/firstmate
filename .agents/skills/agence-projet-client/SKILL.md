---
name: agence-projet-client
description: >-
  Load in a web (firstmate-web) home when a client need arrives (site, page, redesign, logo, content or audit), before any quote, worker brief or message to the client, and again before each presentation, approval or launch for that client.
user-invocable: false
metadata:
  internal: true
---

# agence-projet-client

Ce skill porte la supervision d'un projet client par firstmate ; le métier est dans le dépôt `agence-web-ia` (cloné dans `projects/agence-web-ia`), à la tête de sa branche par défaut, qui fait autorité sur le quoi.
Ses pièces de base : le contrat des workers `AGENTS.md`, la chaîne `methode/chaine.md`, les seuils `methode/seuils.json`, les statuts `methode/statuts-et-origines.md`, les gabarits `modeles/`, les disciplines `domaines/<discipline>/README.md` et les noms de contrôles `domaines/README.md`.
Ce skill est le seul propriétaire du brief commun, de la réception commune d'une remise et du circuit des questions au client ; chaque skill de discipline n'y ajoute que sa part.
Firstmate n'écrit jamais dans le dépôt : chaque tâche est celle d'un worker.

## Quand charger

- Un besoin client arrive : site, page, refonte, logo, contenu ou audit.
- Avant tout devis, tout brief de worker et tout message au client.
- Avant chaque présentation, validation ou mise en ligne pour ce client.

## Faire

1. Ouvrir le chantier par une tâche `chef-de-projet` (`domaines/chef-de-projet/README.md`) : fiche client `FC-nn`, exigences chiffrées `EX-nn` tracées à la fiche, choix d'égalité dans `chef-de-projet/choix.md`, devis et planning.
   Le cadrage, le test de l'identité existante, le périmètre et le contrat suivent `domaines/chef-de-projet/competences/cadrage-perimetre-contrat.md` ; le positionnement de l'agence, `positionnement-agence.md`.
2. Suivre l'ordre de `methode/chaine.md` et lancer ensemble les disciplines d'un même rang.
   Une discipline démarre quand les remises de sa liste « Reçoit » existent.
3. Le skill de supervision de chaque discipline :

   | Discipline | Skill |
   |---|---|
   | `chef-de-projet`, `rgpd-mentions-legales`, `recette`, `maintenance` | ce skill |
   | `strategie-recherche` | `ux-recherche-tests` |
   | `arborescence` | `architecture-information` |
   | `textes` | `contenu-ecriture` |
   | `direction-artistique` | `design-visuel`, `identite-marque-logo`, `photographie-web` |
   | `integration-cms` | `construction-web`, `formulaires` |
   | `seo-fiche-google` | `seo`, `seo-local-fiche-google` |
   | `accessibilite` | `accessibilite` |
   | `vitesse` | `performance-web` |

4. Écrire le `## Firstmate spec` de chaque brief (`bin/fm-brief.sh`) :
   - une tâche, une discipline, un chantier : `Chantier : <id>`, `Discipline : <discipline>`, le commit d'entrée et la remise attendue `chantiers/<id>/remises/<discipline>/<tâche>.md` ;
   - le README de la discipline et les seules compétences utiles ; le worker suit `AGENTS.md` du dépôt et n'écrit que les fichiers de sa discipline (`modeles/proprietaires.json`) ;
   - les réponses du client déjà reçues, chacune citée avec sa question `Q-...` ;
   - les points propres au chantier que le README ne dit pas, que le skill de la discipline nomme.
5. Recevoir chaque remise dans une copie isolée :
   - `node outils/controler_remise.js <discipline> <remise>` passe ;
   - chaque contrôle du tableau « Exigences vérifiables » du README a tourné et sa commande est citée ; un contrôle sans outil laisse l'exigence BLOQUÉ, jamais CONFORME ;
   - lire Statut, Exigences, Hypothèses, Questions au client et Suite ; aucune exigence CONFORME ne repose sur une HYPOTHÈSE ;
   - un point PARTIEL ou NON CONFORME revient au worker par `fm-send` avec le point exact, ou devient une tâche de la discipline qui possède le fichier ;
   - puis `ship-landing`.
6. Porter les questions au client : chaque `chantiers/<id>/questions/Q-...` part au capitaine, qui seul parle au client.
   Elle ne bloque pas : le worker a continué sur sa recommandation, marquée HYPOTHÈSE.
   La réponse revient citée dans le brief suivant de la discipline concernée ; une hypothèse démentie rouvre sa tâche.
7. Tenir les règles de production du capitaine [décision du capitaine, 11 novembre 2026] :
   - les textes précèdent le design et se montent mot pour mot ; un texte qui ne tient pas revient à `textes` ;
   - `direction-artistique` rend trois ambiances vraiment différentes pour ce client, pas trois mises en page ; le client choisit, par le capitaine ; rien ne se construit en entier avant ce choix (`design-visuel`) ;
   - qui construit ne se relit pas, sous-agent compris ; la recette est un worker neuf, qui n'a ni écrit ni construit et qui écrit ses remarques avant de lire la remise de l'intégration ;
   - firstmate tranche les remarques à discuter ; les remarques à corriger reviennent à leur discipline.
8. Mener la recette (`domaines/recette/README.md`) : elle ne corrige rien, rend les questions de validation au client, les réserves, la version scellée et le rapport de livraison.
   Le capitaine pose les questions de validation au client et fait la mise en ligne.
9. Suivre le site livré par `maintenance` (`domaines/maintenance/README.md`) dès la mise en ligne ; toute intervention rejoue les contrôles touchés.

## Refuser ou remonter

**Capitaine**
- Prix, devis, contrat, acompte, validation signée, ajout de périmètre, travail gratuit et toute dépense.
- Tout message, présentation ou livrable au client, et l'usage d'un client dans le portfolio.
- Comptes, achats, domaine, hébergement, mise en ligne, fiche Google et service tiers : le worker les prépare et les nomme dans « Suite ».
- Toute question réglementaire ou juridique ; `rgpd-mentions-legales` remet un modèle, jamais un avis juridique (`domaines/rgpd-mentions-legales/README.md`).
- Conserver, faire évoluer ou remplacer l'identité existante : le client tranche ; dans le doute, une proposition fait évoluer l'existant et une autre s'en affranchit [décision du capitaine, 10 novembre 2026].
- L'affichage des prix sur le site : question au client à chaque projet [décision du capitaine, 11 novembre 2026].

**Firstmate**
- L'ordre des tâches, la discipline et le contenu de chaque brief, l'acceptation ou le renvoi de chaque remise, les remarques à discuter.

**Worker**
- Il produit dans sa discipline et son périmètre, signale le hors-liste au lieu de le faire, ne contacte jamais le client et ne mentionne l'IA dans rien de livré.

**Refus nets**
- Pas de production sans fiche client et exigences écrites, ni sans acompte.
- Pas de remise acceptée sans `controler_remise` passé et preuves rejouables ; une session interactive n'est jamais une preuve.
- La recette ne corrige jamais elle-même.

## Références

- `agence-web-ia` : `AGENTS.md`, `methode/chaine.md`, `methode/seuils.md`, `methode/statuts-et-origines.md`, `modeles/remise.md`, `modeles/question.md`, `domaines/README.md`.
- Disciplines tenues par ce skill : `domaines/chef-de-projet/README.md`, `domaines/rgpd-mentions-legales/README.md`, `domaines/recette/README.md`, `domaines/maintenance/README.md`.
- `bin/fm-brief.sh` et `ship-landing`.
