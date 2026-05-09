---
name: devops-incident
description: Incident response runbook — severity classification, timeline, actions, stakeholder comms.
when_to_use: Invoke automatically when the user signals an active incident — "caiu", "fora do ar", "outage", "serviço down", "sistema caiu", "usuários sem acesso", "tá em produção quebrando", "incidente". Urgency matters: invoke immediately without asking for confirmation.
allowed-tools: Read Bash(git log *)
---

Incident description: $ARGUMENTS

Generate a structured incident response document:

**Severity classification**:
- SEV1: Complete outage, data loss risk, security breach
- SEV2: Major feature down, significant user impact
- SEV3: Partial degradation, workaround available
- SEV4: Minor issue, minimal impact

Output:
## Incident Report

**Status**: ACTIVE / RESOLVED
**Severity**: SEV[N] — [one-line reason]
**Declared**: [timestamp]
**Incident Commander**: [TBD]
**Communication channel**: [TBD]

### Impact
- **Users affected**: 
- **Systems affected**: 
- **Business impact**: 

### Timeline
| Time | Event | Who |
|------|-------|-----|

### Current Hypothesis
[most likely root cause based on symptoms]

### Actions Taken
| Time | Action | Owner | Result |
|------|--------|-------|--------|

### Next Actions
| Action | Owner | ETA |
|--------|-------|-----|

### Stakeholder Comms Template
> **[SEV-N] [Service] incident — [HH:MM]**
> Status: Investigating / Identified / Monitoring / Resolved
> Impact: [user-facing description]
> Next update: [time]

### Escalation Path
[fill based on project runbook]
