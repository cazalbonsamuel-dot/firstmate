#!/usr/bin/env bash
# Live driver: real Claude Code worker on an isolated Herdr lab, driven by
# bin/fm-control.sh exit / relaunch / exit, plus the base (pre-fix) fm-control
# exit as a reproduction. All Herdr calls route through bin/fm-herdr-lab.sh.
set -u
ROOT=$1; EVID=$2; BASE_BIN=$3
LAB_HELPER=$ROOT/bin/fm-herdr-lab.sh
ORIGINAL_PATH=$PATH
unset HERDR_ENV HERDR_PANE_ID HERDR_TAB_ID HERDR_WORKSPACE_ID HERDR_SOCKET_PATH HERDR_SESSION
SESSION=$("$LAB_HELPER" name fmctl-exit)
SCRATCH=$(mktemp -d "$(cd "${TMPDIR:-/tmp}" && pwd -P)/fm-ctl-exit-live.XXXXXX")
LAB=$SCRATCH/home
"$ROOT/bin/fm-lab-home.sh" create "$LAB" >/dev/null || exit 1
FAKEBIN=$SCRATCH/fakebin; mkdir -p "$FAKEBIN"
log() { printf '%s\n' "$*" | tee -a "$EVID/s2-fm-control-live.log"; }
cleanup() {
  trap - EXIT
  PATH="$ORIGINAL_PATH" "$LAB_HELPER" teardown "$SESSION" && log "teardown: lab session $SESSION removed"
  rm -rf "$SCRATCH"
}
trap cleanup EXIT
cat > "$FAKEBIN/herdr" <<EOF
#!/usr/bin/env bash
set -u
args=("\$@"); n=\${#args[@]}
if [ "\$n" -ge 2 ] && [ "\${args[\$((n-2))]}" = --session ]; then
  [ "\${args[\$((n-1))]}" = "$SESSION" ] || { echo "wrapper refused foreign session" >&2; exit 97; }
  args=("\${args[@]:0:\$((n-2))}")
else
  [ "\${1:-}" = --version ] && exec env PATH="$ORIGINAL_PATH" herdr --version
  [ "\${HERDR_SESSION:-}" = "$SESSION" ] || { echo "wrapper requires trailing --session $SESSION" >&2; exit 98; }
fi
[ "\${args[0]:-}" = status ] && exec env PATH="$ORIGINAL_PATH" HERDR_SESSION="$SESSION" herdr "\${args[@]}" --session "$SESSION"
exec env PATH="$ORIGINAL_PATH" "$LAB_HELPER" run "$SESSION" "\${args[@]}"
EOF
chmod +x "$FAKEBIN/herdr"
"$LAB_HELPER" provision "$SESSION" || { log "provision failed"; exit 1; }
lab() { env PATH="$ORIGINAL_PATH" "$LAB_HELPER" run "$SESSION" "$@"; }
export PATH="$FAKEBIN:$ORIGINAL_PATH" HERDR_SESSION="$SESSION"

PROJ=$SCRATCH/proj; WT=$SCRATCH/wt
mkdir -p "$PROJ" "$LAB/data/cx"
git -C "$PROJ" init -q; printf '# proj\n' > "$PROJ/README.md"; git -C "$PROJ" add README.md
git -C "$PROJ" -c user.name=T -c user.email=t@example.invalid commit -qm init
git -C "$PROJ" worktree add --quiet -b cx "$WT"
cat > "$LAB/data/cx/brief.md" <<'EOF'
# Task
## Captain's intent
Lab fixture for an fm-control exit test. Do nothing: do not run any tool, do not edit any file. Reply "ready" once and wait.

## Firstmate spec
Stay idle.
EOF
. "$ROOT/bin/fm-backend.sh"; fm_backend_source herdr || exit 1
CR=$(fm_backend_herdr_container_ensure "$WT") || { log "container_ensure failed"; exit 1; }
CONTAINER=${CR%%$'\t'*}; SEEDED=${CR#*$'\t'}; WSID=${CONTAINER#*:}
read -r TAB PANE <<<"$(fm_backend_herdr_create_task "$CONTAINER" fm-cx "$WT" "$SEEDED")"
cat > "$LAB/state/cx.meta" <<EOF
window=$SESSION:$PANE
endpoint_task_id=cx
worktree=$WT
project=$PROJ
harness=claude
kind=scout
mode=direct
yolo=on
model=default
effort=default
backend=herdr
herdr_session=$SESSION
herdr_workspace_id=$WSID
herdr_tab_id=$TAB
herdr_pane_id=$PANE
EOF
log "lab: session=$SESSION pane=$PANE claude=$(claude --version) herdr=$(herdr --version)"

wait_idle() {  # <label>
  local i=0 trusted=0 screen st
  while [ $i -lt 90 ]; do
    screen=$(lab pane read "$PANE" --source visible 2>/dev/null || true)
    case "$screen" in
      *'Yes, I trust this folder'*) [ $trusted = 0 ] && { trusted=1; lab pane send-keys "$PANE" down enter >/dev/null; } ;;
      *'bypass permissions on'*|*'? for shortcuts'*)
        st=$(lab agent get "$PANE" 2>/dev/null | jq -r '.result.agent.agent_status // empty')
        case "$st" in idle|done) log "$1: claude idle (agent_status=$st)"; return 0 ;; esac ;;
    esac
    i=$((i+1)); sleep 1
  done
  log "$1: claude never idle"; return 1
}
snap() { lab pane read "$PANE" --source visible > "$EVID/$1.txt" 2>/dev/null; }
ctl() {  # <bin-dir> args...
  local bin=$1; shift
  env -u NO_MISTAKES_GATE -u FM_GATE_REFUSE_BYPASS FM_HOME="$LAB" HERDR_SESSION="$SESSION" \
    FM_CONTROL_EXIT_WAIT=30 "$bin/fm-control.sh" "$@" 2>&1
}
state() { fm_backend_agent_state herdr "$SESSION:$PANE"; }

lab pane run "$PANE" "CLAUDE_CODE_ENABLE_PROMPT_SUGGESTION=false claude --dangerously-skip-permissions" >/dev/null
wait_idle "launch" || exit 1
sleep 2; snap s2-0-idle-before-exit
log "agent state before exit: $(state)"

log "--- BASE (pre-fix, bare /exit) fm-control.sh cx exit ---"
OUT=$(ctl "$BASE_BIN" cx exit); rc=$?
log "rc=$rc out: $OUT"
sleep 1; snap s2-1-after-base-exit
log "agent state after base exit: $(state)"

wait_idle "post-base" || true
log "--- FIXED fm-control.sh cx exit ---"
OUT=$(ctl "$ROOT/bin" cx exit); rc=$?
log "rc=$rc out: $OUT"
sleep 1; snap s2-2-after-fixed-exit
log "agent state after fixed exit: $(state)"

log "--- FIXED fm-control.sh cx relaunch ---"
OUT=$(ctl "$ROOT/bin" cx relaunch --note "Lab relaunch test: stay idle, do nothing."); rc=$?
log "rc=$rc out: $OUT"
log "agent state after relaunch: $(state)"
wait_idle "relaunched" || true
sleep 5; snap s2-3-after-relaunch

log "--- FIXED fm-control.sh cx exit (second incarnation) ---"
OUT=$(ctl "$ROOT/bin" cx exit); rc=$?
log "rc=$rc out: $OUT"
sleep 1; snap s2-4-after-second-exit
log "agent state after second exit: $(state)"
