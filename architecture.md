# MERN Architecture Defaults

Prefer clear dependency flow: React UI/API client → Express route/middleware/controller → service/domain logic → Mongoose persistence. Keep HTTP, domain, and persistence concerns separable when practical. Validate untrusted input at runtime and centralize cross-cutting concerns such as errors/auth/config. Existing repository architecture takes precedence.
