#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  if [ "$kit" = codex ]; then hidden=.codex; else hidden=.claude; fi
  script="$root/starter-kit-$kit/$hidden/scripts/sync-workspace-kit.sh"
  bash -n "$script"
  grep -Fq 'backup_parent="$(mktemp -d' "$script"
  grep -Fq 'rmdir "$lock_dir"' "$script"
  if grep -Fq 'backup_root="$project_root/' "$script"; then
    echo "Sauvegarde récursive encore possible pour $kit" >&2
    exit 1
  fi
  if [ "$kit" = claude ] && grep -Fq '"$kit_root/.claude/"' "$script"; then
    echo "Cible Claude imbriquée incorrecte" >&2
    exit 1
  fi
done
echo 'Isolation des sauvegardes de synchronisation Codex/Claude: OK'
