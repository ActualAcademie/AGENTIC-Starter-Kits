#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  hidden=".${kit}"
  discovery="$root/starter-kit-$kit/$hidden/policies/TOOL-DISCOVERY-POLICY.md"
  recovery="$root/starter-kit-$kit/$hidden/policies/AUTONOMY-AND-RECOVERY.md"
  for phrase in \
    'session utilisateur déjà ouverte' \
    'connecteur équivalent' \
    'CLI ou API authentifiée' \
    'Après deux échecs de nature identique' \
    'tâches indépendantes'; do
    grep -Fq "$phrase" "$discovery" || { echo "Récupération outil absente pour $kit: $phrase" >&2; exit 1; }
  done
  grep -Fq 'changer de voie après deux échecs identiques' "$recovery" || { echo "Limite anti-boucle absente pour $kit" >&2; exit 1; }
  grep -Fq "ne clôture pas le Goal tant qu'une action autonome reste possible" "$recovery" || { echo "Continuité autonome absente pour $kit" >&2; exit 1; }
done
echo 'Récupération outils et navigateur Codex/Claude: OK'
