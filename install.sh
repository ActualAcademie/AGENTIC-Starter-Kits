#!/usr/bin/env bash
set -euo pipefail

if [ -t 1 ] && [ "${NO_COLOR:-}" = "" ]; then
  cyan="\033[36m"; blue="\033[34m"; green="\033[32m"; yellow="\033[33m"; red="\033[31m"; bold="\033[1m"; reset="\033[0m"
else
  cyan=""; blue=""; green=""; yellow=""; red=""; bold=""; reset=""
fi
info() { printf "%b\n" "${cyan}ℹ${reset} $*"; }
success() { printf "%b\n" "${green}✔${reset} $*"; }
warning() { printf "%b\n" "${yellow}!${reset} $*"; }
fail() { printf "%b\n" "${red}✖${reset} $*" >&2; exit 1; }
title() {
  clear 2>/dev/null || true
  printf "%b\n" "${blue}${bold}"
  printf "%b\n" "  ╔══════════════════════════════════════════════════════════╗"
  printf "%b\n" "  ║              AGENTIC STARTER KITS                       ║"
  printf "%b\n" "  ║              Installation guidée                       ║"
  printf "%b\n" "  ╚══════════════════════════════════════════════════════════╝${reset}"
  printf "\n"
}
ensure_gitignore() {
  local gitignore="$target/.gitignore"
  touch "$gitignore"
  local entries=("$hidden/" "$entry")
  for ignored_path in "${entries[@]}"; do
    if ! grep -Fqx "$ignored_path" "$gitignore"; then
      printf "%s\n" "$ignored_path" >> "$gitignore"
    fi
  done
}
verify_update_workflow() {
  local workflow="$target/$1"
  [ -f "$workflow" ] || fail "Le workflow de mise à jour est absent : $workflow"
  if git -C "$target" check-ignore -q "$workflow" 2>/dev/null; then
    fail "Le workflow de mise à jour est ignoré par Git. Retirez cette règle avant de continuer."
  fi
}
usage() { printf "%b\n" "Usage : ./install.sh [--kit codex|claude] [--mode native|external] [--target CHEMIN] [--force]"; }
kit=""; mode="native"; target=""; force=false
while [ "$#" -gt 0 ]; do
  case "$1" in
    --kit) [ "$#" -ge 2 ] || fail "Valeur manquante pour --kit."; kit="$2"; shift 2 ;;
    --mode) [ "$#" -ge 2 ] || fail "Valeur manquante pour --mode."; mode="$2"; shift 2 ;;
    --target) [ "$#" -ge 2 ] || fail "Valeur manquante pour --target."; target="$2"; shift 2 ;;
    --force) force=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) fail "Option inconnue : $1" ;;
  esac
done
case "$mode" in native|external) ;; *) fail "Le mode doit être native ou external." ;; esac
title
if [ -z "$kit" ] && [ -t 0 ]; then
  printf "%b\n" "${bold}Quel orchestrateur souhaitez-vous installer ?${reset}"
  printf "\n  ${cyan}1${reset}) Codex\n  ${cyan}2${reset}) Claude\n\n  Votre choix [1] : "
  read -r choice
  case "${choice:-1}" in 1) kit=codex ;; 2) kit=claude ;; *) fail "Choix invalide." ;; esac
fi
if [ -t 0 ] && [ "$mode" = "native" ] && [ -z "${AGENTIC_MODE_SELECTED:-}" ]; then
  printf "\n%b\n" "${bold}Comment souhaitez-vous installer le kit ?${reset}"
  printf "  ${cyan}1${reset}) Mode natif : fichiers du kit disponibles directement dans le projet\n"
  printf "  ${cyan}2${reset}) Mode externe : fichiers du kit ignorés par Git, manifeste discret uniquement\n\n"
  printf "Votre choix [1] : "
  read -r mode_choice
  case "${mode_choice:-1}" in
    1) mode=native ;;
    2) mode=external ;;
    *) fail "Choix de distribution invalide." ;;
  esac
fi
case "$kit" in
  codex) source_dir=starter-kit-codex; entry=AGENTS.md; hidden=.codex; label="Codex" ;;
  claude) source_dir=starter-kit-claude; entry=CLAUDE.md; hidden=.claude; label="Claude" ;;
  *) fail "Choisissez Codex ou Claude avec --kit codex|claude." ;;
esac
if [ -z "$target" ] && [ -t 0 ]; then
  current="$PWD"
  while true; do
    printf "\n%b\n" "${bold}Dossier actuel :${reset} $current"
    printf "  ${cyan}1${reset}) Choisir ce dossier comme projet\n"
    printf "  ${cyan}2${reset}) Entrer dans un sous-dossier\n"
    printf "  ${cyan}3${reset}) Revenir au dossier parent\n"
    printf "  ${cyan}4${reset}) Annuler\n\n"
    printf "Votre choix [1] : "
    read -r navigation_choice
    case "${navigation_choice:-1}" in
      1) target="$current"; break ;;
      2)
        directories=()
        for directory in "$current"/*/; do
          [ -d "$directory" ] && directories+=("${directory%/}")
        done
        if [ "${#directories[@]}" -eq 0 ]; then
          warning "Aucun sous-dossier disponible dans ce dossier."
          continue
        fi
        printf "\nSous-dossiers disponibles :\n"
        index=0
        for directory in "${directories[@]}"; do
          index=$((index + 1))
          printf "  %s) %s\n" "$index" "$(basename "$directory")"
        done
        printf "\nNuméro du sous-dossier, ou Entrée pour revenir : "
        read -r directory_choice
        if [ -z "$directory_choice" ]; then
          continue
        elif [[ "$directory_choice" =~ ^[0-9]+$ ]] && [ "$directory_choice" -ge 1 ] && [ "$directory_choice" -le "${#directories[@]}" ]; then
          current="${directories[$((directory_choice - 1))]}"
        else
          warning "Choix invalide."
        fi
        ;;
      3)
        parent="$(dirname "$current")"
        [ "$parent" != "$current" ] && current="$parent" || warning "Vous êtes déjà à la racine."
        ;;
      4) fail "Installation annulée." ;;
      *) warning "Choix invalide." ;;
    esac
  done
fi
target="${target:-.}"
[ -d "$target" ] || fail "Le dossier cible n’existe pas : $target"
repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
target="$(cd "$target" && pwd)"
if [ "$force" != true ] && { [ -e "$target/$entry" ] || [ -e "$target/$hidden" ]; }; then
  fail "Un kit existe déjà dans $target. Utilisez --force après vérification."
fi
printf "\n%b\n" "${bold}Résumé de l’installation${reset}"
printf "  Orchestrateur : %s\n  Distribution  : %s\n  Projet cible  : %s\n\n" "$label" "$mode" "$target"
if [ -t 0 ]; then
  printf "Continuer l’installation ? [O/n] : "
  read -r confirm
  case "${confirm:-o}" in n|N|non|Non) info "Installation annulée."; exit 0 ;; esac
fi
info "Installation de la configuration $label..."
cp -R "$repo_root/$source_dir/$entry" "$target/$entry"
cp -R "$repo_root/$source_dir/$hidden" "$target/$hidden"
mkdir -p "$target/.github/workflows"
if [ "$mode" = "external" ]; then
  workflow_path="$target/.github/workflows/update-workspace-kit.yml"
  cp "$repo_root/distributions/external/update-workspace-kit.yml" "$workflow_path"
  kit_version="$(sed -n 's/^kit_version = "\(.*\)"/\1/p' "$target/$hidden/KIT.toml")"
  cat > "$target/.workspace.toml" <<EOF
orchestrator = "$kit"
kit_version = "$kit_version"
source = "https://github.com/ActualAcademie/AGENTIC-Starter-Kits"
update_channel = "stable"
EOF
else
  workflow_path="$target/.github/workflows/update-agentic-starter-kit.yml"
  cp "$repo_root/$source_dir/$hidden/templates/github/workflows/update-agentic-starter-kit.yml" "$workflow_path"
fi
ensure_gitignore
verify_update_workflow "${workflow_path#$target/}"
info "Gitignore mis à jour pour le kit $label."
printf "\n"
success "Kit $label installé avec succès."
success "Fichier racine : $target/$entry"
success "Configuration : $target/$hidden"
success "Mises à jour  : $workflow_path"
printf "\n%b\n" "${cyan}Prochaine étape${reset}"
printf "%s\n" "Ouvrez le projet dans $label et envoyez votre cahier des charges complet."
printf "%s\n" "Les futures mises à jour arriveront par Pull Request vers dev ou develop."
if git -C "$target" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  printf "\n%b\n" "${yellow}Avant le premier push${reset}"
  printf "%s\n" "Ajoutez le workflow au premier commit :"
  if [ "$mode" = "external" ]; then
    printf "  git add .github/workflows/update-workspace-kit.yml .workspace.toml .gitignore\n"
  else
    printf "  git add .github/workflows/update-agentic-starter-kit.yml .gitignore %s\n" "$entry"
  fi
  printf "  git commit -m \"chore: install agentic starter kit\"\n"
  printf "  git push -u origin \"\$(git branch --show-current)\"\n"
  printf "\n%s\n" "Le workflow doit être visible dans git ls-files avant le push."
fi
