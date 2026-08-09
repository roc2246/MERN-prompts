# Project Instructions

This repository uses portable Agent Skills under `.agents/skills/` for task-specific MERN workflows.

Use progressive disclosure:

- Match the user's task to the narrowest relevant skill by `name` and `description`.
- Load the matching `SKILL.md` when needed; do not preload every skill.
- Load its bundled project standards only when repository conventions matter.
- Load detailed checklists only for exhaustive reviews.
- Prefer bundled scripts for deterministic inventory/repeatable operations.

For code changes, avoid unrelated edits, follow the active skill's workflow, run relevant existing checks when available, and include a concise Git commit message.
