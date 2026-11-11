---
name: cao-livraison
description: Load in a CAO (FreeCAD) home when a case reaches S5 - final reception, proof re-pointing, and the case PR - before briefing the final worker and again when its PR is ready.
user-invocable: false
metadata:
  internal: true
---

# Livraison d'un cas CAO (S5)

La méthode du dépôt `agent-conception-cao`, à la tête de sa branche par défaut, est l'autorité ; `§N` renvoie au noyau `method/methode-cao-operationnelle-v1.md`, « contrat » au noyau `method/proof-contract-v2.md` et à ses parties `method/contrat/`.

## Quand charger

- Quand un cas atteint S5 : l'assemblage S4 est accepté, toutes les remises de pièces sont intégrées une à une sur la branche du cas (`cao-reception`), et la liste des invalidations ouvertes y est vide (contrat, « Liste des invalidations ouvertes »).
- De nouveau quand la PR du worker S5 est prête, avant le message au capitaine.

## Faire

1. Un seul worker S5, brief écrit avec `cao-worker-brief` sur la ligne « Réception et re-pointage S5 » du §13 ; il est le seul à faire le re-pointage final complet du manifeste et ses revendications de maturité.
2. Ses commandes sont celles du contrat (« Commandes du worker », worker de réception S5), en série et sous la règle du travail lourd (`cao-freecad-execution`) ; le second maître fixe dans le brief la portée de `delivery --execute` :
   - lot de cas, dont tous les fichiers changés sont sous `cases/<cas>/` ou `method/cases/<cas>/` : `python3 method/check_method.py delivery --execute --case <cas> --base <branche par défaut>` ;
   - plein périmètre, `delivery --execute` sans `--case` : pour tout lot méthode ou helper, et après une mise à jour de FreeCAD ou de macOS, tant que les versions observées diffèrent de « Versions locales observées » de `method/performance.md` ;
   - délai et Mac éveillé pour une passe longue selon `cao-freecad-execution`.
3. Contenu attendu de la PR :
   - manifeste complet selon le §3 (« Squelette d'un nouveau cas », manifeste minimal) avec `decision_record` en `option_validee`, plus `definition_scope` si le prototype fabricable est revendiqué ;
   - `cases/<cas>/README.md`, `params.json`, `interfaces.json`, et la décision et ses annexes pour un nouveau cas (le gabarit en un seul fichier pour un cas qui l'a déjà) ;
   - modèles dont la géométrie a changé, et seulement eux ; captures avec leur identité ;
   - dossier, plans, BOM ; pour chaque page TechDraw livrée, `layout_defects` vides dans son rapport et page relue en image, ce qui n'est pas une preuve ;
   - les fiches de remise de `outputs/remises/`.
4. Règles de commit selon `method/worker.md` §6 ; aucun autre cas, helper, lanceur ou fichier de méthode modifié (§7).
5. La PR suit le mode de livraison enregistré pour le projet (`AGENTS.md` section 7) ; le second maître n'intègre jamais lui-même.
6. Recevoir la PR avec `cao-reception`, `reception` en rôle `s5`, sur la branche de la PR.
7. Message au capitaine par le canal parent, en plus de la ligne que les scripts y publient déjà (`docs/secondmate-parent-channel.md`) :
   - le résultat en une phrase et l'URL complète de la PR ;
   - maturité observée et maturité revendiquée, définitions encore ouvertes et limites ;
   - preuves : commandes, codes et durées, et la portée de `delivery --execute` retenue ;
   - essais physiques futurs à prévoir, non exécutés (§2 « Sortie utile et portée démontrée ») ;
   - la question : intégrer la PR.
8. Après intégration par le capitaine, suivre `ship-landing` pour le nettoyage.

## Refuser ou remonter

- **Capitaine** : intégration de la PR (décision 5 du §1) ; dossier qui ne peut pas être fermé, point critique non établi ou budget consommé (décision 6) ; PR de plus de 50 Mo de binaires (§7).
- **Second maître** : moment du lancement S5, portée de `delivery --execute`, acceptation de la remise S5, contenu du message.
- **Worker S5** : re-pointage et commandes ; il s'arrête si un contrôle exige de modifier une entrée gelée, un autre cas ou un helper.
- Refuser une livraison sans `delivery --execute` à 0, à la portée fixée, dans la copie du worker S5, ou sans `delivery` à 0 sans aucun écart côté second maître.
- Refuser `--case` pour un lot qui touche un fichier hors du cas ou après une mise à jour de FreeCAD ou de macOS non encore passée en plein périmètre.

## Références

- §2 « Sortie utile et portée démontrée » : arrêt au dossier, essais futurs.
- §3 « Dossier de preuves », « Squelette d'un nouveau cas » : manifeste minimal.
- §6 « Réouverture et empreintes » ; §7 « Modifications et invalidation » : contrôle complet, seuil de taille.
- §13 « Travail parallèle sous un superviseur » : S4, S5, ressources partagées.
- Contrat, « Principes obligatoires pour une livraison finale », « Commandes », « Remise d'un worker et acceptation par le superviseur ».
- `method/contrat/maturite.md`, `method/contrat/reception.md`.
- `method/worker.md` §6 « Règles de commit » ; `method/guides/techdraw.md` ; `method/performance.md` « Versions locales observées ».
