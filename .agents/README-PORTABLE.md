# Portable MERN Agent Skills

Copy the `.agents` folder directly into the root of a MERN workspace/repository.

The runtime skill layout is:

`.agents/skills/<skill-name>/SKILL.md`

Each skill keeps its own `references/` and `scripts/` folders intact. Shared skill files remain in `.agents/skills/_base/`.

All other files from the original MERN-prompts repository are preserved under `.agents/_toolkit-original/` so nothing from the uploaded project was deleted. That archive is not required for Agent Skill discovery or execution.
