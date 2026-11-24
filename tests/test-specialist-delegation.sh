#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  hidden="$root/starter-kit-$kit/.${kit}"
  tmp="$(mktemp -d)"
  evidence="$tmp/assignments"
  mkdir -p "$evidence"
  for role in frontend qa; do
    cat > "$evidence/$role.assignment" <<EOF
thread=thread-$role
scope=$role independent review
deliverable=$role report
evidence=$role evidence
report=reports/$role.md
EOF
  done
  bash "$hidden/scripts/verify-specialist-plan.sh" general 'frontend@thread-frontend,qa@thread-qa' "$evidence" >/dev/null
  if bash "$hidden/scripts/verify-specialist-plan.sh" general 'frontend@thread-1,qa@pending' "$evidence" >/dev/null 2>&1; then
    echo "Identifiant pending accepté pour $kit" >&2
    exit 1
  fi
  cat > "$evidence/qa.assignment" <<EOF
thread=thread-qa
scope=frontend independent review
deliverable=qa report
evidence=qa evidence
report=reports/qa.md
EOF
  if bash "$hidden/scripts/verify-specialist-plan.sh" general 'frontend@thread-frontend,qa@thread-qa' "$evidence" >/dev/null 2>&1; then
    echo "Chevauchement de périmètre accepté pour $kit" >&2
    exit 1
  fi
  rm -rf "$tmp"
done
echo "Délégation réelle et périmètres spécialisés Codex/Claude: OK"
