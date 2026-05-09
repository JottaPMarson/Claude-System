---
name: arch-design
description: Technical design document for a feature or system. Use before implementing anything non-trivial to align on approach.
allowed-tools: Read Glob Grep Bash(git log *) mcp__lumen__semantic_search mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__find_implementations mcp__plugin_serena_serena__find_declaration
---

Feature/system: $ARGUMENTS

Read existing code to ground the design before generating. Identify current patterns, data models, and API conventions in use.

Output:
## Design Doc: [Feature/System Name]

**Status**: Draft / In Review / Approved
**Author(s)**:
**Reviewers**:
**Target release**:

---

### Overview
[1-2 paragraphs: what this is and why we're building it]

### Goals
-
### Non-Goals
-

### Background
[Existing system context relevant to this design]

### Detailed Design

#### Architecture
[Component diagram (text), data flow, integration points]

#### Data Model
```
[schema / entity definitions]
```

#### API Contract
```
[endpoint definitions, request/response shapes]
```

#### Key Algorithms / Logic
[Non-obvious business logic or processing steps]

#### Error Handling
[How errors propagate, what's recoverable vs fatal]

#### Security Considerations
[AuthN/AuthZ, data sensitivity, trust boundaries]

### Testing Plan
| Test type | Coverage | Notes |
|-----------|----------|-------|

### Rollout Plan
| Phase | Scope | Criteria to advance |
|-------|-------|---------------------|

### Risks
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|

### Open Questions
- [ ]
