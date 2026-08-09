# Claude Project Instructions

Use `.agents/skills/` as the primary source for repeatable MERN workflows. Select the narrowest matching skill from its `name` and `description`, then load that skill's `SKILL.md` only when the task matches.

Keep global context lean:

- Do not preload every project standard or every review checklist.
- Load a skill's `references/project-standards.md` only when repository conventions affect the current task.
- Load `references/detailed-checklist.md` only for deep or exhaustive audits.
- Use bundled scripts for deterministic inventory or repeatable operations when the active skill provides them.
- Inspect only the project files needed to answer or implement the user's request, expanding scope when imports, call sites, configuration, or runtime behavior require it.

When making code changes, preserve unrelated code, validate with the project's existing checks when available, and provide a concise Git commit message.
