# Portable MERN Agent Architecture

This directory is the complete reusable AI architecture for a MERN project.
Copy **only `.agents/`** into another repository to reuse the system.

## Structure

```text
.agents/
├── skills/                 # Portable Agent Skills
├── docs/                   # Human/reference architecture and standards
├── scripts/                # MERN/bootstrap and adapter tooling
├── adapters/               # Canonical thin platform-specific routers
│   ├── CLAUDE.md
│   └── github/
│       └── copilot-instructions.md
├── AGENT-SKILLS.md         # Skill architecture/conventions
├── project.gitignore       # Optional gitignore baseline for cloned projects
└── README.md
```

## Design rules

- `.agents/skills/` is the source of AI behavior.
- Each skill is independently portable and loads references progressively.
- Domain knowledge belongs in skill references, not always-on platform prompts.
- Deterministic tasks belong in scripts when scripts improve reliability or save context.
- `.agents/docs/` is human-readable baseline guidance; it is not automatically loaded into every skill.
- Platform adapters stay thin and route the agent toward `.agents/skills/`.

## Reuse in another project

Copy the entire `.agents/` folder into the target repository.

If your coding agent requires a root-level adapter, install the thin generated copies from the canonical adapter sources:

```powershell
./.agents/scripts/install-agent-adapters.ps1
```

This creates only the integration files required by the platform, while `.agents/` remains the single canonical package you maintain and copy between projects.

## MERN bootstrap

The project bootstrap script lives at:

```text
.agents/scripts/New-MernProject.ps1
```

It is operational tooling, not skill context, so agents should not load it unless the task requires project scaffolding.
