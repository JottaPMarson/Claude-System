# Setup — Plugins

`claude-system` references two MCP plugins in `CLAUDE.md` and the skills. This guide covers how to install them.

Both plugins are optional but recommended — Claude falls back to native tools (Grep, Read) when they are unavailable.

---

## Serena — LSP code intelligence

**What it does**: Gives Claude LSP-powered code navigation — find symbol definitions, list all usages of a function, discover what implements an interface, search by pattern across the codebase. Dramatically faster and more accurate than grep for these tasks.

**Source**: [github.com/oraios/serena](https://github.com/oraios/serena)
**Marketplace**: `serena@claude-plugins-official`

### Install

```bash
claude plugin install serena
```

Restart Claude Code. Serena activates automatically for any project with a supported language (Python, TypeScript, Go, Java, Rust, and more).

### When Claude uses it

| Task | Tool called |
|------|-------------|
| Find where a function/class is defined | `find_symbol` |
| Find all callers of a function | `find_referencing_symbols` |
| Get an overview of a file's symbols | `get_symbols_overview` |
| Find what implements an interface | `find_implementations` |
| Search by name pattern across the codebase | `search_for_pattern` |

Claude prefers Serena over Grep for all of the above. If Serena returns no results or LSP is not initialized for the language, it falls back to Grep/Read.

---

## Lumen — Semantic codebase search

**What it does**: Indexes your codebase and lets Claude search by *concept* rather than exact token. Useful before broad analysis tasks (security review, architecture audit, tech debt analysis) where you want context across multiple files without knowing the exact symbol names.

**Source**: [github.com/ory/claude-plugins](https://github.com/ory/claude-plugins)
**Marketplace**: `lumen@ory` (custom marketplace)

### Install

**Step 1** — Register the Ory marketplace in `~/.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "ory": {
      "source": {
        "source": "github",
        "repo": "ory/claude-plugins"
      }
    }
  }
}
```

**Step 2** — Install the plugin:

```bash
claude plugin install lumen@ory
```

**Step 3** — Index your project (run from the project root):

```bash
claude lumen index .
```

Restart Claude Code. On the next session start, Claude will confirm the index is ready.

### When Claude uses it

| Task | Tool called |
|------|-------------|
| Search by concept before `/sec-review`, `/arch-debt`, `/dev-review` | `mcp__lumen__semantic_search` |
| Explore unfamiliar codebase before analysis | `mcp__lumen__semantic_search` |

Claude falls back to Read/Glob if Lumen returns low-confidence results or is not available.

### Re-indexing

Re-index after significant changes to the codebase:

```bash
claude lumen index .
```

---

## Verifying both plugins are active

Check your `~/.claude/settings.json` for:

```json
{
  "enabledPlugins": {
    "serena@claude-plugins-official": true,
    "lumen@ory": true
  }
}
```

If `install.sh` was run with `jq` available, the merge preserves any `enabledPlugins` you already had. Otherwise enable them manually via `claude plugin enable <name>`.
