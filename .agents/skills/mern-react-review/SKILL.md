---
name: mern-react-review
description: Audit React JavaScript/TypeScript code for component design, hooks, state, accessibility, performance, tests, and maintainability. Use for React best-practices or frontend code reviews.
metadata:
  author: riley-childs
  version: "1.0"
---

# Workflow

See `.agents/skills/_base/common-workflow.md`.

# Output

See `.agents/skills/_base/common-output.md`.

# Deterministic inventory

For recursive/full-project audits, use `scripts/inventory.py` instead of relying on memory or a shallow directory listing. Pass only the extensions relevant to the task. This script provides a reproducible file list and total before review.
