# Live checks at 3109707 (claude -p second mate, disposable clone of agent-conception-cao main @7d74a39)

## Controller (mechanical.txt, rec-orig-*.out, rec-mut-*.out)
delivery rc=0 and summary rc=0 in both copies; summary and reception outputs are identical with and without the open-definition point in the fiche (mutation.txt). Only the step 3 review can catch the gap.
reception rc=1 on main, which has moved past the S5 fiche base (out of scope, not repointed): the same in both copies.
Skill pointers: 43/43 method paths cited by the six skills exist on main (skill-pointers.txt).

## TechDraw brief, current cao-worker-brief (td-sonnet-a..f, td-default)
TechDraw guide controls (--check, --check-svg, layout_defects) copied: 0/7.
paused … until (worker.md §5) copied: 0/7. Spec kept in the output folder (guide rule) copied: 0/7.
max_techdraw_runs_per_page_set named: 7/7. Second mate authorisation + max delay given: 7/7.
Delivery commands not copied (pointer to worker.md §8 / contract): 7/7.
Residual one-line paraphrases of worker.md §3-§5 (FCStd read-only, git diff --exit-code, freecad lease, helper -> blocked): 5/7, outside the decided items.

## Reception review, mutated fiche (open_points without the open-definition point)
current skill: rec-mut-sonnet-a..c 3/3 + rec-mut-default 1/1 flag it and refuse.

## Reception review, original legitimate fiche (false-positive check)
current skill: refuses for a definition mismatch in 5/6 Sonnet runs (rec-orig-sonnet-a,b,c,d,f; e no).
They count the generic controller item definition_scope (manifest without definition_scope, allowed by method/contrat/maturite.md) and ordinary limits (estimated envelopes, collage, verrou, pare-brise) as open definitions missing from open_points.
pre-change skill 1ca5f9c4: 1/3 (rec-orig-base-sonnet-a..c). Round-1 wording f1b4f78c: 1-2/3 (rec-orig-r1-sonnet-a..c).

## Candidate wording (reception-cand.md)
original fiche: 0/4 definition-mismatch refusals (reccand-orig-sonnet-a..d).
mutated fiche: 3/3 still flagged and refused (reccand-mut-sonnet-a..c).
