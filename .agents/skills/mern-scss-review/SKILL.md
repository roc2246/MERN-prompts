---
name: mern-scss-review
description: Audit SCSS/CSS architecture, nesting, variables, mixins, functions, duplication, responsiveness, and maintainability while preserving appearance. Use for stylesheet reviews or SCSS refactors.
metadata:
  author: riley-childs
  version: "2.0"
---

# mern-scss-review

## Focus

SCSS architecture, Sass-native reuse, selector/nesting discipline, responsive design, accessibility, and behavior-preserving refactors.

## Workflow

1. Inspect only the files and nearby dependencies needed for the requested scope.
2. Load `references/project-standards.md` only when repository conventions materially affect the task.
3. Load references progressively:
   - `references/architecture-and-sass.md` for Sass architecture, variables, mixins, functions, and duplication.
   - `references/responsive-accessibility.md` for responsive/UI/accessibility styling.
   - `references/exhaustive-review.md` only for deep/full-project audits.
4. For recursive/full-project audits, use `.agents/scripts/inventory.py` and pass only relevant extensions. Never claim complete coverage without deterministic inventory evidence.
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
