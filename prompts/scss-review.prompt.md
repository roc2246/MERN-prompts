# SCSS Review and Refactor Prompt

## Required Project Context

IMPORTANT: This prompt requires the repository standards files. In this toolkit source repo they live at the repository root. In a consuming project they may live in the project's `.ai/` folder.

Required files:
- architecture.md
- CLAUDE.md
- coding-standards.md
- mern-best-practices.md
- project-context.md
- project-instructions.md
- style-guide.md

AI VERIFICATION STEP: Before continuing, verify these files are present in context. Accept either repository-root copies or `.ai/` copies. If any are missing, identify the missing files and ask the user to provide them.

## Universal Rules

- Prioritize maintainability, accessibility, responsive design, and predictable compiled CSS.
- Avoid overengineering, unnecessary abstractions, and large visual redesigns.
- Preserve the current appearance and behavior unless fixing a confirmed defect.
- During Phase 1, recommend safe improvements without editing files. Apply them only after explicit user approval.
- Do not claim a file was reviewed or changed unless it was actually opened and inspected.
- Do not use deep nesting merely because SCSS supports it.
- Recommend the highest-impact improvements first; apply them only after approval.

## Role

You are a senior front-end developer performing a complete SCSS and CSS architecture review and refactor for a React-based MERN frontend.

## Primary Task

Recursively find and review all handwritten stylesheet code in the provided project, then propose safe refactors for approval before editing.

Search every nested directory for:

- `**/*.scss`
- `**/*.sass`
- `**/*.css`
- CSS Modules such as `**/*.module.scss` and `**/*.module.css`
- Related `.js`, `.jsx`, `.ts`, and `.tsx` components that import or reference those styles

Exclude generated or third-party content, including:

- `node_modules`
- `dist`
- `build`
- `coverage`
- generated bundles
- minified files
- vendor styles
- external libraries

Before editing, create a complete stylesheet inventory. Review every discovered handwritten stylesheet. Do not sample files.

## Required Refactoring Behavior

During Phase 1, propose safe, behavior-preserving improvements. Apply them to the project only after explicit approval.

This includes converting plain CSS-style repetition into idiomatic SCSS when the relationship is clear.

For example, recommend this refactor during Phase 1:

```scss
.git {
  display: flex;
}

.git__message {
  margin-top: 1rem;
}

.git__message--error {
  font-weight: 700;
}
```

into this:

```scss
.git {
  display: flex;

  &__message {
    margin-top: 1rem;

    &--error {
      font-weight: 700;
    }
  }
}
```

Perform this kind of conversion when:

- Selectors clearly belong to the same BEM block.
- `&__element` or `&--modifier` makes the relationship easier to understand.
- The resulting compiled selector is exactly equivalent.
- The nesting remains shallow and readable.
- The refactor does not accidentally increase specificity.

Do not force nesting when:

- Selectors are unrelated despite sharing a prefix.
- The nesting would exceed roughly three meaningful levels.
- The compiled selector would change.
- It would hide an important global selector.
- It would create overly specific selectors.
- The project intentionally uses flat selectors or CSS Modules in a way that makes nesting less clear.

Also find and refactor:

- Repeated parent selectors that can safely use `&`.
- For every stylesheet, actively identify repeated patterns that can be safely converted into SCSS variables, maps, mixins, functions, placeholders, loops, or reusable partials. During Phase 1, propose the refactor when it removes meaningful duplication, centralizes shared logic, or makes intent clearer. Apply it only in Phase 2 after approval.
- Prefer existing project abstractions before creating new ones. Search the codebase for current variables, maps, mixins, functions, placeholders, and utilities, and reuse or extend them when appropriate.
- Create a new mixin, function, map, placeholder, loop, or partial only when the pattern is repeated or likely to be maintained as one shared rule. Do not create an abstraction for a one-off declaration or minor repetition when direct CSS is easier to understand.
- In the Phase 1 proposal, identify all safe matching call sites for any proposed mixin or function. In Phase 2, update those approved call sites, remove superseded duplicate code, and document matching cases intentionally left unchanged.
- Repeated media queries that can be colocated with the component they modify.
- Repeated values that should use existing variables, tokens, maps, functions, or mixins.
- Hard-coded colors, spacing, typography, radii, shadows, and breakpoints that duplicate existing design tokens.
- Duplicate declaration blocks that can use an existing placeholder, mixin, utility, or shared partial.
- Plain `.css` files that use project-owned styles and can safely become `.scss`, when the build system already supports Sass.
- CSS imports and component imports that must be updated after a `.css` to `.scss` conversion.
- Legacy Sass `@import` usage that can safely migrate to `@use` or `@forward` without breaking namespace behavior.
- Unnecessary vendor prefixes already handled by the project's build tooling.
- Invalid, overridden, unreachable, or duplicate declarations.
- Excessive `!important` usage.
- Overly broad selectors and unnecessary specificity.
- Desktop-first rules that can be simplified into the project's mobile-first approach.
- Pixel values that should use the project's established `rem` conventions.

## Architecture Review

Evaluate and improve:

- Folder and partial structure
- Entry-point organization
- `@use` and `@forward` boundaries
- Variables and design tokens
- Mixins, functions, maps, and placeholders
- Component-scoped styles
- Global styles and resets
- Naming conventions, especially BEM
- CSS Modules usage
- Separation of layout, component, utility, and theme styles
- React component and stylesheet coupling
- Dead or orphaned selectors
- Reusability without premature abstraction

## Responsive and Accessibility Review

Check and safely improve:

- Mobile-first implementation
- Grid and Flexbox usage
- Responsive typography and spacing
- Overflow and wrapping behavior
- Focus-visible styles
- Hover-only interactions
- Reduced-motion support
- Color contrast concerns visible from the code
- Touch-target sizing
- Form control states
- Disabled, error, loading, and empty states
- Logical properties where they improve maintainability

## Selector Verification

For every selector considered for removal, renaming, nesting, or consolidation:

1. Search related `.js`, `.jsx`, `.ts`, and `.tsx` files for its usage.
2. Check conditional class names, template literals, CSS Modules references, and class-name helper calls.
3. Check whether it is referenced by tests or third-party integration markup.
4. Preserve public or dynamically constructed class names unless usage can be verified.
5. Do not remove a selector merely because a simple text search misses dynamic usage.

## Validation After Approved Changes

After the user approves and edits are applied:

1. Run the available stylesheet lint command.
2. Run the frontend type-check when TypeScript is present.
3. Run relevant tests.
4. Run the production build or Sass compilation.
5. Fix errors caused by the changes.
6. Verify that moved or nested selectors compile to the intended selectors.
7. Verify that converted `.css` imports now point to the correct `.scss` files.

If a command is unavailable or cannot run, state that clearly. Never claim validation succeeded when it was not performed.

## Coverage Requirements

Provide a coverage report containing:

- Total handwritten `.scss`, `.sass`, and `.css` files discovered
- Every stylesheet path
- Status for each file: `Reviewed`, `Modified`, `Reviewed - no change`, `Partially reviewed`, or `Unavailable`
- Related component files inspected
- Any excluded generated or vendor paths

Do not call the review complete unless every discovered handwritten stylesheet was reviewed.

## Return Format

### 1. Overall SCSS Score

In Phase 1, score the current codebase. In Phase 2, provide an updated score after the approved changes are applied.

### 2. Proposed Changes (Phase 1) / Changes Applied (Phase 2)

For every modification, include:

- File path
- In Phase 1: what would change
- In Phase 2: what changed
- Why it is more maintainable or idiomatic SCSS
- Whether the compiled selector or behavior remained equivalent

### 3. CSS-to-SCSS Refactors

List conversions such as:

- Flat BEM selectors converted to `&__element` and `&--modifier`
- Repeated selectors nested under a common block
- Repeated values replaced with variables or tokens
- Repeated declaration patterns converted into mixins, functions, maps, placeholders, loops, or shared partials
- Existing SCSS abstractions reused or extended instead of duplicated
- `.css` files converted to `.scss`
- Imports updated

### 4. Issues Left Unchanged

Identify anything that was unsafe, ambiguous, out of scope, or required a design decision.

### 5. Validation Results

Report the exact lint, test, type-check, Sass, and build commands run and whether each passed.

### 6. Coverage Report

List every discovered stylesheet and its review status.

### 7. Next Three SCSS Tasks

Give only the three highest-value remaining tasks in priority order.

### 8. Commit Message

In Phase 1, provide a proposed conventional commit message. In Phase 2, provide the final commit message describing the applied SCSS refactor.
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

