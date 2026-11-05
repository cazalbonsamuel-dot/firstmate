# Verdict de réception - répétition à blanc, lot 1f (PR #1, tête `e69eea5`)

Date : 2026-11-05. Rôle : second maître d'un home CAO. Skills chargés : `cao-reception`, `cao-livraison`, `cao-freecad-execution` (classement de `delivery` comme travail non lourd).
Autorité : `method/methode-cao-operationnelle-v1.md` (§N) et `method/proof-contract-v2.md` (« contrat »), section « Remise d'un worker et acceptation par le superviseur ».

Interdits respectés : aucune GUI FreeCAD, aucun `--execute`, ni `check_all.sh` ni `check_delivery.sh`, aucune écriture ni commit dans les copies, pas de `fm-send`.
Commandes lancées, dans chaque copie isolée, jamais la copie principale : `python3 method/check_method.py delivery` puis `python3 method/check_method.py summary method/cases/support-camera-v1/manifest.json`, puis `git status`. `freecadcmd` résolu par `scripts/freecad_env.sh` vers `/Applications/FreeCAD.app` ; chaque `delivery` a duré 4 à 5 s (relecture des digests, pas un travail lourd, §13), aucun processus FreeCAD préexistant (`pgrep -ilx 'freecad|freecadcmd'` vide avant chaque lancement). `git status` propre après chaque commande dans les quatre copies.

Rappel de la règle des écarts admis avant S5 (contrat « Réception : seuls les écarts ouverts », reprise dans `cao-reception` étape 4) :
`delivery` doit rendre 0, ou n'afficher que des erreurs `source_artifacts_*_mismatch` et `input_hashes_*_mismatch` qui portent (a) sur une preuve de la liste des invalidations ouvertes, complétée par la fiche reçue, et (b) sur un fichier que cette invalidation cite dans `cites`. Toute autre erreur refuse la remise. La liste des invalidations ouvertes est l'union des `invalidated_proofs` des fiches intégrées sous `outputs/remises/` sur la branche du cas, moins les preuves citées dans `repointed_proofs` par la fiche intégrée de leur unité.

---

## Tâche A - cas `support-camera-v1` tel quel à `e69eea5` (copie `cao`, tête détachée, sans fiche ni worker)

### Étape 3 - contrôleur

| Commande | Code | Résultat pour `support-camera-v1` |
|---|---|---|
| `delivery` | 0 | `ok: true`, `errors: []`, `warnings: []`, cinq manifestes verts (bras-robot, electronique, support-camera-v1, surfacique, table-ciseaux) |
| `summary` | 0 | `verdict: conforme`, `numeric_verdict: controles_reussis`, `error_count: 0`, `warning_count: 0` |
| `git status` | - | propre |

Maturité : `claimed: []`, `observed: cao_numerique_verifiee`, `prototype_ready: false`, `native_proofs: [PROOF-NATIVE-DELIVERY-CHECK]`, `definition: definition_encore_incomplete`, `open_items: [definition_scope]`.
`summary` laisse ouverts `PROOF-ESSAIS-PHYSIQUES` (non_verifie), `CTRL-DIMENSIONNEMENT` (partiel), `CTRL-FABRICATION` (partiel), `CTRL-ESSAIS` (non_verifie), cohérents avec les trois `limits[]` du manifeste (preuve GUI = réouverture et animation, pas de matériau ni charge mesurés, essais physiques à réaliser).

### Lecture du manifeste

- `case_state` : « prototype CAO existant, correction GUI intégrée dans main 0796807 ; essais physiques non réalisés ». `method_version: methode-cao-operationnelle-v1`.
- `delivered_files` : `cad/support_camera_v1.FCStd` et `.step` en `hash_policy: geometry_digest` ; les STL de `cad/parts/` ne sont pas des `delivered_files`, ils n'apparaissent que dans `input_hashes` et `source_artifacts` de `PROOF-NATIVE-DELIVERY-CHECK` et dans `delivery_checks[DELIVERY-SUP-NATIVE].inputs`.
- Aucune preuve `decision_record` ; le contrôleur n'émet pas `architecture_decision_not_validated` car le cas est exempté dans `check_method.py` (`DECISION_EXEMPT_CASES`, cas antérieur à la porte T29). Pas un écart du contrôleur, mais le gel S2 n'a jamais été écrit pour ce cas.
- `outputs/remises/` n'existe pas à `e69eea5`.

### Parcours des refus de l'étape 4

| Refus | Constat à `e69eea5` | Verdict |
|---|---|---|
| fiche absente, commande sans code ni durée | aucune fiche, aucun worker : il n'y a pas de remise | vrai par construction, non imputable à un worker |
| `delivery` ≠ 0 hors écarts admis | `delivery` = 0 | non |
| fiche intégrée absente / réécrite, S5 avec liste non vide | pas de fiche intégrée, liste des invalidations ouvertes vide (aucune fiche) | non |
| `delivery --execute` par un autre worker que S5 | non lancé | non |
| `maturity.observed` sous un niveau de `claimed` | `claimed: []` | non |
| `definition` / `open_items` incohérents avec `limits[]` | cohérents | non |
| `architecture_decision_not_validated` / `decision_record_malformed` | absent (cas exempté) | non |
| FCStd/STEP régénéré à digest égal, ou `.FCBak` présent | aucun FCStd/STEP modifié ; **un `.FCBak` est versionné** : `cases/electronique/cad/station_electronique_v1.20261012-153218.FCBak` (commit antérieur à la règle `.gitignore`, autre cas) | **écart préexistant de la base**, §6 « jamais committées » |
| capture absente ou sans identité | aucune capture déclarée (pas de fiche) | non |
| chemin personnel absolu dans un rapport, le manifeste ou la fiche | **`/Users/samuelcazalbon/...` dans trois rapports hashés du cas** : `outputs/freecad_gui_manipulation.json` (champs `fcstd`, `screenshot`), `outputs/reproduction_old_model_collisions.json` (`source_file`), `method/cases/support-camera-v1/gui_activation_probe_summary.json` (`source_report`), plus `docs/diagnostic-correction-assemblage.md` ; manifeste propre | **écart préexistant de la base** (contrat « Refus », premier point) |
| entrée gelée / autre cas / helper / manifeste hors écrivains | rien n'est modifié : pas de branche de remise | non |
| budget dépassé | pas de worker | non |

### Verdict A

Il n'y a rien à réceptionner : ni fiche, ni worker, ni branche d'unité, donc ni accepter ni renvoyer. Comme état de base, la tête `e69eea5` est **contrôleur vert** (`delivery` 0, `summary` conforme, maturité observée `cao_numerique_verifiee`, aucune revendication) et constitue une base saine pour des branches d'unité.
Deux écarts préexistants de la base tombent sous les refus de l'étape 4 et sous les règles de commit de `cao-livraison` (point 4 : « aucun chemin personnel, pas de `.FCBak` ») : ils ne bloquent pas une remise d'unité qui ne les touche pas, mais ils bloqueront la PR S5 tant qu'ils ne sont pas traités par une unité dédiée (rejeu des trois rapports par leur propriétaire, avec re-pointage ; retrait du `.FCBak` d'`electronique` dans un lot séparé puisque c'est un autre cas). À noter au capitaine sans décision à lui demander : ce n'est pas une des six décisions du §1.

---

## Tâche B - deux remises d'unités avant S5, base `cas/support-camera-v1` (copie `wt-case`, tête `3a4c364`)

### État de la branche du cas (préalable aux deux remises)

- Historique : `e69eea5` → `5df93f9` (piece-pince : `pince_corps.stl` modifié, ligne `delivery_checks` re-pointée) → `3a4c364` (fiche `outputs/remises/piece-pince-2026-11-05.json`, seul fichier du commit).
- Fiche intégrée piece-pince : `commit 5df93f9`, `invalidated_proofs: [{PROOF-NATIVE-DELIVERY-CHECK, cites: [cad/parts/pince_corps.stl]}]`, `repointed_proofs: []`.
- `delivery` sur la tête : code 1, deux erreurs, toutes `PROOF-NATIVE-DELIVERY-CHECK` sur `cad/parts/pince_corps.stl` (`input_hashes_hash_mismatch`, `source_artifacts_hash_mismatch`) ; `summary` : `a_corriger`, 2 erreurs, maturité observée `non_etabli`, `native_proofs: []`.

**Liste des invalidations ouvertes sur la branche du cas** = { `PROOF-NATIVE-DELIVERY-CHECK` : cites { `cad/parts/pince_corps.stl` } }.
Les deux erreurs de la tête sont donc admises (preuve dans la liste, fichier cité) : la branche du cas est dans l'état attendu après une intégration avant S5.

Observation commune aux trois fiches (pince, plaque, bras), hors contrôleur : la modification de chaque STL est un seul octet `\n` ajouté en fin de fichier binaire (taille +1), sans changement de géométrie ; les commandes déclarées sont `cases`, `fixtures`, `self-test` (rc 0, durées présentes) et `heavy_runs: 0`. Le contrat « Worker natif avant S5 (pièce…) » exige pourtant « le contrôle natif de son cas seulement, c'est-à-dire la commande de son `delivery_checks[]` (`check_delivery.sh` du cas), code 0, son rapport joint à la remise ». Ce contrôle n'est déclaré dans aucune fiche et aucun rapport n'est joint. La consigne de l'exercice répute exécutées les commandes **déclarées** ; celle-ci ne l'est pas. Pour piece-pince l'intégration est déjà faite (fiche jamais réécrite après intégration) : le manque sera rattrapé par le S5 (`check_all.sh` puis `delivery --execute`), mais c'est à consigner.

### Remise 1 - `unit/piece-plaque` (copie `wt-plaque`, tête `413e7dd`)

Étape 1, fiche `outputs/remises/piece-plaque-2026-11-05.json` :
- `commit e90d89c` ; `git merge-base --is-ancestor e90d89c unit/piece-plaque` : vrai ; `git diff --name-only e90d89c unit/piece-plaque` : la fiche seule. Conforme.
- `delivered_files` : `cad/parts/plaque_camera_fourche.stl` sha `44f92ab6…` ; `manifest_lines_repointed` : `delivery_checks[DELIVERY-SUP-NATIVE].inputs[cad/parts/plaque_camera_fourche.stl]` ; `invalidated_proofs` : `PROOF-NATIVE-DELIVERY-CHECK` cites `[cad/parts/plaque_camera_fourche.stl]` ; `repointed_proofs: []` ; captures `[]` ; `open_points: []` ; budget 1 itération, 0 exécution lourde ; version FreeCAD 1.1.4.

Étape 2, `git diff --stat cas/support-camera-v1...unit/piece-plaque` : `cad/parts/plaque_camera_fourche.stl` (Bin 6073484 → 6073485), `method/cases/support-camera-v1/manifest.json` (1 ligne), la fiche. Périmètre d'une unité « pièce plaque » : le fichier de la plaque et sa ligne de manifeste ; rien hors périmètre (le brief n'est pas fourni dans l'exercice, le périmètre est lu d'après l'unité).

Étape 3, dans `wt-plaque` : `delivery` code 1, `summary` code 1 (`a_corriger`, 4 erreurs), `git status` propre, maturité observée `non_etabli` avec `claimed: []`.

**Liste des invalidations ouvertes complétée par la fiche reçue** = { `PROOF-NATIVE-DELIVERY-CHECK` : cites { `cad/parts/pince_corps.stl`, `cad/parts/plaque_camera_fourche.stl` } }.

| Erreur `delivery` | Preuve | Fichier | Admise ? | Règle |
|---|---|---|---|---|
| `input_hashes_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/pince_corps.stl` | oui | preuve dans la liste (fiche intégrée piece-pince), fichier cité |
| `source_artifacts_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/pince_corps.stl` | oui | idem |
| `input_hashes_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/plaque_camera_fourche.stl` | oui | preuve dans la liste complétée par la fiche reçue, fichier cité |
| `source_artifacts_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/plaque_camera_fourche.stl` | oui | idem |

Étape 4, manifeste et autres refus :
- `git diff cas/support-camera-v1 unit/piece-plaque -- manifest.json` : une seule ligne, `delivery_checks[DELIVERY-SUP-NATIVE].inputs[plaque_camera_fourche.stl].sha256` `e9f323b5…` → `44f92ab6…`, égale à l'empreinte de la fiche et au sha réel du fichier sur la branche. Écrivain 3 respecté, fichier déclaré re-pointé, aucun hash de preuve réécrit, `requirements[]` et `decision_record` intacts, aucun helper `scripts/`, aucun autre cas, aucune entrée gelée.
- Pas de FCStd/STEP modifié ; `.FCBak` et chemins `/Users/` : seulement les écarts préexistants de la base (tâche A), non introduits par la branche.
- Maturité : `claimed: []`, donc pas de refus ; `definition`/`open_items` cohérents avec `limits[]` et `open_points: []`.
- Budget : 1 / 0, pas de dépassement.

**Verdict remise 1 : renvoyer**, pour un seul point, sans requalification : la fiche ne déclare pas le contrôle natif du cas (`scripts/check_delivery.sh --json outputs/native_delivery_check.json`, 16 s mesurés dans `method/performance.md`) avec code et durée, et aucun rapport n'est joint, alors que le contrat « Worker natif avant S5 » l'exige d'un worker de pièce (livrable STL). Sur tout le reste, la remise est propre : étapes 1, 2 et 4 sans écart, les quatre erreurs de `delivery` sont toutes admises par la liste des invalidations ouvertes. Dès que la fiche porte ce contrôle à 0 (une exécution lourde autorisée par le second maître, un seul travail lourd à la fois), accepter et intégrer en premier (ordre fixé ci-dessous).

### Remise 2 - `unit/piece-bras` (copie `wt-bras`, tête `c19c6de`)

Étape 1, fiche `outputs/remises/piece-bras-2026-11-05.json` :
- `commit 58ac585` ; ancêtre de `unit/piece-bras` : vrai ; commits suivants : la fiche seule. Conforme.
- `delivered_files` : `cad/parts/plaque_camera_fourche.stl` sha `44f92ab6…` **et** `cad/parts/bras_superieur_lame.stl` sha `92b231dd…` ; `manifest_lines_repointed` : les deux lignes `delivery_checks[DELIVERY-SUP-NATIVE].inputs[…]` ; `invalidated_proofs` : `PROOF-NATIVE-DELIVERY-CHECK` cites **`[cad/parts/plaque_camera_fourche.stl]` seulement** ; `repointed_proofs: []` ; captures `[]` ; `open_points: []` ; budget 1 / 0.

Étape 2, `git diff --stat cas/support-camera-v1...unit/piece-bras` : `bras_superieur_lame.stl` (Bin 91484 → 91485), `plaque_camera_fourche.stl` (Bin 6073484 → 6073485), `manifest.json` (2 lignes), la fiche.
Écart de périmètre : une unité « pièce bras » livre la plaque, pièce d'une autre unité (`unit/piece-plaque` livre le même fichier, au même sha `44f92ab6…`). §13 « un FCStd par pièce », ressources partagées : un fichier a un seul propriétaire. Le brief n'étant pas fourni, c'est à confirmer contre lui, mais le nom de l'unité et l'existence de l'unité plaque en font un hors-périmètre probable.

Étape 3, dans `wt-bras` : `delivery` code 1, `summary` code 1 (`a_corriger`, 6 erreurs), `git status` propre, maturité observée `non_etabli`, `claimed: []`.

**Liste des invalidations ouvertes complétée par la fiche reçue** = { `PROOF-NATIVE-DELIVERY-CHECK` : cites { `cad/parts/pince_corps.stl`, `cad/parts/plaque_camera_fourche.stl` } }. `bras_superieur_lame.stl` n'y figure pas : la fiche l'a re-pointé sans le citer dans `invalidated_proofs`.

| Erreur `delivery` | Preuve | Fichier | Admise ? | Règle |
|---|---|---|---|---|
| `input_hashes_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/pince_corps.stl` | oui | liste ouverte (fiche piece-pince), fichier cité |
| `source_artifacts_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/pince_corps.stl` | oui | idem |
| `input_hashes_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/plaque_camera_fourche.stl` | oui | liste complétée par la fiche reçue, fichier cité |
| `source_artifacts_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/plaque_camera_fourche.stl` | oui | idem |
| `input_hashes_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/bras_superieur_lame.stl` | **non** | la preuve est dans la liste mais le fichier n'est cité par aucune invalidation (`cites`) : « Toute autre erreur refuse la remise » |
| `source_artifacts_hash_mismatch` | PROOF-NATIVE-DELIVERY-CHECK | `cad/parts/bras_superieur_lame.stl` | **non** | idem |

Étape 4, manifeste et autres refus :
- `git diff cas/support-camera-v1 unit/piece-bras -- manifest.json` : deux lignes, `inputs[bras_superieur_lame.stl]` `df1fc1c1…` → `92b231dd…` et `inputs[plaque_camera_fourche.stl]` `e9f323b5…` → `44f92ab6…`, toutes deux égales aux empreintes de la fiche et aux sha réels. Lignes limitées aux fichiers déclarés, aucun hash de preuve réécrit, entrées gelées intactes : conforme à l'écrivain 3, sous réserve du périmètre ci-dessus.
- Pas de FCStd/STEP modifié ; `.FCBak` et `/Users/` : écarts préexistants de la base seulement.
- Maturité `claimed: []` ; budget 1 / 0.
- Même manque que la remise 1 : contrôle natif du cas non déclaré, rapport absent.

**Verdict remise 2 : renvoyer**, points exacts :
1. `delivery` : deux erreurs non admises sur `cad/parts/bras_superieur_lame.stl` ; la fiche doit citer ce fichier dans `invalidated_proofs[PROOF-NATIVE-DELIVERY-CHECK].cites` puisqu'elle l'a re-pointé (contrat : le worker « déclare aussi dans sa fiche les preuves qu'il invalide, c'est-à-dire celles dont `source_artifacts` ou `input_hashes` citent un fichier qu'il a re-pointé »).
2. Périmètre : `cad/parts/plaque_camera_fourche.stl` appartient à l'unité plaque ; retirer ce fichier de la branche, de `delivered_files` et de `manifest_lines_repointed`. Ordre d'intégration fixé par le second maître : piece-plaque d'abord ; piece-bras rebase ensuite sur la branche du cas à jour, où la plaque sera déjà au sha `44f92ab6…`, ce qui fait disparaître ce fichier de son diff.
3. Contrôle natif du cas absent de la fiche (même point que la remise 1).
La fiche peut être réécrite avant intégration (la règle « jamais réécrite » ne s'applique qu'après intégration).

Aucune remontée au capitaine pour B : aucun point critique non établi, aucun budget consommé, aucune remise en cause de l'option choisie.

---

## Tâche C - `cao-livraison` : la tête de `cas/support-camera-v1` (`3a4c364`, copie `wt-case`) peut-elle entrer en S5 maintenant ?

**Non.**

Règle (`cao-livraison` « Quand charger » et point 2 ; contrat « Liste des invalidations ouvertes » et « Refus » ; §13 S5) : S5 n'est ouvert que si l'assemblage S4 est accepté, toutes les remises de pièces sont intégrées une à une sur la branche du cas, et **la liste des invalidations ouvertes y est vide**, chaque preuve des `invalidated_proofs` des fiches de `outputs/remises/` étant citée dans `repointed_proofs` par la fiche intégrée de son unité de preuve ; « un S5 lancé avec une liste des invalidations ouvertes non vide » est un refus, et `delivery` doit alors rendre 0 « sans aucun écart ».

Preuves, sans commande lourde (lecture de fichiers, `git`, et le `delivery` de 5 s déjà lancé pour B) :
1. `outputs/remises/` sur la tête contient une seule fiche, `piece-pince-2026-11-05.json`, avec `invalidated_proofs: [{PROOF-NATIVE-DELIVERY-CHECK, cites: [cad/parts/pince_corps.stl]}]` et `repointed_proofs: []`. Liste des invalidations ouvertes = { `PROOF-NATIVE-DELIVERY-CHECK` }, non vide : personne n'a régénéré ni re-pointé `outputs/native_delivery_check.json` (son `sha256` et ses `input_hashes` dans le manifeste sont encore ceux de `e69eea5`).
2. `delivery` sur cette tête rend 1 avec deux écarts (`input_hashes_hash_mismatch`, `source_artifacts_hash_mismatch` sur `pince_corps.stl`) ; `summary` : `a_corriger`, maturité observée `non_etabli`, `native_proofs: []`. S5 exige 0 sans écart.
3. Les remises piece-plaque et piece-bras ne sont pas intégrées (renvoyées en B) ; les pièces ne sont donc pas toutes sur la branche du cas.
4. Aucune fiche S4 sous `outputs/remises/` : l'assemblage n'a pas été reçu par `cao-reception` sous cette méthode ; les preuves d'assemblage présentes datent du cas historique et citent `pince_corps.stl` au sha périmé.
5. Pour la PR S5 elle-même (`cao-livraison` point 4) : chemins personnels `/Users/...` dans trois rapports hashés et un `.FCBak` versionné dans `cases/electronique/` (tâche A) ; le re-pointage final S5 ne peut pas franchir ces règles sans qu'une unité les ait traités.

Chemin vers S5, dans l'ordre : accepter puis intégrer piece-plaque, puis piece-bras (après correction de leurs fiches) ; une unité « contrôle natif par preuve » (§13) rejoue `scripts/check_delivery.sh` sur le FCStd d'assemblage gelé, re-pointe `PROOF-NATIVE-DELIVERY-CHECK` et cite la preuve dans `repointed_proofs` de sa fiche ; régénération propre des trois rapports à chemins personnels par leur propriétaire ; lot séparé pour le `.FCBak` d'`electronique`. Alors seulement, liste vide, `delivery` à 0 côté second maître, et le brief S5 (`cao-worker-brief`) peut partir.

---

## Résumé

- **A** : rien à réceptionner (pas de fiche ni de worker) ; base `e69eea5` contrôleur vert (`delivery` 0, `summary` conforme, maturité observée `cao_numerique_verifiee`, rien de revendiqué) ; deux écarts préexistants de la base à traiter avant toute PR S5 : chemins `/Users/` dans trois rapports hashés, `.FCBak` versionné dans `cases/electronique/`.
- **B** : liste ouverte sur la branche du cas = { PROOF-NATIVE-DELIVERY-CHECK : pince_corps.stl } ; plaque : 4 erreurs toutes admises, manifeste conforme, **renvoyer** pour le seul contrôle natif du cas absent de la fiche ; bras : 4 erreurs admises et **2 non admises** (`bras_superieur_lame.stl` re-pointé sans être cité), plaque livrée hors périmètre, contrôle natif absent, **renvoyer** ; intégrer plaque avant bras.
- **C** : **non**, pas de S5 : liste des invalidations ouvertes non vide (PROOF-NATIVE-DELIVERY-CHECK jamais re-pointée), `delivery` à 1 sur la tête, pièces non toutes intégrées, aucune remise S4, et les règles de commit de la PR (chemins personnels, `.FCBak`) non satisfaites.
