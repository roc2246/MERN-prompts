---
name: mern-layout-ux-review
description: Review a MERN frontend layout for responsive behavior, accessibility, usability, visual hierarchy, and production readiness. Use for layout, responsive design, or UX audits.
metadata:
  author: riley-childs
  version: "2.0"
---

# mern-layout-ux-review

## Focus

Responsive behavior, accessibility, usability, visual hierarchy, interaction clarity, and production readiness.

## Workflow

1. Inspect only the files and nearby dependencies needed for the requested scope.
2. Load `references/project-standards.md` only when repository conventions materially affect the task.
3. Load the relevant files under `references/` for deep or exhaustive review; do not load every reference for narrow questions.
4. For broad audits, establish scope from the supplied files and do not claim complete coverage without evidence that every in-scope file was inspected.
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
