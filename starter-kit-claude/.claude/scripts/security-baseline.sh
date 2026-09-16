#!/usr/bin/env bash
set -euo pipefail

mode="preview"
if [ "${1:-}" = "--execute" ]; then mode="execute"; fi
if [ "${1:-}" != "" ] && [ "${1:-}" != "--execute" ]; then echo "Usage: $0 [--execute]"; exit 2; fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(git -C "$config/.." rev-parse --show-toplevel 2>/dev/null || cd "$config/.." && pwd)"

python3 - "$config/project-profile.toml" "$root" "$mode" <<'PY'
import pathlib, subprocess, sys, tomllib

profile_path = pathlib.Path(sys.argv[1])
root = pathlib.Path(sys.argv[2])
mode = sys.argv[3]
profile = tomllib.loads(profile_path.read_text())
stack_security = profile.get('stack', {}).get('security', {})
capabilities = profile.get('capabilities', {})
commands = profile.get('commands', {})
failed = False

for path in root.rglob('.env*'):
    if any(part in {'.git', 'node_modules', '.venv', 'vendor'} for part in path.parts):
        continue
    if path.name not in {'.env.example', '.env.sample', '.env.template'}:
        print(f'ECHEC: fichier environnement versionnable ou présent: {path.relative_to(root)}')
        failed = True

if capabilities.get('authentication'):
    for field in ('authentication', 'authorization'):
        if not str(stack_security.get(field, '')).strip():
            print(f'ECHEC: stack.security.{field} requis lorsque authentication est activé')
            failed = True

command = str(commands.get('security', '')).strip()
if command:
    print(f'CONTROLE SECURITE: {command}')
    if mode == 'execute':
        result = subprocess.run(command, shell=True, cwd=root)
        if result.returncode:
            print(f'ECHEC: commande sécurité: {result.returncode}')
            failed = True
else:
    print('AVERTISSEMENT: commands.security non configuré, contrôle spécifique à la stack absent')

if failed:
    raise SystemExit(1)
print('Socle cybersécurité OK')
PY
