---
name: cao-freecad-execution
description: Load in a CAO (FreeCAD) home before authorizing, starting, or supervising any native FreeCAD run (build, delivery check, capture, GUI proof, FEM), and on any FreeCAD crash, hang, or suspicious capture.
user-invocable: false
metadata:
  internal: true
---

# Exécution native FreeCAD

La méthode du dépôt `agent-conception-cao`, à la tête de sa branche par défaut, est l'autorité ; `§N` renvoie au noyau `method/methode-cao-operationnelle-v1.md`.
Lanceurs, bail, délais et refus sont dans `method/guides/freecad.md`, vues et identité des captures dans `method/guides/captures.md`, exploration MCP dans `method/guides/mcp.md` ; ce skill dit comment le second maître ordonne les exécutions et que faire quand elles échouent.

## Quand charger

- Avant d'autoriser, de lancer ou de superviser une exécution native : génération GUI, `check_all.sh`, contrôle natif de livraison, `delivery --execute`, campagne de collisions, preuve GUI, capture, FEM, plans TechDraw, session MCP.
- Sur tout plantage, blocage, délai dépassé ou capture suspecte.

## Faire

1. Classer l'exécution d'après le §13 (« Un seul travail lourd à la fois sur ce Mac ») et les durées de `method/performance.md` (« Exécutions lourdes par cas »).
2. Un seul travail lourd à la fois : le bail `freecad` des lanceurs fait foi partout, sans file tenue à la main.
   Le second maître choisit l'ordre et le moment des exécutions lourdes ; les workers légers restent en parallèle.
   Pendant un travail lourd, `summary`, `cases` et `delivery` attendent le bail pour leurs digests : une réception lente à ce moment n'est pas un blocage.
3. Exiger les seuls lanceurs du projet, sans copie ni contournement de leurs refus (`method/worker.md` §5, `method/guides/freecad.md`).
   `scripts/freecad_env.sh` se source depuis bash (`bash -c '...'` depuis zsh), jamais directement depuis zsh.
4. Runtime hors bac à sable obligatoire pour tout natif (§12).
5. Fixer le délai maximal dans l'autorisation : le `timeout_s` du `delivery_check` déclaré, sinon la durée mesurée dans `method/performance.md` avec une marge, au plus le double.
   Le délai se compte hors attente du bail et en temps éveillé : avant une passe longue, Mac sur secteur ou capot ouvert, sous `caffeinate -i` ; capot fermé sur batterie, le Mac s'endort et la passe dépasse son délai.
   Une exécution jamais mesurée se mesure d'abord en une passe surveillée, puis entre dans `method/performance.md` par un worker.
   Un nouveau contrôle natif déclare dans ses `inputs` les helpers communs qu'il traverse, lanceurs, bail et environnement compris (`method/contrat/preuves-critiques.md`, « Champs attendus sur `delivery_checks` »).
6. Délai dépassé ou plantage : appliquer `method/worker.md` §5 (arrêt, fichiers conservés, une seule relance après diagnostic, comptée dans le budget) ; un deuxième échec identique devient `blocked` au second maître, avec code, journal et fichiers partiels, jamais une relance en boucle.
7. Diagnostiquer d'après les messages des lanceurs et les guides :
   - échec avant le script avec `hw.optional.neon` illisible : runtime en bac à sable (§12), changer de runtime, ne pas relancer à l'identique ;
   - fin non attestée ou résultat de callback non nul : échec réel du script, fichiers intermédiaires sans valeur de livraison ;
   - code 75 : bail non obtenu dans l'attente bornée, attendre la fin du détenteur nommé puis réessayer, ne rien forcer ; code 124 : second dépassement du délai, blocage à remonter ;
   - code 134 ou image uniforme : rendu interdit ou vue à corriger (`method/guides/captures.md`), jamais une capture acceptée ;
   - message 3Dconnexion : avertissement connu, sans effet ;
   - version différente de celle attendue (`method/guides/freecad.md`) : signaler l'écart, ne pas le corriger en silence ;
   - GUI impossible à afficher (Mac verrouillé ou endormi) : garder la limite et remonter, jamais de capture simulée.
8. Session MCP : exploration seulement, jamais une preuve ; lourde de l'ouverture à `--stop`, à fermer dès l'exploration finie (`method/guides/mcp.md`).
9. Après un plantage : ne jamais tuer un processus FreeCAD qui n'appartient pas à l'exécution autorisée ; le worker laisse un état de reprise court (§13) dans sa fiche.

## Refuser ou remonter

- **Capitaine** : toute installation ou modification de la configuration FreeCAD globale (addon, préférences hors `-u/-s`), et un blocage durable de la GUI qui empêche de fermer le dossier (décisions 5 et 6 du §1).
- **Second maître** : ordre des exécutions lourdes, autorisation, délai, relance unique, abandon après deux échecs.
- **Worker** : lance seulement l'exécution autorisée, s'arrête au délai, ne relance pas une deuxième fois de lui-même.

## Références

- §6 « Réouverture et empreintes » : erreurs, fichiers partiels.
- §12 « Points d'entrée - second maître et workers » : runtime hors bac à sable.
- §13 « Travail parallèle sous un superviseur » (un seul travail lourd, ressources partagées) et « Budget par brief ».
- `method/guides/freecad.md`, `method/guides/captures.md`, `method/guides/mcp.md`.
- `method/worker.md` §5 « Exécutions FreeCAD ».
- `method/performance.md` « Exécutions lourdes par cas ».
