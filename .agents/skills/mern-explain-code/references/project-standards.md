# Project Standards Reference
Load this reference only when repository conventions affect the task. It is bundled with the skill for portability.

---

## Source: `architecture.md`

# Architecture

## System Overview

This toolkit targets a generic full-stack MERN application with a React frontend and a Node/Express/MongoDB backend.

- Frontend responsibilities: UI rendering, route navigation, state handling, and API integration.
- Backend responsibilities: authentication/authorization, validation, business logic, and data persistence.

## Runtime Architecture

### Frontend (`client/`)

- `src/pages/`: route-level screens.
- `src/components/`: reusable UI components.
- `src/utils/`: API wrappers and shared helpers.
- `src/scss/` or `src/styles/`: global and component styling.

### Backend (`server/`)

- `routes/`: endpoint declarations and middleware composition.
- `middleware/`: auth, validation, and cross-cutting concerns.
- `controllers/`: HTTP request/response orchestration.
- `models/`: Mongoose schemas and data access logic.
- `utilities/` or `services/`: shared helpers and domain logic.
- `scripts/`: operational scripts (seeding, migrations, maintenance).

## Request Lifecycle

1. Route match in the backend routing layer.
2. Middleware chain executes (auth, authorization, validation, sanitization).
3. Controller handles endpoint-level workflow.
4. Model/service layer performs database operations.
5. JSON response is returned to the frontend.

## Security Architecture

- Stateless JWT auth via `Authorization: Bearer <token>` when token auth is used.
- Role-based authorization middleware for protected operations.
- Route-level request validation before business logic execution.
- Input sanitization and safe error handling to prevent data leakage.

## Data Architecture

Use explicit, validated schemas for each domain entity, with:
- Required fields and type constraints
- Indexes for common query patterns
- Secure handling of sensitive fields (for example, password hashing)
- UTC date storage for cross-timezone consistency

## Operational Notes

- Keep API contracts and project documentation synchronized when routes, schemas, or middleware change.
- Prefer clear separation of concerns across route, controller, service, and model layers.
- Document environment variables and startup flows for both client and server.

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
