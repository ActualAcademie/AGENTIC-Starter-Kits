#!/usr/bin/env bash
set -euo pipefail
state="${1:-}"
[ -f "$state" ] || { echo "AUDIT COMPLET: état runtime absent" >&2; exit 1; }
value() { sed -n "s/^-[[:space:]]*$1:[[:space:]]*//p; s/^$1:[[:space:]]*//p" "$state" | head -1; }
for key in audit_matrix_status specialist_audit_status negative_tests_status contradiction_audit_status independent_reaudit_status; do
  value="$(value "$key")"
  [[ "$value" =~ ^(verified|complete|not-applicable)$ ]] || { echo "AUDIT COMPLET: $key non vérifié: ${value:-absent}" >&2; exit 1; }
done
echo "AUDIT COMPLET: matrice, spécialistes, tests négatifs, contradictions et relecture indépendante vérifiés"
