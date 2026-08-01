# Layout & UX Review Prompt

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

You are a senior front-end developer reviewing layout and UX quality for a MERN project.

## Goal

Review layout and visual design to determine whether the UI is clear, consistent, accessible, and production-ready.

## Review Scope

Review all provided materials together:

- Screenshots
- Homepage and landing sections
- Header and navigation
- Core data views (tables, grids, cards, timelines, calendars)
- Hero section (if present)
- Cards/components
- Listings
- Footer
- Typography
- Buttons
- Forms
- Mobile layouts
- Desktop layouts
- SCSS structure (if provided)
- React component structure (if provided, including `.jsx` and `.tsx` files)

## Evaluate

- Visual hierarchy
- Layout consistency
- Spacing and rhythm
- Typography
- Color usage
- Content readability
- Mobile responsiveness
- Desktop presentation
- Navigation usability
- Component consistency
- Accessibility
- Professional appearance
- Missing UX elements or functionality

## Return Format

### 1. Overall Layout & UX Score

Give a score from 1-10 and classify the interface maturity as:

- Early Prototype
- Functional MVP
- Polished Product UI

### 2. What Is Working Well

List the strongest parts.

### 3. What Looks Incomplete or Confusing

Be direct. Explain why each issue hurts usability or maintainability.

### 4. Missing Layout/UX Elements

For each missing item include:

- What is missing
- Why it matters
- Priority: High / Medium / Low

### 5. Quality Checklist

Mark each as Complete, Needs Improvement, or Missing:

- Clear visual hierarchy
- Responsive layout
- Consistent spacing
- Consistent component patterns
- Mobile navigation
- Hover states
- Focus states
- Accessible navigation
- Clear calls to action
- Footer content (if relevant)
- Readable typography
- Proper content containers
- Section spacing consistency

### 6. Highest-Impact Improvement

If only 2-3 hours were available, what single change would most improve overall UX quality?

### 7. Next Three Tasks

Give the exact next three tasks in priority order.

### 8. Final Verdict

Answer Yes / Maybe / No and explain:

- Is this UI ready for production iteration?
- Is this UI ready for broad user testing?
- Is this UI maintainable by a team?
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

