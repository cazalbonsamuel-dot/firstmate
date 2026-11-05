---
name: cao-freecad-execution
description: Load in a CAO (FreeCAD) home before authorizing, starting, or supervising any native FreeCAD run (build, delivery check, capture, GUI proof, FEM), and on any FreeCAD crash, hang, or suspicious capture.
user-invocable: false
metadata:
  internal: true
---

# Exécution native FreeCAD

La méthode du dépôt `agent-conception-cao`, telle qu'elle sort de sa PR #1 (tête `16803364`, lot 1e), est l'autorité ; `§N` renvoie à `method/methode-cao-operationnelle-v1.md`.
Les lanceurs du projet portent leurs refus ; ce skill dit comment les ordonner et que faire quand ils échouent.

## Quand charger

- Avant d'autoriser, de lancer ou de superviser une exécution native : génération GUI, `check_all.sh`, contrôle natif de livraison, `delivery --execute`, campagne de collisions, preuve GUI, capture, FEM.
- Sur tout plantage, blocage, délai dépassé ou capture suspecte.

## Faire

1. Classer l'exécution d'après la table « Exécutions lourdes par cas » de `method/performance.md` : est lourde toute exécution native de plus de quelques secondes (§13).
   Ne sont pas lourds : calculs Python, plans et BOM, contrôleur sans FreeCAD, digests `freecadcmd` de `delivery`.
2. Un seul travail lourd à la fois sur ce Mac.
   Quand la branche de base du worker contient le bail `freecad` pris par les lanceurs dans `scripts/freecad_env.sh` (lot outillage M6), ce bail fait foi.
   D'ici là, le second maître tient la file : il n'autorise une exécution lourde qu'après la fin de la précédente, vérifie avant chaque autorisation qu'aucun processus FreeCAD ne tourne (`pgrep -ilx 'freecad|freecadcmd'`, nom exact du processus, pour ne pas compter les agents dont la ligne de commande cite FreeCAD), et laisse les workers légers en parallèle.
   Une mémoire « non mesurée » n'autorise jamais deux exécutions lourdes simultanées.
3. N'utiliser que les lanceurs du projet, sans les copier ni les modifier :
   - `scripts/run_freecad_capture.sh --script <script>` pour la génération GUI avec `show_progress`, `--document <FCStd> --output <png>` pour une capture ;
   - `scripts/run_freecad_build.sh` et le `check_delivery.sh` du cas ;
   - `freecad_console_run` de `scripts/freecad_env.sh` pour la console.
   Ne pas contourner leurs refus : `freecadcmd` associé à la GUI, session contenant déjà des documents, `--script` et `--document` ensemble.
   Préférences isolées `-u/-s` seulement ; jamais d'injection dans la session ni dans un document de l'utilisateur.
   Le repli console du build ne prouve pas la GUI.
4. Runtime hors bac à sable obligatoire pour tout natif (§12).
5. Fixer le délai maximal dans l'autorisation : le `timeout_s` du `delivery_check` déclaré, sinon la durée mesurée dans `method/performance.md` avec une marge, au plus le double.
   Une exécution jamais mesurée se mesure d'abord en une passe surveillée, puis entre dans `method/performance.md` par un worker.
   Délai dépassé : l'exécution est un échec ; le worker l'arrête et conserve ce qu'elle a produit.
6. Relancer au plus une fois, après diagnostic ; la relance compte dans `max_heavy_runs_per_brief`.
   Un deuxième échec identique devient `blocked` au second maître, avec code, journal et fichiers partiels conservés ; jamais de relance en boucle.
7. Diagnostiquer d'après les messages des lanceurs et le §15 :
   - « FreeCAD stopped before the script started » avec `hw.optional.neon` illisible : runtime en bac à sable, pas une erreur de script ; changer de runtime, ne pas relancer à l'identique ;
   - « did not report completion » ou « callback result » non nul : échec réel du script ; les fichiers intermédiaires ne valent pas livraison ;
   - code 134 : rendu `CoinOffscreenRenderer` interdit sur macOS, comme `GrabFramebuffer` ;
   - image uniforme : `save_view` retente puis échoue en nommant la vue ; corriger la vue, jamais l'accepter ;
   - message 3Dconnexion : avertissement connu, sans effet ;
   - version différente de 1.1.4 (`4fd3bf320`) dans `freecad_status.json` : signaler l'écart, ne pas le corriger en silence ;
   - GUI impossible à afficher (Mac verrouillé ou endormi) : garder la limite et remonter, jamais de capture simulée.
8. Identité des captures : document, digest, vue, état et date de chaque capture figurent dans la fiche de remise, et dans le JSON d'identité à côté du PNG dès que le lot outillage M6 l'écrit.
9. Après un plantage : conserver journaux, rapports natifs et fichiers partiels sans remplacer un fichier final antérieur (§6) ; le worker laisse un état de reprise court (§13) dans sa fiche ; ne jamais tuer un processus FreeCAD qui n'appartient pas à l'exécution autorisée.

## Refuser ou remonter

- **Capitaine** : toute installation ou modification de la configuration FreeCAD globale (addon, préférences hors `-u/-s`), et un blocage durable de la GUI qui empêche de fermer le dossier (décisions 5 et 6 du §1).
- **Second maître** : ordre des exécutions lourdes, autorisation, délai, relance unique, abandon après deux échecs.
- **Worker** : lance seulement l'exécution autorisée, s'arrête au délai, ne relance pas une deuxième fois de lui-même.

## Références

- §6 « Réouverture et empreintes » : erreurs, fichiers partiels.
- §12 « Points d'entrée - second maître et workers » : runtime hors bac à sable.
- §13 « Travail parallèle sous un superviseur » (un seul travail lourd, ressources partagées) et « Budget par brief ».
- §15 « Captures FreeCAD » : lanceurs, refus, rendu hors écran, identité des captures.
- `method/performance.md` « Exécutions lourdes par cas - ordonnancement ».
- `scripts/run_freecad_capture.sh`, `scripts/run_freecad_build.sh`, `scripts/freecad_env.sh`.
