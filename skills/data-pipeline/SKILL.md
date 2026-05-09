---
name: data-pipeline
description: Data pipeline review — quality, idempotency, error handling, performance, observability. Use when reviewing ETL/ELT pipelines or data workflows.
allowed-tools: Read Grep Glob mcp__lumen__semantic_search mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__find_referencing_symbols
---

Pipeline: $ARGUMENTS (file, directory, or pipeline description)

Review the pipeline against these criteria:

**Correctness**
- Data type handling and coercions
- Join logic and cardinality assumptions
- Null/missing value handling
- Business rule implementation

**Reliability**
- Idempotency — can it run twice without duplicates?
- Exactly-once vs at-least-once semantics
- Retry logic and dead-letter handling
- Partial failure recovery

**Performance**
- Full table scans vs partition pruning
- Shuffle/sort operations (expensive in distributed systems)
- Memory pressure risks (large intermediate datasets)
- Parallelization opportunities

**Data Quality**
- Input validation / schema enforcement
- Output quality checks (row counts, null rates, value ranges)
- Reconciliation against source

**Observability**
- Row counts logged at each stage
- Latency tracking
- Alerting on failure or anomaly

Output:
## Pipeline Review: [pipeline name]

### Summary
[2-3 sentences: overall health, main concerns]

### Findings
| # | Category | Severity | Location | Issue | Recommendation |
|---|----------|----------|----------|-------|----------------|

### Idempotency Analysis
[Is the pipeline safe to re-run? What happens on partial failure?]

### Performance Hotspots
[Estimated expensive operations and optimization options]

### Data Quality Gates Recommended
| Check | Where | Threshold | Action on fail |
|-------|-------|-----------|----------------|
