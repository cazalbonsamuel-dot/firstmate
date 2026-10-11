#!/usr/bin/env bash
# Supervision host hooks scenarios; each invocation owns fresh fixture homes.
# shellcheck disable=SC2016
# shellcheck source=tests/supervision-host-helpers.sh
. "$(dirname "${BASH_SOURCE[0]}")/supervision-host-helpers.sh"

assert_claude_stop_hook_notifies_when_closed_successor_downtime_restore_fails() {
  local status=$1 home real_mktemp successor
  home=$(make_primary_home "hook-successor-restore-fails-$status")
  ln -s "$ROOT/.agents" "$home/.agents"
  echo captain-held > "$home/stub-mode"
  mkfifo "$home/stub-release"
  real_mktemp=$(command -v mktemp)
  cat > "$home/fakebin/mktemp" <<SH
#!/usr/bin/env bash
case "\$*" in
  *'/.watcher-down.tmp.'*) [ ! -e "\$FM_HOME/fail-downtime-write" ] || exit 1 ;;
esac
exec "$real_mktemp" "\$@"
SH
  chmod +x "$home/fakebin/mktemp"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "restore failure: the Stop hook never started a watcher cycle"
  append_status "$home" 'first actionable wake'
  wait_until 250 test -s "$home/stub-ready" || fail "restore failure: the engine did not reach its hold"
  successor=$(cat "$home/state/.watch.lock/pid")
  append_status "$home" 'wake while the engine is handling'
  wait_until 250 bash -c '! kill -0 "$1" 2>/dev/null' _ "$successor" \
    || fail "restore failure: its watcher did not close during the engine turn"
  FM_HOME="$home" bash -c '. "$1"; fm_recovery_marker_begin_handling "$2"' _ \
    "$ROOT/bin/fm-wake-lib.sh" "$home/state/.watcher-down" \
    || fail "fixture: could not model the queued successor wake entering handling"
  if [ "$status" = announced ]; then
    FM_HOME="$home" bash -c '. "$1"; fm_recovery_marker_read "$2" && _fm_recovery_marker_write_locked "$2" handling "${FM_RECOVERY_MARKER_TOKEN##*:}" announced' _ \
      "$ROOT/bin/fm-wake-lib.sh" "$home/state/.watcher-down" \
      || fail "fixture: could not model the handling episode as announced"
  fi
  assert_re "^$status:handling:" "$home/state/.watcher-down" \
    "fixture: the closed handling successor must leave the marker in handling before the host hands back"
  : > "$home/fail-downtime-write"
  printf 'continue\n' > "$home/stub-release"
  wait_until 250 hook_exited "$home" || fail "restore failure: the Stop hook did not finish"
  expect_code 2 "$(cat "$home/hook.rc")" "the Stop hook must notify main when neither hand-back nor downtime restoration commits"
  assert_grep 'firstmate watcher auto-arm FAILED' "$home/hook.err" "the refused rewake must turn into a delivered failure notice"
  assert_re '^epoch=[0-9]+ owner_pid=[0-9]+ outcome=failed ' "$home/state/.claude-autoarm-epoch" \
    "the failed hand-back must be committed"
}

# The close is accepted attended as routine, then its task turns main-only (a
# decision is recorded) while the successor starts: the turn meets the offer
# rule again, so the close reaches main exactly as the arm printed it and no
# engine turn runs on the stale offer.
# Change the task immediately before the second offer computation, rather
# than racing the successor startup. The first offer accepts the close; the
# turn-boundary offer must see the new main-owned decision.
turn_main_only_at_second_offer() {  # <home> [quiet]
  local real_node turn
  real_node=$(command -v node)
  turn='printf '"'"'needs-decision [at=%s]: which export format?\n'"'"' "$(date +%s)" >> "$FM_HOME/state/demo.status"'
  # Quiet: the offer alone turns main-only, with no status line for the
  # successor watcher to close on.
  [ "${2:-}" != quiet ] || turn='echo eligible=0; exit 0'
  cat > "$1/fakebin/node" <<SH
#!/usr/bin/env bash
case "\$*" in
  *fm-branch-dispatch.mjs\ offer*)
    count=\$(cat "\$FM_HOME/offer-count" 2>/dev/null || echo 0)
    count=\$((count + 1))
    printf '%s\n' "\$count" > "\$FM_HOME/offer-count"
    if [ "\$count" -eq 2 ]; then
      $turn
    fi ;;
esac
exec "$real_node" "\$@"
SH
  chmod +x "$1/fakebin/node"
}

# Close the confirmed handling watcher after the engine has acknowledged its
# wake but before its captain outcome returns to the host.
test_claude_stop_hook_restores_handoff_when_successor_closed_before_exit_to_main() {
  local home
  home=$(make_primary_home hook-successor-closed-before-return)
  ln -s "$ROOT/.agents" "$home/.agents"
  echo captain-close-before-return > "$home/stub-mode"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "closed successor: the Stop hook never started a watcher cycle"
  append_status "$home" 'first actionable wake'
  wait_until 250 hook_exited "$home" || fail "closed successor: the Stop hook did not finish: $(cat "$home/state/.supervision-host.log")"
  assert_re '^supervision-host: branch-outcome: ' "$home/hook.err" "the host must hand its captain outcome to main"
  expect_code 2 "$(cat "$home/hook.rc")" "the Stop hook must rewake main after the successor closed"
  assert_re '^(pending|announced):downtime:' "$home/state/.watcher-down" \
    "the closed handling successor must leave a deliverable downtime episode"
  pass "host+hook: a successor closed before exit_to_main does not suppress the branch-outcome rewake"
}

test_claude_stop_hook_restores_handoff_when_successor_closed_mid_engine_turn() {
  local home successor
  home=$(make_primary_home hook-successor-closed-before-outcome)
  ln -s "$ROOT/.agents" "$home/.agents"
  echo captain-held > "$home/stub-mode"
  mkfifo "$home/stub-release"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "closed successor: the Stop hook never started a watcher cycle"
  append_status "$home" 'first actionable wake'
  wait_until 250 test -s "$home/stub-ready" || fail "closed successor: the engine did not reach its hold: hook=$(cat "$home/hook.err" 2>/dev/null) host=$(cat "$home/state/.supervision-host.log" 2>/dev/null) mode=$(cat "$home/stub-mode" 2>/dev/null) engine=$(find "$home" -maxdepth 1 -name 'engine-call.*' -exec sh -c 'cat "$1"' _ {} \; 2>/dev/null) errors=$(cat "$home"/engine-errors.* 2>/dev/null)"
  successor=$(cat "$home/state/.watch.lock/pid")
  append_status "$home" 'wake while the engine is handling'
  wait_until 250 bash -c '! kill -0 "$1" 2>/dev/null' _ "$successor" \
    || fail "closed successor: its watcher did not close during the engine turn"
  FM_HOME="$home" bash -c '. "$1"; fm_recovery_marker_begin_handling "$2"' _ \
    "$ROOT/bin/fm-wake-lib.sh" "$home/state/.watcher-down" \
    || fail "fixture: could not model the queued successor wake entering handling"
  assert_re '^pending:handling:' "$home/state/.watcher-down" \
    "fixture: the closed handling successor must leave the marker in handling before the host hands back"
  printf 'continue\n' > "$home/stub-release"
  wait_until 250 hook_exited "$home" || fail "closed successor: the Stop hook did not finish: $(cat "$home/state/.supervision-host.log")"
  assert_re '^supervision-host: branch-outcome: ' "$home/hook.err" "the host must hand its captain outcome to main"
  expect_code 2 "$(cat "$home/hook.rc")" "the Stop hook must rewake main after the successor closed"
  assert_re '^epoch=[0-9]+ owner_pid=[0-9]+ outcome=rewake ' "$home/state/.claude-autoarm-epoch" \
    "the hand-back must commit the rewake"
  assert_re '^(pending|announced):downtime:' "$home/state/.watcher-down" \
    "the closed handling successor must leave a deliverable downtime episode"
  pass "host+hook: a successor that closes during a held engine turn does not suppress the branch-outcome rewake"
}

test_claude_stop_hook_notifies_when_closed_successor_downtime_restore_fails() {
  assert_claude_stop_hook_notifies_when_closed_successor_downtime_restore_fails pending
  pass "host+hook: a refused hand-back becomes a delivered failure notice"
}

test_claude_stop_hook_notifies_when_closed_announced_successor_downtime_restore_fails() {
  assert_claude_stop_hook_notifies_when_closed_successor_downtime_restore_fails announced
  pass "host+hook: a refused hand-back on an announced handling marker becomes a delivered failure notice"
}

test_attended_routine_wake_is_handled_on_the_engine_and_stays_off_main() {
  local home first drained
  home=$(make_home attended-routine attended)
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "attended: the host never started a watcher cycle: $(cat "$home/host.out")"
  append_status "$home" 'step one'
  wait_until 250 handled_at_least "$home" 1 \
    || fail "attended: the wake was not handled on the engine: $(cat "$home/host.out"; cat "$home/state/.supervision-host.log")"
  first="$home/engine-call.1"
  assert_re '^actor=branch$' "$first" "the attended engine must run as the branch actor"
  assert_no_re '^POSTURE: AWAY' "$first" "an attended wake must carry no away tail"
  assert_re '^(arg=)?FIRSTMATE SUPERVISION WAKE: signal: ' "$first" "the attended wake must carry the close"
  assert_re '	handled	turn=[^	]*	posture=attended	' "$home/state/.supervision-host.log" "the ledger must record the attended turn"
  assert_grep '"verdict":"routine"' "$home/state/branch-outcomes.jsonl" "the engine's routine report did not reach the store"
  assert_no_grep 'demo.status' "$home/state/.wake-queue" "the engine's acknowledgement did not consume the wake"
  assert_no_grep 'supervision-host-return' "$home/state/.wake-queue" "an attended report must queue no return wake for main"
  assert_grep 'it waits in the outcome store for MAIN' "$home/engine-report.log" "an attended routine report must say it stays in the store"
  [ ! -s "$home/host.rc" ] || fail "a routine attended outcome reached main: $(cat "$home/host.out")"
  [ "$(grep -cv '^watcher: started pid=' "$home/host.out")" -eq 0 ] \
    || fail "a routine attended outcome printed more than the first cycle's status to main: $(cat "$home/host.out")"
  watcher_live "$home" || fail "the host is not parked on a live successor after an attended wake"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_contains "$drained" "BRANCH OUTCOMES, ROUTINE (handled by the supervision session since your last drain" \
    "main's next drain must list the routine outcome for awareness"
  assert_contains "$drained" "[seq 1] demo: stub handled demo" "the routine listing must carry the outcome"
  assert_not_contains "$drained" "mark-processed" "a routine outcome must ask for no acknowledgement"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_not_contains "$drained" "[seq 1]" "a routine outcome must be listed only once"
  pass "host: an attended wake the branch may take is handled on the engine, and its routine outcome never wakes main"
}

test_attended_captain_outcome_reaches_main_through_branch_outcomes() {
  local home drained
  home=$(make_home attended-captain attended)
  echo captain > "$home/stub-mode"
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "captain: the host never started a watcher cycle"
  append_status "$home" 'ready for review'
  wait_until 250 host_exited "$home" || fail "captain: the captain outcome did not wake main: $(cat "$home/state/.supervision-host.log")"
  expect_code 0 "$(cat "$home/host.rc")" "a captain-outcome exit must exit 0 for the owner to deliver"
  assert_re '^supervision-host: branch-outcome: .*\(store rows 1\); run bin/fm-wake-drain.sh' "$home/host.out" \
    "the exit must name the captain outcome's store row and send main to its drain"
  assert_no_re '^signal:' "$home/host.out" "the close the engine handled must not reach main as a wake"
  assert_grep 'MAIN processes it from its next drain' "$home/engine-report.log" "an attended captain report must say main processes it"
  assert_no_grep 'demo.status' "$home/state/.wake-queue" "the handled wake must stay acknowledged"
  assert_no_grep 'supervision-host-return' "$home/state/.wake-queue" "an attended captain report must queue no return wake"
  watcher_live "$home" && fail "the host left its successor cycle running when it woke main"

  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_contains "$drained" "BRANCH OUTCOMES (captain outcomes the supervision session recorded for you" "main's drain must present the captain outcome"
  assert_contains "$drained" "[seq 1, recorded " "the section must carry the outcome's row and when it was recorded"
  assert_contains "$drained" " ago] demo: stub escalated: " "the section must carry the outcome's task and summary"
  assert_contains "$drained" "run bin/fm-branch-outcome.sh mark-processed --through 1" "the section must print its exact acknowledgement"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_contains "$drained" " ago] demo: stub escalated: " "an unacknowledged captain outcome must be presented again"
  FM_HOME="$home" "$ROOT/bin/fm-branch-outcome.sh" mark-processed --through 1 >/dev/null \
    || fail "main's acknowledgement of the presented outcome was refused"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_not_contains "$drained" "BRANCH OUTCOMES" "an acknowledged captain outcome must not be presented again"
  pass "host: an attended captain outcome wakes main once and stays in its drain until main acknowledges it"
}

test_captain_leaving_mid_turn_keeps_its_captain_outcome_for_the_return() {
  local home drained
  home=$(make_home attended-go-away attended)
  echo go-away > "$home/stub-mode"
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "go-away: the host never started a watcher cycle"
  append_status "$home" 'finished while the captain left'
  wait_until 250 handled_at_least "$home" 1 || fail "go-away: the wake was not handled: $(cat "$home/state/.supervision-host.log")"
  [ -f "$home/state/.afk-contract" ] || fail "fixture: the stub did not record the away posture"
  [ ! -s "$home/host.rc" ] || fail "a captain outcome recorded after the captain left woke main: $(cat "$home/host.out")"
  assert_grep '"verdict":"captain"' "$home/state/branch-outcomes.jsonl" "fixture: the stub did not report a captain outcome"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_not_contains "$drained" "BRANCH OUTCOMES" "captain outcomes must wait for the return while the away record exists"
  FM_HOME="$home" "$CONTRACT" archive >/dev/null 2>&1 || fail "fixture: could not archive the away posture"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_contains "$drained" " ago] demo: stub handled demo" "after the return the drain must present the away window's captain outcome"
  pass "host: a captain outcome recorded after the captain left waits for the return, then reaches main's drain"
}

# A quiet record left without its daemon (no state/.afk) is a present captain,
# not an away one: the host runs attended beside it, so a captain outcome wakes
# main and reaches its drain instead of waiting for a return that never comes,
# and a decision close reaches main as the plain arm delivers it.
test_quiet_record_without_its_daemon_is_a_present_captain() {
  local home drained
  home=$(make_home quiet-captain quiet)
  echo captain > "$home/stub-mode"
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "quiet: the host never started a watcher cycle"
  append_status "$home" 'ready for review'
  wait_until 250 host_exited "$home" || fail "quiet: the captain outcome did not wake the present captain's main: $(cat "$home/state/.supervision-host.log")"
  assert_re '	handled	turn=[^	]*	posture=attended	' "$home/state/.supervision-host.log" "a quiet record must leave the host's turn attended"
  assert_no_re '^POSTURE: AWAY' "$home/engine-call.1" "a turn beside a quiet record must carry no away tail"
  assert_re 'MAIN DIALOG MIRROR' "$home/engine-call.1" "a turn beside a quiet record must carry the captain's dialog"
  assert_grep 'MAIN processes it from its next drain' "$home/engine-report.log" "a captain report beside a quiet record must say main processes it"
  assert_re '^supervision-host: branch-outcome: .*\(store rows 1\); run bin/fm-wake-drain.sh' "$home/host.out" \
    "the exit must name the captain outcome's store row for the present captain"
  drained=$(FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" 2>&1' "$ROOT/bin/fm-wake-drain.sh")
  assert_contains "$drained" "BRANCH OUTCOMES (captain outcomes the supervision session recorded for you" "main's drain must present the captain outcome beside a quiet record"
  assert_contains "$drained" " ago] demo: stub escalated: " "the section must carry the outcome"
  [ -f "$home/state/.afk-contract" ] || fail "the host must leave quiet mode's record in place"

  home=$(make_home quiet-main-only quiet)
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "quiet main-only: the host never started a watcher cycle"
  append_status "$home" 'which export format?' needs-decision
  wait_until 250 host_exited "$home" || fail "quiet main-only: the decision close did not reach main: $(cat "$home/state/.supervision-host.log")"
  assert_re '^signal: .*demo.status' "$home/host.out" "the decision close must reach main as the arm printed it"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "quiet main-only: the engine took a decision close from a present captain"
  assert_re '	pass-through	attended	main-only	signal:' "$home/state/.supervision-host.log" "the ledger must record the attended main-only pass-through"
  pass "host: a quiet record without its daemon is a present captain, so outcomes and decisions reach main"
}

test_attended_main_only_close_passes_straight_to_main() {
  local home
  home=$(make_home attended-main-only attended)
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "main-only: the host never started a watcher cycle"
  append_status "$home" 'which export format?' needs-decision
  wait_until 250 host_exited "$home" || fail "main-only: the decision close did not reach main: $(cat "$home/state/.supervision-host.log")"
  expect_code 0 "$(cat "$home/host.rc")" "a main-only close must exit 0"
  assert_re '^signal: .*demo.status' "$home/host.out" "the close must carry the watcher's reason line"
  assert_no_re '^supervision-host' "$home/host.out" "a main-only close must reach main exactly as the arm printed it"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "main-only: the engine ran for a decision close"
  assert_grep 'demo.status' "$home/state/.wake-queue" "the decision wake must stay queued for main"
  assert_re '	pass-through	attended	main-only	signal:' "$home/state/.supervision-host.log" "the ledger must record why the close went to main"
  pass "host: an attended decision close stays main's exactly as the plain arm delivers it"
}

# The file is read at every wake (docs/configuration.md "Supervision host"), so
# an off written while the host is parked sends the next attended close to main
# exactly as the arm printed it, with the ledger naming the opt-out.
test_off_written_while_parked_passes_the_next_attended_close_to_main() {
  local home
  home=$(make_home attended-off-while-parked attended)
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "off while parked: the host never started a watcher cycle"
  : > "$home/config/supervision-host-off"
  append_status "$home" 'step one'
  wait_until 250 host_exited "$home" || fail "off while parked: the close did not reach main: $(cat "$home/state/.supervision-host.log")"
  expect_code 0 "$(cat "$home/host.rc")" "a close on a home that opted out must exit 0"
  assert_re '^signal: .*demo.status' "$home/host.out" "the close must carry the watcher's reason line"
  assert_no_re '^supervision-host' "$home/host.out" "the close must reach main exactly as the arm printed it"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "off while parked: the engine ran after the home opted out"
  assert_re '	pass-through	attended	the home does not run the supervision host	signal:' "$home/state/.supervision-host.log" \
    "the ledger must name the opt-out as why the close went to main"
  stop_home_processes "$home"
  pass "host: an off written while the host is parked sends the next attended close to main, naming the opt-out"
}

# The live failure this guards: a main-only pass-through used to exit without
# a watcher, so nothing restarted short-lived listeners until the session
# armed again. The close still reaches main unchanged, and the successor
# cycle stays up for the session's next arm to attach to.
test_main_only_pass_through_leaves_the_successor_watcher_running() {
  local home pid
  home=$(make_home main-only-successor attended)
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "successor: the host never started a watcher cycle"
  append_status "$home" 'which export format?' needs-decision
  wait_until 250 host_exited "$home" || fail "successor: the decision close did not reach main: $(cat "$home/state/.supervision-host.log")"
  expect_code 0 "$(cat "$home/host.rc")" "a main-only close must exit 0"
  assert_re '^signal: .*demo.status' "$home/host.out" "the close must carry the watcher's reason line"
  assert_no_re '^supervision-host' "$home/host.out" "a main-only close must reach main exactly as the arm printed it"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "successor: the engine ran for a decision close"
  watcher_live "$home" || fail "successor: the pass-through left no live watcher: $(cat "$home/state/.supervision-host.log")"
  [ "$(marker_kind "$home")" = downtime ] \
    || fail "successor: the pass-through claimed the close was being handled, so main's re-arm owner would not deliver it: $(cat "$home/state/.watcher-down")"
  pid=$(cat "$home/state/.watch.lock/pid")
  sleep 2
  kill -0 "$pid" 2>/dev/null || fail "successor: the watcher exited after the pass-through (pid $pid)"
  [ "$(cat "$home/state/.watch.lock/pid" 2>/dev/null)" = "$pid" ] || fail "successor: the watcher lock moved after the pass-through"
  pass "host: a main-only pass-through leaves the successor watcher running and the close undelivered for main"
}

# The session-lock holder's process identity cannot be read (its proc entry
# is truncated), so no main-session key exists: the close reaches main exactly
# as the arm printed it, before any mirror feed or engine turn.
test_attended_close_with_unidentified_main_session_passes_to_main() {
  local home
  home=$(make_home attended-unidentified attended)
  FM_HOME="$home" FM_CREW_STATE_BIN="$home/fakebin/fm-crew-state.sh" PATH="$home/fakebin:$PATH" \
    "$FAKE_CLAUDE" -c '
      printf "%s\n" "$$" > "$FM_HOME/state/.lock"
      printf "%s\n" "$$" >> "$FM_HOME/claude-pids"
      mkdir -p "$FM_HOME/proc/$$"
      printf "%s (claude) S\n" "$$" > "$FM_HOME/proc/$$/stat"
      printf "claude\0" > "$FM_HOME/proc/$$/cmdline"
      export FM_PROC_ROOT_OVERRIDE="$FM_HOME/proc"
      "$0" park > "$FM_HOME/host.out" 2>&1
      printf "%s\n" "$?" > "$FM_HOME/host.rc"
    ' "$HOST" 2>> "$home/claude.err" &
  wait_until 150 watcher_live "$home" || fail "unidentified: the host never started a watcher cycle: $(cat "$home/host.out")"
  append_status "$home" 'step one'
  wait_until 250 host_exited "$home" || fail "unidentified: the close did not reach main: $(cat "$home/state/.supervision-host.log")"
  expect_code 0 "$(cat "$home/host.rc")" "a close for an unidentified main session must exit 0"
  assert_re '^signal: .*demo.status' "$home/host.out" "the close must carry the watcher's reason line"
  assert_no_re '^supervision-host' "$home/host.out" "the close must reach main exactly as the arm printed it"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "unidentified: the engine ran without a main-session key"
  assert_grep 'demo.status' "$home/state/.wake-queue" "the wake must stay queued for main"
  assert_re '	pass-through	attended	the main session could not be identified	signal:' "$home/state/.supervision-host.log" \
    "the ledger must record why the close went to main"
  pass "host: an attended close whose main session cannot be identified reaches main and runs no engine turn"
}

test_attended_close_that_turns_main_only_before_its_turn_passes_to_main() {
  local home
  home=$(make_home attended-turns-main-only attended)
  turn_main_only_at_second_offer "$home"
  start_host "$home"
  wait_until 150 watcher_live "$home" || fail "turns-main-only: the host never started a watcher cycle"
  append_status "$home" 'step one'
  wait_until 250 host_exited "$home" || fail "turns-main-only: the close did not reach main: $(cat "$home/state/.supervision-host.log")"
  assert_grep 'which export format?' "$home/state/demo.status" "fixture: the decision was not recorded before the turn"
  expect_code 0 "$(cat "$home/host.rc")" "the close must exit 0"
  assert_re '^signal: .*demo.status' "$home/host.out" "the close must carry the watcher's reason line"
  assert_no_re '^supervision-host' "$home/host.out" "the close must reach main exactly as the arm printed it"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "turns-main-only: the engine ran on a stale offer"
  assert_grep 'demo.status' "$home/state/.wake-queue" "the wake must stay queued for main"
  local pi_offer
  pi_offer=$(node --input-type=module -e '
    const dispatch = await import(process.argv[1]);
    console.log(dispatch.branchOfferForWake(process.argv[2], process.argv[3], false).eligible);
  ' "$ROOT/.pi/extensions/lib/fm-branch-dispatch.ts" "$home/state" "signal: $home/state/demo.status")
  [ "$pi_offer" = true ] || fail "the host-only transition veto changed Pi's existing offer rule"
  assert_re '	pass-through	attended	main-only	signal:' "$home/state/.supervision-host.log" "the ledger must record why the close went to main"
  watcher_live "$home" || fail "the pass-through left no successor watcher"
  pass "host: an attended close whose task turns main-only before its turn still reaches main unchanged"
}

# The live failure (2026-09-27): a main-only pass-through confirmed a handling
# handoff before the close reached main's re-arm owner, so the Stop hook's
# rewake commit refused and it exited 0 in silence. An idle primary was never
# woken, and the detached successor's own later close reached no reader.
test_claude_stop_hook_delivers_a_main_only_pass_through() {
  local home
  home=$(make_primary_home hook-main-only)
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "hook main-only: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'which export format?' needs-decision
  wait_until 250 hook_exited "$home" || fail "hook main-only: the Stop hook never closed: $(cat "$home/state/.supervision-host.log")"
  assert_re '	pass-through	attended	main-only	signal:' "$home/state/.supervision-host.log" "fixture: the close was not a main-only pass-through"
  assert_rewoke_main "$home" "hook main-only"
  assert_re '^signal: .*demo.status' "$home/hook.err" "the rewake must carry the close"
  watcher_live "$home" || fail "hook main-only: the pass-through left no successor watcher"
  pass "host+hook: an attended main-only pass-through rewakes main and keeps its successor watcher"
}

# The live repro (2026-09-28): a quiet record live with no daemon flag parked a
# present Claude captain, whose worker's captain outcomes waited for a return.
# Through the real Stop hook the outcome now rewakes main, with no away note.
test_claude_stop_hook_rewakes_a_present_captain_beside_a_quiet_record() {
  local home drained
  home=$(make_primary_home hook-quiet-record)
  # This case runs an engine turn from the primary root, whose prompt reads the skills.
  ln -s "$ROOT/.agents" "$home/.agents"
  FM_HOME="$home" FM_AFK_MODE=quiet "$CONTRACT" enter --words 'keep routine wakes off my main' >/dev/null 2>&1 \
    || fail "fixture: could not record quiet mode"
  echo captain > "$home/stub-mode"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "hook quiet: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'ready for review'
  wait_until 250 hook_exited "$home" || fail "hook quiet: the Stop hook never closed: $(cat "$home/state/.supervision-host.log")"
  assert_re '	handled	turn=[^	]*	posture=attended	' "$home/state/.supervision-host.log" "a quiet record must leave the host's turn attended"
  assert_rewoke_main "$home" "hook quiet"
  assert_re '^supervision-host: branch-outcome: ' "$home/hook.err" "the rewake must carry the captain outcome"
  assert_no_grep 'not a return' "$home/hook.err" "a present captain's rewake must not call itself away-posture supervision"
  drained=$(main_drain "$home")
  assert_contains "$drained" " ago] demo: stub escalated: " "main's drain must present the captain outcome beside a quiet record"
  pass "host+hook: a captain outcome beside a quiet record rewakes the present captain with no away note"
}

# Default-on for Claude (docs/configuration.md "Supervision host"): through the
# real Stop hook and mirror writer, a Claude primary home with no
# config/supervision-host runs the host at the default engine, mirrors the
# captain's dialog, and keeps a routine attended wake off main; a home with
# config/supervision-host-off runs the plain watcher arm, mirrors nothing, and every wake
# reaches main as the arm printed it.
test_claude_stop_hook_runs_the_host_without_the_file_and_off_opts_out() {
  local home first
  home=$(make_primary_home hook-default-on)
  ln -s "$ROOT/.agents" "$home/.agents"
  rm -f "$home/config/supervision-host"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "default-on: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  assert_grep 'watch the fleet for me' "$home/state/.host-mirror.jsonl" "a Claude home without the file must mirror the captain's dialog"
  append_status "$home" 'step one'
  wait_until 250 handled_at_least "$home" 1 \
    || fail "default-on: the wake was not handled on the engine: $(cat "$home/hook.err" 2>/dev/null; cat "$home/state/.supervision-host.log" 2>/dev/null)"
  first="$home/engine-call.1"
  assert_re '^arg=sonnet$' "$first" "a Claude home without the file must run the Claude engine at its default model"
  assert_re '^primary=claude$' "$first" "the engine must carry the Claude primary pin"
  assert_re '	handled	turn=[^	]*	posture=attended	' "$home/state/.supervision-host.log" "the ledger must record the attended turn"
  [ ! -s "$home/hook.rc" ] || fail "a routine attended wake on a Claude home without the file reached main: $(cat "$home/hook.err")"
  watcher_live "$home" || fail "default-on: the host is not parked on a live successor"
  : > "$home/session.stop"
  stop_home_processes "$home"

  home=$(make_primary_home hook-opted-out)
  : > "$home/config/supervision-host-off"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "off: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'step one'
  wait_until 250 hook_exited "$home" || fail "off: the Stop hook never closed"
  assert_rewoke_main "$home" "off"
  assert_re '^signal: .*demo.status' "$home/hook.err" "off: the rewake must carry the arm's close"
  assert_no_re '^supervision-host' "$home/hook.err" "off: the close must reach main exactly as the arm printed it"
  assert_absent "$home/state/.supervision-host.log" "a home opted out by config/supervision-host-off must never run the host"
  assert_absent "$home/state/.host-mirror.jsonl" "a home opted out by config/supervision-host-off must mirror nothing"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "a home opted out by config/supervision-host-off ran an engine turn"
  : > "$home/session.stop"
  stop_home_processes "$home"
  pass "host+hook: a Claude home without config/supervision-host runs the host at the default engine, and an off file restores the plain arm"
}

test_claude_stop_hook_delivers_a_close_that_turns_main_only_at_its_turn() {
  local home
  home=$(make_primary_home hook-turns-main-only)
  turn_main_only_at_second_offer "$home"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "hook turns-main-only: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'step one'
  wait_until 250 hook_exited "$home" || fail "hook turns-main-only: the Stop hook never closed: $(cat "$home/state/.supervision-host.log")"
  [ "$(cat "$home/offer-count" 2>/dev/null)" -ge 2 ] || fail "fixture: the close was not accepted before it turned main-only"
  [ "$(engine_calls "$home")" -eq 0 ] || fail "hook turns-main-only: the engine ran on a stale offer"
  assert_rewoke_main "$home" "hook turns-main-only"
  watcher_live "$home" || fail "hook turns-main-only: the pass-through left no successor watcher"
  pass "host+hook: a close that turns main-only at its turn rewakes main and keeps its successor watcher"
}

# The successor a close that turns main-only at its turn leaves for main
# outlives the Stop hook's process group teardown, like the pass-through's.
test_successor_left_at_the_turn_survives_the_hook_process_group_teardown() {
  local home watcher
  home=$(make_primary_home hook-turns-main-only-teardown)
  turn_main_only_at_second_offer "$home" quiet
  : > "$home/hook.own-group"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "at-turn teardown: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'step one'
  wait_until 250 hook_exited "$home" || fail "at-turn teardown: the Stop hook never closed: $(cat "$home/state/.supervision-host.log")"
  [ "$(cat "$home/offer-count" 2>/dev/null)" -ge 2 ] || fail "fixture: the close was not accepted before it turned main-only"
  assert_rewoke_main "$home" "at-turn teardown"
  watcher=$(cat "$home/state/.watch.lock/pid")
  kill -TERM -- "-$(cat "$home/hook.pgid")" 2>/dev/null || true
  sleep 2
  kill -0 "$watcher" 2>/dev/null || fail "at-turn teardown: the successor watcher (pid $watcher) did not survive the hook's process group teardown"
  stop_home_processes "$home"
  pass "host+hook: the successor a close that turns main-only at its turn leaves for main survives the hook's process group teardown"
}

# If the at-turn hand-back cannot publish downtime, the healthy successor
# cannot turn that undelivered close into a silent Stop-hook success.
test_claude_stop_hook_notifies_when_at_turn_downtime_write_fails() {
  local home real_mktemp
  home=$(make_primary_home hook-turns-main-only-write-fails)
  turn_main_only_at_second_offer "$home"
  real_mktemp=$(command -v mktemp)
  cat > "$home/fakebin/mktemp" <<SH
#!/usr/bin/env bash
case "\$*" in
  *'/state/.watcher-down.tmp.'*)
    [ "\$(cat "\$FM_HOME/offer-count" 2>/dev/null)" != 2 ] || exit 1 ;;
esac
exec "$real_mktemp" "\$@"
SH
  chmod +x "$home/fakebin/mktemp"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "hook write failure: no watcher started"
  append_status "$home" 'step one'
  wait_until 250 hook_exited "$home" || fail "hook write failure: the Stop hook did not finish"
  [ "$(cat "$home/offer-count" 2>/dev/null)" -ge 2 ] || fail "fixture: the close did not turn main-only at its turn"
  assert_re 'pass-through[[:space:]]+downtime-unrestored' "$home/state/.supervision-host.log" "fixture: downtime publication did not fail"
  assert_re '^(pending|announced):handling:' "$home/state/.watcher-down" "fixture: the marker unexpectedly became downtime"
  expect_code 2 "$(cat "$home/hook.rc")" "the Stop hook must notify main instead of dropping the close"
  assert_grep 'firstmate watcher auto-arm FAILED' "$home/hook.err" "main must receive the failure notification"
  assert_re 'outcome=failed ' "$home/state/.claude-autoarm-epoch" "the failure must be committed"
  pass "host+hook: failed at-turn downtime write notifies main despite a healthy successor"
}

# The successor a pass-through leaves closes while main's rewoken turn is still
# running, so no arm is attached to read it: the next turn end must still
# deliver that close instead of stranding it in the queue.
test_successor_close_during_main_turn_is_delivered_at_the_next_turn_end() {
  local home successor drained
  home=$(make_primary_home hook-successor-close)
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "successor close: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'which export format?' needs-decision
  wait_until 250 hook_exited "$home" || fail "successor close: the first close never reached the Stop hook: $(cat "$home/state/.supervision-host.log")"
  assert_rewoke_main "$home" "successor close (first)"
  successor=$(cat "$home/state/.watch.lock/pid")
  main_drain "$home" >/dev/null
  append_status "$home" 'which region?' needs-decision
  wait_until 250 bash -c '! kill -0 "$1" 2>/dev/null' _ "$successor" || fail "fixture: the successor did not close on the later decision"
  # shellcheck disable=SC2086 # the printed acknowledgement arguments
  [ -z "$MAIN_ACK" ] || FM_HOME="$home" "$FAKE_CLAUDE" -c '"$0" "$@" >/dev/null 2>&1' "$ROOT/bin/fm-wake-drain.sh" $MAIN_ACK \
    || fail "successor close: main's acknowledgement failed: $MAIN_ACK"
  turn_end "$home"
  wait_until 250 hook_exited "$home" || fail "successor close: the next turn end never closed: $(cat "$home/state/.supervision-host.log")"
  assert_rewoke_main "$home" "successor close (next turn end)"
  drained=$(main_drain "$home")
  assert_contains "$drained" 'which region?' "the successor's close must reach main's drain"
  watcher_live "$home" || fail "successor close: the next turn end left no watcher"
  pass "host+hook: a successor close that lands during main's turn is delivered at the next turn end"
}

# The live loop (2026-10-07): the successor a main-only pass-through leaves
# for main shared the Stop hook's process group, so Claude's teardown of that
# group after the exit-2 rewake stopped it mid-turn. The stop published
# downtime, and the next park's first cycle announced an empty
# "check: rearm-resurface" that woke main again, over and over. The successor
# must outlive that teardown, so the next park takes it over quietly.
test_pass_through_successor_survives_the_hook_process_group_teardown() {
  local home pgid watcher
  home=$(make_primary_home hook-group-teardown)
  : > "$home/hook.own-group"
  start_hook_session "$home"
  turn_end "$home"
  wait_until 150 watcher_live "$home" || fail "group teardown: the Stop hook never started a watcher cycle: $(cat "$home/hook.err" 2>/dev/null)"
  append_status "$home" 'which export format?' needs-decision
  wait_until 250 hook_exited "$home" || fail "group teardown: the decision close never reached the Stop hook: $(cat "$home/state/.supervision-host.log")"
  assert_re '	pass-through	attended	main-only	signal:' "$home/state/.supervision-host.log" "fixture: the close was not a main-only pass-through"
  assert_rewoke_main "$home" "group teardown (pass-through)"
  watcher=$(cat "$home/state/.watch.lock/pid")
  pgid=$(cat "$home/hook.pgid")
  kill -TERM -- "-$pgid" 2>/dev/null || true
  sleep 2
  kill -0 "$watcher" 2>/dev/null || fail "group teardown: the successor watcher (pid $watcher) did not survive the hook's process group teardown"
  [ "$(cat "$home/state/.watch.lock/pid" 2>/dev/null)" = "$watcher" ] || fail "group teardown: the watcher lock moved"
  stop_home_processes "$home"
  pass "host+hook: the successor a pass-through leaves for main survives the hook's process group teardown"
}

test_claude_stop_hook_restores_handoff_when_successor_closed_before_exit_to_main
test_claude_stop_hook_restores_handoff_when_successor_closed_mid_engine_turn
test_claude_stop_hook_notifies_when_closed_successor_downtime_restore_fails
test_claude_stop_hook_notifies_when_closed_announced_successor_downtime_restore_fails
test_attended_routine_wake_is_handled_on_the_engine_and_stays_off_main
test_attended_captain_outcome_reaches_main_through_branch_outcomes
test_captain_leaving_mid_turn_keeps_its_captain_outcome_for_the_return
test_quiet_record_without_its_daemon_is_a_present_captain
test_attended_main_only_close_passes_straight_to_main
test_off_written_while_parked_passes_the_next_attended_close_to_main
test_main_only_pass_through_leaves_the_successor_watcher_running
test_attended_close_with_unidentified_main_session_passes_to_main
test_attended_close_that_turns_main_only_before_its_turn_passes_to_main
test_claude_stop_hook_delivers_a_main_only_pass_through
test_claude_stop_hook_rewakes_a_present_captain_beside_a_quiet_record
test_claude_stop_hook_runs_the_host_without_the_file_and_off_opts_out
test_claude_stop_hook_delivers_a_close_that_turns_main_only_at_its_turn
test_successor_left_at_the_turn_survives_the_hook_process_group_teardown
test_claude_stop_hook_notifies_when_at_turn_downtime_write_fails
test_successor_close_during_main_turn_is_delivered_at_the_next_turn_end
test_pass_through_successor_survives_the_hook_process_group_teardown
