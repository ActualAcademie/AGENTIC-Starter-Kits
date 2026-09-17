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

for optional_tool in docker node npm pnpm yarn bun deno cargo go ruby java mvn playwright; do
  if command -v "$optional_tool" >/dev/null 2>&1; then
    version="$($optional_tool --version 2>/dev/null | head -n 1 || true)"
    printf 'DISPONIBLE: %s %s\n' "$optional_tool" "$version"
  else
    printf 'NON DISPONIBLE: %s\n' "$optional_tool"
  fi
done

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
