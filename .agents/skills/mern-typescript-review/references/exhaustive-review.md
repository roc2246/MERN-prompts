# Exhaustive TypeScript Review

Load only for deep or full-project TypeScript audits.

## Coverage
- Inventory handwritten `*.ts` and `*.tsx` recursively with `scripts/inventory.py`; exclude generated/dependency/build/cache output and declaration files.
- Review every inventoried file before claiming complete coverage.
- Follow local imports/exports where needed to prove contracts and runtime-check safety.
- Report missing/unavailable references instead of guessing.

## Additional criteria
- Functions/control flow: nullable paths, exhaustive switches, promises, missing `await`, swallowed errors, date/time parsing.
- Maintainability: naming, module responsibility, duplication, testability, comments that explain why, and avoidance of premature abstraction/type gymnastics.
- JavaScript-to-TypeScript refactors: remove defensive checks only when the value is proven to come exclusively from trusted typed code.

## Evidence and output
For each important finding include severity, exact path/code area, evidence, risk, and practical fix. Group repeated root causes. Separate confirmed defects from optional improvements. For implementation requests, preserve behavior unless fixing a confirmed bug, update affected call sites/tests/imports, and run existing type-check/lint/test/build commands when available.
