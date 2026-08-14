---
name: mern-code-review
description: General code review for MERN JavaScript/TypeScript, React, Express, Mongoose, and styles. Use as the catch-all for code reviews when scope is unclear, for refactoring audits, maintainability checks, or when the user asks for a senior-engineer review. For focused backend architecture or dependency flow reviews, use mern-backend-review instead.
metadata:
  author: riley-childs
  version: "1.0"
---

# Workflow

See `.agents/skills/_base/common-workflow.md`.

# Output

See `.agents/skills/_base/common-output.md`.

# Deterministic Inventory

For recursive/full-project audits, use `scripts/inventory.py` instead of relying on memory or a shallow directory listing. Pass only the extensions relevant to the task. This script provides a reproducible file list and total before review.
