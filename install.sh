#!/usr/bin/env bash
set -euo pipefail

CLAUDE_DIR="$HOME/.claude"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$CLAUDE_DIR/backup-$(date +%Y%m%d%H%M%S)"

echo "Installing claude-system..."

# Validate SKILL.md and AGENT.md frontmatter
bash "$REPO_DIR/validate.sh"

# Backup existing config
mkdir -p "$BACKUP"
[ -f "$CLAUDE_DIR/settings.json" ] && cp "$CLAUDE_DIR/settings.json" "$BACKUP/settings.json"
[ -f "$CLAUDE_DIR/CLAUDE.md" ]     && cp "$CLAUDE_DIR/CLAUDE.md"     "$BACKUP/CLAUDE.md"
echo "  Backup saved to $BACKUP"

# Rotate backups: keep only the 3 most recent
mapfile -t OLD_BACKUPS < <(ls -1dt "$CLAUDE_DIR"/backup-* 2>/dev/null | tail -n +4)
for old in "${OLD_BACKUPS[@]}"; do
  rm -rf "$old"
done

# settings.json — merge to preserve user settings (enabledPlugins, theme, etc.)
if command -v jq &>/dev/null; then
  if [ -f "$CLAUDE_DIR/settings.json" ]; then
    jq --argjson repo "$(cat "$REPO_DIR/settings.json")" '. * $repo' \
      "$CLAUDE_DIR/settings.json" > "$CLAUDE_DIR/settings.json.tmp" \
      && mv "$CLAUDE_DIR/settings.json.tmp" "$CLAUDE_DIR/settings.json"
    echo "  settings.json merged (hooks updated, user settings preserved)"
  else
    cp "$REPO_DIR/settings.json" "$CLAUDE_DIR/settings.json"
    echo "  settings.json -> ~/.claude/ (new)"
  fi
else
  echo "  WARNING: jq not found. settings.json will be overwritten (user plugins/theme lost)."
  read -r -p "  Continue? [y/N] " confirm
  [[ "$confirm" =~ ^[Yy]$ ]] || { echo "Aborted."; exit 1; }
  cp "$REPO_DIR/settings.json" "$CLAUDE_DIR/settings.json"
  echo "  settings.json -> ~/.claude/ (overwritten)"
fi

# CLAUDE.md
cp "$REPO_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "  CLAUDE.md -> ~/.claude/"

# hooks
mkdir -p "$CLAUDE_DIR/hooks"
cp "$REPO_DIR/hooks/"*.sh "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/"*.sh
echo "  hooks/ -> ~/.claude/hooks/"

# skills
mkdir -p "$CLAUDE_DIR/skills"
cp -r "$REPO_DIR/skills/"* "$CLAUDE_DIR/skills/"
echo "  skills/ -> ~/.claude/skills/"

# agents
mkdir -p "$CLAUDE_DIR/agents"
cp -r "$REPO_DIR/agents/"* "$CLAUDE_DIR/agents/"
echo "  agents/ -> ~/.claude/agents/"

echo ""
echo "Done. Restart Claude Code to apply changes."
echo "To uninstall: bash $REPO_DIR/uninstall.sh"
