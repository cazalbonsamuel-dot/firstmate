---
name: cao-reception
description: Load in a CAO (FreeCAD) home when a CAO worker reports done, a ready branch, or a PR, before accepting its handoff.
user-invocable: false
metadata:
  internal: true
---

# Réception d'une remise de worker CAO

La méthode du dépôt `agent-conception-cao` est l'autorité ; `§N` renvoie à `method/methode-cao-operationnelle-v1.md`, « contrat » à `method/proof-contract-v2.md`.
Ce skill précède `ship-landing` et ne le remplace pas.

## Quand charger

- Quand un worker CAO signale `done`, une branche prête ou une PR, avant toute acceptation ou demande d'intégration.

## Faire

1. Lire la fiche de remise au chemin fixé par le brief : unité, commit, fichiers livrés avec sha256 et digest, commandes avec code et durée, version FreeCAD, captures et leur identité, décisions consommées, budget, points ouverts.
   Vérifier que son `commit` est un ancêtre de la tête de la branche reçue (`git merge-base --is-ancestor <commit> <branche>`) et que les commits suivants ne touchent que la fiche (`git diff --name-only <commit> <branche>`).
2. Lister les fichiers touchés par `git diff --stat <base>...<branche>` et les comparer au périmètre du brief.
3. Dans la copie du worker ou une autre copie isolée de la branche, jamais la copie principale, sans GUI et jamais avec `--execute` :
   `python3 method/check_method.py delivery`, puis `python3 method/check_method.py summary method/cases/<cas>/manifest.json`.
   `delivery` relit les digests par `freecadcmd` en console, quelques secondes, ce qui n'est pas un travail lourd ; sans `freecadcmd`, la maturité reste `non_etabli` : contrôler la cohérence, ne pas accepter de maturité.
   Pour une unité sans manifeste ni exécution native (recherche, calcul, plans), exiger `cases`, `fixtures` et `self-test` à 0 et lire le livrable.
   Vérifier ensuite que la copie est restée propre (`git status`).
4. Refuser la remise, sans la requalifier, si l'un de ces points est vrai :
   - fiche absente, ou commande sans code ni durée ;
   - `delivery` différent de 0, sans aucun écart admis ;
   - `delivery --execute` lancé par un autre worker que celui de S5 ;
   - `maturity.observed` en dessous d'un niveau présent dans `maturity.claimed` (une revendication vide n'est pas un écart) ;
   - `maturity.definition` et `maturity.open_items` qui ne correspondent pas aux définitions déclarées ouvertes dans `limits[]` et dans les `open_points` de la fiche ;
   - `architecture_decision_not_validated` ou `decision_record_malformed` ;
   - FCStd ou STEP modifié dont le digest est égal au digest épinglé avant la remise, c'est-à-dire au manifeste de la base de la branche, ou `.FCBak` présent ;
   - capture listée ou hashée absente de la branche, ou sans identité (document, digest, vue, état, date) ;
   - chemin personnel absolu dans un rapport, le manifeste ou la fiche ;
   - entrée gelée modifiée, autre cas que celui du brief modifié, helper ou lanceur `scripts/` modifié hors lot méthode, manifeste modifié hors de la liste fermée de ses écrivains (squelette du cas, qui le crée ; worker de gel S1/S2 sous dictée, pour `requirements[]` et `decision_record` ; tout worker, pour les lignes des fichiers qu'il possède et déclare dans sa fiche ; worker S5, pour le re-pointage final complet et les revendications de maturité), ou hors des lignes des fichiers que la fiche déclare ;
   - budget dépassé sans arrêt ni remontée.
5. Lire les captures contre les vues exigées par le brief : ensemble repéré, entraînement et guidage, interfaces et retenues (§15).
   Une vue ne prouve pas le fonctionnement ; si le runtime du second maître ne lit pas les images de façon sûre, confier cette lecture à un worker de revue distinct du concepteur.
6. Décider :
   - accepter quand le contrôleur est vert et la revue sans écart ;
   - renvoyer au worker par `fm-send` avec le point exact (règle, fichier, sortie ou ligne en cause) ;
   - remonter quand le refus relève d'une décision du capitaine.
7. Ne jamais rouvrir FreeCAD en GUI, relancer `--execute`, corriger la remise soi-même ni baisser un critère pour accepter.
8. Après acceptation, suivre `ship-landing` ; une remise S5 continue avec `cao-livraison`.

## Refuser ou remonter

- **Capitaine** : point critique non établi ou budget consommé sans preuve conforme (décision 6 du §1) ; difficulté qui remet en cause l'option choisie (décision 4) ; intégration de la PR (décision 5).
- **Second maître** : accepter ou renvoyer ; il ne requalifie aucun statut.
- **Worker** : corrige ce qui est renvoyé dans son périmètre et s'arrête s'il faut toucher une entrée gelée.

## Références

- §1 « Règle de base » : statuts, maturité, niveaux d'autorité.
- §6 « Réouverture et empreintes » : règle de commit des binaires.
- §7 « Modifications et invalidation » : helpers communs, seuil de taille.
- §13 « Travail parallèle sous un superviseur » (ressources partagées, S4, S5) et « Budget par brief ».
- §15 « Captures FreeCAD » : vues à rendre inspectables.
- `method/proof-contract-v2.md` « Porte amont », « Politique `geometry_digest` des modèles », « Maturité : preuves numériques ≠ prototype prêt », « Remise d'un worker et acceptation par le superviseur ».
