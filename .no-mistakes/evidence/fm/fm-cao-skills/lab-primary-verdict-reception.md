# Verdict de réception (répétition à blanc) - support-camera-v1

- Copie contrôlée : copie isolée `cao-dry.EEXaXN/cao`, tête `16803364` (PR #1, lot 1e), détachée.
- Remise fictive : le cas tel quel ; aucun worker, aucune fiche de remise, aucune branche d'unité.
- Interdits respectés : pas de GUI FreeCAD, pas de `--execute`, aucune écriture dans la copie, pas de `fm-send`.
  Aucun processus FreeCAD ne tournait avant le contrôle ; la relecture des digests par `freecadcmd` en console est classée non lourde (skill exécution native, point 1).

## Verdict : RENVOYER (refus sans requalification)

Le contrôleur est vert, mais la revue trouve des écarts qui figurent dans la liste fermée des refus de l'étape 4.
Aucun point ne relève d'une décision du capitaine ; tout est corrigeable par un worker dans son périmètre.

## Étape 1 et 2 - fiche et périmètre

- Fiche de remise : **absente**. Aucun `outputs/remise.json` (chemin par défaut du contrat), aucun `cases/support-camera-v1/`.
  Refus 4.a par construction : « fiche absente ». Sans fiche, impossible de vérifier l'ancêtre du commit, les commandes avec code et durée, la version FreeCAD déclarée, l'identité des captures, les décisions consommées, le budget et les points ouverts.
- Périmètre : les cinq commits de la PR (`2ee5d13..16803364`) ne touchent que `method/README.md`, `method/methode-cao-operationnelle-v1.md`, `method/proof-contract-v2.md`, `method/templates/recherche-options.md`. Aucun FCStd, STEP, manifeste, script ou rapport du cas n'est modifié : la règle « digest épinglé inchangé sur un modèle modifié » est sans objet, les entrées gelées et `scripts/` sont intacts, et le manifeste n'a pas d'écrivain à contrôler.

## Étape 3 - contrôleur

| Commande | Code | Durée | Résultat |
|---|---|---|---|
| `python3 method/check_method.py delivery` | 0 | 4,6 s | `ok: true` sur les cinq manifestes, 0 erreur, 0 avertissement ; `freecadcmd` trouvé via `/Applications/FreeCAD.app`, digests relus (pas de `geometry_digest_skipped`) |
| `python3 method/check_method.py summary method/cases/support-camera-v1/manifest.json` | 0 | < 1 s | `verdict: conforme`, `numeric_verdict: controles_reussis`, 0 erreur, 0 avertissement |
| `git status` après contrôle | - | - | copie propre (0 ligne) |

Lecture de `summary` :

- `maturity.claimed: []`, `maturity.observed: cao_numerique_verifiee`, `prototype_ready: false`, `native_proofs: [PROOF-NATIVE-DELIVERY-CHECK]`.
  Revendication vide : pas d'écart revendiqué/observé.
- `maturity.definition: definition_encore_incomplete`, `perimeter: null`, `open_items: [definition_scope]` : aucun `definition_scope` adopté, conforme au contrat pour un ancien cas.
- Points ouverts affichés : `PROOF-ESSAIS-PHYSIQUES` non vérifiée, `CTRL-DIMENSIONNEMENT` et `CTRL-FABRICATION` partiels, `CTRL-ESSAIS` non vérifié. Ils correspondent aux trois `limits[]` du manifeste (preuve GUI = animation Simulation, pas de glisser-déposer ; aucun matériau ni charge mesurés ; essais physiques à faire). Cohérent.
- Version FreeCAD des preuves : 1.1.4 (`4fd3bf320`) dans `outputs/freecad_status.json` et dans l'observation GUI, soit la version attendue.
- `PROOF-GUI-MANIPULATION` : `execution: fresh_gui_run`, observée le 2026-11-02, empreinte du FCStd identique avant/après (`b3dca8d2…`), fermeture des trois pivots dans la tolérance.

## Étape 4 - parcours des refus

| Refus | Constat | État |
|---|---|---|
| Fiche absente, commande sans code ni durée | Aucune fiche | **Refus** |
| `delivery` différent de 0 | Code 0, aucun `*_mismatch` | OK |
| `delivery --execute` lancé hors S5 | Non lancé ; `outputs/native_delivery_check.json` est celui de la branche, non régénéré | OK |
| `maturity.observed` sous un niveau revendiqué | `claimed` vide | OK |
| `definition` et `open_items` vs `limits[]` et `open_points` | Cohérents avec `limits[]` ; `open_points` non vérifiables sans fiche | OK sous réserve |
| `architecture_decision_not_validated`, `decision_record_malformed` | Aucune erreur ; le cas n'a pas de `decision_record` mais figure nommément dans `DECISION_EXEMPT_CASES` du contrôleur (contrat, « Porte amont ») | OK, exemption nommée |
| FCStd/STEP modifié à digest égal, `.FCBak` présent | Aucun modèle modifié dans la PR. Un `.FCBak` existe dans le dépôt (`cases/electronique/cad/station_electronique_v1.20261012-153218.FCBak`), hors de ce cas | OK pour ce cas, voir observations |
| Capture listée ou hashée absente, ou sans identité | Les cinq PNG de `outputs/captures/` sont dans la branche, mais aucun n'est listé ni hashé dans le manifeste, et sans fiche aucun n'a d'identité (document, digest, vue, état, date). Le rapport `outputs/freecad_gui_manipulation.json` cite `freecad_gui_manipulation.png` sans sha256 | **Refus** |
| Chemin personnel absolu dans un rapport, le manifeste ou la fiche | Présent dans trois rapports du cas : `outputs/freecad_gui_manipulation.json` (clés `fcstd` et `screenshot`, chemin `/Users/.../.treehouse/...`), `outputs/reproduction_old_model_collisions.json` (clé `source_file`), `method/cases/support-camera-v1/gui_activation_probe_summary.json` (clé `source_report`, `/Users/.../firstmate/data/...`). Les trois fichiers sont hashés par des preuves du manifeste (`PROOF-GUI-MANIPULATION`, `PROOF-ANCIEN-DEFAUT-COLLISION`, `PROOF-GUI-ANCIEN-DEFAUT`). Le manifeste lui-même n'en contient pas (`/Applications/FreeCAD.app` n'est pas un chemin personnel) | **Refus** |
| Entrée gelée, autre cas, `scripts/`, manifeste hors écrivains | Rien de modifié | OK |
| Budget dépassé sans arrêt ni remontée | Non vérifiable sans fiche (budget par défaut : 3 itérations, 6 exécutions lourdes) | Non établi |

## Étape 5 - lecture des captures (§15)

Cinq PNG lus directement par le second maître :

- `freecad_nominal_assembly.png` : ensemble en isométrique, trois repères de pivots visibles, pince ancrée (cadenas). Vue d'ensemble acceptable mais sans repérage des pièces.
- `freecad_verified_max_reach.png` et `freecad_verified_limit_folded.png` : deux poses extrêmes, bras bleu sur gabarits translucides (bureau, enveloppe caméra). Lisibles pour l'enveloppe de mouvement.
- `freecad_joint_stack_detail.png` : malgré son nom, c'est la même vue d'ensemble que la pose nominale, sans zoom, coupe ni éclaté sur l'empilement du pivot. Les détails de guidage et de retenue ne sont pas inspectables, ce que §15 exige.
- `freecad_gui_manipulation.png` : vue orthographique de dessus, très petite (7,8 ko), avec un bloc isolé à droite de la caméra sans explication. Elle ne rend rien d'inspectable et ne porte aucune identité.

Aucune de ces vues ne prouve le fonctionnement ; c'est attendu. L'écart réel est l'absence de vue de détail sur les interfaces et retenues.

## Points à renvoyer au worker (ordre proposé)

1. Produire la fiche de remise au chemin fixé par le brief, avec commandes (code, durée), version FreeCAD, `invalidated_proofs`, budget et `open_points`.
2. Régénérer `outputs/freecad_gui_manipulation.json` sans chemin personnel (chemins relatifs au dépôt) et re-pointer `PROOF-GUI-MANIPULATION` ; une exécution GUI lourde, à autoriser une seule fois (108 s mesurées pour `check_all.sh`, 6 s par capture).
3. Corriger `source_file` de `outputs/reproduction_old_model_collisions.json` et `source_report` de `gui_activation_probe_summary.json` en références relatives ou en identifiants, puis re-pointer `PROOF-ANCIEN-DEFAUT-COLLISION` et `PROOF-GUI-ANCIEN-DEFAUT` (le worker propriétaire de ces rapports, pas un autre).
4. Déclarer l'identité des cinq captures dans la fiche (document, digest, vue, état, date) et hasher dans la preuve GUI la capture qu'elle cite.
5. Fournir une vraie vue de détail du pivot (coupe ou éclaté) sous le nom `freecad_joint_stack_detail.png`, ou renommer la vue actuelle.

## Rien à remonter au capitaine pour cette remise

- Aucune décision 1 à 6 du §1 n'est engagée : aucun point critique n'est non établi faute de preuve, le budget n'est pas consommé, l'option n'est pas remise en cause.
- Information à batcher dans un prochain message, sans décision attendue : le cas reste exempté de la porte amont et sans `definition_scope`, donc jamais `prototype_fabricable` tant qu'un `definition_scope` n'est pas adopté.

## Observations hors périmètre, à filer sans bloquer

- `cases/electronique/cad/station_electronique_v1.20261012-153218.FCBak` est versionné ; une remise du cas électronique buterait sur la règle `.FCBak`.
- `cases/table-ciseaux/outputs/captures/*.json` et `docs/diagnostic-correction-assemblage.md` contiennent aussi des chemins personnels absolus.
- `outputs/freecad_build_gui_status.json` et `outputs/geometry_check.json` ne sont cités par aucune preuve du manifeste.
