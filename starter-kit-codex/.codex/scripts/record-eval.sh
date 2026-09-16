#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 12 ]; then
  echo "Usage: $0 task_id role skill risk tours contexte duree relances resultat defauts cout gain"
  exit 2
fi

for value in "$@"; do
  case "$value" in *,*|*$'\n'*|*$'\r'*) echo "Valeur CSV invalide"; exit 2 ;; esac
done

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
printf '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n' "$@" >> "$config/evaluations/evaluation.csv"
echo "Evaluation enregistrée"
