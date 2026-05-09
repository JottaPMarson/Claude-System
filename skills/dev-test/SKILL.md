---
name: dev-test
description: Generate unit tests — happy path, edge cases, and mocks. Use when adding tests for existing code or new features.
allowed-tools: Read Grep Glob mcp__lumen__semantic_search mcp__plugin_serena_serena__get_symbols_overview mcp__plugin_serena_serena__find_symbol mcp__plugin_serena_serena__find_referencing_symbols
---

Target: $ARGUMENTS (file or function to test)

1. Read the target file to understand the function signatures, types, and behavior.
2. Detect the test framework in use (Jest, pytest, Go testing, JUnit, RSpec, etc.) by reading existing test files.
3. Generate tests that match the existing framework and style.

Test coverage to include:
- **Happy path** — normal inputs, expected outputs
- **Edge cases** — empty/null/zero inputs, boundaries, max values
- **Error cases** — invalid inputs, error propagation, exception handling
- **Mocks** — external dependencies (DB, HTTP, filesystem) should be mocked

Output ready-to-run test code. Match the existing file structure (import paths, naming conventions, describe/it blocks or equivalent).

If the function has side effects, test the side effects explicitly.
If the function is untestable as written (tight coupling, no dependency injection), note what needs to change first.
