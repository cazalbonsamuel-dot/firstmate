#!/usr/bin/env bash
# usage: drive.sh <worktree> <config> <outprefix>
set -u
WT=$1 CFG=$2 OUT=$3
cd "$WT"
unset HERDR_ENV HERDR_PANE_ID HERDR_TAB_ID HERDR_WORKSPACE_ID HERDR_SOCKET_PATH HERDR_BIN_PATH HERDR_SESSION
export HERDR_CONFIG_PATH=$CFG
LAB=$(bin/fm-herdr-lab.sh name sidebar)
echo "lab=$LAB"
TM=$(mktemp -d "${TMPDIR:-/tmp}/fm-sbtm.XXXXXX")
cleanup() {
  TMUX_TMPDIR="$TM" tmux -L fm-lab kill-server 2>/dev/null
  bin/fm-herdr-lab.sh teardown "$LAB"; echo "teardown rc=$?"
  rm -rf "$TM"
}
trap cleanup EXIT
bin/fm-herdr-lab.sh provision "$LAB" || exit 1
H() { bin/fm-herdr-lab.sh run "$LAB" "$@"; }
mkws() { H workspace create --label "$1" --cwd /tmp --no-focus | jq -r '.result.workspace.workspace_id // .result.workspace_id // empty'; }
H workspace list | head -c 600; echo
W1=$(mkws "firstmate"); W2=$(mkws "storefront"); W3=$(mkws "└ web-run · p:AbCdEfGhIjKlMnOpQrStUv"); W4=$(mkws "other-home")
echo "ws: $W1 $W2 $W3 $W4"
PANES=$(H pane list)
pane_of() { printf '%s' "$PANES" | jq -r --arg w "$1" '[.result.panes[] | select(.workspace_id==$w)][0].pane_id'; }
P1=$(pane_of "$W1"); P2=$(pane_of "$W2"); P3=$(pane_of "$W3"); P4=$(pane_of "$W4")
echo "panes: $P1 $P2 $P3 $P4"
H pane report-agent "$P1" --source fmtest --agent claude --state working >/dev/null
H pane report-agent "$P2" --source fmtest --agent claude --state working >/dev/null
H pane report-agent "$P3" --source fmtest --agent codex --state blocked >/dev/null
H pane report-agent "$P4" --source fmtest --agent codex --state idle >/dev/null
# terminal titles
for p in "$P1|firstmate captain" "$P2|fix cart totals" "$P3|web run tests" "$P4|other home worker"; do
  H pane run "${p%%|*}" "clear; printf '\\033]0;${p#*|}\\007'; sleep 900" >/dev/null
done
# Firstmate tokens on the tagged task panes only (what fm-herdr-groups sync writes)
H pane report-metadata "$P2" --source firstmate --token fm_group=storefront --token fm_state=running --token fm_task=fix-cart >/dev/null
H pane report-metadata "$P3" --source firstmate --token fm_icon=🟣 --token fm_group=web --token fm_state=waiting --token fm_task=web-run >/dev/null
H pane list | jq -c '.result.panes[] | {pane_id, workspace_id, agent, agent_status, title, tokens}' 2>/dev/null
TMUX_TMPDIR="$TM" tmux -L fm-lab new-session -d -s view -x 150 -y 42 "env -u TMUX HERDR_CONFIG_PATH=$CFG TERM=xterm-256color herdr --session $LAB"
sleep 4
TMUX_TMPDIR="$TM" tmux -L fm-lab send-keys -t view Enter
sleep 2
H pane list | jq -c '.result.panes[] | {pane_id, agent, agent_status, title, terminal_title, tokens}' > "$OUT.panes.jsonl"
TMUX_TMPDIR="$TM" tmux -L fm-lab capture-pane -p -t view > "$OUT.txt"
TMUX_TMPDIR="$TM" tmux -L fm-lab capture-pane -p -e -t view > "$OUT.ansi"
# Waiting-dot clear check
H pane report-metadata "$P3" --source firstmate --clear-token fm_icon >/dev/null
sleep 2
TMUX_TMPDIR="$TM" tmux -L fm-lab capture-pane -p -t view > "$OUT.icon-cleared.txt"
TMUX_TMPDIR="$TM" tmux -L fm-lab capture-pane -p -e -t view > "$OUT.icon-cleared.ansi"
cat "$OUT.txt"
