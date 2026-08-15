# Project Standards

Keep domain logic independent of HTTP concerns where practical. Use accurate static types for trusted internal calls; retain runtime validation for untrusted inputs before they enter domain logic. Prefer pure/testable helpers when that improves clarity.
