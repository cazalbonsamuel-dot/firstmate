---
name: cao-recherche-options
description: Load in a CAO (FreeCAD) home before starting the solution research and review gate for a new or changed architecture, and before presenting any option comparison or structuring trade-off to the captain.
user-invocable: false
metadata:
  internal: true
---

# Porte de recherche et revue des solutions

La méthode du dépôt `agent-conception-cao`, à la tête de sa branche par défaut, est l'autorité ; `§N` renvoie au noyau `method/methode-cao-operationnelle-v1.md`.
Pour un nouveau cas, le gabarit tient en deux fichiers : la « décision » (`method/templates/recherche-options.md`, remplie en `cases/<cas>/design/recherche-options.md`) et les « annexes » (`method/templates/recherche-annexes.md`, remplies en `cases/<cas>/design/recherche/annexes.md`), jamais sous `method/cases/<cas>/`, qui ne porte que le manifeste (§2, dernier paragraphe de la porte).
Un cas dont le gabarit a été rempli en un seul fichier le garde.

## Quand charger

- Avant tout nouveau choix d'architecture ou changement significatif de principe, transmission, implantation ou procédé, et après un rejet d'architecture (§2 « Porte obligatoire »).
- Avant de présenter au capitaine un comparatif ou un compromis structurant de coût, encombrement, performances ou entretien.
- Pas pour un détail local à architecture validée : vérifier seulement que la recherche et la décision antérieures restent applicables (décision, §6).

## Faire

1. Arrêter le §1 de la décision (besoin, exigences impératives, inconnues, motif de la revue) : c'est l'entrée gelée de tous les workers de la porte.
2. Choisir deux à quatre familles de solutions réellement différentes ; pas de variantes du même choix ni d'option inventée pour le quota.
   Si une seule paraît viable, justifier les exclusions et la soumettre quand même.
3. Lancer en parallèle un scout par famille (unité « Recherche d'une famille de solutions », §13), brief écrit avec `cao-worker-brief`, sans FreeCAD.
   Livrable : les lignes de sa famille pour les annexes §2, sources comprises selon le §2 porte, étape 1, et un schéma de principe.
4. Lancer ensuite un worker de pré-dimensionnement par option encore viable (§13) : annexes §3, formules, unités, faisabilité, contraintes dures.
   Une option manifestement incompatible est écartée avant toute modélisation ; une inconnue n'est jamais un résultat favorable.
5. Tenir la proportion de la recherche telle que le §2 l'écrit (« Proportion de la recherche ») :
   - dès qu'une famille est écartée, par une réponse du capitaine ou une contrainte dure établie, arrêter son scout par `fm-send` : elle garde une ligne au tableau avec son motif, la réponse ou la source qui l'établit et sa date ;
   - ne faire reprendre que les sources qui portent une décision (exigence, contrainte dure, choix ou exclusion d'une option) ;
   - aucun plafond chiffré de taille ou de nombre de sources dans un brief : la proportion réduit la rédaction, jamais la porte.
6. Décider la consolidation, écrite par un worker sous dictée (`cao-worker-brief`), jamais par le second maître : résumé des §2 et §3 de la décision, avec renvois aux annexes, et son §4 (recommandation présentée comme proposition, incertitudes décisives, une seule question de choix).
7. Construire une seule planche Lavish de comparaison pour cette porte : par option, les colonnes du tableau du §2 « Entrée et modes de travail », visuels marqués « propositions non validées », puis la question de choix.
   Pour un simple oui ou non, une question sans planche suffit.
8. Tenir la décision pour le capitaine, lier puis armer la planche selon `captain-hold-lifecycle` et `process-event-sources` ; le capitaine est atteint par le canal parent (`docs/secondmate-parent-channel.md`), jamais par le chat du home.
   Faire noter par le worker sous dictée, au §4 de la décision, la version de la planche réellement présentée et la date.
9. En attente : seuls les travaux compatibles avec toutes les options continuent ; aucune CAO détaillée, génération complète ou campagne de validation.
10. À la réponse : faire recopier sous dictée le §5 de la décision par le worker de gel S2, qui hashe ensuite les deux fichiers et écrit au manifeste la seule preuve `decision_record`, ses `source_artifacts` listant la décision et les annexes (`method/contrat/porte-amont.md`).
    S2 est atteint seulement quand cette preuve est en `option_validee` ; toute retouche ultérieure de l'un des deux fichiers périme la preuve.
11. Sur `a_revoir` ou `rejetee` : revenir au comparatif, jamais à une itération détaillée de l'option rejetée.

## Refuser ou remonter

- **Capitaine** : le choix d'architecture (décision 1 du §1), tout compromis structurant (décision 2), et l'absence d'option satisfaisant les contraintes, présentée avec les arbitrages nécessaires sans choisir à sa place (décision 4).
- **Second maître** : familles explorées, sources, exclusions justifiées, arrêt des familles écartées, recommandation, forme de la planche ; jamais le choix lui-même.
- **Worker scout** : le contenu de sa famille ou de son option ; il ne recommande pas de décision et ne contacte jamais le capitaine.
- Refuser comme validation : une recommandation reprise telle quelle, un « oui » à la méthode, à un besoin ou à une référence de composant, un « fais au mieux », une note déposée sur disque sans présentation, une validation antidatée.

## Références

- §1 « Règle de base » : six décisions du capitaine.
- §2 « Entrée et modes de travail » (tableau de comparaison), « Porte obligatoire : recherche et revue des solutions » étapes 1 à 5 et « Proportion de la recherche ».
- §13 « Travail parallèle sous un superviseur » : unités recherche et pré-dimensionnement, S2.
- `method/templates/recherche-options.md` §1 à §6 et `method/templates/recherche-annexes.md` §2 et §3.
- `method/contrat/porte-amont.md` (`decision_record`, T29).
