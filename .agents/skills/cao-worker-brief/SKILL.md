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
   - le livrable (colonne « Livrable accepté ») et le chemin de la fiche de remise, propre à l'unité : `cases/<cas>/outputs/remises/<unité>.json` ;
   - le propriétaire unique de chaque FCStd et de `outputs/`, hors `outputs/remises/` où chaque unité écrit seulement sa fiche ; une preuve ou une capture rouvre le FCStd gelé en lecture seule ;
   - hors périmètre : helpers et lanceurs `scripts/`, autres pièces, tout autre cas, et le manifeste du cas hors de la liste fermée de ses écrivains (squelette du cas, qui le crée ; worker de gel S1/S2 sous dictée, pour `requirements[]` et `decision_record` ; tout worker, pour les lignes des fichiers qu'il possède et déclare dans sa fiche ; worker S5, pour le re-pointage final complet et les revendications de maturité) ; un worker avant S5 re-pointe lui-même les lignes des fichiers qu'il possède, déclarés dans sa fiche, et rien d'autre ;
   - budget : `max_iterations` et `max_heavy_runs_per_brief` de `method/iteration_budget.json`, réduits quand l'unité le permet, augmentés seulement avec justification écrite ;
   - chaque exécution lourde attend l'autorisation du second maître, avec son délai maximal (`cao-freecad-execution`) ; avant d'attendre une commande lourde, le worker déclare `paused ... until <début + délai>` selon la règle de statut du brief ;
   - commandes de remise du contrat, chacune avec code et durée dans la fiche : unité sans exécution native, `cases`, `fixtures`, `self-test` ; unité native avant S5, la commande `delivery_checks[]` du cas (`check_delivery.sh`) ou, avant S4, le contrôle natif de la pièce nommé par le brief, jamais `delivery --execute` ; worker S5 seul, `check_all.sh` du cas avec FreeCAD (le code 3 sans FreeCAD n'est pas une remise), puis `delivery --execute` ;
   - fiche de remise JSON du contrat, réécrite à chaque remise : unité, `case_id`, `commit` remis, fichiers livrés avec sha256 et digest, commandes avec code et durée, version FreeCAD, captures, décisions consommées, budget, points ouverts ;
   - identité de chaque capture dans la fiche : chemin, sha256, document, digest du document, vue, état et date ; une capture sans identité est refusée ;
   - règles de commit (§6) : pas de modèle régénéré à digest égal, pas de `.FCBak`, captures hashées ajoutées par `git add -f`, aucun chemin personnel ;
   - commande d'acceptation du second maître, sur la branche remise : `python3 method/check_method.py delivery` puis `summary method/cases/<cas>/manifest.json`, sans GUI ni `--execute` ; refus si `delivery` rend autre chose que 0, sans aucun écart admis, ou si `maturity.observed` est en dessous d'un niveau revendiqué (`cao-reception`) ;
   - arrêt : une question qui touche une entrée gelée, une interface, un compromis ou l'une des six décisions du §1 donne `needs-decision` au second maître ; un besoin de modifier un helper donne `blocked`.
4. Base de branche : quand les artefacts gelés vivent sur la branche du cas et pas sur la branche par défaut, lancer le worker avec `--base-branch` (`AGENTS.md` section 7).
5. Runtime : une unité native exige un runtime hors bac à sable sur ce Mac (§12) ; ne jamais la confier à un profil dont le bac à sable bloque Qt.
6. Avant de lancer, relire le brief contre la ligne du §13 : une entrée, un livrable, un propriétaire, un budget.

## Refuser ou remonter

- **Capitaine** : rien directement ; une unité impossible sans nouvelle décision passe par la décision du §1 concernée.
- **Second maître** : unité, entrées gelées, budget, ordre et autorisation des exécutions lourdes, vues de capture.
- **Worker** : détails locaux sans effet sur entrée gelée, interface ou compromis, et manière de produire ses preuves (§1 niveaux d'autorité).
- Refuser d'écrire un brief « objet entier » quand S3 permet un travail par pièce, deux propriétaires pour un même FCStd ou une même ligne du manifeste, ou un brief qui autorise la modification d'un autre cas que celui du brief ou d'un helper commun.

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
