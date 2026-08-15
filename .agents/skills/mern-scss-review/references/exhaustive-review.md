# Exhaustive SCSS Review

Load only for deep/full-project stylesheet audits.

## Coverage
- Inventory relevant `.scss`/`.css` files recursively with `scripts/inventory.py`.
- Review every inventoried handwritten stylesheet before claiming complete coverage.
- Follow entrypoints, `@use`/`@forward`, and component/page imports to understand dependency order and ownership.

## Review
Assess architecture, Sass-native reuse, variables/maps, mixins/functions, selector specificity, nesting, duplication, responsive behavior, accessibility, dead styles, and build compatibility. Prefer practical refactors over abstract Sass machinery.

## Implementation
When refactoring is requested, preserve rendered behavior unless the user requested a design change. Update imports/usages together, run the existing Sass/build/lint/test checks when available, and clearly report anything not verified.
