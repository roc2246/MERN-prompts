# typescript-best-practices-review.prompt.md

## Preferred workflow

If the client supports Agent Skills, use `.agents/skills/mern-typescript-review/SKILL.md` instead of treating this file as a large standalone system prompt. The skill is the source of truth for this workflow.

## Task

Recursively audit the requested TypeScript/TSX scope for type safety, idiomatic TypeScript, runtime-boundary validation, compiler configuration, and safe refactors.

## Context loading

- Start with the files/folders named by the user.
- Load only nearby code needed to understand imports, call sites, configuration, or behavior.
- Load `.agents/skills/mern-typescript-review/references/project-standards.md` only when repository conventions affect the task.
- For a deep or exhaustive audit, load `.agents/skills/mern-typescript-review/references/detailed-checklist.md`. Do not load the detailed checklist for a narrow question.
- For recursive audits, use the skill's `scripts/inventory.py` when present so coverage is deterministic rather than inferred.

## Working rules

- Base claims only on files actually inspected.
- Do not claim complete-project coverage unless every inventoried in-scope file was reviewed.
- Prefer small, high-confidence, production-relevant changes over broad rewrites.
- Preserve runtime validation at untrusted boundaries even when TypeScript types exist.
- Follow the repository approval workflow before editing when applicable.
- After approved changes, run relevant existing checks when available and report changed files and validation results.
- Put the highest-impact finding first and include exact file paths.
- If code changes, provide a concise Git commit message.
