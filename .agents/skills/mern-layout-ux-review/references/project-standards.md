# Project Standards Reference
Load this reference only when repository conventions affect the task. It is bundled with the skill for portability.

---

## Source: `style-guide.md`

# Style Guide

## General Style

The application should look clean, professional, and consistent.

Prioritize:
- Readability
- Consistency
- Accessibility
- Responsive design
- Reusable components
- Simple, maintainable CSS

Avoid:
- Random one-off styles
- Overly complex layouts
- Large blocks of repeated CSS
- Inline styles in JSX (prefer SCSS or CSS variables)

## Layout

Use:
- Mobile-first CSS
- CSS Grid for page-level layouts
- Flexbox for alignment inside components
- A consistent `.container` or layout wrapper
- Reasonable max-widths so content does not stretch too wide

Prefer layouts that:
- Stack cleanly on mobile
- Become multi-column on tablet/desktop
- Keep spacing consistent
- Avoid layout shifts

## Spacing

Use consistent spacing values.

Preferred spacing scale:

```scss
0.25rem
0.5rem
0.75rem
1rem
1.5rem
2rem
3rem
4rem
```

## Typography

Use:
- Consistent heading hierarchy (`h1` to `h6`)
- Readable line-height (around `1.4` to `1.7`)
- Clear body text size (usually `1rem` minimum)
- Strong contrast between text and background

Avoid:
- Decorative fonts for body text
- Inconsistent font sizing between similar components

## Component Styling

Prefer:
- Component-scoped partials/files
- Predictable class naming (for example BEM or a simple variant)
- Shared utility variables and mixins for spacing, colors, and breakpoints

Keep selectors shallow and maintainable.

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
