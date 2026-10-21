#!/usr/bin/env bash
set -euo pipefail
state="${1:-$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)/RUNTIME-STATE.md}"
[ -s "$state" ] || exit 0
value() { sed -n "s/^- $1:[[:space:]]*//p" "$state" | head -n 1; }
[ "$(value initialization_status)" = active ] || exit 0
started="$(value initialization_started_at)"; actions="$(value initialization_actions)"
[ -n "$started" ] && [[ "$actions" =~ ^[0-9]+$ ]] || { echo "INITIALISATION: compteur ou date absents" >&2; exit 1; }
python3 - "$started" "$actions" <<'PY'
import datetime,sys
start=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00'))
actions=int(sys.argv[2]); minutes=(datetime.datetime.now(datetime.timezone.utc)-start).total_seconds()/60
if minutes>15 or actions>=20:
 print(f"INITIALISATION: budget atteint ({minutes:.1f} minutes, {actions} actions)",file=sys.stderr); raise SystemExit(2)
print("Budget initialisation OK")
PY
