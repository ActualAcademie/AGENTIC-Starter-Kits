#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
for kit in codex claude; do
  hidden=".${kit}"
  tmp="$(mktemp -d)"
  mkdir -p "$tmp/$hidden/scripts"
  cp "$root/starter-kit-$kit/$hidden/scripts/request-user-input.sh" "$tmp/$hidden/scripts/"
  cp "$root/starter-kit-$kit/$hidden/scripts/resolve-user-input.sh" "$tmp/$hidden/scripts/"
  git -C "$tmp" init -q
  (cd "$tmp" && bash "$hidden/scripts/request-user-input.sh" intake "Choisir le mode" local "Local" github "GitHub") >/dev/null
  grep -q '^- pending_request_id: intake$' "$tmp/$hidden/RUNTIME-STATE.md"
  grep -q '^- pending_request_choices: local,github$' "$tmp/$hidden/RUNTIME-STATE.md"
  if (cd "$tmp" && bash "$hidden/scripts/request-user-input.sh" other "Écrasement interdit" x "X") >/dev/null 2>&1; then exit 1; fi
  if (cd "$tmp" && bash "$hidden/scripts/resolve-user-input.sh" intake 3 >/dev/null 2>&1); then exit 1; fi
  (cd "$tmp" && bash "$hidden/scripts/resolve-user-input.sh" intake 2) >/dev/null
  grep -q '^- pending_request_id: resolved$' "$tmp/$hidden/RUNTIME-STATE.md"
  grep -q '^- user_response_id: github$' "$tmp/$hidden/RUNTIME-STATE.md"
  grep -q '^- user_response_kind: choice$' "$tmp/$hidden/RUNTIME-STATE.md"
  (cd "$tmp" && bash "$hidden/scripts/request-user-input.sh" special 'Réponse spéciale' custom 'Personnalisé' other 'Autre') >/dev/null
  (cd "$tmp" && bash "$hidden/scripts/resolve-user-input.sh" special 'valeur avec $ et "guillemets"') >/dev/null
  grep -Fq -- '- user_response: valeur avec $ et "guillemets"' "$tmp/$hidden/RUNTIME-STATE.md"
  rm -rf "$tmp"
done
echo 'Réponses interactives persistantes Codex/Claude: OK'
