#!/usr/bin/env bash
set -euo pipefail
event="$(cat)"
active="$(printf '%s' "$event" | jq -r '.stop_hook_active // false' 2>/dev/null || echo false)"
[ "$active" = "true" ] && exit 0
source "$(dirname -- "${BASH_SOURCE[0]}")/hook-runtime.sh"
rm -f "$project_root/.codex/runtime-events.log.lock" 2>/dev/null || true
state="$project_root/.codex/RUNTIME-STATE.md"
if [ -f "$state" ]; then
  status="$(sed -n 's/^- execution_status: //p' "$state" | head -1)"
  pending="$(sed -n 's/^- pending_request_id: //p' "$state" | head -1)"
  repeats="$(sed -n 's/^- blocker_repeat_count: //p' "$state" | head -1)"
  if [[ "$status" =~ ^(blocked|needs-review|waiting-for-user)$ ]] && { [ "$pending" != "none" ] || [[ "$repeats" =~ ^[2-9][0-9]*$ ]]; }; then
    printf '{"decision":"allow","reason":"État en attente enregistré; aucune reprise automatique répétitive avant nouvel événement."}\n'
    exit 0
  fi
fi
if ! run_with_timeout 30 bash "$project_root/.codex/scripts/guard-before-response.sh" >/dev/null 2>&1; then
  printf '{"decision":"block","reason":"La clôture est refusée : le Goal, la prochaine action, les preuves ou la livraison ne sont pas vérifiés. Reprendre automatiquement la prochaine action autonome."}\n'
fi
