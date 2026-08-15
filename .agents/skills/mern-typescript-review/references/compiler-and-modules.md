# Compiler and Modules

Load for `tsconfig`, build, module, or import/export questions.

## Compiler configuration
- Evaluate `strict` and related flags based on concrete project benefit and migration impact.
- Check `target`, `module`, `moduleResolution`, ESM/CommonJS interoperability, include/exclude, root/out directories, source maps, and path aliases.
- Consider `noUncheckedIndexedAccess`, `exactOptionalPropertyTypes`, `noImplicitReturns`, and unused-code checks when practical.
- Separate client/server/test/shared configs only when the project needs distinct runtime/build concerns.

## Modules
- Prefer explicit module boundaries and `import type`/`export type` where useful.
- Flag circular dependencies, unstable barrel files, runtime/type-only import confusion, and aliases that tooling cannot resolve consistently.
