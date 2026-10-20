#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
state="${1:-$(cd "$script_dir/.." && pwd)/RUNTIME-STATE.md}"
[ -s "$state" ] || { echo "RUNTIME: fichier absent" >&2; exit 1; }
duplicates="$(awk '/^- [A-Za-z0-9_]+:/{key=$2; sub(/:$/, "", key); count[key]++; if(count[key]>1) print key}' "$state" | sort -u)"
[ -z "$duplicates" ] || { echo "RUNTIME: clés dupliquées: $duplicates" >&2; exit 2; }
for key in execution_status goal_status current_action next_action last_observable_evidence goal_budget; do
  grep -Eq "^- $key:[[:space:]]*[^[:space:]].*" "$state" || { echo "RUNTIME: champ obligatoire absent: $key" >&2; exit 3; }
done
budget="$(sed -n 's/^- goal_budget:[[:space:]]*//p' "$state")"
case "$budget" in unlimited|none|\[\[A_COMPLETER\]\]|'') echo "RUNTIME: budget Goal non borné ou incomplet" >&2; exit 4;; esac
echo "Schéma runtime canonique vérifié"
