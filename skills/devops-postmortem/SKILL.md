---
name: devops-postmortem
description: Blameless post-mortem document. Use after an incident is resolved to document timeline, root cause, and action items.
allowed-tools: Read
---

Context: $ARGUMENTS (incident description, service, date)

Generate a blameless post-mortem. Focus on systems and processes, never individuals.

Output:
## Post-Mortem: [incident title]

**Date**: [incident date]
**Duration**: [start] → [end] ([total time])
**Severity**: SEV[N]
**Author(s)**:
**Review date**:

### Summary
[2-3 sentences: what happened, what was the impact, how was it resolved]

### Impact
- **Users affected**: 
- **Downtime/degradation**: 
- **Data loss**: none / [details]
- **Financial impact**: 

### Timeline
| Time (UTC) | Event |
|------------|-------|

### Root Cause
[The specific technical cause. Use "5 Whys" if applicable:]
- Why 1:
- Why 2:
- Why 3:
- Why 4:
- Why 5 (root):

### Contributing Factors
[System/process factors that made the incident possible or worse]

### What Went Well
-

### What Went Poorly
-

### Action Items
| Action | Owner | Priority | Due Date | Status |
|--------|-------|----------|----------|--------|

### Lessons Learned
[Key takeaways for the team]
