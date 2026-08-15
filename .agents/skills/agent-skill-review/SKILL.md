---
name: agent-skill-review
description: Audit an Agent Skills repository for discoverability, progressive disclosure, token efficiency, modularity, deterministic scripting opportunities, portability, and redundant files. Use when reviewing or optimizing SKILL.md-based AI architecture.
metadata:
  author: riley-childs
  version: "1.0"
---

# Agent Skill Review

## Workflow

1. Inventory every skill folder and its `SKILL.md`, `references/`, `scripts/`, and assets.
2. Read skill metadata first and evaluate whether the name/description clearly communicate both capability and activation conditions.
3. Load `references/review-checklist.md` for a full architecture audit.
4. Identify duplicated or legacy AI instruction layers that compete with the skill system.
5. Prefer progressive disclosure: instructions required every run belong in `SKILL.md`; contextual/deep material belongs in references; deterministic repeatable work belongs in scripts.
6. Evaluate each skill for one clear purpose, portability, minimal context cost, and safe interaction with neighboring skills.
7. Verify referenced files/folders actually exist. Do not recommend symmetry for its own sake; scripts/assets should exist only when useful.
8. For implementation requests, make safe structural edits directly, preserve useful domain knowledge, then validate every skill reference and inventory the final tree.

## Output

For each file or skill, give a keep/change/delete decision and the reason. Prioritize architecture-level changes first, then skill-specific optimizations. If files are changed, report validation results and a concise Git commit message.
