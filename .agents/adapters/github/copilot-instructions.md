# Copilot Repository Instructions

Reusable AI behavior lives under `.agents/skills/`.

When a task matches a skill, discover the matching skill from its metadata, load that skill's `SKILL.md`, and progressively load only the references or scripts it explicitly requires. Do not preload unrelated skills or `.agents/docs/`.

Use the most specific matching skill. Use `mern-code-review` only when no more specialized review skill matches.
