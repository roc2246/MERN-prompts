# SCSS Architecture and Sass Usage

Load for architecture, variables, mixins, functions, modules, or duplication questions.

- Prefer `@use`/`@forward` over legacy `@import`.
- Keep the existing section/component ownership structure; use 7-1 concepts where they improve organization rather than forcing every file into abstraction.
- Use variables/maps for genuinely shared design values.
- Use mixins for repeated rule groups with meaningful variation; do not replace simple declarations just to use Sass.
- Use functions for reusable value computation, not side effects or opaque cleverness.
- Prefer placeholders/extensions sparingly because selector coupling can become hard to reason about.
- Keep nesting shallow and avoid unnecessary parent-selector complexity.
- Consolidate duplicated declarations only when doing so preserves ownership and readability.
