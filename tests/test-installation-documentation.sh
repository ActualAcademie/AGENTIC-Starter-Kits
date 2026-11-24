#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
guide="$root/docs/INSTALLATION.md"

test -f "$guide"
for required in \
  'exclusivement `shared`' \
  'AGENTIC_KIT_HOME' \
  '--kit codex' \
  '--kit claude' \
  '--target' \
  '--briefs-root' \
  '--updates off' \
  'Cahier-des-Charges' \
  'projet déjà existant' \
  'GitFlow'; do
  grep -Fq -- "$required" "$guide"
done

grep -Fq -- 'docs/INSTALLATION.md' "$root/README.md"
grep -Fq -- 'docs/INSTALLATION.md' "$root/starter-kit-codex/README.md"
grep -Fq -- 'docs/INSTALLATION.md' "$root/starter-kit-claude/README.md"
grep -Fq -- 'mode shared' "$root/README.md"
grep -Fq -- 'mode shared' "$root/starter-kit-codex/README.md"
grep -Fq -- 'mode shared' "$root/starter-kit-claude/README.md"

if grep -Fq 'cp -R "$KIT_SOURCE/.codex"' "$root/starter-kit-codex/README.md"; then
  echo 'ancienne installation locale Codex encore documentée' >&2
  exit 1
fi
if grep -Fq 'cp -R "$KIT_SOURCE/.claude"' "$root/starter-kit-claude/README.md"; then
  echo 'ancienne installation locale Claude encore documentée' >&2
  exit 1
fi

bash -n "$root/install.sh"
echo 'installation-documentation: OK'
