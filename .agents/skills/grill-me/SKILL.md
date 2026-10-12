---
name: grill-me
description: >-
  Load when the user explicitly asks for grill-me, grilling, or in-depth requirements framing (cadrage approfondi), or when a request leaves material uncertainty about the desired outcome or scope.
  Owns the optional interactive framing conversation before development; unclear requests receive an offer, not an automatic interview.
user-invocable: false
metadata:
  internal: true
---

# Interactive requirements framing

This is a firstmate conversation procedure, not a worker interview or a new development authority.

## Enter only when wanted

An explicit request for grill-me, grilling, or in-depth framing starts the conversation without a second permission question.
For an unclear request, briefly name the uncertainty and offer to explore it together; wait for acceptance before starting the interview.
A small, already well-defined request follows the existing intake path without this extra phase.
A missing project referent still uses the project-resolution rule in [AGENTS.md](../../../AGENTS.md#intake-and-authority), not an interview across speculative projects.

## Ask, listen, then adapt

Start from the user's words and any established evidence, not an invented solution or implementation plan.
Ask one focused question at a time, or a small related group whose answers do not depend on each other.
Choose the next question for what it can clarify about the deliverable, not to fill a questionnaire or reach a question count.
Wait for the answer before asking its dependent follow-ups.

Explore the desired result and who will use it in what situation, then follow the answers into relevant constraints, tradeoffs, failure cases, and boundaries.
Probe implicit needs with concrete examples: what happens today, what should become possible, and what would make the result unacceptable?
Cover only cases that could materially change what is wanted; do not exhaust a speculative design tree.
When options help, explain their concrete consequences and distinguish a recommendation from a choice the user actually made.
Use neutral questions rather than wording every question so that "yes" accepts a preferred answer.
If an answer contradicts an earlier assumption, explicitly revise the understanding and revisit only the affected questions.
Do not repeat settled questions unless new evidence changes their premise.

Separate facts from choices.
Use available evidence for facts; where authorized project investigation is needed, delegate bounded fact-finding through the existing intake path instead of making the user research the repository or tools.
Workers return facts and options to firstmate; firstmate alone carries the user-facing exchange.
While a fact is unknown, ask only questions that do not depend on it and label any provisional assumption.
Ask the user about lived context or preferences that cannot be established from authorized evidence.
Do not commission a parallel design exercise when existing evidence already answers the question.

## Finish or lighten without inventing consent

There is no fixed number of rounds.
Finish when the remaining uncertainty no longer changes the requested result or when the user asks to stop; shorten the exchange immediately when asked to keep it lighter.
Give a concise synthesis in the conversation: desired result, expressed choices, scope and exclusions, important constraints, observable success, and consequential unknowns.
Separate what the user said from established facts, recommendations, and unconfirmed assumptions.
Do not silently add acceptance criteria or attribute an unspoken choice to the user.
Ask a targeted correction only where it matters; do not require a written specification or ceremonial summary approval before this procedure can be used.
If the user stops with a material choice still open, state what remains undecided and what cannot proceed on that basis.

Preserve the user's words and expressed decisions through the existing task-intent and knowledge owners in [AGENTS.md](../../../AGENTS.md#7-task-lifecycle), not through a new interview registry or a task per micro-question.
A genuine unresolved user decision follows [captain-hold-lifecycle](../captain-hold-lifecycle/SKILL.md); ordinary conversational questions are not separate decision tasks.
Return to normal intake for the next action: shared understanding or an interview answer alone does not authorize development, destructive or security-sensitive actions, or a merge.
Existing decision authority, evidence requirements, validation, and merge approval remain unchanged.
