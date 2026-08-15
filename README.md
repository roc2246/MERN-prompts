# MERN AI Dev Toolkit

A compact AI workspace for MERN development: MongoDB/Mongoose, Express/Node, React, TypeScript/JavaScript, testing, SCSS, documentation, and UX review.

## How it works

`.agents/skills/` is the primary interface. Skills use progressive disclosure: the agent first sees `name` + `description`, loads the matching `SKILL.md`, and reads detailed references only when required. Shared rules live in `.agents/skills/_base/` to avoid repeating tokens across skills.

## Skills

- `mern-code-review` — general full-stack review
- `mern-backend-review` — backend architecture/reliability
- `mern-api-review` — Express routes/controllers/middleware
- `mern-business-logic-review` — services/utilities/domain logic
- `mern-typescript-review` — TypeScript/TSX best practices
- `mern-react-review` — React review
- `mern-react-component` — component creation/refactor
- `mern-scss-review` — SCSS/CSS architecture/refactor
- `mern-layout-ux-review` — responsive UX/accessibility
- `mern-test-coverage` — missing-test audit/generation
- `mern-documentation` — README/docs maintenance
- `mern-explain-code` — code explanation

## Usage

Ask the agent to use the exact skill when you want deterministic activation, for example:

```text
Use mern-typescript-review to audit server/src for TypeScript best practices.
```

For recursive audits, the shared inventory script provides a reproducible file list:

```bash
python .agents/skills/_base/inventory.py server/src --ext .ts --ext .tsx
```

Repository conventions always override generic defaults. Prefer narrow scope, minimal safe edits, runtime validation at trust boundaries, and existing project tooling for type-check/lint/test/build verification.

Standalone files in `prompts/` are intentionally tiny aliases for users/tools that still prefer `.prompt.md` entrypoints.
