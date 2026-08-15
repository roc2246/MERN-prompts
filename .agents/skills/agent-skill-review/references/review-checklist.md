# Agent Skill Review Checklist

Use this reference only for a full/deep skill architecture audit.

## Skill boundaries
- One clear capability or repeatable workflow per skill.
- Neighboring skills have distinguishable activation criteria.
- Catch-all skills remain fallbacks rather than absorbing specialized workflows.

## Metadata and discovery
- `name` is concise and capability-oriented.
- `description` says what the skill does and when it should activate.
- Metadata is LLM/agent agnostic unless a platform dependency is real.

## Progressive disclosure
- `SKILL.md` contains only instructions useful on most activations.
- Long criteria, examples, schemas, and rare edge cases live under `references/`.
- Large references can be split by topic so narrow tasks load only relevant context.
- Always-required instructions are not hidden behind a reference lookup.

## Scripts and assets
- Deterministic, repeatable operations use scripts when that is more reliable/cheaper than model reasoning.
- Scripts are small, documented by usage, and portable with the skill.
- Do not add scripts/assets merely for folder symmetry.

## Token efficiency
- Remove duplicated prose, legacy prompts, archived copies, generated caches, and global instructions repeated inside every skill.
- Avoid loading project-wide standards when only a domain-specific subset matters.
- Prefer concise instructions that preserve behavior over verbose role/persona text.

## Portability
- A copied skill should not silently depend on unrelated sibling folders.
- Paths referenced by `SKILL.md` exist inside the skill when practical.
- Product-specific entrypoints route to skills rather than duplicating domain expertise.

## Validation
- Inventory all skills before claiming complete coverage.
- Verify every referenced file exists.
- Check for stale paths and documentation that describes removed architecture.
- Check for generated files (`__pycache__`, `*.pyc`) and nested repositories.
