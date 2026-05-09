---
name: pmo-status
description: Project status report with RAG status, milestones, blockers, and next steps.
when_to_use: Invoke automatically when the user asks about project health or needs a status update — "como está o projeto?", "status do projeto", "preciso de um relatório", "reunião com stakeholder", "atualização do projeto", "o que foi feito essa semana".
allowed-tools: Read Bash(git log *) Bash(git shortlog *)
---

Project context: $ARGUMENTS

Read available project docs and git history to generate the report.

RAG: 🟢 Green = on track | 🟡 Amber = at risk | 🔴 Red = off track / blocked

Output:
## Project Status Report

**Project**: [name]
**Period**: [date range]
**Status**: 🟢 / 🟡 / 🔴 [one-line reason]
**Prepared by**:

---

### Executive Summary
[3-4 sentences: overall health, key achievements, key risks]

### Milestone Status
| Milestone | Target Date | Status | Notes |
|-----------|-------------|--------|-------|

### This Period — Completed
-

### This Period — In Progress
| Item | Owner | % Complete | ETA | Notes |
|------|-------|------------|-----|-------|

### Blockers
| Blocker | Impact | Owner | Resolution path |
|---------|--------|-------|-----------------|

### Risks
| Risk | RAG | Likelihood | Impact | Mitigation |
|------|-----|-----------|--------|------------|

### Next Period — Planned
-

### Budget / Resources (if applicable)
| Item | Budget | Actual | Forecast | Variance |
|------|--------|--------|----------|----------|

### Decisions Needed
-
