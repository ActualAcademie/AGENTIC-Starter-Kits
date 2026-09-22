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
usage() { printf "%b\n" "Usage : ./install.sh [--kit codex|claude] [--target CHEMIN] [--force]"; }
kit=""; target=""; force=false
while [ "$#" -gt 0 ]; do
  case "$1" in
    --kit) [ "$#" -ge 2 ] || fail "Valeur manquante pour --kit."; kit="$2"; shift 2 ;;
    --target) [ "$#" -ge 2 ] || fail "Valeur manquante pour --target."; target="$2"; shift 2 ;;
    --force) force=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) fail "Option inconnue : $1" ;;
  esac
done
title
if [ -z "$kit" ] && [ -t 0 ]; then
  printf "%b\n" "${bold}Quel orchestrateur souhaitez-vous installer ?${reset}"
  printf "\n  ${cyan}1${reset}) Codex\n  ${cyan}2${reset}) Claude\n\n  Votre choix [1] : "
  read -r choice
  case "${choice:-1}" in 1) kit=codex ;; 2) kit=claude ;; *) fail "Choix invalide." ;; esac
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
printf "  Orchestrateur : %s\n  Projet cible  : %s\n  Mises à jour   : Pull Request automatique vers dev ou develop\n\n" "$label" "$target"
if [ -t 0 ]; then
  printf "Continuer l’installation ? [O/n] : "
  read -r confirm
  case "${confirm:-o}" in n|N|non|Non) info "Installation annulée."; exit 0 ;; esac
fi
info "Copie de la configuration $label..."
cp -R "$repo_root/$source_dir/$entry" "$target/$entry"
cp -R "$repo_root/$source_dir/$hidden" "$target/$hidden"
mkdir -p "$target/.github/workflows"
cp "$repo_root/$source_dir/$hidden/templates/github/workflows/update-agentic-starter-kit.yml" "$target/.github/workflows/update-agentic-starter-kit.yml"
ensure_gitignore
info "Gitignore mis à jour pour le kit $label."
printf "\n"
success "Kit $label installé avec succès."
success "Fichier racine : $target/$entry"
success "Configuration : $target/$hidden"
success "Mises à jour  : $target/.github/workflows/update-agentic-starter-kit.yml"
printf "\n%b\n" "${cyan}Prochaine étape${reset}"
printf "%s\n" "Ouvrez le projet dans $label et envoyez votre cahier des charges complet."
printf "%s\n" "Les futures mises à jour arriveront par Pull Request vers dev ou develop."
