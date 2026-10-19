#!/usr/bin/env bash
set -euo pipefail
source "$(dirname -- "${BASH_SOURCE[0]}")/hook-runtime.sh"
event="$(cat)"
id="$(printf '%s' "$event" | jq -r '.agent_id // "unknown"' 2>/dev/null || echo unknown)"
report="$(printf '%s' "$event" | jq -r '.report_path // .tool_response.report_path // empty' 2>/dev/null || true)"
if [ -n "$report" ] && [ ! -f "$report" ]; then
  printf '{"decision":"block","reason":"Rapport du sous-agent absent : %s"}\n' "$id"
  exit 0
fi
if [ -z "$report" ]; then
  printf '{"decision":"block","reason":"Rapport spécialiste absent pour %s"}\n' "$id"
  exit 0
fi
role="$(printf '%s' "$event" | jq -r '.agent_role // .role // empty' 2>/dev/null || true)"
if [ -n "$role" ] && [ -x "$config/scripts/verify-agent-report.sh" ]; then
  if ! bash "$config/scripts/verify-agent-report.sh" "$role" "$id" "$report" >/dev/null 2>&1; then
    printf '{"decision":"block","reason":"Rapport spécialiste incomplet ou incohérent pour %s"}\n' "$id"
    exit 0
  fi
fi
log_event "$(date -u '+%Y-%m-%dT%H:%M:%SZ') | subagent_stop | id=$id | report=${report:-absent}"
printf '{"systemMessage":"Sous-agent %s terminé. Vérifier son livrable, les fichiers touchés et la preuve indépendante avant de cocher sa tâche."}\n' "$id"
