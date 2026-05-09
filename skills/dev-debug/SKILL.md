---
name: dev-debug
description: Root cause analysis from an error, symptom, or unexpected behavior.
when_to_use: Invoke automatically when the user pastes a stack trace, error message, exception, or describes something broken ("não funciona", "tá quebrando", "deu erro", "bug", "crashing", "failing"). Do not wait for an explicit /dev-debug call.
allowed-tools: Read Grep Bash(git log *) Bash(git blame *) mcp__lumen__semantic_search mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__find_referencing_symbols mcp__plugin_serena_serena__find_declaration mcp__plugin_serena_serena__get_diagnostics_for_file
---

Error/symptom: $ARGUMENTS

1. If a stack trace or error message is provided, parse it to identify the failure point.
2. Read the relevant code at the failure point.
3. Check git log for recent changes to those files.
4. Form hypotheses ranked by likelihood.

Output:
## Debug Analysis: [error/symptom]

### Error Breakdown
```
[parsed stack trace or error, annotated with what each line means]
```

### Failure Point
**File**: [file:line]
**Function**: [function name]
**Trigger**: [what causes this code path]

### Root Cause Hypotheses
| # | Hypothesis | Likelihood | Evidence |
|---|-----------|-----------|----------|
| 1 | | HIGH/MED/LOW | |
| 2 | | | |
| 3 | | | |

### Most Likely Root Cause
[explanation of top hypothesis]

### Fix Candidates
| Option | Approach | Risk | Recommended |
|--------|----------|------|-------------|

### Verification Steps
[How to confirm the fix resolves the issue without regression]

### Recent Changes (if relevant)
[git log output for relevant files — what changed recently]
