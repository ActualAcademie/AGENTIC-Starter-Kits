#!/usr/bin/env bash
set -euo pipefail
if root="$(git rev-parse --show-toplevel 2>/dev/null)" && [ -f "$root/.codex/RUNTIME-STATE.md" ]; then state="$root/.codex/RUNTIME-STATE.md"; else state="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)/RUNTIME-STATE.md"; fi
value() { sed -n "s/^-[[:space:]]*$1:[[:space:]]*//p" "$state" | head -n 1; }
count="$(value blocker_repeat_count)"; action="$(value next_action)"; previous="$(value previous_blocked_action)"; attempts="$(value attempt_count)"; max_attempts="$(value max_attempts)"
if [[ "$count" =~ ^[0-9]+$ ]] && [ "$count" -ge 2 ] && [ -n "$action" ] && [ "$action" = "$previous" ]; then
  echo "BOUCLE BLOQUANTE: même blocage répété; changer d'approche et exécuter une alternative avant toute conclusion." >&2
  exit 1
fi
if [ -z "$count" ] && [[ "$attempts" =~ ^[0-9]+$ && "$max_attempts" =~ ^[0-9]+$ ]] && [ "$attempts" -ge "$max_attempts" ] && [ -n "$action" ]; then
  echo "BOUCLE BLOQUANTE: compteur de tentatives atteint; produire une alternative avant reprise." >&2
  exit 1
fi
echo "Garde anti-boucle OK"
