#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
missing=0
for tool in bash rg; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf 'OK: %s\n' "$tool"
  else
    printf 'MANQUANT: %s\n' "$tool"
    missing=1
  fi
done

if git --version >/dev/null 2>&1; then echo "OK: git"; else echo "OPTIONNEL INDISPONIBLE: git"; fi

if "$script_dir/python.sh" --version >/dev/null 2>&1; then
  echo "OK: Python compatible"
else
  echo "MANQUANT: Python 3"
  missing=1
fi
"$script_dir/python.sh" - <<'PY'
import sys
if sys.version_info < (3, 11): raise SystemExit('Python 3.11 ou supérieur est requis')
print(f'OK: python {sys.version_info.major}.{sys.version_info.minor}')
PY
exit "$missing"
