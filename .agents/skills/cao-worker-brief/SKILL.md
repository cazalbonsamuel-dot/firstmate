---
name: cao-worker-brief
description: Load in a CAO (FreeCAD) home before writing the brief of a CAO worker - research, pre-sizing, calculation, part design, native proof, capture, drawings or dossier, integration, or final delivery.
user-invocable: false
metadata:
  internal: true
---

# Brief d'un worker CAO

La méthode du dépôt `agent-conception-cao`, à la tête de sa branche par défaut, est l'autorité ; `§N` renvoie au noyau `method/methode-cao-operationnelle-v1.md`, « contrat » au noyau `method/proof-contract-v2.md` et à ses parties `method/contrat/`.
Le brief se génère par `bin/fm-brief.sh` (`AGENTS.md` section 11) ; ce skill fixe le contenu CAO à mettre dans son `## Firstmate spec`.
Les règles communes à toute unité (rôle, lecture, entrées gelées, propriété et écrivains du manifeste, FreeCAD, commit, budget, fiche de remise, intégration, refus) sont dans `method/worker.md` : le brief le cite et ne les recopie ni ne les assouplit.

## Quand charger

- Avant d'écrire ou de régénérer le brief de tout worker CAO, y compris un worker court qui écrit sous dictée des artefacts gelés (critères, `params.json`, `interfaces.json`, §5 de la décision).

## Faire

1. Choisir une seule ligne de la table des unités de travail (§13) ; un travail qui n'entre dans aucune ligne se redécoupe.
   Recherche et pré-dimensionnement sont des scouts ; toute unité qui écrit dans le projet est un ship.
2. Vérifier le point de synchronisation requis avant de lancer : S1 pour un calcul ou une conception, S2 pour toute CAO détaillée, S3 pour une pièce, FCStd d'assemblage gelé et hashé pour une preuve native ou une capture.
   Une entrée non gelée interdit le lancement.
3. Remplir les crochets du brief (b) de `method/README.md` :
   - l'unité, sa ligne du §13, `method/worker.md`, et la colonne « Lire » de cette ligne : sections du noyau nommées, lues seules, guides et parties du contrat nommés ; une lecture ajoutée porte sa raison écrite ;
   - la base : un commit de la branche du cas, jamais une liste d'empreintes ; les entrées gelées sont les fichiers gelés du cas à ce commit (`method/worker.md` §3), plus, s'il y a lieu, la preuve `DEC-...` et le FCStd gelé d'une unité de preuve ou de capture ;
   - le livrable (colonne « Livrable accepté »), les fichiers que le worker possède, un seul propriétaire par FCStd et par dossier de sorties, et le chemin de sa fiche `cases/<cas>/outputs/remises/<unité>-<date>.json`, numérotée `-2`, `-3` pour une remise suivante le même jour ;
   - le budget de `method/iteration_budget.json`, réduit quand l'unité le permet, augmenté seulement avec justification écrite ; la fiche le déclare au schéma fixe du contrat (« Fiche de remise ») ;
   - les points propres au cas que la ligne et `method/worker.md` ne disent pas : cotes serrées connues, vues de capture exigées.
4. Commandes de remise : renvoyer à `method/worker.md` §8 et au contrat (« Commandes du worker »), qui les fixent selon que l'unité a ou non une exécution native et n'en demandent aucune à un scout ; le brief ne les recopie pas.
   Avant S4, quand le cas n'a pas encore de contrôle natif, le brief nomme le contrôle natif de la pièce.
5. Pour une unité « Plans normatifs TechDraw », le brief nomme le budget `max_techdraw_runs_per_page_set` de `method/iteration_budget.json` et rien d'autre de la passe : ses contrôles avant ou après exécution, y compris celui de la spécification de pages, et sa relecture en image sont dans `method/guides/techdraw.md` et ne s'écrivent pas dans le brief.
6. Exécutions lourdes : le brief donne l'autorisation du second maître et le délai maximal de chacune (`cao-freecad-execution`), seules valeurs propres à l'unité ; ce que le worker fait de ce délai, y compris ce qu'il déclare avant d'attendre, est dans `method/worker.md` §5 et ne s'écrit pas dans le brief.
7. Gel complémentaire en cours d'unité : transmettre le nouveau commit par `fm-send`, sans empreintes ; le worker repart de lui selon `method/worker.md` §3.
8. Base de branche : quand les artefacts gelés vivent sur la branche du cas et pas sur la branche par défaut, lancer le worker avec `--base-branch` sur la branche du cas (`AGENTS.md` section 7).
9. Runtime : une unité native exige un runtime hors bac à sable sur ce Mac (§12) ; ne jamais la confier à un profil dont le bac à sable bloque Qt.
10. Avant de lancer, relire le brief contre la ligne du §13 : une entrée, un livrable, un propriétaire, un budget, aucune règle de `method/worker.md`, des guides ni des parties du contrat de la colonne « Lire » recopiée.

## Refuser ou remonter

- **Capitaine** : rien directement ; une unité impossible sans nouvelle décision passe par la décision du §1 concernée.
- **Second maître** : unité, base, budget, ordre et autorisation des exécutions lourdes, ordre d'intégration, vues de capture.
- **Worker** : détails locaux sans effet sur entrée gelée, interface ou compromis, et manière de produire ses preuves (§1 niveaux d'autorité) ; il remonte le reste selon `method/worker.md` §1 et §4.
- Refuser d'écrire un brief « objet entier » quand S3 permet un travail par pièce, deux propriétaires pour un même FCStd ou une même ligne du manifeste, ou un brief qui autorise la modification d'un autre cas que celui du brief ou d'un helper commun.

## Références

- §1 « Règle de base » : niveaux d'autorité.
- §12 « Points d'entrée - second maître et workers ».
- §13 « Travail parallèle sous un superviseur » (unités et colonne « Lire », S1-S5, gel complémentaire, ressources partagées) et « Budget par brief ».
- `method/README.md` « Points d'entrée », brief (b) du worker.
- `method/worker.md`, dont §5 « Exécutions FreeCAD » et §8 « Remise ».
- Contrat, « Remise d'un worker et acceptation par le superviseur » : « Commandes du worker », « Fiche de remise ».
- `method/guides/techdraw.md` ; `method/iteration_budget.json`.
