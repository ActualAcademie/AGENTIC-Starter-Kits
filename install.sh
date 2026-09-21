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
  printf "\nChemin du projet cible [projet courant] : "
  read -r target
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
printf "\n"
success "Kit $label installé avec succès."
success "Fichier racine : $target/$entry"
success "Configuration : $target/$hidden"
success "Mises à jour  : $target/.github/workflows/update-agentic-starter-kit.yml"
printf "\n%b\n" "${cyan}Prochaine étape${reset}"
printf "%s\n" "Ouvrez le projet dans $label et envoyez votre cahier des charges complet."
printf "%s\n" "Les futures mises à jour arriveront par Pull Request vers dev ou develop."
