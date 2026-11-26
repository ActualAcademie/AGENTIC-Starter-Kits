#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
if root="$(git rev-parse --show-toplevel 2>/dev/null)"; then config="$root/.codex"; else config="$(cd "$script_dir/.." && pwd)"; fi
mkdir -p "$config"
state="$config/RUNTIME-STATE.md"
[ "$#" -ge 6 ] || { echo "Usage: $0 <id> <question> <choice-id> <choice-label> ..." >&2; exit 2; }
request_id="$1"; question="$2"; shift 2
[ "$request_id" != "none" ] && [[ "$request_id" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Identifiant de demande invalide." >&2; exit 2; }
[ $(( $# % 2 )) -eq 0 ] || { echo "Chaque choix doit avoir un identifiant et un libellé." >&2; exit 2; }
if [ ! -f "$state" ]; then
  printf '%s\n' '# État d’exécution agentique' '' '## Identité' '' '- execution_status: running' '- session_status: active' '- goal_status: active' '- pending_request_id: none' '- pending_turn_id: none' '- required_action_status: none' '- current_action: bootstrap-runtime-state' '- next_action: resume-after-user-response' '- last_observable_evidence: runtime-state-created-by-interactive-request' > "$state"
fi
current_request="$(sed -n 's/^- pending_request_id:[[:space:]]*//p' "$state" | head -1)"
if [ "$current_request" != "none" ] && [ "$current_request" != "resolved" ]; then
  [ "$current_request" = "$request_id" ] && { echo "INPUT: demande déjà en attente [$request_id]"; exit 0; }
  echo "INPUT: une autre demande est déjà en attente [$current_request]" >&2
  exit 3
fi
now="$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
choice_ids=""
while [ "$#" -gt 0 ]; do
  choice_id="$1"; choice_label="$2"; shift 2
  [[ "$choice_id" =~ ^[A-Za-z0-9._-]+$ ]] || { echo "Identifiant de choix invalide: $choice_id" >&2; exit 2; }
  choice_ids="${choice_ids}${choice_ids:+,}${choice_id}"
done
safe_question="$(printf '%s' "$question" | tr '\n' ' ' | sed 's/[|]/-/g')"
REQUEST_ID="$request_id" NOW="$now" QUESTION="$safe_question" CHOICES="$choice_ids" perl -0pi -e 's/^- execution_status:.*$/- execution_status: waiting-for-user/m; s/^- session_status:.*$/- session_status: waiting-for-user/m; s/^- pending_request_id:.*$/- pending_request_id: $ENV{REQUEST_ID}/m; s/^- pending_turn_id:.*$/- pending_turn_id: user-response-required/m; s/^- required_action_status:.*$/- required_action_status: pending/m; s/^- current_action:.*$/- current_action: waiting-for-user/m; s/^- next_action:.*$/- next_action: resume-after-user-response/m; s/^- last_observable_evidence:.*$/- last_observable_evidence: $ENV{NOW} | questionnaire-emitted-$ENV{REQUEST_ID}/m; s/^- pending_request_question:.*$/- pending_request_question: $ENV{QUESTION}/m; s/^- pending_request_choices:.*$/- pending_request_choices: $ENV{CHOICES}/m' "$state"
grep -q '^- pending_request_question:' "$state" || printf '%s\n' "- pending_request_question: $safe_question" >> "$state"
grep -q '^- pending_request_choices:' "$state" || printf '%s\n' "- pending_request_choices: $choice_ids" >> "$state"
printf 'WAITING-FOR-USER [%s]\n%s\n' "$request_id" "$question"
number=1
while [ "$#" -gt 0 ]; do printf '%s) %s [%s]\n' "$number" "$2" "$1"; shift 2; number=$((number + 1)); done
printf 'Réponds avec le numéro ou l identifiant. Aucune reprise automatique avant ta réponse.\n'
