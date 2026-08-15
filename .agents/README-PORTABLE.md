# Portable MERN Agent Skills

Copy the `.agents` folder directly into the root of a MERN workspace/repository.

The runtime skill layout is:

`.agents/skills/<skill-name>/SKILL.md`

Each skill keeps its own `references/` folder intact. Shared deterministic tooling belongs under `.agents/scripts/`; skills may invoke it without duplicating its implementation.
