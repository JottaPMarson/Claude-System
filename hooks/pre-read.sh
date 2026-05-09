#!/usr/bin/env bash
# PreToolUse hook for Read — blocks sensitive credential files

INPUT=$(cat)
FILE=$(echo "$INPUT" | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
    print(d.get('tool_input', {}).get('file_path', ''))
except Exception:
    print('')
" 2>/dev/null)

block() {
  echo "BLOCKED: $1" >&2
  exit 2
}

if echo "$FILE" | grep -qE '(\.env$|\.env\.[^/]+$|/\.aws/|/\.ssh/|\.pem$|\.key$|/credentials$|\.p12$|\.pfx$|\.jks$|id_rsa$|id_ed25519$)'; then
  block "sensitive credential file: $FILE. Read it manually if intentional."
fi

exit 0
