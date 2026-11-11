# Live checks at efc55a2 (claude -p second mate, disposable clone of agent-conception-cao main @7d74a39)

Only change since 3109707: the maturity line of cao-reception step 3 (narrowed to definitions that limits[] declares open; generic definition_scope and other limits excluded).
rec-prompt.txt = the same prompt as round test-3109707 with the committed skill; diff is that line only.

## Controller (mechanical.txt)
summary rc=0 in both copies, same maturity (open_items ["definition_scope"]); reception rc=1 in both, same codes (main has moved past the S5 fiche base).
The controller does not see the removed open_points entry; only the step 3 review can.

## Original, correct S5 fiche (false-refusal check)
Refusal for a definition mismatch: 0/5 (rec-orig-sonnet-a..d, rec-orig-default).
All five call definition_scope generic and the other limits not open definitions. Sonnet-c refuses for other reasons (manifest hash, budget), not the definition review.

## Mutated fiche (open_points without the open-definition entry, lab commit 0ade749)
Gap flagged and handoff refused: 4/4 (rec-mut-sonnet-a..c, rec-mut-default).

## TechDraw brief (cao-worker-brief unchanged since 3109707; td-sonnet-a..c)
TechDraw guide controls (--check, --check-svg, layout_defects) copied: 0/3. Delivery commands copied: 0/3 (pointer to worker.md §8).
max_techdraw_runs_per_page_set named 3/3; authorisation + max delay 3/3.
paused … until as an instruction: 0/3 (td-sonnet-c only points to worker.md §5 for it).
