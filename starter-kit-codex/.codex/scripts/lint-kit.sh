#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(cd "$config/../.." && pwd)"

while IFS= read -r -d '' file; do
  bash -n "$file"
done < <(find "$config" -type f -name '*.sh' -print0)

"$script_dir/python.sh" - "$config" <<'PY'
from pathlib import Path
import sys, tomllib
config = Path(sys.argv[1])
errors = []
for path in config.rglob('*'):
    if not path.is_file():
        continue
    if path.suffix == '.toml':
        try:
            tomllib.loads(path.read_text())
        except Exception as exc:
            errors.append(f'{path}: TOML invalide: {exc}')
    if path.suffix in {'.md', '.toml'}:
        text = path.read_text()
        if not text.endswith('\n'):
            errors.append(f'{path}: saut de ligne final manquant')
        if '\t' in text:
            errors.append(f'{path}: tabulation interdite')
        if any(line.rstrip() != line for line in text.splitlines()):
            errors.append(f'{path}: espace final interdit')
        if '\u2014' in text:
            errors.append(f'{path}: tiret cadratin interdit')
        if path.suffix == '.md' and text.count('```') % 2:
            errors.append(f'{path}: blocs Markdown non équilibrés')
if errors:
    print('\n'.join(errors))
    raise SystemExit(1)
print(f'Lint kit OK: {config.name}')
PY
