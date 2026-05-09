# claude-system

Domains: PMO, DevOps/SRE, Staff Engineering, Cybersecurity/AppSec, Data Engineering, QA, General Dev.

## Rules
- Token efficiency: dense output, no padding prose, no trailing summaries
- Security-first: flag vulnerabilities before implementing
- No comments unless WHY is non-obvious
- No docstrings or multi-line comment blocks
- Prefer editing existing files over creating new ones
- No features beyond what was asked

## Skills
| Command | Domain | Use when |
|---------|--------|----------|
| /sec-review | Security | reviewing code for vulnerabilities |
| /sec-threat | Security | threat modeling a system |
| /sec-owasp | Security | OWASP Top 10 checklist |
| /devops-deploy | DevOps | pre-deploy verification |
| /devops-incident | DevOps | active incident response |
| /devops-postmortem | DevOps | post-incident doc |
| /devops-slo | DevOps/SRE | SLO/error budget analysis |
| /arch-rfc | Architecture | drafting an RFC |
| /arch-adr | Architecture | recording an architecture decision |
| /arch-design | Architecture | technical design doc |
| /arch-debt | Architecture | tech debt analysis |
| /pmo-sprint | PMO | sprint planning |
| /pmo-status | PMO | project status report |
| /pmo-risk | PMO | risk assessment |
| /pmo-stakeholder | PMO | stakeholder communication |
| /dev-review | Dev | structured code review |
| /dev-commit | Dev | conventional commit message |
| /dev-test | Dev/QA | unit test generation |
| /dev-debug | Dev | root cause analysis |
| /data-pipeline | Data | pipeline review |
| /data-model | Data | data model design |

## Tool Preferences

### Serena (active)
Prefer Serena over native tools for code navigation:
- Finding a symbol definition → `find_symbol` over Grep
- Finding all usages of a function/class → `find_referencing_symbols` over Grep
- Understanding module/file structure before a review → `get_symbols_overview` over multiple Reads
- Finding what implements an interface/abstract class → `find_implementations` over Grep
- Searching by pattern across the codebase → `search_for_pattern` over Grep
- Fall back to Grep/Read only if Serena returns no results or LSP is not initialized

### Lumen (active)
Prefer Lumen for broad codebase exploration before running analysis skills:
- Searching by concept rather than exact name → `mcp__lumen__semantic_search` over Grep
- Initial context gathering before /sec-review, /arch-debt, /dev-review → Lumen first
- Fall back to Read/Glob if Lumen returns low-confidence results

## Security Gates (hooks active)
- `rm -r*` / recursive delete: BLOCKED
- `git push --force`: BLOCKED
- `docker run --privileged`: BLOCKED
- Read `.env`, `*.pem`, `*.key`, `~/.aws/*`, `~/.ssh/*`: BLOCKED
- Write to `/etc/`, `/usr/`, `/bin/`, `/sbin/`: BLOCKED
