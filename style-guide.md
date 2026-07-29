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
