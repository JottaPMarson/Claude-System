---
name: arch-debt
description: Technical debt analysis — identify, categorize, and prioritize debt in a codebase or component. Use when planning refactoring or paying down debt.
allowed-tools: Read Grep Glob Bash(git log *) Bash(git shortlog *) mcp__lumen__semantic_search mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__find_referencing_symbols mcp__plugin_serena_serena__find_implementations
---

Scope: $ARGUMENTS (path, component, or entire repo)

Analyze the codebase for technical debt. Look for:
- Code smells (duplication, long functions, god classes, deep nesting)
- Architectural debt (wrong abstractions, coupling, missing layers)
- Test debt (missing tests, brittle tests, no integration coverage)
- Dependency debt (outdated deps, deprecated APIs, security vulns)
- Documentation debt (missing docs, stale docs, no ADRs)
- Operational debt (no monitoring, manual processes, missing runbooks)

Output:
## Tech Debt Analysis: [scope]

### Debt Register
| # | Category | Item | File/Location | Effort (S/M/L/XL) | Impact (H/M/L) | Priority |
|---|----------|------|---------------|-------------------|----------------|----------|

### Effort × Impact Matrix
```
         HIGH IMPACT       LOW IMPACT
HIGH      [quick wins]      [fill-ins]
EFFORT
LOW       [major proj]      [skip]
```

### Top 5 Priority Items
1. **[item]** — [why this first, estimated effort, suggested approach]
2.
3.
4.
5.

### Debt Trends (from git history)
[Areas accumulating debt fastest, based on commit frequency vs complexity]

### Recommended Approach
[Proposed debt reduction strategy — tackle inline vs dedicated sprint vs rewrite]
