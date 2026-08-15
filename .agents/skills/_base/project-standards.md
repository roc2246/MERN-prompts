# MERN Project Standards

Use repository conventions when they exist; these are defaults only.

## TypeScript / JavaScript
- Prefer TypeScript for app code when the repo uses it; keep strictness enabled where practical.
- Avoid `any`; prefer inference, narrow `unknown`, model domain types explicitly, and validate runtime boundaries.
- Use ESM, async/await, small focused modules, and explicit exported APIs.

## Express / Node
- Keep routes thin; compose middleware and delegate orchestration/domain work to controllers/services.
- Validate body/query/params before use. Enforce authentication and authorization explicitly.
- Centralize error handling; avoid leaking internals. Use correct HTTP semantics/status codes.
- Keep secrets/config in environment-backed configuration; never hard-code credentials.

## MongoDB / Mongoose
- Use constrained schemas, intentional indexes, projections, and `.lean()` for read-only queries when appropriate.
- Avoid unbounded queries and N+1-style access. Treat client-provided filters/operators as untrusted.
- Keep persistence concerns separate from HTTP concerns.

## React
- Prefer functional components and hooks. Keep state local until sharing is justified.
- Use semantic HTML, labels, keyboard support, explicit loading/error/empty states, and stable keys.
- Avoid premature memoization; optimize measured bottlenecks.
- Keep API/data logic out of presentational components when it materially improves clarity/testability.

## SCSS
- Prefer mobile-first, component-oriented styles with shallow selectors and reusable tokens.
- Use variables/maps/mixins/functions only when they reduce duplication or encode a real rule.
- Avoid needless abstraction, deep nesting, selector specificity wars, and duplicated breakpoints.

## Testing
- Test observable behavior and failure paths. Match the existing framework and patterns.
- Prioritize auth, validation, business logic, API behavior, state transitions, and regression-prone code.
- Do not test implementation details without a concrete reason.

## General
Security, correctness, maintainability, accessibility, and simplicity outrank cleverness. Do not introduce libraries or architecture without demonstrated value.
