---
name: devops-slo
description: SLO/SLA definition and error budget calculation for a service. Use when setting reliability targets or reviewing SLO compliance.
allowed-tools: Read
---

Service: $ARGUMENTS

Define or review SLOs. If existing SLO data is provided, calculate error budget consumption.

**SLI categories to consider**:
- Availability: % of successful requests
- Latency: % of requests under threshold (p50/p95/p99)
- Error rate: % of non-5xx responses
- Throughput: requests per second sustained
- Freshness: data staleness for pipelines/batch

Output:
## SLO Definition: [service]

### Service Overview
[brief description, criticality, user base]

### SLOs
| SLI | Metric | Target | Window | Measurement |
|-----|--------|--------|--------|-------------|
| Availability | successful_requests / total_requests | 99.9% | 30d rolling | [tool/query] |
| Latency p95 | | | | |
| Error rate | | | | |

### Error Budgets
| SLO | Target | Allowed downtime/month | Allowed errors/day |
|-----|--------|------------------------|-------------------|
| 99.9% availability | 99.9% | 43.8 min | [N errors at X RPS] |

### Error Budget Status (if data available)
| SLO | Budget | Consumed | Remaining | Burn Rate |
|-----|--------|----------|-----------|-----------|

### Alerting Thresholds
| Alert | Condition | Severity | Action |
|-------|-----------|----------|--------|
| Fast burn | >14.4× burn rate for 1h | PAGE | immediate response |
| Slow burn | >3× burn rate for 6h | TICKET | review next business day |

### SLA (external commitment)
[If different from SLO — typically 1-2% lower than internal SLO]
