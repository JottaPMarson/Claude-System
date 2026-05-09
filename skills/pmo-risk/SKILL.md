---
name: pmo-risk
description: Risk assessment matrix with probability, impact, and mitigation plan. Use at project start or when risks need to be formally tracked.
allowed-tools: Read
---

Project/context: $ARGUMENTS

Identify risks across categories: technical, resource, schedule, scope, external, compliance/security.

Scoring: Probability 1-5 (1=rare, 5=almost certain) × Impact 1-5 (1=negligible, 5=critical) = Risk Score

Output:
## Risk Assessment: [project]

**Date**:
**Last reviewed**:
**Risk owner**:

### Risk Register
| ID | Category | Risk Description | Probability (1-5) | Impact (1-5) | Score | Level | Mitigation | Contingency | Owner | Status |
|----|----------|-----------------|-------------------|--------------|-------|-------|------------|-------------|-------|--------|

**Risk levels**: 🔴 Critical (20-25) | 🟠 High (12-19) | 🟡 Medium (6-11) | 🟢 Low (1-5)

### Risk Matrix
```
  5 |  5 | 10 | 15 | 20 | 25
  4 |  4 |  8 | 12 | 16 | 20
  3 |  3 |  6 |  9 | 12 | 15
  2 |  2 |  4 |  6 |  8 | 10
  1 |  1 |  2 |  3 |  4 |  5
     1    2    3    4    5
     <-- Probability -->
```

### Top Risks (score ≥ 12)
| ID | Risk | Score | Immediate action required |
|----|------|-------|--------------------------|

### Review Schedule
| Trigger | Action |
|---------|--------|
| Monthly | Review all open risks |
| Score change | Update register |
| New risk identified | Add within 24h |
