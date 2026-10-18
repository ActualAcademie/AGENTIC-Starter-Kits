#!/usr/bin/env bash
set -euo pipefail
project_root="$(git rev-parse --show-toplevel)"
manifest="$project_root/.workspace.toml"
version="${1:?version requise}"
repo="$(git config --get remote.origin.url | sed -E 's#.*github.com[:/]([^/]+/[^/.]+)(\.git)?#\1#')"
[ -n "$repo" ] || { echo "Remote GitHub introuvable." >&2; exit 1; }
git fetch origin dev >/dev/null
tmp="$(mktemp -d)"
trap 'git worktree remove --force "$tmp" >/dev/null 2>&1 || rm -rf "$tmp"' EXIT
branch="chore/kit-update-$version"
git worktree add --quiet -b "$branch" "$tmp" origin/dev
cp "$manifest" "$tmp/.workspace.toml"
git -C "$tmp" add .workspace.toml
git -C "$tmp" diff --cached --quiet && { echo "Aucune modification de manifeste à livrer."; exit 0; }
git -C "$tmp" -c user.name="Agentic Kit" -c user.email="agentic-kit@users.noreply.github.com" commit -m "chore(kit): update shared kit to $version" >/dev/null
git -C "$tmp" push -u origin "$branch" >/dev/null
if command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
  gh pr create --repo "$repo" --base dev --head "$branch" --title "chore(kit): update shared kit to $version" --body "Mise à jour automatique de .workspace.toml vers le kit shared $version." >/dev/null
else
  echo "Branche poussée sans PR automatique : authentification gh requise pour créer la PR." >&2
fi
echo "PR de mise à jour préparée sur $branch vers dev."
