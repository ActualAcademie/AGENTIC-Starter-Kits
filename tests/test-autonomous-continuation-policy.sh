#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  if [ "$kit" = codex ]; then hidden=.codex; else hidden=.claude; fi
  policy="$root/starter-kit-$kit/$hidden/policies/AUTONOMOUS-CONTINUATION-POLICY.md"
  orchestration="$root/starter-kit-$kit/$hidden/ORCHESTRATION.md"
  test -s "$policy"
  for phrase in 'recoverable-local' 'specialist-solvable' 'alternative-solvable' 'out-of-scope' 'critical-human' 'Deux échecs' 'GitHub Projects comme à Trello' 'identifiant réel'; do
    grep -Fq "$phrase" "$policy"
  done
  grep -Fq 'AUTONOMOUS-CONTINUATION-POLICY.md' "$orchestration"
done

echo 'autonomous-continuation-policy: parité fonctionnelle Codex/Claude vérifiée'
