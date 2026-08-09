---
name: mern-typescript-review
description: Recursively audit handwritten TypeScript/TSX for type safety, idiomatic TypeScript, runtime-boundary validation, compiler configuration, and safe refactors. Use for TypeScript best-practices reviews.
metadata:
  author: riley-childs
  version: "1.0"
---

# Workflow

1. Identify the exact files/folders and requested outcome from the user's task. Do not broaden scope without a concrete reason.
2. Inspect the target code and nearby files needed to understand imports, call sites, configuration, or behavior.
3. Load `references/project-standards.md` only when repository conventions affect the task. Do not load it for a narrow explanation that can be answered directly from the target code.
4. For a deep or exhaustive audit, read `references/detailed-checklist.md`. Do **not** load it for a narrow question that can be answered from the target code and core instructions.
5. Base findings on code actually inspected. Never claim complete coverage without an inventory or evidence that every in-scope file was reviewed.
6. Prefer small, high-confidence, production-relevant changes over broad rewrites or new abstractions.
7. Distinguish compile-time guarantees from runtime trust boundaries. Keep runtime validation for external/untrusted data.
8. When code changes are requested, follow the repository's approval workflow if the bundled project standards require it; after implementation, run the relevant existing checks when available and report changed files plus validation results.

# Output

- Put the highest-impact finding or action first.
- Cite exact file paths and code areas.
- Explain why each recommendation matters and its practical tradeoff.
- Avoid repeating standards that do not affect the current task.
- If implementation changes code, include a concise Git commit message.

# Deterministic inventory

For recursive/full-project audits, use `scripts/inventory.py` instead of relying on memory or a shallow directory listing. Pass only the extensions relevant to the task. This script provides a reproducible file list and total before review.
