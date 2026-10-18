#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
state="$config/RUNTIME-STATE.md"
[ -f "$state" ] || { echo "RUNTIME-STATE.md absent: état non sauvegardé." >&2; exit 1; }
cp "$state" "$config/.kit-update-resume-state"
perl -0pi -e 's/execution_status: [^\n]*/execution_status: paused-kit-update/; s/session_status: [^\n]*/session_status: paused-kit-update/; s/next_action: [^\n]*/next_action: restore-kit-update-state-and-resume/' "$state"
echo "KIT-UPDATE: travail suspendu; livrer vers dev puis exécuter resume-kit-update.sh"
