---
name: sec-threat
description: STRIDE threat modeling for a system, component, or data flow. Use when designing security controls or reviewing architecture.
allowed-tools: Read Glob mcp__lumen__semantic_search mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__find_implementations
---

Target: $ARGUMENTS (system description, architecture doc, or diagram description).

Apply STRIDE to each identified component/trust boundary:
- **S**poofing — identity forgery (auth controls)
- **T**ampering — data modification (integrity controls)
- **R**epudiation — deny actions (audit/logging)
- **I**nformation Disclosure — data leakage (confidentiality)
- **D**enial of Service — availability attacks (resilience)
- **E**levation of Privilege — unauthorized access (authz)

Output:
## Threat Model: [system name]

### Components & Trust Boundaries
[list components and data flows]

### Threat Matrix
| Component | STRIDE | Threat | Likelihood (H/M/L) | Impact (H/M/L) | Control |
|-----------|--------|--------|-------------------|----------------|---------|

### Risk Summary
| Risk | Score (L×I) | Priority | Recommended Control |
|------|-------------|----------|---------------------|

### Top Mitigations
1.
2.
3.
