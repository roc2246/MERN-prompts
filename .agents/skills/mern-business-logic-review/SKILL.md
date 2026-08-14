---
name: mern-business-logic-review
description: Review Node.js/TypeScript services, utilities, calculations, validators, and domain logic for correctness and maintainability. Use for business logic or utility-module audits.
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
