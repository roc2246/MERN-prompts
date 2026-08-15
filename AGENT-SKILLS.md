# Agent Skills

This workspace follows progressive disclosure: agents discover skills from frontmatter, load one matching `SKILL.md`, then load references/scripts only when needed.

## Authoring

- Keep each skill narrow and make its description state what it does and when to use it.
- Put only always-needed instructions in `SKILL.md`.
- Put deep criteria in `references/`; use scripts for deterministic/repeatable work.
- Prefer shared `_base/` rules over duplicated text.
- Do not add examples, schemas, or policies unless they materially improve execution.
