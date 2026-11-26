#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
if root="$(git rev-parse --show-toplevel 2>/dev/null)"; then state="$root/.codex/RUNTIME-STATE.md"; else state="$(cd "$script_dir/.." && pwd)/RUNTIME-STATE.md"; fi
[ "$#" -ge 2 ] || { echo "Usage: $0 REQUEST_ID ANSWER" >&2; exit 2; }
request_id="$1"; answer="$2"
value() { sed -n "s/^-\{0,1\}[[:space:]]*$1:[[:space:]]*//p" "$state" | head -n 1; }
[ -f "$state" ] || { echo "INPUT: RUNTIME-STATE.md absent" >&2; exit 1; }
[ "$request_id" = "none" ] && [ "$(value pending_request_id)" = "none" ] && [ "$(value required_action_status)" != "pending" ] && { echo "INPUT: aucune réponse en attente; état déjà résolu"; exit 0; }
[ "$(value pending_request_id)" = "$request_id" ] || { echo "INPUT: demande différente ou déjà résolue" >&2; exit 3; }
[ "$(value required_action_status)" = "pending" ] || { echo "INPUT: aucune réponse en attente" >&2; exit 3; }
safe_answer="$(printf '%s' "$answer" | tr '\n' ' ' | sed 's/[|]/-/g; s/^[[:space:]]*//; s/[[:space:]]*$//')"
[ -n "$safe_answer" ] || { echo "INPUT: réponse vide refusée" >&2; exit 2; }
choices="$(value pending_request_choices)"
response_id="$safe_answer"; response_kind=custom
if [[ "$safe_answer" =~ ^[0-9]+$ ]]; then
  IFS=',' read -r -a choice_array <<< "$choices"
  index=$((safe_answer - 1))
  [ "$index" -ge 0 ] && [ "$index" -lt "${#choice_array[@]}" ] || { echo "INPUT: numéro de choix invalide" >&2; exit 2; }
  response_id="${choice_array[$index]}"; response_kind=choice
elif [ "$choices" != "none" ] && [[ ",$choices," == *",$safe_answer,"* ]]; then
  response_kind=choice
fi
now="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
REQUEST_ID="$request_id" RESPONSE="$safe_answer" RESPONSE_ID="$response_id" RESPONSE_KIND="$response_kind" NOW="$now" perl -0pi -e 's/^- execution_status:.*$/- execution_status: running/m; s/^- session_status:.*$/- session_status: active/m; s/^- pending_request_id:.*$/- pending_request_id: resolved/m; s/^- pending_turn_id:.*$/- pending_turn_id: resolved/m; s/^- required_action_status:.*$/- required_action_status: resolved/m; s/^- current_action:.*$/- current_action: user-response-$ENV{REQUEST_ID}/m; s/^- next_action:.*$/- next_action: process-user-response-$ENV{REQUEST_ID}/m; s/^- last_observable_evidence:.*$/- last_observable_evidence: $ENV{NOW} | user-response-$ENV{REQUEST_ID}/m; s/^- goal_status: complete$/- goal_status: active/m; s/^- goal_delivery_status: verified$/- goal_delivery_status: pending/m; s/^- pending_request_question:.*$/- pending_request_question: resolved/m; s/^- pending_request_choices:.*$/- pending_request_choices: none/m; s/^- user_response:.*$/- user_response: $ENV{RESPONSE}/m; s/^- user_response_id:.*$/- user_response_id: $ENV{RESPONSE_ID}/m; s/^- user_response_kind:.*$/- user_response_kind: $ENV{RESPONSE_KIND}/m' "$state"
if ! grep -q '^\- user_response:' "$state"; then printf '\n- user_response: %s\n' "$safe_answer" >> "$state"; fi
grep -q '^\- user_response_id:' "$state" || printf '%s\n' "- user_response_id: $response_id" >> "$state"
grep -q '^\- user_response_kind:' "$state" || printf '%s\n' "- user_response_kind: $response_kind" >> "$state"
printf 'INPUT RESOLVED [%s] %s\n' "$request_id" "$safe_answer"
