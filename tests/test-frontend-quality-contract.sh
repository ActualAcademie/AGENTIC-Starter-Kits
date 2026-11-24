#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex_agent="$root/starter-kit-codex/.codex/agents/frontend.toml"
claude_agent="$root/starter-kit-claude/.claude/agents/frontend.md"
codex_policy="$root/starter-kit-codex/.codex/policies/FRONTEND-QUALITY-POLICY.md"
claude_policy="$root/starter-kit-claude/.claude/policies/FRONTEND-QUALITY-POLICY.md"

for file in "$codex_agent" "$claude_agent" "$codex_policy" "$claude_policy"; do
  test -f "$file" || { echo "Fichier frontend absent: $file" >&2; exit 1; }
done

grep -Fq 'FRONTEND-QUALITY-POLICY.md' "$codex_agent"
grep -Fq 'FRONTEND-QUALITY-POLICY.md' "$claude_agent"

for policy in "$codex_policy" "$claude_policy"; do
  grep -Fq 'composition indépendante' "$policy"
  grep -Fq 'Architecture obligatoire' "$policy"
  grep -Fq 'inventaire de réutilisation' "$policy"
  grep -Fq 'audit complet' "$policy"
  grep -Fq 'même SHA final' "$policy"
done

grep -Fq 'carte de composition' "$codex_agent"
grep -Fq 'composants monolithiques' "$codex_policy"
grep -Fq 'carte de composition' "$claude_agent"
grep -Fq 'composants monolithiques' "$claude_policy"

echo "Contrat frontend premium et maintenable: OK"
