# Roadmap — claude-system

Status: **v0.1.1** — 21 skills · 3 agents · 3 hooks · validate + merge de settings ativos
Roadmap: **+32 skills** planejadas em 10 domínios novos até v0.4

---

## Estado atual (v0.1.1)

### Skills (21)

| Domínio | Comando | Função |
|---------|---------|--------|
| Security | `/sec-review` | Code review focado em vulnerabilidades (OWASP Top 10) |
| Security | `/sec-threat` | Threat modeling STRIDE |
| Security | `/sec-owasp` | Checklist formal OWASP 2021 |
| DevOps | `/devops-deploy` | Checklist go/no-go pré-deploy |
| DevOps | `/devops-incident` | Runbook de resposta a incidente (SEV1-4) |
| DevOps | `/devops-postmortem` | Post-mortem blameless estruturado |
| DevOps | `/devops-slo` | SLO/SLA + cálculo de error budget |
| Architecture | `/arch-rfc` | Documento RFC completo |
| Architecture | `/arch-adr` | Architecture Decision Record (MADR) |
| Architecture | `/arch-design` | Design doc técnico de feature/sistema |
| Architecture | `/arch-debt` | Análise de tech debt + matriz esforço×impacto |
| PMO | `/pmo-sprint` | Sprint planning com estimativas e dependências |
| PMO | `/pmo-status` | Status report RAG (Verde/Âmbar/Vermelho) |
| PMO | `/pmo-risk` | Risk register com matriz probabilidade×impacto |
| PMO | `/pmo-stakeholder` | Comunicado executivo sem jargão técnico |
| Dev | `/dev-review` | Code review estruturado (Critical/Major/Minor) |
| Dev | `/dev-commit` | Conventional commit message a partir do git diff |
| Dev | `/dev-test` | Geração de testes unitários com edge cases |
| Dev | `/dev-debug` | Root cause analysis a partir de erro/stack trace |
| Data | `/data-pipeline` | Review de pipeline (idempotência, qualidade, perf) |
| Data | `/data-model` | Design de schema + índices + tradeoffs |

### Agentes (3)

| Agent | Ferramentas | Quando usa |
|-------|-------------|------------|
| `sec-agent` | Read, Grep, Glob, WebSearch, Serena | Auditorias de segurança profundas (somente leitura) |
| `arch-agent` | Read, Grep, Glob, git log, WebSearch, Serena | Análise de arquitetura e design |
| `pmo-agent` | Read, git log, git shortlog | Saúde do projeto a partir do histórico |

### Hooks (3)

| Hook | O que bloqueia |
|------|----------------|
| `pre-bash.sh` | `rm -r/R/*`, `git push --force`, `dd` em disco, `mkfs/fdisk/parted`, `docker --privileged` |
| `pre-read.sh` | `.env`, `*.pem`, `*.key`, `~/.aws/*`, `~/.ssh/*` |
| `pre-write.sh` | Escrita em `/etc/`, `/usr/`, `/bin/`, `/sbin/`, `/boot/`, `/lib/` |

### Infraestrutura

| Item | Status |
|------|--------|
| `validate.sh` — valida frontmatter de SKILL.md/AGENT.md antes do install | ✅ |
| `install.sh` com merge de settings via jq (preserva plugins e tema do usuário) | ✅ |
| Rotação de backups — mantém os 3 mais recentes | ✅ |

---

## Backlog

### v0.1.x — Melhorias do sistema e novas skills

| Item | Tipo | O que resolve |
|------|------|---------------|
| `/arch-diagram` | skill | Gera XML draw.io a partir de design docs — gap de visualização |
| `/present` | skill | Material para reuniões e apresentações técnicas (roteiro, talking points, demo) |
| `/dev-pr` | skill | PR description completa a partir do git diff (além do `/dev-commit`) |
| `/sec-deps` | skill | Scanner de dependências vulneráveis por ecossistema (npm, pip, go, trivy) |
| `/pm-prd` + `/pm-okr` + `/pm-story` | skill (3) | Domínio Product — PRD, OKRs, User Stories com Gherkin |
| `/devops-infra` | skill | Review de IaC: Terraform, Kubernetes YAML, Docker Compose |
| `/arch-review` | skill | Análise da arquitetura atual (coupling, coesão, pontos de falha) |
| `/dev-changelog` | skill | CHANGELOG.md (Keep a Changelog) a partir do git log entre tags |
| `mobile-review` + `mobile-release` | skill (2) | Review de código mobile + checklist de release iOS/Android |
| `post-bash.sh` | hook | Audit log de comandos executados — visibilidade de sessões longas |
| `post-write.sh` | hook | Lint automático no arquivo editado após Write/Edit |
| `qa-agent` | agent | Análise de cobertura — identifica funções sem teste e prioriza por impacto |

### v0.2 — Novos domínios críticos

| Domínio | Skills | O que resolve |
|---------|--------|---------------|
| Cloud / FinOps | `cloud-well-arch`, `cloud-cost`, `cloud-migration` | Well-Architected review, rightsizing/custo, plano de migração |
| Database / DBA | `db-query`, `db-migration`, `db-review` | Query lenta + EXPLAIN, migration zero-downtime, schema em produção |
| Legal / Compliance | `compliance-lgpd`, `compliance-soc2`, `compliance-checklist` | LGPD/GDPR, SOC2 readiness, HIPAA/PCI-DSS/ISO 27001 |
| Observability | `obs-alert`, `obs-dashboard`, `obs-trace` | Alertas SLO com burn rate, dashboards por audiência, distributed tracing |

### v0.3 — Expansão de cobertura

| Domínio | Skills | O que resolve |
|---------|--------|---------------|
| ML / AI Engineering | `ml-review`, `ml-card`, `prompt-eng`, `mlops-pipeline` | Qualidade de código ML, model cards, prompt review, MLOps pipeline |
| Frontend | `fe-review`, `fe-a11y`, `fe-perf` | Bundle, acessibilidade WCAG 2.1, Core Web Vitals |
| API / Platform | `api-design`, `api-review`, `sdk-design` | Design REST/GraphQL/gRPC, breaking changes, SDK ergonomia |
| Technical Writing | `docs-api`, `docs-readme`, `docs-runbook` | OpenAPI spec, README de projeto, runbooks operacionais |

### v0.4 — Domínios de papel específico

| Domínio | Skills | O que resolve |
|---------|--------|---------------|
| Engineering Management | `em-1on1`, `em-perf-review`, `em-team-health`, `em-hiring` | 1:1, perf review baseado em evidências, saúde do time, rubrica de entrevista |
| Agile / Scrum Master | `agile-retro`, `agile-metrics`, `agile-health` | Facilitação de retros, velocity/cycle time, health check do processo |

---

## Plano de execução

```
v0.1   ✅  21 skills · 3 agents · 3 hooks
v0.1.1 ✅  validate.sh · install merge · rotação de backups

v0.1.x ————————————————————————————
  Sprint 1  arch-diagram · present · post-bash.sh
  Sprint 2  dev-pr · pm-prd/okr/story · sec-deps
  Sprint 3  devops-infra · post-write.sh · arch-review
  Sprint 4  qa-agent · dev-changelog · mobile-review/release

v0.2 ——————————————————————————————
  Sprint 5  Cloud: cloud-well-arch · cloud-cost · cloud-migration
            DB: db-query · db-migration · db-review
  Sprint 6  Compliance: lgpd · soc2 · checklist
            Observability: obs-alert · obs-dashboard · obs-trace

v0.3 ——————————————————————————————
  Sprint 7  ML/AI: ml-review · ml-card · prompt-eng · mlops-pipeline
            Frontend: fe-review · fe-a11y · fe-perf
  Sprint 8  API: api-design · api-review · sdk-design
            Docs: docs-api · docs-readme · docs-runbook

v0.4 ——————————————————————————————
  Sprint 9  EM: em-1on1 · em-perf-review · em-team-health · em-hiring
            Agile: agile-retro · agile-metrics · agile-health
```

---

## Como contribuir com novas skills

Cada skill deve seguir o padrão:

```markdown
---
name: nome-do-skill
description: Uma linha — o que o skill faz. Claude lê isso para decidir quando auto-invocar.
when_to_use: Quando invocar automaticamente — frases, gatilhos, contextos. Omitir se for manual.
allowed-tools: Read Grep Glob Bash(git log *)
---

[Instrução compacta para o Claude. Sem prosa, sem padding.]

Output:
[Template estruturado da saída esperada — tabelas, listas, seções fixas]
```

**Regras de qualidade**:
- `description` deve responder "o que esse skill produz?" — Claude usa para decidir se auto-invoca
- `allowed-tools` mínimo necessário — não adicionar `WebSearch` se o skill só lê código local
- Para skills de análise de código: incluir `mcp__lumen__semantic_search` e as ferramentas Serena relevantes
- Output sempre estruturado: tabelas, listas, templates — nunca parágrafos soltos
- Testar: invocar o skill em um projeto real e verificar se o output é acionável

Veja [CONTRIBUTING.md](CONTRIBUTING.md) para o guia completo e [ROADMAP.md](ROADMAP.md) para evitar trabalho duplicado.

---

*Última atualização: 2026-05-09 | v0.1.1 — 21 skills · roadmap até v0.4 com +32 skills planejadas*
