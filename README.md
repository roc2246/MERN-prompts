# MERN AI Dev Toolkit

A reusable Agent Skills and standards toolkit for MERN projects.

This repository provides:
- Project standards for architecture, coding, style, and best practices.
- Reusable Agent Skills for common engineering tasks (reviews, component building, documentation, explanation).
- A consistent workflow for using AI assistants with MERN codebases.

The toolkit is intentionally project-agnostic so you can apply it to internal apps, SaaS products, dashboards, marketplaces, and client projects.


## Agent Skills (Recommended)

The primary workflow is now `.agents/skills/`. Each engineering task is a discoverable Agent Skill with concise metadata and instructions. Detailed review criteria live in skill `references/` and are loaded only when needed; recursive audit skills also include deterministic inventory scripts. This implements progressive disclosure and avoids loading the entire standards library into every request. See `AGENT-SKILLS.md`.


## Who This Is For

Use this toolkit if you are:
- Building or maintaining a MERN application.
- Using an AI coding assistant and want consistent outputs.
- Standardizing quality gates across backend, frontend, and styling.
- Creating repeatable Agent Skill workflows for code review and refactoring.

## Repository Structure

```text
MERN-prompts/
  architecture.md
  CLAUDE.md
  coding-standards.md
  mern-best-practices.md
  project-context.md
  project-instructions.md
  style-guide.md
  README.md
  AGENT-SKILLS.md
  .github/
    copilot-instructions.md
  .agents/
    skills/
      mern-api-review/
      mern-backend-review/
      mern-business-logic-review/
      mern-code-review/
      mern-documentation/
      mern-explain-code/
      mern-layout-ux-review/
      mern-react-component/
      mern-react-review/
      mern-scss-review/
      mern-test-coverage/
      mern-typescript-review/
```

## What Each Core File Does

### `project-context.md`
Defines the baseline context for a generic MERN application, goals, and technology assumptions.

### `project-instructions.md`
Defines assistant behavior for implementation, code changes, reviews, and commit message expectations.

### `coding-standards.md`
Language and framework conventions for JavaScript, Node/Express, React, and SCSS.

### `style-guide.md`
UI and layout standards covering responsiveness, typography, spacing, and component styling.

### `architecture.md`
Reference architecture for common MERN folder structure, lifecycle, and separation of concerns.

### `mern-best-practices.md`
Cross-cutting best practices for security, maintainability, performance, and production readiness.

### `CLAUDE.md`
Instruction entrypoint for assistants that support a Claude-style instruction file.

### `.github/copilot-instructions.md`
Instruction entrypoint for GitHub Copilot Chat / coding workflows.

## Agent Skill Catalog

- `mern-api-review` — reviews Express routes, controllers, middleware, and API design.
- `mern-backend-review` — broad backend architecture and reliability audit.
- `mern-business-logic-review` — reviews utilities, domain logic, and correctness.
- `mern-code-review` — general full-stack code quality review.
- `mern-documentation` — audits and updates project documentation.
- `mern-explain-code` — explains selected code with maintainability guidance.
- `mern-layout-ux-review` — reviews layout quality, UX clarity, and responsiveness.
- `mern-react-component` — builds or refactors reusable React components.
- `mern-react-review` — reviews React architecture and implementation quality.
- `mern-scss-review` — reviews SCSS architecture, maintainability, and consistency.
- `mern-test-coverage` — audits test coverage and proposes or generates missing tests.
- `mern-typescript-review` — audits TypeScript/TSX and proposes idiomatic refactors.

## How To Use This Toolkit

## 1. Place or copy the toolkit

Recommended location in your project:

```text
<your-project>/.ai/
```

Map these files into that folder (or keep this repository as a reference and copy as needed).

Example target structure:

```text
<your-project>/@.ai/project-context.md
<your-project>/@.ai/project-instructions.md
<your-project>/@.ai/coding-standards.md
<your-project>/@.ai/style-guide.md
<your-project>/@.ai/architecture.md
<your-project>/@.ai/mern-best-practices.md
<your-project>/@.ai/CLAUDE.md
```

## 2. Ensure assistant instruction discovery

For GitHub Copilot workflows, ensure your project includes:
- `.github/copilot-instructions.md`

For other assistants, point them to:
- `@.ai/CLAUDE.md` (or equivalent instruction source)

## 3. Invoke skills with relevant code context

When using a skill:
- Include the exact files/folders you want analyzed.
- Include enough surrounding context for imported modules.
- Keep scope explicit (for example: `server/routes`, `client/src/components/Header`).

## 4. Review and approve changes

Implementation-capable skills use a mandatory two-phase workflow:

1. **Phase 1 — Review and proposal**
   - The assistant inspects the requested scope.
   - It reports findings, affected files, priorities, expected benefits, risks, and proposed changes.
   - It does not edit, create, delete, rename, or overwrite files.
   - It ends by asking: **Would you like me to go forward and apply these changes?**
2. **Phase 2 — Implementation after approval**
   - The assistant applies only the approved changes.
   - It runs relevant type-check, lint, test, and build commands when available.
   - It reports every changed file and the validation results.

Skill output should guide engineering decisions, not replace judgment. Review the proposed changes before approving them. Prioritize high-impact security and reliability fixes, keep architecture changes incremental, and validate behavior after implementation.

## Suggested Workflow

1. Ask Copilot Agent to use `mern-code-review` or `mern-backend-review` for a baseline Phase 1 review.
2. Use specialized skills for focused improvements:
   - API and middleware -> `mern-api-review`
   - Component work -> `mern-react-component`
   - Styling cleanup -> `mern-scss-review`
   - UX polish -> `mern-layout-ux-review`
3. Review the proposed changes and explicitly approve only the changes you want applied.
4. Use `mern-documentation` before major merges or release prep.
5. Use `mern-explain-code` to understand unfamiliar code or onboard collaborators.

## Example Requests

```text
Use the /mern-api-review skill to review server/routes and server/controllers only.
Focus on authentication, validation, status codes, and middleware order.
Return critical issues first with file-specific fixes.
```

```text
Use the /mern-react-component skill to create a reusable UserCard component from this existing JSX.
Target folder: client/src/components/cards.
Include matching SCSS and a test file.
```

```text
Use the /mern-test-coverage skill to audit server/services and client/src/hooks.
Propose missing unit tests and flag untested edge cases. Do not generate files until I approve the proposal.
```

## Quality Principles Built Into This Toolkit

- Security first: auth, authorization, validation, sanitization.
- Maintainability over cleverness.
- Accessibility and responsive design by default.
- Clear separation of concerns in MERN architecture.
- Practical production readiness, not overengineering.

## Customizing For A Specific Project

You can tailor the toolkit by editing:
- `project-context.md` for domain details.
- `architecture.md` for your real folder structure and service boundaries.
- `style-guide.md` for design-system tokens and conventions.
- `coding-standards.md` for language and framework conventions specific to your stack.
- Skill references to include project-specific checklists.

Keep customizations minimal and explicit to preserve portability.

## Maintenance Guidelines

- Keep standards and skills aligned when rules change.
- Update skill metadata and references when stack choices evolve (for example, TypeScript adoption).
- Remove outdated checks that no longer match your architecture.
- Review documentation periodically to avoid drift.

## Versioning Recommendations

For teams, consider semantic versioning for this toolkit itself:
- Major: breaking changes to prompt formats or standards.
- Minor: new prompts, new review criteria, expanded guidance.
- Patch: wording clarifications and typo fixes.

## Contributing

Suggested contribution process:
1. Open an issue describing the gap (prompt need, missing rule, unclear guidance).
2. Propose focused changes with examples.
3. Validate that updates remain generic to any MERN project.
4. Submit PR with before/after rationale.

## License

Add your preferred license in this repository root (for example, MIT) if you plan to share publicly.

## Quick Start Checklist

- [ ] Copy toolkit files into your project `.ai/` folder.
- [ ] Add `.github/copilot-instructions.md` to your project.
- [ ] Confirm assistant can read the standards files.
- [ ] Run a baseline review prompt on one target area.
- [ ] Review the Phase 1 proposal and approve the desired changes.
- [ ] Confirm the assistant reports changed files and validation results after implementation.
- [ ] Iterate with specialized prompts.
