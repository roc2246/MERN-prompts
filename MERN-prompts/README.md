# MERN AI Dev Toolkit

A reusable prompt-and-standards toolkit for any MERN project.

This repository provides:
- Project standards for architecture, coding, style, and best practices.
- Prompt templates for common engineering tasks (reviews, component building, documentation, explanation).
- A consistent workflow for using AI assistants with MERN codebases.

The toolkit is intentionally project-agnostic so you can apply it to internal apps, SaaS products, dashboards, marketplaces, and client projects.

## Who This Is For

Use this toolkit if you are:
- Building or maintaining a MERN application.
- Using an AI coding assistant and want consistent outputs.
- Standardizing quality gates across backend, frontend, and styling.
- Creating repeatable prompt workflows for code review and refactoring.

## Repository Structure

```text
ai-dev-toolkit/
  architecture.md
  CLAUDE.md
  coding-standards.md
  mern-best-practices.md
  project-context.md
  project-instructions.md
  style-guide.md
  .github/
    copilot-instructions.md
  prompts/
    api-controller-route-review.prompt.md
    backend-review.prompt.md
    build-component.prompt.md
    business-logic-utility-review.prompt.md
    code-review.prompt.md
    documentation-review-and-update.prompt.md
    explain-code.prompt.md
    layout-ux-review.prompt.md
    scss-review.prompt.md
```

## What Each Core File Does

### `ai-dev-toolkit/project-context.md`
Defines the baseline context for a generic MERN application, goals, and technology assumptions.

### `ai-dev-toolkit/project-instructions.md`
Defines assistant behavior for implementation, code changes, reviews, and commit message expectations.

### `ai-dev-toolkit/coding-standards.md`
Language and framework conventions for JavaScript, Node/Express, React, and SCSS.

### `ai-dev-toolkit/style-guide.md`
UI and layout standards covering responsiveness, typography, spacing, and component styling.

### `ai-dev-toolkit/architecture.md`
Reference architecture for common MERN folder structure, lifecycle, and separation of concerns.

### `ai-dev-toolkit/mern-best-practices.md`
Cross-cutting best practices for security, maintainability, performance, and production readiness.

### `ai-dev-toolkit/CLAUDE.md`
Instruction entrypoint for assistants that support a Claude-style instruction file.

### `ai-dev-toolkit/.github/copilot-instructions.md`
Instruction entrypoint for GitHub Copilot Chat / coding workflows.

## Prompt Templates (Task Catalog)

### Backend and API
- `api-controller-route-review.prompt.md`
  - Reviews Express routes/controllers/middleware and API design.
- `backend-review.prompt.md`
  - Runs a broad backend architecture and reliability audit.
- `business-logic-utility-review.prompt.md`
  - Focuses on utility modules, domain logic, and correctness.

### Frontend and UX
- `build-component.prompt.md`
  - Builds or refactors reusable React components.
- `layout-ux-review.prompt.md`
  - Reviews layout quality, UX clarity, and responsiveness.
- `scss-review.prompt.md`
  - Reviews SCSS architecture, maintainability, and consistency.

### General Engineering
- `code-review.prompt.md`
  - General full-stack code quality review.
- `documentation-review-and-update.prompt.md`
  - Audits docs and suggests high-value updates.
- `explain-code.prompt.md`
  - Explains selected code with maintainability guidance.

## How To Use This Toolkit

## 1. Place or copy the toolkit

Recommended location in your project:

```text
<your-project>/.ai/
```

Map these files into that folder (or keep this repository as a reference and copy as needed).

Example target structure:

```text
<your-project>/.ai/project-context.md
<your-project>/.ai/project-instructions.md
<your-project>/.ai/coding-standards.md
<your-project>/.ai/style-guide.md
<your-project>/.ai/architecture.md
<your-project>/.ai/mern-best-practices.md
<your-project>/.ai/CLAUDE.md
```

## 2. Ensure assistant instruction discovery

For GitHub Copilot workflows, ensure your project includes:
- `.github/copilot-instructions.md`

For other assistants, point them to:
- `.ai/CLAUDE.md` (or equivalent instruction source)

## 3. Use prompts with relevant code context

When running a prompt:
- Include the exact files/folders you want analyzed.
- Include enough surrounding context for imported modules.
- Keep scope explicit (for example: `server/routes`, `client/src/components/Header`).

## 4. Apply recommendations selectively

Prompt output should guide engineering decisions, not replace judgment.
- Prioritize high-impact security and reliability fixes first.
- Keep architecture changes incremental unless major refactor is planned.
- Validate behavior with tests or manual verification.

## Suggested Workflow

1. Start with `code-review.prompt.md` or `backend-review.prompt.md` for baseline quality.
2. Use specialized prompts for focused improvements:
   - API and middleware -> `api-controller-route-review.prompt.md`
   - Component work -> `build-component.prompt.md`
   - Styling cleanup -> `scss-review.prompt.md`
   - UX polish -> `layout-ux-review.prompt.md`
3. Run `documentation-review-and-update.prompt.md` before major merges or release prep.
4. Use `explain-code.prompt.md` to onboard collaborators quickly.

## Example Prompt Requests

Use these as quick copy templates in your AI chat tool.

### Example: Backend route review

```text
Use ai-dev-toolkit/prompts/api-controller-route-review.prompt.md.
Review server/routes and server/controllers only.
Focus on authentication, validation, status codes, and middleware order.
Return critical issues first with file-specific fixes.
```

### Example: Build component

```text
Use ai-dev-toolkit/prompts/build-component.prompt.md.
Create a reusable UserCard component from this existing JSX.
Target folder: client/src/components/cards.
Include matching SCSS and a usage example.
```

### Example: Documentation audit

```text
Use ai-dev-toolkit/prompts/documentation-review-and-update.prompt.md.
Review README, server README, and API docs.
Propose only high-impact updates that reduce onboarding time.
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
- Prompt templates to include project-specific checklists.

Keep customizations minimal and explicit to preserve portability.

## Maintenance Guidelines

- Keep standards and prompts aligned when rules change.
- Update prompt wording when stack choices evolve (for example, TypeScript adoption).
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
- [ ] Apply highest-impact fixes and validate.
- [ ] Iterate with specialized prompts.
