#!/usr/bin/env bash
set -euo pipefail
role="${1:-}"
agent_id="${2:-}"
report="${3:-}"
[ -n "$role" ] && [ -n "$agent_id" ] && [ -n "$report" ] || { echo "RAPPORT: rôle, identifiant et chemin requis" >&2; exit 1; }
[ -s "$report" ] || { echo "RAPPORT: livrable absent ou vide pour $role@$agent_id" >&2; exit 1; }
grep -Eq '^agent_role:[[:space:]]*' "$report" || { echo "RAPPORT: agent_role manquant" >&2; exit 1; }
grep -Eq '^agent_id:[[:space:]]*' "$report" || { echo "RAPPORT: agent_id manquant" >&2; exit 1; }
grep -Eq '^status:[[:space:]]*(accepted|rework|blocked)$' "$report" || { echo "RAPPORT: status accepted, rework ou blocked requis" >&2; exit 1; }
grep -Eq '^scope:[[:space:]]*[^[:space:]].*' "$report" || { echo "RAPPORT: scope manquant" >&2; exit 1; }
grep -Eq '^evidence:[[:space:]]*[^[:space:]].*' "$report" || { echo "RAPPORT: evidence manquante" >&2; exit 1; }
grep -Eq '^next_action:[[:space:]]*[^[:space:]].*' "$report" || { echo "RAPPORT: next_action manquante" >&2; exit 1; }
actual_role="$(sed -n 's/^agent_role:[[:space:]]*//p' "$report" | head -1)"
actual_id="$(sed -n 's/^agent_id:[[:space:]]*//p' "$report" | head -1)"
[ "$actual_role" = "$role" ] || { echo "RAPPORT: rôle incohérent ($actual_role != $role)" >&2; exit 1; }
[ "$actual_id" = "$agent_id" ] || { echo "RAPPORT: identifiant incohérent ($actual_id != $agent_id)" >&2; exit 1; }
echo "Rapport spécialiste vérifié: $role@$agent_id"
