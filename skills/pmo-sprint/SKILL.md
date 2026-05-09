---
name: pmo-sprint
description: Sprint planning — breakdown, estimation, dependencies, and risk. Use at the start of a sprint given a backlog or list of items.
allowed-tools: Read
---

Sprint items / context: $ARGUMENTS

Break down items into tasks, estimate, identify dependencies and risks.

Story point scale: 1=trivial, 2=small, 3=medium, 5=large, 8=very large, 13=needs breakdown

Output:
## Sprint Plan: Sprint [N] — [dates]

**Team capacity**: [N] points (adjust based on team size/velocity)
**Goal**: [one sentence sprint goal]

### Backlog → Sprint Items
| # | Item | Breakdown | Points | Owner | Depends on | Risk |
|---|------|-----------|--------|-------|------------|------|

**Total**: [N] points

### Definition of Done
- [ ] Code reviewed and merged
- [ ] Tests written and passing
- [ ] Deployed to staging
- [ ] Acceptance criteria verified
- [ ] Docs updated if needed

### Risks & Blockers
| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|

### Dependencies (external)
| Item | Depends on | Team/Person | Status |
|------|------------|-------------|--------|

### Sprint Ceremonies
| Ceremony | When | Duration |
|----------|------|----------|
| Daily standup | Daily | 15 min |
| Mid-sprint check | Day [N] | 30 min |
| Review | Last day | 1h |
| Retro | Last day | 45 min |
