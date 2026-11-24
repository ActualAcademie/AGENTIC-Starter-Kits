#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  if [ "$kit" = codex ]; then hidden=.codex; else hidden=.claude; fi
  source="$root/starter-kit-$kit/$hidden"
  tmp="$(mktemp -d)"
  mkdir -p "$tmp/$hidden/scripts" "$tmp/$hidden/templates"
  cp "$source/scripts/auto-repair-runtime.sh" "$source/scripts/bootstrap-runtime-state.sh" "$source/scripts/normalize-runtime-state.sh" "$source/scripts/validate-runtime-schema.sh" "$tmp/$hidden/scripts/"
  cp "$source/templates/RUNTIME-STATE.md" "$tmp/$hidden/templates/"
  chmod +x "$tmp/$hidden/scripts"/*.sh
  (cd "$tmp" && bash "$hidden/scripts/auto-repair-runtime.sh") >/dev/null
  test -s "$tmp/$hidden/RUNTIME-STATE.md"
  grep -q '^- goal_budget: 100000$' "$tmp/$hidden/RUNTIME-STATE.md"
  grep -q '^- native_goal_status:' "$tmp/$hidden/RUNTIME-STATE.md"
  grep -q '^- next_action: ' "$tmp/$hidden/RUNTIME-STATE.md"
  rm -rf "$tmp"
done

for gate in \
  "$root/starter-kit-codex/.codex/scripts/session-start-gate.sh" \
  "$root/starter-kit-claude/.claude/scripts/session-start-gate.sh"; do
  ! grep -Fq 'if [ -L "$entry" ]' "$gate"
  grep -Fq 'auto-repair-runtime.sh' "$gate"
done

echo 'runtime-auto-repair: OK'
