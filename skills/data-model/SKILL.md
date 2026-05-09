---
name: data-model
description: Data model design — schema, relationships, indexes, and normalization tradeoffs. Use when designing or reviewing a database schema.
allowed-tools: Read Grep Glob mcp__lumen__semantic_search mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__get_symbols_overview
---

Domain/context: $ARGUMENTS

Design or review a data model. Consider the access patterns before normalizing.

Output:
## Data Model: [domain]

### Entities & Relationships

```
[ERD in text notation — e.g.:]
User (1) ──── (N) Order (N) ──── (N) Product
             └── (1) Address
```

### Schema

```sql
-- [or appropriate DDL for the target DB]

CREATE TABLE [table] (
  id          [type]  PRIMARY KEY,
  [field]     [type]  [constraints],
  created_at  [type]  NOT NULL DEFAULT now(),
  updated_at  [type]  NOT NULL DEFAULT now()
);
```

### Indexes

| Table | Index | Columns | Type | Justification |
|-------|-------|---------|------|---------------|

### Normalization Analysis
**Level**: 1NF / 2NF / 3NF / BCNF / Denormalized (explain why)
[Tradeoffs made and why]

### Access Patterns
| Query | Frequency | Supported by index? | Notes |
|-------|-----------|---------------------|-------|

### Tradeoffs
| Decision | Why this approach | Alternative considered | Cost |
|----------|-------------------|----------------------|------|

### Migration Considerations
[If modifying existing schema: backward compatibility, zero-downtime migration path]
