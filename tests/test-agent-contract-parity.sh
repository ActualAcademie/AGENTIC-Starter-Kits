#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
codex="$root/starter-kit-codex/.codex"
claude="$root/starter-kit-claude/.claude"

starter-kit-codex/.codex/scripts/python.sh - "$root" <<'PY'
import pathlib, sys, tomllib
root = pathlib.Path(sys.argv[1])
codex = root / "starter-kit-codex/.codex"
claude = root / "starter-kit-claude/.claude"
contracts = tomllib.loads((codex / "SPECIALIST-CONTRACTS.toml").read_text())
models = tomllib.loads((codex / "models.toml").read_text())
agents = list((codex / "agents").glob("*.toml"))
names = set()
for path in agents:
    data = tomllib.loads(path.read_text())
    name = data.get("name")
    names.add(name)
    assert name in contracts, f"contrat manquant: {name}"
    profile = models["profiles"].get(data.get("model_profile"))
    assert profile, f"profil manquant: {name}"
    assert profile["model"] == data.get("model"), f"modele incoherent: {name}"
    assert ".codex/policies/AGENT-QUALITY-POLICY.md" in data.get("must_read", []), f"politique manquante: {name}"
    for skill in data.get("skills", []):
        assert (codex / "skills" / skill / "SKILL.md").is_file(), f"skill absente: {name}/{skill}"
assert names == set(contracts), "inventaire et contrats Codex desynchronises"
for path in (claude / "agents").glob("*.md"):
    text = path.read_text()
    assert "AGENT-QUALITY-POLICY.md" in text, f"politique Claude manquante: {path.name}"
print("Parité des contrats agents Codex et Claude: OK")
PY
