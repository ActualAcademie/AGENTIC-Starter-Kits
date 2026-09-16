#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"

"$script_dir/python.sh" - "$config/project-profile.toml" <<'PY'
import pathlib, sys, tomllib
profile = tomllib.loads(pathlib.Path(sys.argv[1]).read_text())
stack = profile.get('stack', {})
print(f"Projet: {profile.get('project_name', 'inconnu')}")
print(f"Type: {profile.get('project_type', 'inconnu')}")
print(f"Branche d'intégration: {profile.get('integration_branch', 'inconnue')}")
print(f"Langages: {', '.join(stack.get('languages', [])) or 'non renseignés'}")
print(f"Package manager: {stack.get('package_manager') or 'non renseigné'}")
print(f"Runtime: {stack.get('runtime') or 'non renseigné'}")
for name in ('frontend', 'backend', 'database', 'infrastructure', 'security'):
    section = stack.get(name, {})
    values = ', '.join(f"{key}={value}" for key, value in section.items() if value not in ('', False))
    print(f"{name}: {values or 'non renseigné'}")
PY
