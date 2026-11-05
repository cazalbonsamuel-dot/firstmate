---
name: cao-worker-brief
description: Load in a CAO (FreeCAD) home before writing the brief of a CAO worker - research, pre-sizing, calculation, part design, native proof, capture, drawings or dossier, integration, or final delivery.
user-invocable: false
metadata:
  internal: true
---

# Brief d'un worker CAO

La méthode du dépôt `agent-conception-cao` est l'autorité ; `§N` renvoie à `method/methode-cao-operationnelle-v1.md`, « contrat » à `method/proof-contract-v2.md`.
Le brief se génère par `bin/fm-brief.sh` (`AGENTS.md` section 11) ; ce skill fixe le contenu CAO à mettre dans son `## Firstmate spec`.

## Quand charger

- Avant d'écrire ou de régénérer le brief de tout worker CAO, y compris un worker court qui écrit sous dictée des artefacts gelés (critères, `params.json`, `interfaces.json`, §5 du gabarit de décision).

## Faire

1. Choisir une seule ligne de la table des unités de travail (§13) ; un travail qui n'entre dans aucune ligne se redécoupe.
   Recherche et pré-dimensionnement sont des scouts ; toute unité qui écrit dans le projet est un ship.
2. Vérifier le point de synchronisation requis avant de lancer : S1 pour un calcul ou une conception, S2 pour toute CAO détaillée, S3 pour une pièce, FCStd d'assemblage gelé et hashé pour une preuve native ou une capture.
   Une entrée non gelée interdit le lancement.
3. Reprendre le brief (b) de `method/README.md` et y écrire :
   - l'unité et la colonne « Sections appliquées » de sa ligne ;
   - les entrées gelées avec chemin et sha256 (`design/params.json`, `design/interfaces.json`, gabarit de décision et preuve `DEC-...`, FCStd d'assemblage), à ne pas modifier ;
   - le livrable (colonne « Livrable accepté ») et le chemin de la fiche de remise, par défaut `cases/<cas>/outputs/remise.json` ;
   - le propriétaire unique de chaque FCStd et de `outputs/` ; une preuve ou une capture rouvre le FCStd gelé en lecture seule ;
   - hors périmètre : manifeste du cas (sauf worker S5), helpers et lanceurs `scripts/`, autres pièces, tout autre cas ;
   - budget : `max_iterations` et `max_heavy_runs_per_brief` de `method/iteration_budget.json`, réduits quand l'unité le permet, augmentés seulement avec justification écrite ;
   - chaque exécution lourde attend l'autorisation du second maître, avec son délai maximal (`cao-freecad-execution`) ; avant d'attendre une commande lourde, le worker déclare `paused ... until <début + délai>` selon la règle de statut du brief ;
   - commandes de remise du contrat : unité sans exécution native, `cases`, `fixtures`, `self-test` ; unité native, `check_all.sh` du cas avec FreeCAD (le code 3 sans FreeCAD n'est pas une remise), puis `delivery --execute`, chacune avec code et durée dans la fiche ;
   - règles de commit (§6) : pas de modèle régénéré à digest égal, pas de `.FCBak`, captures hashées ajoutées par `git add -f`, aucun chemin personnel ;
   - arrêt : une question qui touche une entrée gelée, une interface, un compromis ou l'une des six décisions du §1 donne `needs-decision` au second maître ; un besoin de modifier un helper donne `blocked`.
4. Base de branche : quand les artefacts gelés vivent sur la branche du cas et pas sur la branche par défaut, lancer le worker avec `--base-branch` (`AGENTS.md` section 7).
5. Runtime : une unité native exige un runtime hors bac à sable sur ce Mac (§12) ; ne jamais la confier à un profil dont le bac à sable bloque Qt.
6. Avant de lancer, relire le brief contre la ligne du §13 : une entrée, un livrable, un propriétaire, un budget.

## Refuser ou remonter

- **Capitaine** : rien directement ; une unité impossible sans nouvelle décision passe par la décision du §1 concernée.
- **Second maître** : unité, entrées gelées, budget, ordre et autorisation des exécutions lourdes, vues de capture.
- **Worker** : détails locaux sans effet sur entrée gelée, interface ou compromis, et manière de produire ses preuves (§1 niveaux d'autorité).
- Refuser d'écrire un brief « objet entier » quand S3 permet un travail par pièce, deux propriétaires pour un même FCStd ou manifeste, ou un brief qui autorise la modification d'un cas existant ou d'un helper commun.

## Références

- §1 « Règle de base » : niveaux d'autorité.
- §2 « Implantation avant le détail » : fiche d'interfaces gelée S3.
- §6 « Réouverture et empreintes » : règle de commit des binaires.
- §7 « Modifications et invalidation » : helpers communs, lot méthode séparé.
- §12 « Points d'entrée - second maître et workers ».
- §13 « Travail parallèle sous un superviseur » (unités, S1-S5, ressources partagées) et « Budget par brief ».
- `method/README.md` « Points d'entrée », brief (b) du worker.
- `method/proof-contract-v2.md` « Remise d'un worker et acceptation par le superviseur ».
- `method/iteration_budget.json`.
