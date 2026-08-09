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

## Source: `project-context.md`

# Project Context

Project Type: Generic MERN Application

Purpose:
A reusable baseline context for full-stack MERN applications, adaptable to products such as dashboards, booking systems, marketplaces, internal tools, or content platforms.

Current Goals:
- Implement secure authentication and authorization flows.
- Build a responsive React frontend with reusable components.
- Develop a robust Node.js/TypeScript Express API backed by MongoDB/Mongoose.
- Maintain high code quality with centralized validation and error handling.
- Keep architecture and documentation clear for long-term maintenance.

Primary Technologies:
- React (JavaScript or TypeScript, commonly Vite or Next.js where applicable)
- Node.js/TypeScript & Express
- MongoDB (Mongoose)
- Authentication strategy (for example JWT)
- SCSS or CSS Modules

---

## Source: `project-instructions.md`

# Project Instructions

This is a full-stack MERN (MongoDB, Express, React, Node.js) application with JavaScript and TypeScript support.

## Main Goals

* Build a production-ready and maintainable application.
* Use clean React functional components and hooks in JavaScript or TypeScript (`.jsx`/`.tsx`).
* Implement a secure and scalable Express backend in JavaScript or TypeScript (`.js`/`.ts`).
* Maintain clear separation between client and server logic.
* Prioritize accessibility, responsiveness, and maintainability.

## When Helping With This Project

* Explain code clearly and simply.
* Mention which file code belongs in.
* Keep solutions beginner-to-intermediate friendly unless asked otherwise.
* Prefer practical, production-ready patterns.
* Follow MERN stack best practices (RESTful APIs, authentication, validation, security).
* Follow the project's coding standards and style guide.
* Prioritize maintainability over cleverness.

## Code Changes

When providing code:

* Specify the file path.
* Explain why the change is being made.
* Note security implications when relevant (auth, input sanitization, authorization).
* Preserve existing project architecture unless a change is justified.

## Reviews

When reviewing code, layouts, or API endpoints, prioritize:

1. Maintainability
2. Accessibility
3. Responsive design
4. API standards
5. Security
6. Reusability
7. Reliability

If the project uses TypeScript, treat `.ts`/`.tsx` files as the primary review source. Use compiled `.js` output only as a fallback when TypeScript source files are unavailable.

Focus on practical improvements that matter in real production environments.

Avoid recommending unnecessary complexity.

## Git Commit Messages

If code changes, refactoring, file creation, file deletion, or architectural changes are suggested, always provide a suggested Git commit message at the end of the response.

Format:

Git commit message: [message]

Examples:

Git commit message: Add reusable calendar component
Git commit message: Implement auth middleware for protected routes
Git commit message: Create responsive dashboard layout
Git commit message: Refactor auth controller for clearer error handling
