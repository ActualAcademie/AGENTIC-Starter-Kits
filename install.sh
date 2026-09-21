#!/usr/bin/env bash
set -euo pipefail

kit=""; target="."; force=false
while [ "$#" -gt 0 ]; do
  case "$1" in
    --kit) kit="$2"; shift 2 ;;
    --target) target="$2"; shift 2 ;;
    --force) force=true; shift ;;
    -h|--help) echo "Usage: ./install.sh --kit codex|claude [--target PATH] [--force]"; exit 0 ;;
    *) echo "Option inconnue: $1" >&2; exit 2 ;;
  esac
done
case "$kit" in
  codex) source_dir=starter-kit-codex; entry=AGENTS.md; hidden=.codex ;;
  claude) source_dir=starter-kit-claude; entry=CLAUDE.md; hidden=.claude ;;
  *) echo "Choisissez --kit codex ou --kit claude." >&2; exit 2 ;;
esac
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="$(cd "$target" && pwd)"
[ "$force" = true ] || { [ ! -e "$target/$entry" ] && [ ! -e "$target/$hidden" ]; } || { echo "Un kit existe déjà. Utilisez --force après vérification." >&2; exit 1; }
cp -R "$repo_root/$source_dir/$entry" "$target/$entry"
cp -R "$repo_root/$source_dir/$hidden" "$target/$hidden"
mkdir -p "$target/.github/workflows"
cp "$repo_root/$source_dir/$hidden/templates/github/workflows/update-agentic-starter-kit.yml" "$target/.github/workflows/update-agentic-starter-kit.yml"
echo "Kit $kit installé dans $target."
echo "Le workflow de mise à jour automatique est installé."
