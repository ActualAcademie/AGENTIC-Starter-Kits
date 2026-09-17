#!/usr/bin/env bash
set -euo pipefail

ROOT="${PROJECT_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
METRICS="$ROOT/.codex/metrics"
LOG="$METRICS/usage.jsonl"
mkdir -p "$METRICS"

usage() {
  printf '%s\n' "Usage: cost-tracker.sh record --agent AGENT --model MODEL --input TOKENS --output TOKENS [--work-item ID] [--feature NAME] [--status STATUS]"
  printf '%s\n' "       cost-tracker.sh report [--days N]"
}

if [[ "${1:-}" == "record" ]]; then
  shift
  agent="unknown" model="unknown" input="0" output="0" work_item="unknown" feature="unknown" status="completed"
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --agent) agent="$2"; shift 2;; --model) model="$2"; shift 2;;
      --input) input="$2"; shift 2;; --output) output="$2"; shift 2;;
      --work-item) work_item="$2"; shift 2;; --feature) feature="$2"; shift 2;;
      --status) status="$2"; shift 2;; *) usage; exit 2;;
    esac
  done
  [[ "$input" =~ ^[0-9]+$ && "$output" =~ ^[0-9]+$ ]] || { echo "Token counts must be integers." >&2; exit 2; }
  timestamp="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  printf '{"timestamp":"%s","agent":"%s","model":"%s","input_tokens":%s,"output_tokens":%s,"work_item":"%s","feature":"%s","status":"%s"}\n' "$timestamp" "$agent" "$model" "$input" "$output" "$work_item" "$feature" "$status" >> "$LOG"
  echo "Usage recorded in $LOG"
  exit 0
fi

if [[ "${1:-}" == "report" ]]; then
  [[ -f "$LOG" ]] || { echo "No usage recorded yet."; exit 0; }
  awk -F'[:,}]' '
    /input_tokens/ { for (i=1;i<=NF;i++) { if ($i ~ /input_tokens/) inTok=$(i+1); if ($i ~ /output_tokens/) outTok=$(i+1); if ($i ~ /"agent"/) agent=$(i+1); if ($i ~ /"model"/) model=$(i+1) } totalIn+=inTok; totalOut+=outTok; count++; agents[agent]++; models[model]++ }
    END { gsub(/[^0-9]/,"",totalIn); gsub(/[^0-9]/,"",totalOut); printf "Calls: %d\nInput tokens: %s\nOutput tokens: %s\n\nCalls by agent:\n", count, totalIn, totalOut; for (a in agents) printf "  %s: %d\n", a, agents[a]; print "\nCalls by model:"; for (m in models) printf "  %s: %d\n", m, models[m] }
  ' "$LOG"
  exit 0
fi

usage
exit 2
