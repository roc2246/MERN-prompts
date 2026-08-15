# Type Safety and Domain Modeling

Load for `any`, assertions, unions, generics, function contracts, or domain-model questions.

- Flag unjustified `any`, unsafe assertions, double assertions, non-null assertions, broad `object`/`Function`/`{}` types, and inaccurate optional/null fields.
- Narrow `unknown` before use. Prefer accurate types over casts that silence errors.
- Use discriminated unions or literal types when they prevent impossible states.
- Prefer understandable domain-specific types over clever type-level programming.
- Share types only when the contract is genuinely shared; avoid giant global type files.
- Use utility types (`Pick`, `Omit`, `Partial`, `Required`, `Record`, `ReturnType`, `Awaited`) when they clarify an existing relationship.
- Prefer explicit return types for exported/shared functions when they stabilize the public contract.
