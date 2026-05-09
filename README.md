# claude-system

A global Claude Code configuration system covering multiple professional disciplines. Install once, use across any project.

## Domains

| Domain | Skills |
|--------|--------|
| Cybersecurity / AppSec | `sec-review`, `sec-threat`, `sec-owasp` |
| DevOps / SRE | `devops-deploy`, `devops-incident`, `devops-postmortem`, `devops-slo` |
| Staff Engineering / Architecture | `arch-rfc`, `arch-adr`, `arch-design`, `arch-debt` |
| PMO / Project Management | `pmo-sprint`, `pmo-status`, `pmo-risk`, `pmo-stakeholder` |
| General Dev + QA | `dev-review`, `dev-commit`, `dev-test`, `dev-debug` |
| Data Engineering | `data-pipeline`, `data-model` |

## Installation

```bash
git clone https://github.com/YOUR_USERNAME/claude-system.git
cd claude-system
bash install.sh
```

Restart Claude Code after installing.

To uninstall:
```bash
bash uninstall.sh
```

Your previous `settings.json` and `CLAUDE.md` are backed up to `~/.claude/backup-[timestamp]/`.

## Skills

| Command | What it does |
|---------|-------------|
| `/sec-review [target]` | Security code review — OWASP Top 10, injection, auth, crypto |
| `/sec-threat [system]` | STRIDE threat model — component-level threat matrix |
| `/sec-owasp [target]` | OWASP Top 10 (2021) checklist |
| `/devops-deploy [service]` | Pre-deploy go/no-go checklist |
| `/devops-incident [description]` | Incident response runbook |
| `/devops-postmortem` | Blameless post-mortem document |
| `/devops-slo [service]` | SLO/SLA definition + error budget |
| `/arch-rfc [topic]` | RFC document draft |
| `/arch-adr [decision]` | Architecture Decision Record (MADR format) |
| `/arch-design [feature]` | Technical design document |
| `/arch-debt [scope]` | Tech debt analysis + priority matrix |
| `/pmo-sprint [items]` | Sprint planning + estimation |
| `/pmo-status` | Project status report (RAG) |
| `/pmo-risk [project]` | Risk assessment matrix |
| `/pmo-stakeholder [context]` | Non-technical stakeholder update |
| `/dev-review [target]` | Structured code review |
| `/dev-commit` | Conventional commit message from staged diff |
| `/dev-test [file]` | Unit test generation |
| `/dev-debug [error]` | Root cause analysis |
| `/data-pipeline [pipeline]` | Data pipeline review |
| `/data-model [domain]` | Data model design + schema |

## Plugins

Two MCP plugins extend Claude's capabilities and are referenced throughout the skills and CLAUDE.md. They must be installed separately — see [SETUP.md](SETUP.md).

| Plugin | Purpose | Key tool |
|--------|---------|----------|
| **Serena** | LSP-based code navigation — find definitions, usages, implementations | `find_symbol`, `find_referencing_symbols`, `get_symbols_overview` |
| **Lumen** | Semantic search — concept-based codebase indexing and retrieval | `mcp__lumen__semantic_search` |

**When Claude uses each:**
- Serena → code navigation tasks (finding where a function is defined, who calls it, what implements an interface)
- Lumen → broad exploration tasks (searching by concept before a `/sec-review`, `/arch-debt`, or `/dev-review`)

Both are configured as preferences in `CLAUDE.md`: Claude falls back to Grep/Read if a plugin is unavailable.

## Security Hooks

Strict pre-tool-use hooks are active after installation:

| What | Action |
|------|--------|
| `rm -r*` / recursive delete | **BLOCKED** |
| `git push --force` | **BLOCKED** |
| `docker run --privileged` | **BLOCKED** |
| `dd` to disk devices | **BLOCKED** |
| `mkfs`, `fdisk`, `parted` | **BLOCKED** |
| Read `.env`, `*.pem`, `*.key`, `~/.aws/*`, `~/.ssh/*` | **BLOCKED** |
| Write to `/etc/`, `/usr/`, `/bin/`, `/sbin/` | **BLOCKED** |

To run a blocked command, execute it yourself in the terminal.

## Agents

Three specialized sub-agents are included:

| Agent | When used |
|-------|-----------|
| `sec-agent` | Deep read-only security audits |
| `arch-agent` | Architecture analysis and design reviews |
| `pmo-agent` | Project health analysis from git history |

Claude delegates to these agents automatically based on task context.

## Structure

```
claude-system/
├── install.sh / uninstall.sh
├── settings.json          # hooks + schema
├── CLAUDE.md              # global identity + rules + skill index
├── hooks/
│   ├── pre-bash.sh        # bash security gate
│   ├── pre-read.sh        # credential read protection
│   └── pre-write.sh       # system dir write protection
├── skills/                # 21 skill files
│   └── [skill-name]/SKILL.md
└── agents/                # 3 agent files
    └── [agent-name]/AGENT.md
```

## Contributing

PRs welcome. Each skill should be:
- Token-efficient: dense markdown, no prose padding
- Structured output: tables and templates, not paragraphs
- Minimal `allowed-tools`: only what the skill actually needs

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide.

## Acknowledgments

This system builds on two open-source Claude Code plugins:

- **[Serena](https://github.com/oraios/serena)** by [Oraios](https://github.com/oraios) — LSP-powered code intelligence for Claude Code. Available via the official Claude plugins marketplace (`serena@claude-plugins-official`).
- **[Lumen](https://github.com/ory/claude-plugins)** by [Ory](https://github.com/ory) — semantic codebase indexing and search for Claude Code. Available via the Ory plugin marketplace (`lumen@ory`).

## License

MIT
