#!/usr/bin/env bash
set -euo pipefail
max_minutes="${GOAL_MAX_MINUTES:-30}"; max_steps="${GOAL_MAX_STEPS:-40}"; max_tokens="${GOAL_MAX_TOKENS:-50000}"; max_retries="${GOAL_MAX_RETRIES:-2}"; max_agents="${GOAL_MAX_AGENTS:-3}"
validate_limit() { local name="$1" value="$2" ceiling="$3"; [[ "$value" =~ ^[0-9]+$ ]] || { echo "GOAL_BUDGET: $name doit être un entier" >&2; exit 2; }; (( value > 0 && value <= ceiling )) || { echo "GOAL_BUDGET: $name hors limite 1..$ceiling" >&2; exit 2; }; }
validate_limit minutes "$max_minutes" 30; validate_limit steps "$max_steps" 40; validate_limit tokens "$max_tokens" 50000; validate_limit retries "$max_retries" 2; validate_limit agents "$max_agents" 3
printf 'GOAL_BUDGET: OK minutes=%s steps=%s tokens=%s retries=%s agents=%s\n' "$max_minutes" "$max_steps" "$max_tokens" "$max_retries" "$max_agents"
