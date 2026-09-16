#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 role [low|normal|elevated|critical]"
  exit 2
fi

role="$1"
risk="${2:-normal}"
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"

"$script_dir/python.sh" - "$config/models.toml" "$role" "$risk" <<'PY'
import pathlib, sys, tomllib
models = tomllib.loads(pathlib.Path(sys.argv[1]).read_text())
role, risk = sys.argv[2:]
profile_name = models.get('role_defaults', {}).get(role)
if not profile_name:
    raise SystemExit(f'Rôle inconnu: {role}')
if risk in ('low', 'elevated', 'critical'):
    profile_name = models.get('risk_override', {}).get(risk, profile_name)
profile = models.get('profiles', {}).get(profile_name)
if not profile:
    raise SystemExit(f'Profil de modèle introuvable: {profile_name}')
print(f'profile={profile_name}')
print(f'model={profile["model"]}')
print(f'reasoning_effort={profile["reasoning_effort"]}')
print(f'fallback_model={profile["fallback_model"]}')
print(f'fallback_reasoning_effort={profile["fallback_reasoning_effort"]}')
print(f'purpose={profile["purpose"]}')
PY
