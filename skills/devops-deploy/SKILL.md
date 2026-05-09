---
name: devops-deploy
description: Pre-deployment checklist and go/no-go verification. Use before deploying to any environment, especially production.
allowed-tools: Read Bash(git log *) Bash(git status) Bash(git diff *) Bash(docker ps)
---

Service/environment: $ARGUMENTS

Run checks and mark GO/NO-GO/NA for each:

**Code**
- [ ] All tests passing (check CI status or test output)
- [ ] No uncommitted changes in deploy branch
- [ ] PR reviewed and merged (not direct push to main)
- [ ] Changelog/release notes updated

**Config & Secrets**
- [ ] Env vars configured for target environment
- [ ] No secrets in code (grep for hardcoded keys)
- [ ] Feature flags set correctly

**Infrastructure**
- [ ] Database migrations tested (rollback plan exists)
- [ ] Dependencies healthy (downstream services, DBs, queues)
- [ ] Resource limits/autoscaling configured
- [ ] Health check endpoints responsive

**Observability**
- [ ] Monitoring/alerting configured for new code paths
- [ ] Log levels appropriate for production
- [ ] Dashboards updated if new metrics

**Rollback**
- [ ] Rollback procedure documented
- [ ] Previous version artifact available
- [ ] Rollback tested in staging

Output:
## Deploy Checklist: [service] → [env]

| Category | Check | Status | Notes |
|----------|-------|--------|-------|

**Decision**: GO / NO-GO
**Blockers**: [list if NO-GO]
**Deploy command**: [if known]
