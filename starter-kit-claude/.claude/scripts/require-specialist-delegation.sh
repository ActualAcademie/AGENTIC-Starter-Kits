#!/usr/bin/env bash
set -euo pipefail
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
state="$config/RUNTIME-STATE.md"
[ -s "$state" ] || { echo "AGENTS: état runtime absent" >&2; exit 1; }
value() { sed -n "s/^- $1:[[:space:]]*//p" "$state" | head -n 1; }
status="$(value execution_status)"; goal="$(value goal_status)"; plan="$(value goal_delegation_plan)"
agents="$(value goal_agents_created)"; assignments="$(value goal_agent_assignments)"; evidence="$(value goal_agent_evidence)"
case "$status:$goal" in running:active|waiting-ci:active) ;; *) echo "AGENTS: aucun Goal actif avec délégation vérifiable" >&2; exit 1;; esac
[ -n "$plan" ] && [ "$plan" != "none" ] && [ "$plan" != "[[A_COMPLETER]]" ] || { echo "AGENTS: plan de délégation obligatoire avant toute tâche" >&2; exit 1; }
if [ "$plan" != "séquentiel justifié" ]; then
  for current in "$agents" "$assignments" "$evidence"; do
    [ -n "$current" ] && [ "$current" != "none" ] && [ "$current" != "[[A_COMPLETER]]" ] || { echo "AGENTS: délégation spécialiste incomplète" >&2; exit 1; }
  done
  IFS=',' read -r -a entries <<< "$agents"
  for entry in "${entries[@]}"; do [[ "$entry" == *@* ]] && [ -n "${entry#*@}" ] && [ "${entry#*@}" != pending ] || { echo "AGENTS: spécialiste non créé: $entry" >&2; exit 1; }; done
fi
echo "Délégation spécialiste obligatoire vérifiée"
