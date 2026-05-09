---
name: dev-review
description: Structured code review — correctness, performance, error handling, style. General review, not security-focused.
when_to_use: Invoke automatically when the user asks to review code, a file, a PR, or a diff without mentioning security specifically ("revisa esse código", "olha esse arquivo", "o que acha disso", "review this"). If the user asks about security specifically, use sec-review instead.
allowed-tools: Read Grep Glob Bash(git diff *) Bash(git log *) mcp__lumen__semantic_search mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__find_referencing_symbols mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__search_for_pattern
---

Target: $ARGUMENTS (file path, PR number, or `git diff HEAD` if empty)

Review categories in order (stop at first critical per category):
1. **Correctness** — logic errors, off-by-one, null handling, race conditions, data integrity
2. **Security** — injection, auth, secrets, insecure deserialization (flag, don't detail — use /sec-review for deep dive)
3. **Performance** — N+1 queries, unnecessary allocations, missing indexes, blocking I/O
4. **Error handling** — swallowed errors, missing rollback, inadequate logging
5. **Testability** — missing tests for new logic, untestable code structures
6. **Style** — naming, complexity (functions >20 lines flag), duplication

Output:
## Code Review: [target]

### Critical (must fix before merge)
| # | Category | Location | Issue | Suggestion |
|---|----------|----------|-------|------------|

### Major (should fix)
| # | Category | Location | Issue | Suggestion |
|---|----------|----------|-------|------------|

### Minor (optional)
| # | Category | Location | Issue | Suggestion |
|---|----------|----------|-------|------------|

### Positive Notes
[What was done well — only include if genuinely noteworthy]

**Verdict**: APPROVE / REQUEST CHANGES / NEEDS DISCUSSION
