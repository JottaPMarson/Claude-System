---
name: sec-review
description: Security-focused code review — OWASP Top 10, injection, auth flaws, crypto, sensitive data exposure.
when_to_use: Invoke automatically when the user mentions security, vulnerabilities, "está seguro?", "tem brecha?", "pode ser explorado?", "pentest", "autenticação", or when the code being reviewed handles auth, passwords, tokens, user input, or external APIs. Also invoke if during a general review you spot a potential security issue — switch to this skill.
allowed-tools: Read Grep Glob Bash(git diff *) mcp__lumen__semantic_search mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__find_referencing_symbols mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__search_for_pattern mcp__plugin_serena_serena__find_declaration
---

Target: $ARGUMENTS (file, directory, or `git diff HEAD` if empty).

Check in order — stop at first critical per category, note all highs:
1. **Injection** — SQL, command, LDAP, XPath, template injection
2. **Auth/AuthZ** — broken auth, missing authz checks, IDOR, privilege escalation
3. **Sensitive data** — hardcoded secrets, PII in logs, unencrypted storage/transit
4. **Crypto** — MD5/SHA1 for security, ECB mode, static IVs, weak key sizes
5. **Security misconfiguration** — debug on prod, verbose errors, default creds, open CORS
6. **XSS/CSRF** — if web code: unescaped output, missing CSRF tokens
7. **Deps** — grep for known-bad patterns (eval, exec, pickle.loads, deserialize)

Output:
## Security Review: [target]

| # | Severity | Category | Location | Finding | Fix |
|---|----------|----------|----------|---------|-----|

**Severity counts**: CRITICAL: N | HIGH: N | MEDIUM: N | LOW: N

**Top 3 fixes**:
1.
2.
3.
