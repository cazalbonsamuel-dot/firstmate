---
name: web-design-direction
description: Load in a web (firstmate-web) home before having a design direction chosen for a site, and before accepting a new or redone rendering.
user-invocable: false
metadata:
  internal: true
---

# Direction de design web

Le choix de la direction revient au capitaine (`data/captain.md`) ; le firstmate fait produire les candidates, les présente et vérifie le rendu contre la direction retenue.

## Quand charger

- Avant de faire choisir une direction de design pour un site neuf ou une refonte visuelle.
- Avant d'accepter un rendu nouveau ou refait, à la réception de la remise du worker.
- Pas pour un correctif qui ne change pas le rendu : vérifier seulement qu'il respecte le DESIGN.md retenu.

## Faire

1. Réunir les références : les trois à cinq sites réels que donne le capitaine, complétés par le worker depuis des galeries gratuites ; aucune référence payante (décision du capitaine).
2. Lancer un scout, brief écrit avec `web-worker-brief`, qui produit deux ou trois DESIGN.md réellement différents, chacun :
   - fondé sur trois à cinq sites réels nommés avec URL et date de consultation, et ce qui en est retenu (principe, pas copie) ;
   - quatre à six couleurs nommées avec leurs rôles, polices et rôles, échelle typographique, espacements, mise en page, clair et sombre si le site a les deux ;
   - relu contre les signatures du design généré par IA listées par `frontend-design`, toute signature conservée justifiée par écrit ;
   - illustré par une maquette de la page d'accueil rendue et capturée, marquée « proposition non validée ».
   Le skill `website-design:web-design-system` sert de trame ; sans UXKIN, le DESIGN.md dit qu'il ne s'appuie pas sur sa base.
3. Construire une seule planche Lavish de comparaison (`lavish-axi`) : par direction, captures, palette, typographie, sites de référence, signatures justifiées ; puis une seule question de choix.
4. Tenir le choix pour le capitaine selon `captain-hold-lifecycle` ; pendant l'attente, seuls les travaux indépendants du design continuent (contenu, mesure, technique).
5. À la réponse, faire écrire dans le projet, par un worker, le DESIGN.md retenu et ses tokens, avec la citation ou la référence de la réponse du capitaine et la version de la planche présentée.
   Ce DESIGN.md devient une entrée figée de tout worker de rendu.
6. À la réception d'un rendu nouveau ou refait :
   - comparer les captures 375, 768 et 1440 px au DESIGN.md retenu (couleurs, polices, échelle, espacements, mise en page) ;
   - chercher les signatures de `frontend-design` non justifiées et toute valeur hors tokens ;
   - vérifier les points mesurables : longueur de ligne inférieure à 80 caractères, contraste au moins 4,5:1, cibles tactiles d'au moins 44 px, aucun défilement horizontal à 375 px, focus visible, `prefers-reduced-motion` respecté ;
   - renvoyer au worker avec des écarts précis (capture, élément, valeur attendue, valeur vue), jamais avec un « à améliorer » ;
   - signaler aussi tout défaut visuel hors sujet vu à l'écran (exigence visuelle du capitaine).
7. La revue des signatures et des tokens de l'étape 6 se fait toujours sur les captures et le code, pour tout rendu nouveau ou refait.
   Recherche de motifs et Stylelint sont des aides facultatives qui ne la remplacent pas ; Impeccable `detect` viendra au lot 8.

## Refuser ou remonter

- **Capitaine** : le choix de la direction, tout changement de direction en cours de projet, toute référence ou ressource payante.
- **Firstmate** : références complémentaires, nombre de directions (deux ou trois), forme de la planche, acceptation ou renvoi d'un rendu contre le DESIGN.md retenu.
- **Worker** : le contenu de ses directions, sans recommander de choix ni contacter le capitaine.
- Refuser comme choix : une direction par défaut, une recommandation reprise telle quelle, un « fais au mieux », une planche non présentée.
- Refuser un rendu jugé sur le code seul, sans captures du rendu.

## Références

- `data/captain.md` : règle de design et décision sur les références visuelles.
- Skill `frontend-design` : signatures du design généré par IA, plan de tokens relu contre le brief avant le code.
- Skills `website-design:web-design-system` (trame du DESIGN.md) et `website-design:web-review` (revue du rendu).
- WCAG 2.2 : https://www.w3.org/TR/WCAG22/ (contraste 4,5:1 au critère 1.4.3 ; 44 px est le critère AAA 2.5.5, retenu par `landing-page`).
- `lavish-axi --help` pour la planche.
