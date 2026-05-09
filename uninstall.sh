#!/usr/bin/env bash
set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Uninstalling claude-system..."

# Remove hooks
for f in pre-bash.sh pre-read.sh pre-write.sh; do
  [ -f "$CLAUDE_DIR/hooks/$f" ] && rm "$CLAUDE_DIR/hooks/$f" && echo "  removed hooks/$f"
done

# Remove skills
for skill in "$REPO_DIR/skills/"*/; do
  name=$(basename "$skill")
  [ -d "$CLAUDE_DIR/skills/$name" ] && rm -rf "$CLAUDE_DIR/skills/$name" && echo "  removed skills/$name"
done

# Remove agents
for agent in "$REPO_DIR/agents/"*/; do
  name=$(basename "$agent")
  [ -d "$CLAUDE_DIR/agents/$name" ] && rm -rf "$CLAUDE_DIR/agents/$name" && echo "  removed agents/$name"
done

# Remove CLAUDE.md (only if it matches ours)
if grep -q "claude-system" "$CLAUDE_DIR/CLAUDE.md" 2>/dev/null; then
  rm "$CLAUDE_DIR/CLAUDE.md"
  echo "  removed CLAUDE.md"
fi

echo ""
echo "Done. Restore from ~/.claude/backup-* if needed."
