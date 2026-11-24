#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  hidden="$root/starter-kit-$kit/.${kit}"
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  mkdir -p "$tmp/assignments"
  cat > "$tmp/assignments/frontend.assignment" <<'EOF'
thread=frontend-real
scope=independent frontend implementation
deliverable=frontend report
evidence=frontend evidence
report=reports/frontend.md
EOF
  bash "$hidden/scripts/verify-specialist-plan.sh" general 'frontend@frontend-real' "$tmp/assignments" >/dev/null

  if bash "$hidden/scripts/verify-specialist-plan.sh" general 'coordinateur@coordinateur-real' "$tmp/assignments" >/dev/null 2>&1; then
    echo "Le Coordinateur a été accepté comme spécialiste pour $kit" >&2
    exit 1
  fi
  if bash "$hidden/scripts/verify-specialist-plan.sh" general 'inconnu@unknown-real' "$tmp/assignments" >/dev/null 2>&1; then
    echo "Un rôle absent du registre a été accepté pour $kit" >&2
    exit 1
  fi
  if bash "$hidden/scripts/verify-specialist-plan.sh" general 'frontend@other-thread' "$tmp/assignments" >/dev/null 2>&1; then
    echo "Un thread différent de l'affectation a été accepté pour $kit" >&2
    exit 1
  fi
  sed -i.bak '/^report=/d' "$tmp/assignments/frontend.assignment"
  if bash "$hidden/scripts/verify-specialist-plan.sh" general 'frontend@frontend-real' "$tmp/assignments" >/dev/null 2>&1; then
    echo "Une affectation sans rapport a été acceptée pour $kit" >&2
    exit 1
  fi
  rm -rf "$tmp"
  trap - EXIT
done
echo "Frontières de rôles spécialistes Codex/Claude: OK"
