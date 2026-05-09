---
name: dev-commit
description: Generate a conventional commit message from staged diff.
when_to_use: Invoke automatically whenever the user says anything about committing — "commit", "commita", "fazer commit", "gera a mensagem", "quero commitar", "cria o commit". Do not wait to be asked for /dev-commit explicitly.
allowed-tools: Bash(git diff --staged) Bash(git diff *) Bash(git status) Bash(git log *)
---

$ARGUMENTS (optional: additional context or scope hint)

1. Run `git diff --staged` to see what's staged. If nothing staged, use `git diff HEAD`.
2. Read recent `git log --oneline -10` to match the repo's commit style.
3. Generate a conventional commit message.

Conventional commit format:
```
<type>(<scope>): <short description>

[optional body — only if WHY is non-obvious from the title]

[optional footer: Breaking changes, closes #issue]
```

Types: `feat` `fix` `refactor` `perf` `test` `docs` `chore` `ci` `build` `revert`

Rules:
- Title ≤72 chars, lowercase, no period at end
- Scope = affected module/package (omit if change is global)
- Body only if the diff doesn't speak for itself
- Breaking change: add `!` after type/scope AND footer `BREAKING CHANGE: description`

Output the commit message in a code block, ready to copy.
If the diff contains multiple unrelated changes, output one message per logical group and note they should be staged separately.
