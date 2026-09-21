#!/usr/bin/env bash
set -euo pipefail
updates_mode=ask
while [ "$#" -gt 0 ]; do
  case "$1" in
    --updates) updates_mode="$2"; shift 2 ;;
    -h|--help) echo "Usage: init-project.sh [--updates ask|pr|off]"; exit 0 ;;
    *) echo "Option inconnue: $1" >&2; exit 2 ;;
  esac
done
if [ "$updates_mode" = "ask" ] && [ -t 0 ]; then
  printf "Activer les mises à jour automatiques du starter kit ? [O]ui Pull Request, [N]on : "
  read -r answer
  case "$answer" in n|N|non|Non) updates_mode=off ;; *) updates_mode=pr ;; esac
elif [ "$updates_mode" = "ask" ]; then
  updates_mode=pr
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config_root="$(cd "$script_dir/.." && pwd)"
project_root="$(git -C "$config_root/.." rev-parse --show-toplevel 2>/dev/null || (cd "$config_root/.." && pwd))"

if [ ! -f "$config_root/ORCHESTRATION.md" ]; then
  echo "Kit Claude introuvable dans $config_root"
  exit 1
fi

mkdir -p "$config_root/work-items/archive" "$config_root/evaluations"

if [ "$updates_mode" != "off" ] && [ ! -f "$project_root/.github/workflows/update-agentic-starter-kit.yml" ]; then
  mkdir -p "$project_root/.github/workflows"
  cp "$config_root/templates/github/workflows/update-agentic-starter-kit.yml" "$project_root/.github/workflows/update-agentic-starter-kit.yml"
fi

if [ ! -f "$config_root/project-profile.toml" ]; then
  cp "$config_root/templates/project-profile.toml" "$config_root/project-profile.toml"
fi

inventory="$config_root/project-inventory.md"
{
  echo "# Inventaire de projet"
  echo
  echo "## État Git"
  git -C "$project_root" status --short --branch 2>&1 || echo "Git indisponible"
  echo
  echo "## Fichiers détectés"
  for file in package.json pyproject.toml requirements.txt Cargo.toml go.mod pom.xml build.gradle compose.yml docker-compose.yml; do
    [ -f "$project_root/$file" ] && echo "- $file"
  done
  echo
  echo "## Documentation détectée"
  for file in README.md CONTRIBUTING.md AGENTS.md; do
    [ -f "$project_root/$file" ] && echo "- $file"
  done
} > "$inventory"

if git -C "$project_root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  bash "$config_root/scripts/install-git-hooks.sh"
fi

if [ -f "$project_root/.gitignore" ]; then
  gitignore="$project_root/.gitignore"
else
  gitignore="$project_root/.gitignore"
  touch "$gitignore"
fi
for ignored_path in ".claude/" "CLAUDE.md"; do
  if ! grep -Fqx "$ignored_path" "$gitignore"; then
    printf '%s\n' "$ignored_path" >> "$gitignore"
  fi
done

echo "Initialisation terminée: compléter $config_root/project-profile.toml avec le Skill project-onboarding."
