# Unit Test Coverage Audit & Missing Test Generation

## Required Project Context

IMPORTANT: This prompt requires the content of all markdown standards files in the parent `ai-dev-toolkit` directory.

Required files:
- @architecture.md
- @CLAUDE.md
- @coding-standards.md
- @mern-best-practices.md
- @project-context.md
- @project-instructions.md
- @style-guide.md

AI VERIFICATION STEP: Before continuing, verify these files are present in context. If any are missing, STOP and ask the user to provide them.

## Universal Rules

- Prioritize production-quality test coverage, maintainability, and MERN best practices.
- Avoid overengineering or adding unnecessary test tooling unless it is already part of the project.
- Be direct, practical, and evidence-based.
- Recommend the highest-impact improvements first.
- Create tests where they are clearly missing and appropriate.

## Role

You are a Senior Full-Stack Engineer specializing in automated testing and quality assurance for MERN applications.

## Task

Audit all JavaScript and TypeScript files in the frontend and backend codebases to determine whether they already have corresponding unit tests.

If unit tests are missing for suitable source files, create them using the testing framework that is already installed or available in the project.

## Discovery Phase

Before writing tests, inspect the project carefully:

1. Identify the frontend and backend source roots.
   - Common frontend locations: `src/`, `client/src/`, `frontend/src/`, `app/`
   - Common backend locations: `server/`, `backend/`, `src/`, `api/`, `controllers/`, `services/`

2. Inspect project configuration files to determine the testing stack:
   - `package.json`
   - `jest.config.*`
   - `vitest.config.*`
   - `mocha.opts`
   - `tsconfig.json`
   - any lockfiles that indicate installed test libraries

3. Detect which unit testing tools are available:
   - Jest
   - Vitest
   - Mocha + Chai/Sinon
   - Ava
   - Node.js built-in test runner (`node:test`)

4. Identify existing test conventions:
   - `*.test.js`, `*.test.ts`, `*.spec.js`, `*.spec.ts`
   - `__tests__/` folders
   - `test/` folders
   - naming conventions used by the project

## Audit Requirements

Perform a recursive scan of the relevant frontend and backend source files.

### Include
- JavaScript and TypeScript source files in application logic
- Utility modules
- Services
- Helpers
- Controllers and route handlers when they contain testable logic
- React components that contain business logic or pure rendering behavior

### Exclude
- `node_modules/`
- `dist/`, `build/`, `coverage/`
- generated files
- configuration files
- static assets
- purely declarative files that do not warrant unit tests

## Matching Logic

For each source file, determine whether there is a corresponding test file using the project’s existing naming conventions.

Typical patterns:
- `src/utils/math.ts` -> `src/utils/math.test.ts`
- `src/components/Button.jsx` -> `src/components/Button.test.jsx`
- `server/services/auth.js` -> `server/services/auth.test.js`

If a file already has a test in a matching location, do not create another one.

## Test Creation Rules

When a suitable source file lacks a unit test:

1. Create a focused unit test that covers the main behavior of the file.
2. Prefer testing real logic rather than overly mocked behavior.
3. Keep tests readable, minimal, and maintainable.
4. Use the project’s installed testing framework whenever possible.
5. If no framework is installed, use Node’s built-in test runner and assert module.

## Framework-Specific Instructions

### If Jest is installed
- Create `*.test.js` or `*.test.ts` files.
- Use `describe`, `it` or `test`, and `expect`.
- Follow the project’s current Jest conventions.

### If Vitest is installed
- Create `*.test.js`, `*.test.ts`, `*.spec.js`, or `*.spec.ts` files.
- Use `describe`, `it`, and `expect`.
- Prefer `import` syntax consistent with the project.

### If Mocha is installed
- Create tests using `describe` and `it`.
- Use `assert` or Chai as appropriate.

### If no test framework is installed
- Create tests using Node’s built-in `node:test` and `node:assert/strict`.
- Add a script such as `test` to `package.json` if needed.

## Implementation Expectations

- Do not create tests for every single file blindly; focus on files where unit tests provide meaningful value.
- For frontend components, prioritize testable logic and reusable behavior.
- For backend modules, prioritize pure functions, services, validation helpers, and business logic.
- If a module depends heavily on external services, database calls, or browser APIs, write a smaller isolated test or note the limitation clearly.

## Output Format

### 1. Project Test Stack
- Detected testing framework(s)
- Test conventions found in the repo
- Relevant frontend/backend roots identified

### 2. Source Files Inventory
- List of frontend and backend source files reviewed
- Note which already have tests
- Note which are missing tests

### 3. New Tests Created
- File path created
- Why the test was added
- Summary of what the test covers

### 4. Notes and Risks
- Any modules that were skipped and why
- Any missing dependencies or setup needed
- Any recommendations for improving coverage further

### 5. Suggested Next Steps
- Recommended follow-up tests
- Optional package.json script updates
- Any tooling improvements

## Quality Bar

The final result should be practical and production-ready. Do not just list missing tests; actually create them where appropriate and ensure they follow the project’s existing patterns.
