---
name: agent-skill-trigger-index
description: Load only when auditing or maintaining the complete agent-only skill trigger index.
user-invocable: false
metadata:
  internal: true
---

# Agent-only reference skills

These skills are not captain-invocable; load them only at their precise triggers.

- `operational-home-layout` - load when locating, interpreting, or changing Firstmate home, config, data, state, project, or generated runtime paths.
- `session-start-recovery` - load when the session-start digest reports unfinished checks, actionable diagnostics, recovery inputs, or output requiring interpretation.
- `bootstrap-diagnostics` - load whenever the session-start digest's bootstrap or network-checks section prints an actionable diagnostic line (`MISSING:`, `MISSING_MANUAL:`, `OUTDATED:`, `PRESENTATION_UNAVAILABLE:`, `BACKEND_INVALID:`, `NEEDS_GH_AUTH`, `TANGLE:`, `STARTUP_MEMORY_BUDGET:`, `CREW_DISPATCH: invalid`, `FLEET_SYNC:`, `NETWORK_CHECKS:`, `HOME_SUMMARY:`, `BACKLOG_RECONCILE:`, `SECONDMATE_SYNC:`, `SECONDMATE_LIVENESS:`, `SECONDMATE_HANDOFF:`, `NUDGE_SECONDMATES:`, or `FMX:`), or when `BOOTSTRAP_INFO:` says an interrupted backlog cleanup may have left an endpoint or local copy; silence and other `BOOTSTRAP_INFO:` facts need no load.
- `grill-me` - load on an explicit grill-me or in-depth requirements-framing request, or material uncertainty about the desired outcome or scope.
- `diagnostic-reasoning` - load before scoping a reported bug and before acting on a diagnostic report.
- `ask-user-authority` - load before deciding any ask-user finding.
- `validation-supervision` - load when a ship starts or already has an active no-mistakes validation run, including a mid-run requirement change or finding, and before deciding or answering any ask-user finding.
- `ship-landing` - load when a ship reports a PR or ready branch, when deciding or monitoring landing, and before task cleanup.
- `scout-completion` - load when a scout reports completion, presents a visual artifact for iteration, or is being considered for promotion to implementation.
- `quota-array-dispatch` - load before choosing among a matched crew-dispatch profile array from current quota-axi default TOON.
- `harness-adapters` - load before spawning or recovering a crewmate or secondmate, handling a trust dialog, sending a harness-specific skill invocation, interrupting or exiting an agent, resuming an exited agent, or verifying a new harness adapter.
- `firstmate-orca` - load before switching to Orca, spawning or supervising Orca-backed work, smoke-testing Orca backend behavior, debugging Orca task state, or reconciling Orca-backed task metadata.
- `project-management` - load before adding, creating, removing, or initializing a project.
  Cloning or registering a project is add intake and uses the same trigger.
- `stuck-crewmate-recovery` - load when the session-start digest reports an ordinary direct report's endpoint dead or its metadata has no window, after a stale wake, looping pane, repeated confusion, an answered-by-brief question, an unresponsive crewmate, or a failed steer, and whenever a live worker reports its no-mistakes pipeline dead, unreachable, or timed out.
- `secondmate-provisioning` - load before creating, seeding, validating, launching, handing backlog to, recovering, pushing inherited local material into, or retiring a secondmate home, and before editing `data/secondmates.md`.
- `captain-hold-lifecycle` - load before treating an investigation or visual review as complete, before ending a visual review that exposed a captain decision, when recording or routing the captain's answer, and on any `RECORD DIVERGENCE` line from the wake drain.
- `away-quiet-supervision` - load whenever /afk or /quiet is invoked, an away or quiet record exists, or a marked away-supervisor message arrives.
- `process-event-sources` - load before arming a long-polling source, before registering a deterministic condition->action watch (do X as soon as Y is true), on any `procevent <adapter> <source-id> <sequence>` check wake, and on any `process-event source stranded` or `process-event source failed to start` check wake.
  Never run a registered source's blocking command yourself in a conversational turn.
- `fmx-respond` - load on an `x-mention <request_id>` `check:` wake to handle the mention, on an `x-mode-error ...` `check:` wake to report the Relay configuration blocker, on a `public-followup ...` `check:` wake or a startup-surfaced public commitment, and on any milestone or terminal wake for a Relay-linked task before posting its completion follow-up; relevant only when Relay is on.
- `firstmate-codexapp` - load before coordinating a visible Codex Desktop thread, evaluating a Codex App backend request, or reconciling Codex Desktop host-tool smoke evidence for Firstmate work.
- `cao-intake` - in a CAO (FreeCAD) home, load when a need for a new object or a change to an existing CAO object arrives, before writing any brief for it.
- `cao-recherche-options` - in a CAO home, load before starting the solution research and review gate for a new or changed architecture, and before presenting any option comparison or structuring trade-off to the captain.
- `cao-worker-brief` - in a CAO home, load before writing the brief of any CAO worker.
- `cao-reception` - in a CAO home, load when a CAO worker reports done, a ready branch, or a PR, before accepting its handoff.
- `cao-freecad-execution` - in a CAO home, load before authorizing, starting, or supervising any native FreeCAD run, and on any FreeCAD crash, hang, or suspicious capture.
- `cao-livraison` - in a CAO home, load when a case reaches S5 (final reception, proof re-pointing, case PR) and again when its PR is ready.
- `firstmate-coding-guidelines` - load before changing firstmate's shared, tracked material, as defined by section 1's list, whether editing directly or briefing a crewmate for a firstmate-repo task.
- `agence-projet-client` - Load in a web (firstmate-web) home when a client need arrives (site, page, redesign, logo, content or audit), before any quote, worker brief or message to the client, and again before each presentation, approval or launch for that client.
- `ux-recherche-tests` - Load in a web (firstmate-web) home before commissioning user research, a UX audit of an existing site, a usability test, an A/B test or post-launch measurement, and before presenting their results.
- `architecture-information` - Load in a web (firstmate-web) home before briefing a site's content inventory, sitemap, navigation or wireframes, and before having any of them validated.
- `contenu-ecriture` - Load in a web (firstmate-web) home before briefing or accepting any text meant for a client site, whether a page, microcopy, a message, a button or link label, or brand text.
- `identite-marque-logo` - Load in a web (firstmate-web) home when a client has no usable brand identity or asks for a logo or brand guidelines, before briefing their creation, and again before each presentation of logo concepts to the client.
- `design-visuel` - Load in a web (firstmate-web) home before briefing a visual direction, a mockup or a design system for a site, and before accepting a mockup for handoff to integration.
- `photographie-web` - Load in a web (firstmate-web) home when a site needs photos, before briefing a photo shoot, a stock image purchase or a retouch, and before accepting images for a site.
- `construction-web` - Load in a web (firstmate-web) home before briefing a site's integration, CMS, hosting or technical go-live, and before accepting a built site.
- `formulaires` - Load in a web (firstmate-web) home when a page contains a form (contact, quote, sign-up, login or payment), before briefing its build and again before accepting it.
- `accessibilite` - Load in a web (firstmate-web) home when scoping a client project, before briefing any mockup or build, before accepting any mockup or built site, and when a client is subject to an accessibility obligation or asks for a conformance level.
- `seo` - Load in a web (firstmate-web) home before briefing the site structure, the content, or the launch of a site whose client expects search traffic, and before any SEO audit.
- `seo-local-fiche-google` - Load in a web (firstmate-web) home when a client receives customers on site or serves a local area, before briefing the creation, takeover, or optimization of their Google business profile, and before any work on their customer reviews.
- `performance-web` - Load in a web (firstmate-web) home before accepting a built site or putting it online, when images are exported for the web, when monitoring a live site's speed, and when a client complains about slowness or asks for a speed audit.
