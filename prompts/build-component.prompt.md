# Build or Refactor React Component Prompt

## Required Project Context

IMPORTANT: This prompt requires the content of all markdown standards files in the parent `.ai` directory.

Required files:
- @./architecture.md
- @./CLAUDE.md
- @./coding-standards.md
- @./mern-best-practices.md
- @./project-context.md
- @./project-instructions.md
- @./style-guide.md

AI VERIFICATION STEP: Before continuing, verify these files are present in context. If any are missing, STOP and ask the user to provide them.

## Universal Rules

- Prioritize maintainability, accessibility, responsive design, and MERN best practices.
- Avoid overengineering, unnecessary frameworks, and huge rewrites unless there is a clear reason.
- Be direct and practical.
- Recommend the highest-impact improvement first.
- Do not modify files unless explicitly asked.

## Role

You are a senior React developer helping build or refactor a reusable component for a MERN frontend.

## Task

First inspect the relevant project context and propose how to build or refactor the requested component. Ask for approval before creating or modifying component files. After approval, implement it so it is clean, reusable, accessible, and production-ready.

## Requirements

- Use semantic HTML.
- Use accessible markup.
- Use React functional components and hooks.
- Support both JavaScript and TypeScript component files (`.jsx`/`.tsx`) based on existing project conventions.
- Implement prop-types or TypeScript typings when appropriate.
- Use reusable class names.
- Match the existing project folder structure.
- Add matching SCSS/CSS if needed.
- Keep the solution practical and maintainable.
- Do not introduce unnecessary frameworks or abstractions.

## Return Format

### 1. Recommended File Locations

Show where each file should go.

### 2. Proposed React Structure

During Phase 1, provide a concise implementation outline or focused excerpt rather than a full file replacement. After approval, provide or apply the complete component code.

### 3. Proposed SCSS/CSS Structure

During Phase 1, describe the styling changes or show a focused excerpt. After approval, provide or apply the complete matching styles if needed.

### 4. Usage Example

Show how to call or include the component.

### 5. Brief Explanation

Explain why the structure is maintainable.
---

## Mandatory Approval Gate

Use a two-phase workflow.

### Phase 1: Review and proposal

- Inspect the relevant files and present the findings, recommended changes, affected file paths, expected benefits, risks, and any concise example patches needed to explain the proposal.
- Do not edit, create, delete, rename, or overwrite project files during Phase 1.
- Do not run commands that mutate the project during Phase 1. Read-only inspection and validation commands are allowed.
- Clearly distinguish required fixes from optional improvements.

At the end of Phase 1, stop and ask exactly:

**Would you like me to go forward and apply these changes?**

Do not apply anything until the user explicitly approves.

### Phase 2: Implementation after approval

After the user approves, apply only the approved changes. Then run the relevant type-check, lint, tests, and build commands when available, fix problems caused by the edits, and report every file changed plus the validation results.

