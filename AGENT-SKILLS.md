# Agent Skills Architecture

This toolkit now treats the files in `.agents/skills/` as the primary AI workflow interface. The older `prompts/*.prompt.md` files are retained as detailed reference checklists and backward-compatible prompt templates.

## Why this structure

The skill layout follows progressive disclosure:

1. **Discovery:** the agent sees each skill's `name` and `description`.
2. **Activation:** only the matching `SKILL.md` is loaded.
3. **Execution:** detailed checklists, project standards, and scripts are loaded only when the active task requires them.

This avoids injecting all MERN standards and every review criterion into every request. It reduces irrelevant context and makes task matching more reliable.

## Skill anatomy

Each skill contains:

- `SKILL.md` — concise metadata plus the repeatable workflow.
- `references/detailed-checklist.md` — the former full prompt, used only for deep/exhaustive work.
- `scripts/` — deterministic helpers where file discovery or repeatability benefits from executable logic.

## Authoring rules

When adding a new workflow:

- Create a narrowly scoped skill rather than enlarging a global instruction file.
- Make `description` explain both **what the skill does** and **when it should activate**.
- Keep `SKILL.md` focused on instructions needed on every run.
- Put long criteria, examples, domain references, schemas, and edge-case catalogs under `references/`.
- Put repeatable deterministic operations under `scripts/` when a script is more reliable than asking the model to improvise.
- Load project standards selectively. Do not require every standards file for every task.
- Prefer portable instructions that do not depend on one specific agent product unless a capability genuinely requires it.

## Legacy prompts

`prompts/` remains useful for clients that do not support Agent Skills. When editing a legacy prompt, keep it aligned with its corresponding skill and avoid turning it into a global always-loaded instruction set.
