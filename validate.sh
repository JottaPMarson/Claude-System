#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
ERRORS=0

validate_frontmatter() {
  local file="$1"
  if ! python3 - "$file" <<'EOF'
import sys, re

path = sys.argv[1]
content = open(path).read()

if not content.startswith('---'):
    print(f"MISSING FRONTMATTER: {path}")
    sys.exit(1)

parts = re.split(r'^---\s*$', content, maxsplit=2, flags=re.MULTILINE)
if len(parts) < 3:
    print(f"MALFORMED FRONTMATTER: {path}")
    sys.exit(1)

block = parts[1]
# Simple key: value parser (no pyyaml dependency)
keys = set()
for line in block.splitlines():
    m = re.match(r'^([a-zA-Z_-]+)\s*:', line)
    if m:
        keys.add(m.group(1))

required = ['name', 'description']
missing = [k for k in required if k not in keys]
if missing:
    print(f"MISSING FIELDS {missing}: {path}")
    sys.exit(1)

print(f"OK: {path}")
EOF
  then
    ERRORS=$((ERRORS + 1))
  fi
}

for f in "$REPO_DIR"/skills/*/SKILL.md "$REPO_DIR"/agents/*/AGENT.md; do
  [ -f "$f" ] && validate_frontmatter "$f"
done

if [ "$ERRORS" -gt 0 ]; then
  echo ""
  echo "Validation failed: $ERRORS error(s). Fix before installing."
  exit 1
fi

echo "All files valid."
