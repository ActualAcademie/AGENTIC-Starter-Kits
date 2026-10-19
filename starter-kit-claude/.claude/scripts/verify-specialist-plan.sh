#!/usr/bin/env bash
set -euo pipefail
domain="${1:-}"; agents="${2:-}"; evidence="${3:-}"
[ -n "$domain" ] && [ -n "$agents" ] && [ -n "$evidence" ] || { echo "AGENTS: domaine, agents et preuve requis" >&2; exit 1; }
case "$domain" in
  visual|frontend|responsive)
    for role in frontend qa auditeur; do
      found=false
      IFS=',' read -r -a entries <<< "$agents"
      for entry in "${entries[@]}"; do
        case "$entry" in
          "$role"@*) [ "${entry#*@}" != "" ] && [ "${entry#*@}" != "pending" ] && found=true ;;
        esac
      done
      [ "$found" = true ] || { echo "AGENTS: $role doit être créé avec un identifiant réel (format role@id)" >&2; exit 1; }
    done
    ;;
esac
IFS=',' read -r -a all_entries <<< "$agents"
[ "${#all_entries[@]}" -gt 0 ] || { echo "AGENTS: aucun spécialiste réel déclaré" >&2; exit 1; }
[ -d "$evidence" ] || { echo "AGENTS: preuve de délégation absente: $evidence" >&2; exit 1; }
for entry in "${all_entries[@]}"; do
  role="${entry%@*}"; agent_id="${entry#*@}"
  [ "$role" != "$entry" ] && [ -n "$role" ] && [ -n "$agent_id" ] && [ "$agent_id" != "pending" ] || {
    echo "AGENTS: chaque spécialiste doit avoir un identifiant réel au format role@id" >&2; exit 1;
  }
  [ -s "$evidence/$role.assignment" ] || { echo "AGENTS: affectation absente pour $role" >&2; exit 1; }
  assignment="$evidence/$role.assignment"
  for field in scope deliverable evidence; do
    grep -Eq "^${field}=" "$assignment" || { echo "AGENTS: $role.assignment doit préciser $field" >&2; exit 1; }
  done
done
scopes="$(for entry in "${all_entries[@]}"; do grep '^scope=' "$evidence/${entry%@*}.assignment" | cut -d= -f2-; done)"
[ "$(printf '%s\n' "$scopes" | sort | uniq -d | sed '/^$/d' | wc -l | tr -d ' ')" -eq 0 ] || {
  echo "AGENTS: chevauchement de périmètres détecté" >&2; exit 1;
}
echo "Plan spécialisé vérifié: domaine=$domain agents=$agents preuves=$evidence"
