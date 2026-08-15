---
name: mern-documentation
description: Audit or update MERN project documentation so architecture, setup, APIs, environment variables, and maintenance guidance stay accurate. Use for README or documentation review/update tasks.
metadata:
  author: riley-childs
  version: "2.0"
---

# mern-documentation

## Focus

Documentation accuracy against the repository, setup completeness, architecture/API drift, environment variables, and maintainability guidance.

## Workflow

1. Inspect only the files and nearby dependencies needed for the requested scope.
2. Load `references/project-standards.md` only when repository conventions materially affect the task.
3. Load the relevant files under `references/` for deep or exhaustive review; do not load every reference for narrow questions.
4. For recursive/full-project audits, use `scripts/inventory.py` when present and pass only relevant extensions. Never claim complete coverage without deterministic inventory evidence.
5. Base findings only on inspected code. Follow imports/call sites when required to prove behavior or safely remove validation.
6. Prefer small, high-confidence, production-relevant changes over broad rewrites or new abstractions.
7. Keep runtime validation at untrusted boundaries such as HTTP input, environment variables, JSON, database data, local storage, files, forms, and third-party APIs.
8. Reviews are read-only unless the user explicitly requests implementation. If implementation is requested, make the requested safe changes directly, run existing relevant checks when available, and report changed files plus validation results.

## Output

- Put the highest-impact finding or action first.
- Cite exact file paths and code areas.
- Explain why recommendations matter and note practical tradeoffs.
- Avoid repeating standards that do not affect the task.
- If code changes are made, include a concise Git commit message.
