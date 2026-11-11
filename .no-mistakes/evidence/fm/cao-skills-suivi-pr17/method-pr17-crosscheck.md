# Cross-check of the CAO skill changes against the method repo (PR 17, merged 2026-11-11, 4ab31f41)

Read-only fetch via gh api of the method default branch. Not a live product run.

- method/versions-reference.json: exists (453 B).
- method/contrat/preuves-critiques.md: heading "## Champs attendus sur `delivery_checks`" (l.36); l.58 "Un contrôle natif déclare dans ses `inputs` ... les helpers communs qu'il traverse : lanceurs ..., bail ..., environnement ...".
- method/proof-contract-v2.md l.87-90: "Écrivains du manifeste de cas", writer 2 = worker de gel; re-points `sha256` in each `delivery_checks[].inputs` citing a modified frozen input, nothing else of the check, owners' proofs declared in `invalidated_proofs`.
- method/proof-contract-v2.md l.81: `--case` compares FreeCAD/macOS to the reference and refuses (`delivery_case_versions_refused`), full perimeter required; duration referenced to method/performance.md "Versions locales observées".
- method/check_method.py l.1306: emits `delivery_case_versions_refused` "plein périmètre obligatoire"; l.1348 RECEPTION_ROLES = (worker, gel, s5); l.1455 frozen inputs admitted only for role gel.
- method/performance.md l.5: "## Versions locales observées".
- cao-livraison step 4 restored to "aucun autre cas, helper, lanceur ou fichier de méthode modifié (§7)." per review decision; step 2 names method/versions-reference.json explicitly and routes the version update to a separate method lot.
- Em dash count in the diff: 0.
