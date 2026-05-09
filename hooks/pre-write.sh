#!/usr/bin/env bash
# PreToolUse hook for Write/Edit — blocks writes to system directories

INPUT=$(cat)
FILE=$(echo "$INPUT" | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
    # Write tool uses file_path, Edit uses file_path too
    print(d.get('tool_input', {}).get('file_path', ''))
except Exception:
    print('')
" 2>/dev/null)

block() {
  echo "{\"continue\": false, \"stopReason\": \"BLOCKED: $1\"}"
  exit 2
}

if echo "$FILE" | grep -qE '^/(etc|usr|bin|sbin|boot|lib|lib64|proc|sys)/'; then
  block "write to system directory: $FILE. Run manually if intentional."
fi

exit 0
