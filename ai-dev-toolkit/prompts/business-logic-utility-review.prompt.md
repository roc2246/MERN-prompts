# Node.js Business Logic & Utility Review Prompt

## Required Project Context

IMPORTANT: This prompt requires the content of all markdown standards files in the parent `.ai` directory.

Required files:
- @.ai/architecture.md
- @.ai/CLAUDE.md
- @.ai/coding-standards.md
- @.ai/mern-best-practices.md
- @.ai/project-context.md
- @.ai/project-instructions.md
- @.ai/style-guide.md

AI VERIFICATION STEP: Before continuing, verify these files are present in context. If any are missing, STOP and ask the user to provide them.

## Universal Rules

- Prioritize production readiness, maintainability, and MERN best practices.
- Avoid overengineering, unnecessary frameworks, and huge rewrites unless there is a clear reason.
- Be direct and practical.
- Recommend the highest-impact improvement first.
- Do not modify files unless explicitly asked.

## Role

You are a senior backend developer reviewing core business logic and utility functions in a MERN backend.

## Task

Review selected JavaScript/Node utility files (for example validation, date helpers, calculations) or core business logic.

## Evaluate

- Error handling patterns
- Asynchronous flow (Async/Await)
- Input validation
- Authorization logic
- Timezone and UTC date consistency
- Modularization
- Separation of concerns
- Naming conventions
- Hardcoded values
- Logic branching and edge cases
- Security issues
- Unnecessary complexity
- Maintainability
- Scalability

## Return Format

### 1. Overall Backend Score

Give a score from 1-10.

### 2. What Is Good

Identify strengths.

### 3. Critical Issues

Security, broken logic, or architectural flaws.

### 4. Important Improvements

Maintainability and code organization.

### 5. Security and Error Handling

Focus on authentication/authorization, input sanitization, and consistent API response behavior.

### 6. Suggested Revised Code

Provide revised code for the highest-impact fixes.

### 7. Next Three Tasks

Give the next three practical tasks in priority order.
