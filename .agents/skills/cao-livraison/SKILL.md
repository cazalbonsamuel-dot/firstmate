---
name: cao-livraison
description: Load in a CAO (FreeCAD) home when a case reaches S5 - final reception, proof re-pointing, and the case PR - before briefing the final worker and again when its PR is ready.
user-invocable: false
metadata:
  internal: true
---

# Livraison d'un cas CAO (S5)

La méthode du dépôt `agent-conception-cao` est l'autorité ; `§N` renvoie à `method/methode-cao-operationnelle-v1.md`, « contrat » à `method/proof-contract-v2.md`.

## Quand charger

- Quand un cas atteint S5 : l'assemblage S4 est accepté par `cao-reception` et toutes les remises de pièces sont sur la branche du cas.
- De nouveau quand la PR du worker S5 est prête, avant le message au capitaine.

## Faire

1. Un seul worker S5, brief écrit avec `cao-worker-brief` ; il est le seul à re-pointer le manifeste (§13 ressources partagées).
2. Ses commandes, en série et sous la règle du travail lourd (`cao-freecad-execution`) :
   - `check_all.sh` du cas avec FreeCAD, code 0 ;
   - inscription au manifeste des preuves, hashes et digests déclarés dans les fiches des autres unités (`requirements[]` et `decision_record` y sont déjà, écrits au gel S1/S2), puis re-pointage sur les sorties fraîches, ou restauration des octets épinglés quand le digest est égal (§6) ;
   - contrôle complet du §7 : `cases`, `fixtures`, `self-test`, puis `delivery --execute`, jamais `--changed` ;
   - journal des durées de chaque commande dans la fiche de remise, et dans `generated_by.duration_s` quand le lanceur l'écrit.
3. Contenu attendu de la PR :
   - manifeste complet : `requirements[]` avec `acceptance_criteria`, `decision_record` en `option_validee`, `native_delivery_check`, `delivery_checks[]`, `controls[]`, `matrix[]`, `limits[]`, `definition_scope` si le prototype fabricable est revendiqué ;
   - `cases/<cas>/README.md` : besoin, périmètre, commandes du cas ;
   - gabarit de décision rempli, `params.json`, `interfaces.json` ;
   - modèles dont la géométrie a changé, et seulement eux ;
   - captures hashées ajoutées par `git add -f`, avec leur identité ;
   - dossier, plans, BOM, et la fiche de remise.
4. Règles de commit : pas de modèle régénéré à digest égal, pas de `.FCBak`, aucun chemin personnel, aucun autre cas, helper, lanceur ou fichier de méthode modifié (§6, §7).
   Plus de 10 Mo de binaires ajoutés ou modifiés : justifier chaque fichier dans la description de la PR ; plus de 50 Mo : remonter au capitaine avant d'ouvrir la PR.
5. La PR suit le mode de livraison enregistré pour le projet (`AGENTS.md` section 7) ; le second maître n'intègre jamais lui-même.
6. Recevoir la PR avec `cao-reception` : `delivery` et `summary` côté second maître, sur la branche de la PR.
7. Message au capitaine par le canal parent, en plus de la ligne que les scripts y publient déjà (`docs/secondmate-parent-channel.md`) :
   - le résultat en une phrase et l'URL complète de la PR ;
   - maturité observée et maturité revendiquée, définitions encore ouvertes et limites ;
   - preuves : commandes, codes et durées ;
   - essais physiques futurs à prévoir, non exécutés (§2 « Sortie utile et portée démontrée ») ;
   - la question : intégrer la PR.
8. Après intégration par le capitaine, suivre `ship-landing` pour le nettoyage.

## Refuser ou remonter

- **Capitaine** : intégration de la PR (décision 5 du §1) ; dossier qui ne peut pas être fermé, point critique non établi ou budget consommé (décision 6) ; PR de plus de 50 Mo de binaires.
- **Second maître** : moment du lancement S5, acceptation de la remise S5, contenu du message.
- **Worker S5** : re-pointage et commandes ; il s'arrête si un contrôle exige de modifier une entrée gelée, un autre cas ou un helper.
- Refuser une livraison sans `delivery --execute` à 0 dans la copie du worker S5, ou sans `delivery` à 0 côté second maître.

## Références

- §2 « Sortie utile et portée démontrée » : arrêt au dossier, essais futurs.
- §3 « Dossier de preuves », « Squelette d'un nouveau cas » : manifeste minimal.
- §6 « Réouverture et empreintes » : règle de commit des binaires.
- §7 « Modifications et invalidation » : contrôle complet, seuil de taille.
- §13 « Travail parallèle sous un superviseur » : S4, S5, ressources partagées.
- `method/proof-contract-v2.md` « Principes obligatoires pour une livraison finale », « Maturité : preuves numériques ≠ prototype prêt », « Commandes », « Remise d'un worker et acceptation par le superviseur ».
