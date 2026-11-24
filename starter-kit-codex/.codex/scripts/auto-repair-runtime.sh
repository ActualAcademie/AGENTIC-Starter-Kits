#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(git rev-parse --show-toplevel 2>/dev/null || cd "$config/.." && pwd)"
state="$root/.codex/RUNTIME-STATE.md"
[ -s "$state" ] || bash "$script_dir/bootstrap-runtime-state.sh"
budget="$(sed -n 's/^- goal_budget:[[:space:]]*//p' "$state" | head -1)"
case "$budget" in unlimited|none|\[\[A_COMPLETER\]\]|'') sed -i.bak 's/^- goal_budget:.*/- goal_budget: 100000/' "$state"; rm -f "$state.bak" ;; esac
bash "$script_dir/normalize-runtime-state.sh" "$state" >/dev/null
bash "$script_dir/validate-runtime-schema.sh" "$state" >/dev/null
printf 'RUNTIME AUTO-REPAIR: état bootstrapé, normalisé et validé\n'
