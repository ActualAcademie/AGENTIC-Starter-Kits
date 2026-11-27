#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  hidden=".$kit"
  script="$root/starter-kit-$kit/$hidden/scripts/session-start-gate.sh"
  bash -n "$script"
  grep -Fq 'KIT_SYNC_TIMEOUT_SECONDS:-30' "$script"
  grep -Fq '.sync-attempted' "$script"
  grep -Fq 'synchronisation interrompue après' "$script"
done
echo "Timeout et circuit breaker de synchronisation Codex/Claude: OK"
