#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  if [ "$kit" = codex ]; then hidden=.codex; else hidden=.claude; fi
  test -f "$root/starter-kit-$kit/$hidden/policies/INTERACTIVE-INPUT-POLICY.md"
  test -f "$root/starter-kit-$kit/$hidden/skills/project-intake/SKILL.md"
  test -f "$root/starter-kit-$kit/$hidden/scripts/request-user-input.sh"
  grep -Fq 'interface interactive native' "$root/starter-kit-$kit/$hidden/skills/project-intake/SKILL.md"
  grep -Fq 'pending_request_id' "$root/starter-kit-$kit/$hidden/skills/project-intake/SKILL.md"
  grep -Fq 'INTERACTIVE-INPUT-POLICY.md' "$root/starter-kit-$kit/$hidden/ORCHESTRATION.md"
  bash -n "$root/starter-kit-$kit/$hidden/scripts/request-user-input.sh"
done
echo "Initialisation interactive persistante Codex/Claude: OK"
