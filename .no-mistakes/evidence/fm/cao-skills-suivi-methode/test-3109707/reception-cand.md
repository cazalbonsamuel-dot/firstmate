---
name: cao-reception
description: Load in a CAO (FreeCAD) home when a CAO worker reports done, a ready branch, or a PR, before accepting its handoff.
user-invocable: false
metadata:
  internal: true
---

# Réception d'une remise de worker CAO

La méthode du dépôt `agent-conception-cao`, à la tête de sa branche par défaut, est l'autorité ; `§N` renvoie au noyau `method/methode-cao-operationnelle-v1.md`, « contrat » au noyau `method/proof-contract-v2.md` et à ses parties `method/contrat/`.
Commandes, écarts admis et partage entre contrôle mécanique et revue sont dans `method/contrat/reception.md` ; ce skill précède `ship-landing` et ne le remplace pas.

## Quand charger

- Quand un worker CAO signale `done`, une branche prête ou une PR, avant toute acceptation ou demande d'intégration.

## Faire

1. Lire la fiche de remise au chemin fixé par le brief : points ouverts, décisions consommées, budget, captures et commandes.
   Pour un scout (recherche, pré-dimensionnement), lire son livrable contre la ligne du §13 ; il n'y a ni manifeste ni contrôleur à passer.
2. Dans la copie du worker ou une autre copie isolée et propre de la branche, jamais la copie principale, sans GUI et jamais avec `--execute` :
   - `python3 method/check_method.py delivery`, puis `python3 method/check_method.py summary method/cases/<cas>/manifest.json` ; leur vue compacte suffit, `--full` seulement quand une erreur ou un écart demande le détail d'une preuve ; `cases` est inutile quand `delivery` tourne ;
   - `python3 method/check_method.py reception method/cases/<cas>/manifest.json --fiche <fiche> --base <tête de la branche du cas avant l'unité> --role worker|gel|s5` pour les refus mécaniques ;
   - pendant un travail lourd, ces commandes attendent le bail (`cao-freecad-execution`) ; sans `freecadcmd`, la maturité reste `non_etabli` : contrôler la cohérence, ne pas accepter de maturité ;
   - vérifier ensuite que la copie est restée propre (`git status`).
3. Faire la revue humaine que `reception` ne fait pas :
   - captures relues contre les vues exigées par le brief (`method/guides/captures.md`) ; une vue ne prouve pas le fonctionnement ; si le runtime du second maître ne lit pas les images de façon sûre, confier cette lecture à un worker de revue distinct du concepteur ;
   - `maturity.definition` et `maturity.open_items` de `summary` comparés aux définitions déclarées ouvertes dans `limits[]` et dans les `open_points` de la fiche (`method/contrat/reception.md`) : une définition que `limits[]` déclare ouverte et que la fiche ne nomme pas dans ses `open_points`, ou l'inverse, est un écart ; l'item générique `definition_scope` d'un manifeste qui n'en déclare pas et les autres limites (estimations, hypothèses) n'en sont pas (`method/contrat/maturite.md`) ;
   - plans TechDraw : contrôle de mise en page et relecture en image selon `method/guides/techdraw.md`, sans valeur de preuve ;
   - ordre d'intégration fixé par le second maître, provenance MCP, fichiers touchés comparés au périmètre du brief.
4. Refuser la remise, sans la requalifier, sur tout motif du contrat (« Refus », section « Remise d'un worker et acceptation par le superviseur ») , en particulier une erreur de `delivery` hors des écarts admis par `method/contrat/reception.md`, `reception` différent de 0, ou un écart trouvé à la revue.
5. Décider :
   - accepter quand le contrôleur est vert et la revue sans écart ;
   - renvoyer au worker par `fm-send` avec le point exact (règle, fichier, sortie ou ligne en cause) ;
   - remonter quand le refus relève d'une décision du capitaine.
6. Ne jamais rouvrir FreeCAD en GUI, relancer `--execute`, corriger la remise soi-même ni baisser un critère pour accepter.
7. Après acceptation d'une unité avant S5, dire au worker quand intégrer, une unité à la fois dans l'ordre fixé (`method/worker.md` §9) ; après chaque intégration, relancer l'étape 2 sur la tête de la branche du cas avant d'accepter l'unité suivante.
   Une remise S5 continue avec `cao-livraison` ; le nettoyage suit `ship-landing`.

## Refuser ou remonter

- **Capitaine** : point critique non établi ou budget consommé sans preuve conforme (décision 6 du §1) ; difficulté qui remet en cause l'option choisie (décision 4) ; intégration de la PR (décision 5).
- **Second maître** : accepter ou renvoyer ; il ne requalifie aucun statut.
- **Worker** : corrige ce qui est renvoyé dans son périmètre et s'arrête s'il faut toucher une entrée gelée.

## Références

- §1 « Règle de base » : statuts, maturité, niveaux d'autorité.
- §13 « Travail parallèle sous un superviseur » (ressources partagées, S4, S5) et « Budget par brief ».
- Contrat, « Remise d'un worker et acceptation par le superviseur » : « Liste des invalidations ouvertes », « Intégration des branches d'unité », « Fiche de remise », « Refus ».
- `method/contrat/reception.md`, `method/contrat/porte-amont.md`, `method/contrat/geometry-digest.md`, `method/contrat/maturite.md`.
- `method/guides/captures.md`, `method/guides/techdraw.md`.
- `method/worker.md` §9 « Intégration ».
