#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(git -C "$config/.." rev-parse --show-toplevel 2>/dev/null || { echo "Git requis pour valider un push"; exit 1; })"

"$script_dir/python.sh" - "$config/project-profile.toml" <<'PY'
import pathlib, sys, tomllib
profile = tomllib.loads(pathlib.Path(sys.argv[1]).read_text())
capabilities = profile.get('capabilities', {})
commands = profile.get('commands', {})
if capabilities.get('frontend') or capabilities.get('backend'):
    missing = [name for name in ('lint', 'test') if not str(commands.get(name, '')).strip()]
    if missing:
        print(f'ECHEC: commandes obligatoires pour projet applicatif: {", ".join(missing)}')
        raise SystemExit(1)
PY

read -r integration_branch require_feature_branch max_files max_lines < <(
  "$script_dir/python.sh" - "$config/project-profile.toml" <<'PY'
import pathlib, sys, tomllib
profile = tomllib.loads(pathlib.Path(sys.argv[1]).read_text())
delivery = profile.get('delivery', {})
print(
    profile.get('integration_branch', 'develop'),
    str(delivery.get('require_feature_branch', True)).lower(),
    delivery.get('max_files_per_commit', 75),
    delivery.get('max_changed_lines_per_commit', 1200),
)
PY
)

branch="$(git -C "$root" branch --show-current)"
if [ "$require_feature_branch" = "true" ]; then
  if [ -z "$branch" ] || [ "$branch" = "$integration_branch" ] || [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "ECHEC GITFLOW: créer une branche de travail avant le push, jamais pousser directement vers $integration_branch ou main"
    exit 1
  fi
  case "$branch" in feature/*|fix/*|hotfix/*|chore/*|docs/*|refactor/*|test/*) ;; *)
    echo "ECHEC GITFLOW: branche invalide $branch. Utiliser feature/, fix/, hotfix/, chore/, docs/, refactor/ ou test/"
    exit 1 ;;
  esac
fi

base="$(git -C "$root" merge-base HEAD "$integration_branch" 2>/dev/null || true)"
if [ -n "$base" ]; then
  while IFS= read -r commit; do
    files="$(git -C "$root" diff-tree --no-commit-id --name-only -r "$commit" | wc -l | tr -d ' ')"
    lines="$(git -C "$root" diff-tree --no-commit-id --numstat -r "$commit" | awk '{add += ($1 == "-" ? 0 : $1); del += ($2 == "-" ? 0 : $2)} END {print add + del}')"
    if [ "$files" -gt "$max_files" ] || [ "$lines" -gt "$max_lines" ]; then
      echo "ECHEC GITFLOW: commit $commit touche $files fichiers et $lines lignes. Limites: $max_files fichiers, $max_lines lignes. Découper la feature en commits atomiques ou faire approuver une limite adaptée dans project-profile.toml avant le push."
      exit 1
    fi
  done < <(git -C "$root" rev-list "$base"..HEAD)
fi

git -C "$root" diff --check
bash "$script_dir/preflight.sh"
bash "$script_dir/run-project-checks.sh" --execute
echo "Validation avant push OK"
