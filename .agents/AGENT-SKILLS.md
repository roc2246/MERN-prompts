# Agent Skills Architecture

`.agents/skills/` is the single AI workflow interface for this toolkit. Separate legacy `.prompt.md` files are intentionally not required.

## Progressive disclosure

1. **Discover** — the agent sees concise skill `name` and `description` metadata.
2. **Match** — the task is routed to the narrowest relevant skill.
3. **Activate** — only that skill's `SKILL.md` is loaded.
4. **Access** — references and scripts are loaded/run only when the active task needs them.

## Skill anatomy

A skill may contain:

- `SKILL.md` — metadata plus instructions useful on most activations.
- `references/` — optional domain knowledge, checklists, examples, schemas, or standards loaded progressively.
- `scripts/` — deterministic helpers for repeatable operations such as recursive inventory.
- `assets/` — only when the capability genuinely needs reusable non-instruction resources.

Not every skill needs every folder. For example, `mern-explain-code` is intentionally lightweight and `mern-layout-ux-review` does not include an inventory script solely for symmetry.

## Authoring rules

- Give each skill one clear capability or repeatable workflow.
- Make `description` state both what it does and when it should activate.
- Keep instructions LLM/agent agnostic unless a platform dependency is genuine.
- Put instructions needed every run directly in `SKILL.md` rather than behind another shared reference.
- Put optional/deep context under `references/`; split very large references by topic.
- Put deterministic repeatable logic under `scripts/` when it improves reliability or token efficiency.
- Keep skills self-contained enough to copy independently; avoid sibling `_base` dependencies.
- Do not add scripts/assets merely because another skill has them.
- Keep global product-specific instruction files thin and route task-specific behavior to skills.

## Review and implementation

Review/audit requests are read-only unless the user asks for changes. Explicit implementation, creation, fix, or refactor requests authorize the requested safe edits without requiring a redundant second approval gate.
