# Shared Workflow

1. Scope the request; inspect only target files plus dependencies needed to verify behavior.
2. For full/recursive audits, inventory relevant handwritten files first with `_base/inventory.py`.
3. Load `project-standards.md` only when repo conventions matter. Load a skill's `detailed-checklist.md` only for deep/exhaustive review.
4. Base claims on inspected code. Separate confirmed defects from suggestions; never claim full coverage without an inventory.
5. Prefer the smallest safe change. Preserve existing architecture and behavior unless change is required.
6. Treat external data as untrusted: TypeScript types do not replace runtime validation.
7. Do not edit files unless asked. If asked to implement, edit only in scope, run relevant existing checks, and report changed files/results.
