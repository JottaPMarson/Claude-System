---
name: sec-owasp
description: OWASP Top 10 (2021) checklist against code or endpoint. Use for compliance checks or pre-release security gates.
allowed-tools: Read Grep Glob mcp__lumen__semantic_search mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__search_for_pattern
---

Target: $ARGUMENTS (codebase path or specific component).

Evaluate each OWASP Top 10 (2021) category:
A01 Broken Access Control | A02 Cryptographic Failures | A03 Injection
A04 Insecure Design | A05 Security Misconfiguration | A06 Vulnerable Components
A07 Auth Failures | A08 Software/Data Integrity Failures | A09 Logging Failures
A10 SSRF

For each: read relevant code, grep for patterns, determine PASS/FAIL/NA/PARTIAL.

Output:
## OWASP Top 10 Checklist: [target]

| # | Category | Status | Evidence | Notes |
|---|----------|--------|----------|-------|
| A01 | Broken Access Control | | | |
| A02 | Cryptographic Failures | | | |
| A03 | Injection | | | |
| A04 | Insecure Design | | | |
| A05 | Security Misconfiguration | | | |
| A06 | Vulnerable Components | | | |
| A07 | Auth Failures | | | |
| A08 | Integrity Failures | | | |
| A09 | Logging Failures | | | |
| A10 | SSRF | | | |

**Findings** (FAIL/PARTIAL only):
[detail each failure with file:line and recommendation]

**Overall**: PASS / FAIL — N categories need attention
