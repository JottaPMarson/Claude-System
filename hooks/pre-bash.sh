#!/usr/bin/env bash
# PreToolUse hook for Bash — blocks destructive commands

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | python3 -c "
import sys, json
try:
    d = json.load(sys.stdin)
    print(d.get('tool_input', {}).get('command', ''))
except Exception:
    print('')
" 2>/dev/null)

block() {
  echo "BLOCKED: $1" >&2
  exit 2
}

# Recursive delete (rm -r, -rf, -R, -Rf, -RF, --recursive, etc.)
if echo "$COMMAND" | grep -qE 'rm\s+(-[a-zA-Z]*[rR][a-zA-Z]*|--(recursive))(\s|$)'; then
  block "recursive rm detected. Use rm on individual files only. Run manually if intentional."
fi

# Destructive disk operations
if echo "$COMMAND" | grep -qE 'dd\s+.*of=/dev/(sd|hd|nvme|vd|xvd|mmcblk)'; then
  block "destructive disk write (dd). Run manually if intentional."
fi

# Disk format/partition
if echo "$COMMAND" | grep -qE '(mkfs\.|fdisk|parted|wipefs|shred\s+/dev/)'; then
  block "disk format/partition operation. Run manually if intentional."
fi

# Force push
if echo "$COMMAND" | grep -qE 'git\s+push\s+.*--force(-with-lease)?'; then
  block "git push --force requires manual confirmation. Run it yourself after reviewing."
fi

# Privileged container
if echo "$COMMAND" | grep -qE 'docker\s+run\s+.*--privileged'; then
  block "docker run --privileged requires manual confirmation."
fi

exit 0
