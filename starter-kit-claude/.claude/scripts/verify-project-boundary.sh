#!/usr/bin/env bash
set -euo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
forbidden='agentic|agentic starter kits|starter kit|\.codex|\.claude'
violations=()
while IFS= read -r -d '' file; do
  case "$file" in
    .codex/*|.claude/*|AGENTS.md|CLAUDE.md) continue ;;
  esac
  if rg -n -i --hidden --glob '!node_modules/**' --glob '!.git/**' "$forbidden" "$root/$file" >/dev/null 2>&1; then
    violations+=("$file")
  fi
done < <(git -C "$root" ls-files -z)

if [ "${#violations[@]}" -gt 0 ]; then
  printf '%s\n' "FRONTIÈRE PROJET: références interdites détectées dans :" "${violations[@]}"
  exit 1
fi
echo "Frontière projet OK: aucun détail interne exposé dans les livrables suivis."
