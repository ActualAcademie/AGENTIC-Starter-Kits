#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
config="$(cd "$script_dir/.." && pwd)"
root="$(git -C "$config/.." rev-parse --show-toplevel 2>/dev/null || cd "$config/.." && pwd)"
target="$root/.github/workflows/codex-orchestration.yml"

if [ -e "$target" ]; then echo "Workflow existant, aucune écriture: $target"; exit 1; fi
mkdir -p "$root/.github/workflows"
printf '%s\n' \
  'name: Codex orchestration gates' '' 'on:' '  pull_request:' '  push:' '    branches: [main, develop]' '' \
  'jobs:' '  quality:' '    runs-on: ubuntu-latest' '    steps:' '      - uses: actions/checkout@v4' \
  '      - uses: actions/setup-python@v5' '        with:' '          python-version: "3.11"' \
  '      - name: Install ripgrep' '        run: sudo apt-get update && sudo apt-get install -y ripgrep' \
  '      - name: Preflight' '        run: bash .codex/scripts/preflight.sh' \
  '      - name: Project checks' '        run: bash .codex/scripts/run-project-checks.sh --execute' > "$target"
echo "Workflow créé: $target"
