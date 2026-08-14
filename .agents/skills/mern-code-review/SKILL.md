---
name: mern-code-review
description: Review MERN JavaScript/TypeScript, React, Express, Mongoose, and styles for production-quality issues. Use for general code reviews, refactoring audits, maintainability checks, or when the user asks for a senior-engineer review.
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
