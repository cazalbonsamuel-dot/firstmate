---
name: web-livraison
description: Load in a web (firstmate-web) home when a web worker reports a ready PR, and before any production release.
user-invocable: false
metadata:
  internal: true
---

# Livraison web et mise en production

Sur un hébergeur qui déploie la branche principale, fusionner une PR, c'est mettre le site en production : la fusion attend toujours le mot du capitaine, jamais `yolo` (`data/captain.md`).
Ce skill précède `ship-landing` et ne le remplace pas ; le pipeline de livraison reste seul juge de la revue, des tests et de la CI.

## Quand charger

- Quand un worker web signale une PR prête, avant de la présenter au capitaine.
- Avant toute mise en production, y compris un déploiement qui ne passe pas par une fusion.
- De nouveau après la fusion, pour la vérification en production.

## Faire

1. Vérifier la présence et la cohérence des preuves exigées par le brief (`web-worker-brief`), sans refaire la revue du pipeline :
   - captures 375, 768 et 1440 px avant et après, prises sur le rendu ;
   - tableau des mesures avant/après : Lighthouse cinq passes en médiane, axe, sorties du kit du projet ou manque écrit ;
   - pour un contenu : liste « affirmations et sources », revue anti-slop sans point bloquant et résumé de relecture (`web-content-review`) ;
   - pour un rendu nouveau ou refait : conformité au DESIGN.md retenu (`web-design-direction`) ;
   - URL d'aperçu qui répond et montre la branche de la PR ;
   - contrôles automatiques verts ;
   - retour arrière écrit dans la PR (commit à annuler ou déploiement précédent à rétablir chez l'hébergeur).
   Une preuve manquante renvoie au worker ; un contrôle rouge ne se présente pas.
2. Ouvrir l'URL d'aperçu dans `chrome-devtools-axi` et regarder le rendu ; tout défaut visible, même hors sujet, est signalé.
3. Présenter au capitaine la fusion comme une mise en production, dans un seul message :
   - le résultat en une phrase ;
   - l'URL complète de la PR et l'URL d'aperçu ;
   - les mesures avant/après qui comptent, et ce qui a baissé s'il y en a ;
   - les textes à relire lui-même quand la PR publie du texte ;
   - la question : fusionner, donc mettre en production.
   Tenir la décision selon `captain-hold-lifecycle`.
4. Fusionner seulement sur son mot, par le chemin de `ship-landing`.
5. Après fusion, faire vérifier la production par un worker, une mesure à la fois :
   - captures et Lighthouse sur l'URL de production, comparés à l'aperçu ;
   - inspection d'URL dans Search Console pour les pages nouvelles ou modifiées, quand la propriété existe ;
   - notification IndexNow pour Bing quand le site porte sa clé ;
   - robots.txt et réponses HTTP testés pour chaque agent de la matrice des robots IA quand ils ont changé.
6. Rapporter au capitaine le résultat en production avec l'URL ; une régression déclenche le retour arrière écrit, sur son mot.

## Refuser ou remonter

- **Capitaine** : toute fusion sur un site en ligne, toute mise en production, tout retour arrière en production, tout compte ou nom de domaine nécessaire au déploiement.
- **Firstmate** : présence des preuves, renvoi au worker, moment de la présentation, vérification après fusion.
- **Worker** : production des preuves et vérifications après fusion ; jamais de fusion, de déploiement manuel ni de connecteur d'écriture en production.
- Refuser de présenter une PR sans URL d'aperçu, sans mesures avant/après jointes, ou dont un texte publié n'a pas suivi `web-content-review`.
- Refuser `yolo` pour un site en ligne, même si le registre du projet l'active : le signaler au capitaine.

## Références

- `data/captain.md` : fusion = mise en production, mesure avant/après, relecture des textes.
- Google, inspection d'URL : https://support.google.com/webmasters/answer/9012289
- IndexNow (moteurs participants, Google n'en fait pas partie) : https://www.indexnow.org/faq
- Lighthouse, variabilité : https://github.com/GoogleChrome/lighthouse/blob/main/docs/variability.md
