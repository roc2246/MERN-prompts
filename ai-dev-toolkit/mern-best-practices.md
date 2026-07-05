# MERN Best Practices

## General Rules

Always write application code that is:
- Secure
- Readable
- Maintainable
- Accessible

## Backend (Node.js & Express)
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
