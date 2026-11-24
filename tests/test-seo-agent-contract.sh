#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex="$root/starter-kit-codex/.codex"
claude="$root/starter-kit-claude/.claude"

test -f "$codex/agents/seo.toml"
test -f "$claude/agents/seo.md"
test -f "$codex/policies/SEO-GEO-EEAT-POLICY.md"
test -f "$claude/policies/SEO-GEO-EEAT-POLICY.md"

grep -Fq 'model_profile = "audit"' "$codex/agents/seo.toml"
grep -Fq 'quality-audit' "$codex/agents/seo.toml"
grep -Fq 'SEO-GEO-EEAT-POLICY.md' "$codex/agents/seo.toml"
grep -Fq 'SEO-GEO-EEAT-POLICY.md' "$claude/agents/seo.md"
grep -Fq '[seo]' "$codex/SPECIALIST-CONTRACTS.toml"
grep -Fq '[seo]' "$claude/SPECIALIST-CONTRACTS.toml"
grep -Fq 'seo = "audit"' "$codex/models.toml"
grep -Fq '| `seo` |' "$codex/SPECIALIST-AGENTS.md"
grep -Fq '| `seo` |' "$claude/SPECIALIST-AGENTS.md"

echo "Contrat SEO, GEO et E-E-A-T: OK"
