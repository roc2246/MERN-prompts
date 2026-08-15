# Node, Express, and Mongoose

Load for backend TypeScript reviews.

## Node / Express
- Type request-derived values only after runtime validation/narrowing.
- Review async error propagation, centralized error types/middleware, authentication/authorization types, environment parsing, and controller/service separation.
- Avoid assertions on `req.body`, `req.params`, or `process.env` as a substitute for validation.

## Mongoose
- Align required/optional/default/null fields between schemas and TypeScript.
- Distinguish domain objects, hydrated documents, lean results, populated refs, and API DTOs.
- Review `ObjectId` vs string boundaries, timestamps, methods/statics, `.lean()` results, and unsafe population casts.
- Flag schema/type drift and accidental leakage of Mongoose documents into API contracts.
