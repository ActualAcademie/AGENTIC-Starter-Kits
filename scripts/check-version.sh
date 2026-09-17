#!/usr/bin/env bash
set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
version_file="$root/VERSION"
[ -f "$version_file" ] || { echo "VERSION manquant"; exit 1; }
version="$(tr -d '[:space:]' < "$version_file")"
case "$version" in
  0|[0-9]*.[0-9]*.[0-9]*) ;;
  *) echo "Version SemVer invalide: $version"; exit 1 ;;
esac
if ! [[ "$version" =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-[0-9A-Za-z.-]+)?(\+[0-9A-Za-z.-]+)?$ ]]; then
  echo "Version SemVer invalide: $version"
  exit 1
fi
printf 'Version SemVer OK: %s\n' "$version"
