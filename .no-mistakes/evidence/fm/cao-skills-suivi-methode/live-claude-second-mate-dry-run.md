**Dry run, answered in text only. Nothing was run or edited.**

## Task A: CAO content of `## Firstmate spec` for case `inclinometre-jimny-boitier`

Common to both units, the brief cites `method/worker.md` and does not copy it. It also gives:
- the unit's §13 row;
- the base, as one commit of the case branch, with no hash list (use `--base-branch` if the frozen files live only on the case branch);
- the owned files, with a single owner per FCStd and per output folder;
- the budget from `method/iteration_budget.json`;
- the fiche path `cases/inclinometre-jimny-boitier/outputs/remises/<unité>-<date>.json`, numbered `-2` or `-3` for a later handoff the same day;
- a worker runtime outside the sandbox, if the unit is native.

### (1) Research scout "Recherche d'une famille de solutions"
- **Type:** scout, not a ship. One worker per family, 2 to 4 families. It is independent of the other families and is not heavy.
- **Frozen inputs:** the need, the mandatory requirements and the unknowns (template §1).
- **Deliverable:** section 2 of the template annexes, filled in, with dated sources.
- **Sections read:** §2 gate steps 1-2, and the template annexes §2.
- **Handoff commands:** none. The brief asks the scout to run no handoff command, because `method/worker.md` §8 and the contract ("Commandes du worker") ask none of a scout.
- **TechDraw controls:** not applicable.
- **Heavy runs:** none, since the unit is not heavy. The brief still points to `method/worker.md` §5 for waiting, in case a run is ever added.
- **Reception:** I read the deliverable against the §13 row. There is no manifest and no controller.

### (2) "Plans normatifs TechDraw" (one page set per part, heavy but short)
- **Type:** ship.
- **Frozen inputs:** the frozen FCStd (with its digest), the frozen `params.json`, and a page specification validated by `--check`. The brief states the sync point: S3, with the FCStd frozen and hashed.
- **Deliverable:** an SVG and a PDF per page, `techdraw_report.json` in `verifie`, and the pages reread as images. No FCStd is modified.
- **Reading:** §5 "Fabrication", `method/guides/techdraw.md`, and `method/guides/freecad.md`.
- **Case-specific points:** the part, the page specification, and the section origin. The guide records that for this case's housing the section origin at x = 0 cost three passes. `--check` gives the centred origin.
- **Handoff commands (native unit before S5):**
  - The native check of the case, meaning the command in its `delivery_checks[]` (`check_delivery.sh` of the case), exit code 0, with its report attached.
  - If the case has no native check yet (before S4), the brief names the native check of the part.
  - Never `delivery --execute`.
  - `self-test` and `fixtures` only if the batch touches the controller, the fixtures or the digest helpers.
  - Code and duration of each command go in the fiche.
- **TechDraw controls and budget:**
  - The brief names `max_techdraw_runs_per_page_set`, currently 2. That means one pass, then one rework after the check and the image reread. A third run needs a written `depassement`.
  - These runs also count in `heavy_runs`.
  - Controls are those of `guides/techdraw.md`: `python3 scripts/techdraw_pages.py --check pages.json` before each run, and `--check-svg <page>.svg…` plus the report's `layout_defects` after it.
  - A pass that has layout defects is redone before any image reread.
  - The image reread of the delivered pass is mandatory.
  - The layout checks carry no proof value.
- **Waiting for heavy runs:** each run waits for my authorization, with its maximum delay (`cao-freecad-execution`).
  - The worker uses only the project launchers (`scripts/run_freecad_capture.sh --script`) and never calls `freecadcmd` directly.
  - If the lease is not obtained, the launcher returns 75: the worker waits and retries without forcing.
  - Before waiting, the worker declares `paused … until <start + delay>`.
  - On timeout or crash the worker stops, keeps the logs, and retries at most once after diagnosis. A second identical failure is reported as `blocked`.

## Task B: what I still do myself, in the skill's order

`reception` returning 0 covers only the mechanical refusals. The skill also has me run `delivery` and `summary` in the worker's copy or a clean isolated one, never `--execute`, then check `git status`. Those are commands rather than review items, but they come first. Then the human review:

1. **Captures** reread against the views the brief required (`method/guides/captures.md`). A view does not prove that the part works. If my runtime cannot read images safely, a review worker distinct from the designer does it.
2. **Maturity:** compare `maturity.definition` and `maturity.open_items` from `summary` with the definitions declared open in `limits[]` and in the fiche's `open_points`. Without `freecadcmd`, maturity stays `non_etabli`, and I check coherence without accepting any maturity.
3. **TechDraw plans:** not applicable to the native part unit, so nothing to do there unless the unit had plans.
4. **Integration order** as I fixed it, **MCP provenance**, and **files touched** compared with the brief's scope.

If any of these shows a gap, I refuse without requalifying and send the exact point back through `fm-send`. If it is clean, I accept. Then I tell the worker when to integrate, one unit at a time, and rerun the checks on the case branch head before the next unit. I never reopen FreeCAD GUI, rerun `--execute`, fix the handoff myself, or lower a criterion.

## Files read (paths only)

- `/Users/samuelcazalbon/.no-mistakes/worktrees/4ae80ba588f5/01M7508ANJDPQARZW08APKNMVE/.claude/skills/cao-worker-brief/SKILL.md` (loaded via Skill)
- `/Users/samuelcazalbon/.no-mistakes/worktrees/4ae80ba588f5/01M7508ANJDPQARZW08APKNMVE/.claude/skills/cao-reception/SKILL.md` (loaded via Skill)
- `/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-method.gi4U6G/repo/method/worker.md`
- `/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-method.gi4U6G/repo/method/proof-contract-v2.md` (lines 70-99)
- `/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-method.gi4U6G/repo/method/guides/techdraw.md`
- `/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-method.gi4U6G/repo/method/methode-cao-operationnelle-v1.md` (lines 398-427)
- `/var/folders/16/2rlxmpgs2sxg_bhtjgvd9vp80000gn/T/cao-method.gi4U6G/repo/method/contrat/reception.md`
- Grep hits also touched `method/README.md` and `method/iteration_budget.json`, but I did not read them in full.
