---
name: web-livraison
description: Load in a web (firstmate-web) home when a web worker reports a ready PR, before any production release, and again after the merge to verify production.
user-invocable: false
metadata:
  internal: true
---

# Livraison web et mise en production

Sur un hébergeur qui déploie la branche principale, fusionner une PR, c'est mettre le site en production : la fusion attend toujours le mot du capitaine, jamais `yolo` (règles 4 et 63 de `data/regles-design.md`).
Ce skill précède `ship-landing` et ne le remplace pas ; le pipeline de livraison reste seul juge de la revue, des tests et de la CI.

## Quand charger

- Quand un worker web signale une PR prête, avant de la présenter au capitaine.
- Avant toute mise en production, y compris un déploiement qui ne passe pas par une fusion.
- De nouveau après la fusion, pour la vérification en production.

## Faire

1. Vérifier la présence et la cohérence des preuves exigées par le brief (`web-worker-brief`), sans refaire la revue du pipeline, chacune prise sur le rendu, jamais sur le code seul (règles 57 et 58) :
   - captures 375, 768 et 1440 px avant et après ;
   - tableau des mesures avant/après : Lighthouse cinq passes en médiane (JSON) avec LCP ≤ 2,5 s sur mobile (règle 53), rapport axe ;
   - sorties de html-validate, lychee, knip et size-limit, et pour un contenu de Vale et Grammalecte ;
   - pour un contenu : liste « affirmations et sources », revue anti-slop sans point bloquant et résumé de relecture (`web-content-review`) ;
   - pour un rendu nouveau ou refait : la revue en deux temps, conformité puis niveau, de `web-design-direction` étape 7, sans écart ouvert (règle 60) ;
   - aucune preuve sociale en ligne sans sa source : un emplacement marqué dont la source manque n'est jamais mis en ligne vide (règle 43) ; aucune photo provisoire sans sa marque (règle 38) ;
   - URL d'aperçu qui répond et montre la branche de la PR ; une maquette non publiée y porte `noindex`, un badge fixe discret dans un coin qui ne masque pas le premier écran et des données fictives sûres (règle 56) ;
   - contrôles automatiques verts ;
   - retour arrière écrit dans la PR (commit à annuler ou déploiement précédent à rétablir chez l'hébergeur) ;
   - pour une refonte qui change des URL : la table de redirections 301 page à page (`web-intake`), testée sur l'aperçu, chaque ancienne URL menant à sa nouvelle page, à garder au moins un an.
   Seule la PR qui crée le kit (lot 3) est dispensée des mesures avant et des sorties du kit : elle montre leur première sortie, mesure de départ des PR suivantes.
   Une preuve manquante renvoie au worker, un manque écrit à la place d'une preuve du kit compris ; un contrôle rouge ne se présente pas.
2. Ouvrir l'URL d'aperçu dans `chrome-devtools-axi` et regarder le rendu ; tout ce qui a l'air faux à l'écran, même hors sujet, est signalé et corrigé (règle 61).
   Avant la mise en ligne d'un site neuf ou refait, exiger du worker la page de mentions légales avec les données du capitaine et le parcours de l'action principale au clavier seul (règle 54), puis un passage VoiceOver avec Safari sur la page de l'action principale (titre de page, liste des titres, régions, liste des liens, étiquettes du formulaire), tous deux joints à la PR.
   Proposer au capitaine, comme option et non comme porte, que trois à cinq personnes accomplissent l'action principale sur leur téléphone en pensant à voix haute, sans aide.
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
   - robots.txt et réponses HTTP testés pour chaque agent de la matrice des robots IA quand ils ont changé ;
   - après une refonte qui change des URL : suivi dans Search Console (404, pages indexées) pendant les semaines qui suivent, quand la propriété existe.
6. Rapporter au capitaine le résultat en production avec l'URL ; une régression déclenche le retour arrière écrit, sur son mot.

## Refuser ou remonter

- **Capitaine** : toute fusion, toute mise en production, tout retour arrière en production, tout compte, nom de domaine, hébergeur ou fiche Google nécessaire au déploiement (règles 4 et 63).
- **Firstmate** : présence des preuves, renvoi au worker, moment de la présentation, vérification après fusion.
- **Worker** : production des preuves et vérifications après fusion ; jamais de fusion, de déploiement manuel ni de connecteur d'écriture en production.
- Refuser de présenter une PR sans URL d'aperçu, sans mesures avant/après jointes ni les sorties du kit exigées par `web-worker-brief` (hors PR qui crée le kit, étape 1), ou dont un texte publié n'a pas suivi `web-content-review`.
- Refuser `yolo` pour un site en ligne, même si le registre du projet l'active : le signaler au capitaine.

## Références

- `data/regles-design.md` : fusion et mise en production (règles 4 et 63), preuves sur le rendu (règles 57 et 58), revue en deux temps (règle 60), maquettes non publiées (règle 56).
- `data/captain.md` : fusion = mise en production, sans `yolo`.
- Google, inspection d'URL : https://support.google.com/webmasters/answer/9012289
- IndexNow (moteurs participants, Google n'en fait pas partie) : https://www.indexnow.org/faq
- Lighthouse, variabilité : https://github.com/GoogleChrome/lighthouse/blob/main/docs/variability.md
- Google, déménagement de site avec changement d'URL : https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes
- WCAG 2.2, critère 2.1.1 Keyboard : https://www.w3.org/TR/WCAG22/
- RGAA 4.1.2, environnement de test (VoiceOver avec Safari parmi les combinaisons de référence) : https://accessibilite.numerique.gouv.fr/methode/environnement-de-test/
- Sara Soueidan, test au lecteur d'écran avec VoiceOver et Safari : https://youtu.be/jXaQsSUMiAY
- NN/g, tester avec cinq utilisateurs (2000) : https://www.nngroup.com/articles/why-you-only-need-to-test-with-5-users/
