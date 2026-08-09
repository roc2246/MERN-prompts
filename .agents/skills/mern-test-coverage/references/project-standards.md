# Project Standards Reference
Load this reference only when repository conventions affect the task. It is bundled with the skill for portability.

---

## Source: `coding-standards.md`

# Coding Standards

## JavaScript / TypeScript / Node.js / Express

Use:
- ESM modules (`import`/`export`)
- Type-safe patterns when TypeScript is used (clear interfaces/types, avoid `any` where practical)
- Async/Await for asynchronous operations
- Centralized error handling middleware
- Mongoose schemas for data modeling
- Proper HTTP status codes (200, 201, 400, 401, 403, 404, 500)
- `camelCase` for variables and functions

Prefer:
- Separation of routes, controllers, services/utilities, and models
- Stateless authentication and explicit authorization rules where needed
- Centralized validation utilities for request payloads

## React

Use:
- Functional components with Hooks
- `PascalCase` for component names
- Descriptive prop names
- TypeScript component props/interfaces in `.tsx` files when the codebase uses TypeScript
- React Router for client-side navigation in SPA projects

Prefer:
- Reusable UI components in `src/components/`
- Local state first, then context/global state when justified
- Semantic HTML within JSX

## SCSS

Use:
- Mobile-first styles
- `rem` units when possible
- CSS custom properties for theme values
- Grid for page layouts
- Flexbox for component alignment
- Component-based partials

Avoid:
- Overly specific selectors
- Random one-off styles
- Large files with unrelated styles
- Styling generated build files directly

## JavaScript / TypeScript

Use:
- Small focused modules
- Clear event listeners
- Progressive enhancement
- Accessible interactions

When using TypeScript:
- Prefer explicit return types for exported functions and shared utilities
- Keep types close to domain models and reuse shared types where appropriate

Avoid:
- jQuery unless specifically needed
- Global variables when avoidable
- Overcomplicated state logic

---

## Source: `mern-best-practices.md`

# MERN Best Practices

## General Rules

Always write application code that is:
- Secure
- Readable
- Maintainable
- Accessible

## Backend (Node.js/TypeScript & Express)
- **RESTful Design**: Use consistent resource naming and proper HTTP verbs (GET, POST, PUT, DELETE, PATCH where appropriate).
- **Authentication & Authorization**: Use a clear auth strategy (for example JWT) and enforce role/permission checks where required.
- **Sanitization**: Sanitize user input to reduce NoSQL injection and Cross-Site Scripting (XSS) risks.
- **Validation**: Validate all incoming request data (body, query, params) using centralized utilities.
- **Error Handling**: Use centralized error-handling middleware for consistent responses without leaking internals.
- **Statelessness**: Keep APIs stateless unless there is a clear reason not to.

## Database (MongoDB & Mongoose)
- **Schema Integrity**: Define strict schemas with explicit validation and type constraints.
- **Indexing**: Index fields frequently used in search/filter/sort operations.
- **Lean Queries**: Use `.lean()` for read-only operations where document methods are unnecessary.
- **Middleware**: Use Mongoose hooks only when they improve correctness and maintainability.
- **Date Management**: Store timestamps in UTC to keep behavior consistent across time zones.

## Frontend (React)
- **Component Architecture**: Use functional components with modern Hooks.
- **Type Safety**: Use TypeScript (`.ts`/`.tsx`) where adopted by the project, with clear shared domain types.
- **State Management**: Keep state local by default; promote to shared state only when needed.
- **Performance**: Use memoization (`React.memo`, `useMemo`, `useCallback`) for measurable bottlenecks.
- **Accessibility (A11y)**: Use semantic HTML, labels, and keyboard-accessible interactions.

## UI & Styling (SCSS)
- **Mobile-First**: Start with small screens, then enhance for larger breakpoints.
- **Architecture**: Use a consistent naming convention and component-oriented structure.
- **Consistency**: Use `rem` units and a spacing scale to maintain visual rhythm.

## Production Readiness
- **Professionalism**: Prioritize clarity and separation of concerns over clever shortcuts.
- **Documentation**: Document setup, architecture decisions, and non-obvious logic.
- **Reliability**: Design clear error states and graceful fallback behavior in both API and UI.
