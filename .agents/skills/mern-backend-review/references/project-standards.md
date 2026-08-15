# Project Standards

Prefer clear controller/service/model boundaries and one-way dependency flow. Keep secrets in environment configuration, validate external inputs, centralize errors, and avoid speculative abstractions. Mongoose persistence types should not leak accidentally into public API contracts.
