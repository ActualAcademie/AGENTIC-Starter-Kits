#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
  echo "Usage: $0 AGENT_ID ATTEMPTS SIGNATURE [MAX_ATTEMPTS]" >&2
  exit 2
fi
agent_id="$1"; attempts="$2"; signature="$3"; max_attempts="${4:-2}"
[[ -n "$agent_id" && "$agent_id" != "pending" ]] || { echo "AGENT_LOOP: identifiant réel requis" >&2; exit 2; }
[[ "$attempts" =~ ^[0-9]+$ && "$max_attempts" =~ ^[0-9]+$ ]] || { echo "AGENT_LOOP: compte invalide" >&2; exit 2; }
[[ -n "$signature" ]] || { echo "AGENT_LOOP: signature requise" >&2; exit 2; }
if (( attempts > max_attempts )); then
  echo "AGENT_LOOP: arrêt obligatoire, même blocage répété pour $agent_id" >&2
  exit 1
fi
printf 'AGENT_LOOP: OK agent=%s tentative=%s contexte=neuf_apres_echec\n' "$agent_id" "$attempts"
