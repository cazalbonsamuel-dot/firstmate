---
name: cao-recherche-options
description: Load in a CAO (FreeCAD) home before starting the solution research and review gate for a new or changed architecture, and before presenting any option comparison or structuring trade-off to the captain.
user-invocable: false
metadata:
  internal: true
---

# Porte de recherche et revue des solutions

La méthode du dépôt `agent-conception-cao` est l'autorité ; `§N` renvoie à `method/methode-cao-operationnelle-v1.md`, « gabarit » à `method/templates/recherche-options.md`.

## Quand charger

- Avant tout nouveau choix d'architecture ou changement significatif de principe, transmission, implantation ou procédé, et après un rejet d'architecture (§2 « Porte obligatoire »).
- Avant de présenter au capitaine un comparatif ou un compromis structurant de coût, encombrement, performances ou entretien.
- Pas pour un détail local à architecture validée : vérifier seulement que la recherche et la décision antérieures restent applicables (gabarit §6).

## Faire

1. Arrêter le §1 du gabarit (besoin, exigences impératives, inconnues, motif de la revue) : c'est l'entrée gelée de tous les workers de la porte.
2. Choisir deux à quatre familles de solutions réellement différentes ; pas de variantes du même choix ni d'option inventée pour le quota.
   Si une seule paraît viable, justifier les exclusions et la soumettre quand même.
3. Lancer en parallèle un scout par famille (unité « Recherche d'une famille de solutions », §13), brief écrit avec `cao-worker-brief`, sans FreeCAD.
   Consignes de sources à mettre dans le brief : sources primaires d'abord (fabricants, notices, plans) ; date de consultation, référence ou version exacte, lien, information réellement établie, limites de transposition ; refus d'accès consignés sans contournement ; une image ou une vidéo ne prouve ni interface ni capacité ; un extrait indexé n'est pas un plan reçu.
   Livrable : les lignes de sa famille pour le gabarit §2 et un schéma de principe.
4. Lancer ensuite un worker de pré-dimensionnement par option encore viable (§13) : gabarit §3, formules, unités, faisabilité, contraintes dures.
   Une option manifestement incompatible est écartée avant toute modélisation ; une inconnue n'est jamais un résultat favorable.
5. Décider la consolidation du gabarit §2 à §4, écrite par un worker sous dictée (`cao-worker-brief`), jamais par le second maître : tableau d'options, options écartées et pourquoi, recommandation argumentée présentée comme proposition, incertitudes décisives, une seule question de choix.
6. Construire une seule planche Lavish de comparaison pour cette porte.
   Par option : schéma ou maquette d'encombrement sommaire marqué « propositions non validées », fonctionnement (mouvement, effort, usage), avantages et limites, encombrement chiffré, coût en ordre de grandeur sourcé ou marqué estimé, difficulté de fabrication et d'entretien, inconnues ; puis la question de choix.
   Pour un simple oui ou non, une question sans planche suffit.
7. Tenir la décision pour le capitaine, lier puis armer la planche selon `captain-hold-lifecycle` et `process-event-sources` ; le capitaine est atteint par le canal parent (`docs/secondmate-parent-channel.md`), jamais par le chat du home.
   Faire noter par le worker sous dictée, dans le gabarit §4, la version de la planche réellement présentée et la date.
8. En attente : seuls les travaux compatibles avec toutes les options continuent ; aucune CAO détaillée, génération complète ou campagne de validation.
9. À la réponse : faire recopier par un worker, sous dictée, le §5 du gabarit (état, option, périmètre, compromis et réserves, citation ou référence retrouvable, date, version du comparatif, travaux autorisés).
   Ce worker hashe le gabarit en entier après ce §5 et déclare dans sa fiche la preuve `decision_record` à porter au manifeste, avec `source_artifacts` et les cinq champs `state`, `option`, `perimeter`, `response_ref`, `response_date` (contrat « Porte amont ») ; il ne touche pas le manifeste, où le worker S5 l'inscrit (`cao-livraison`).
   S2 est atteint seulement sur un §5 hashé en `option_validee` ; toute retouche ultérieure du gabarit périme la preuve.
10. Sur `a_revoir` ou `rejetee` : revenir au comparatif, jamais à une itération détaillée de l'option rejetée.

## Refuser ou remonter

- **Capitaine** : le choix d'architecture (décision 1 du §1), tout compromis structurant (décision 2), et l'absence d'option satisfaisant les contraintes, présentée avec les arbitrages nécessaires sans choisir à sa place (décision 4).
- **Second maître** : familles explorées, sources, exclusions justifiées, recommandation, forme de la planche ; jamais le choix lui-même.
- **Worker scout** : le contenu de sa famille ou de son option ; il ne recommande pas de décision et ne contacte jamais le capitaine.
- Refuser comme validation : une recommandation reprise telle quelle, un « oui » à la méthode, à un besoin ou à une référence de composant, un « fais au mieux », une note déposée sur disque sans présentation, une validation antidatée.

## Références

- §1 « Règle de base » : six décisions du capitaine.
- §2 « Entrée et modes de travail » (tableau de comparaison), « Porte obligatoire : recherche et revue des solutions » étapes 1 à 5.
- §13 « Travail parallèle sous un superviseur » : unités recherche et pré-dimensionnement, S2.
- `method/templates/recherche-options.md` §1 à §6.
- `method/proof-contract-v2.md` « Porte amont : recherche et décision d'architecture » (`decision_record`, T29).
- `method/check_method.py self-test` (T29) et `fixtures` (`decision_missing`).
