---
name: mern-typescript-review
description: Audit handwritten TypeScript/TSX for type safety, idiomatic TypeScript, runtime-boundary validation, compiler configuration, and safe refactors. Use for TypeScript best-practices reviews.
metadata:
  author: riley-childs
  version: "2.0"
---

# mern-typescript-review

## Focus

Type safety, domain modeling, runtime boundaries, compiler configuration, modules, Node/Express/Mongoose, React/TSX, and safe TypeScript-native refactors.

## Workflow

1. Inspect only the files and nearby dependencies needed for the requested scope.
2. Load `references/project-standards.md` only when repository conventions materially affect the task.
3. Load references progressively:
   - `references/type-safety.md` for types/assertions/domain modeling.
   - `references/runtime-boundaries.md` for validation and trust boundaries.
   - `references/compiler-and-modules.md` for `tsconfig` or module questions.
   - `references/node-express-mongoose.md` for backend-specific review.
   - `references/react-tsx.md` for frontend-specific review.
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
