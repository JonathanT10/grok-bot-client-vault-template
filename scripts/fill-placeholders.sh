#!/usr/bin/env bash
# Replace {{UPPER_CASE}} placeholders across the vault with values from an env file.
# Usage:  ./scripts/fill-placeholders.sh client.env
#         ./scripts/fill-placeholders.sh --check     # list placeholders still present
# Lower-case Obsidian variables like {{date:YYYY-MM-DD}} and {{title}} are left alone.
set -euo pipefail
cd "$(dirname "$0")/.."

list_left() {
  grep -rnoE '\{\{[A-Z][A-Z0-9_]*\}\}' --include='*.md' . | grep -v '^./README.md' | grep -v '^./scripts/' || true
}

if [[ "${1:-}" == "--check" ]]; then
  left="$(list_left)"
  if [[ -z "$left" ]]; then echo "No client placeholders left."; else echo "$left"; exit 1; fi
  exit 0
fi

envfile="${1:?usage: fill-placeholders.sh client.env | --check}"
[[ -f "$envfile" ]] || { echo "No such file: $envfile"; exit 1; }

# shellcheck disable=SC1090
set -a; source "$envfile"; set +a
keys=$(grep -oE '^[A-Z][A-Z0-9_]*=' "$envfile" | tr -d '=')

find . -name '*.md' -not -path './.git/*' -not -path './scripts/*' -not -path './README.md' -print0 |
while IFS= read -r -d '' f; do
  for k in $keys; do
    v="${!k}"
    K="$k" V="$v" perl -0pi -e 's/\{\{\Q$ENV{K}\E\}\}/$ENV{V}/g' "$f"
  done
done
echo "Done. Run './scripts/fill-placeholders.sh --check' to see anything left to fill by hand."
