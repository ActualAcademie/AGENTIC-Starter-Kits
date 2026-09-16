#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(git -C "$config/.." rev-parse --show-toplevel 2>/dev/null || { echo "Git requis pour valider un push"; exit 1; })"

python3 - "$config/project-profile.toml" <<'PY'
import pathlib, sys, tomllib

profile = tomllib.loads(pathlib.Path(sys.argv[1]).read_text())
capabilities = profile.get('capabilities', {})
commands = profile.get('commands', {})
if capabilities.get('frontend') or capabilities.get('backend'):
    missing = [name for name in ('lint', 'test') if not str(commands.get(name, '')).strip()]
    if missing:
        print(f'ECHEC: commandes obligatoires pour projet applicatif: {", ".join(missing)}')
        raise SystemExit(1)
PY

git -C "$root" diff --check
bash "$script_dir/preflight.sh"
bash "$script_dir/run-project-checks.sh" --execute
echo "Validation avant push OK"
