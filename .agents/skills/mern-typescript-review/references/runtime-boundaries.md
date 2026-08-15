# Runtime Boundaries

Load when data enters from outside trusted TypeScript code.

TypeScript annotations do not validate runtime data. Keep or add validation for:
- HTTP bodies, params, queries, headers
- environment variables
- parsed JSON
- database data when trust cannot be guaranteed
- forms, files, local/session storage
- third-party API responses

Classify checks as:
1. **Replace with static typing** when every caller is trusted TypeScript and the runtime check only duplicates the signature.
2. **Keep runtime validation** at an untrusted boundary.
3. **Use both** by validating/narrowing externally, then passing typed data into application code.

Before removing an internal runtime check, trace definitions, imports, exports, and every relevant call site. If origin cannot be proven, retain validation.
