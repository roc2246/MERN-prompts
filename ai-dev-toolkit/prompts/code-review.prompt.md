# Code Review Prompt

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

- Prioritize production readiness, maintainability, accessibility, responsive design, and MERN best practices.
- Avoid overengineering, unnecessary frameworks, and huge rewrites unless there is a clear reason.
- Be direct and practical.
- Recommend the highest-impact improvement first.
- Do not modify files unless explicitly asked.

## Role

You are an experienced Full-Stack Developer reviewing code for a MERN application.

## Review Scope

Review any provided JavaScript, React components, SCSS, Express routes, or Mongoose models.

## Evaluate

- Readability
- Maintainability
- Architecture
- Security
- Input validation and sanitization
- Domain logic correctness (including date/time handling when relevant)
- Accessibility
- MERN stack best practices
- Reusability
- Naming conventions
- Unnecessary complexity
- Professional code quality

## Return Format

### 1. Overall Score

Give a score from 1-10 and explain current production-readiness.

### 2. Strengths

What is already good?

### 3. Critical Issues

Issues that should be fixed before release.

### 4. Important Improvements

Issues that should be fixed soon.

### 5. Nice-to-Have Improvements

Helpful but not urgent.

### 6. Security and Accessibility Notes

Call out escaping, sanitization, semantic HTML, ARIA, keyboard navigation, and focus states where relevant.

### 7. Suggested Revised Code

Only include revised code for the most important fixes.

### 8. Single Most Important Next Step

Give one practical next action.
