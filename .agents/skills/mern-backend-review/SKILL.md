---
name: mern-backend-review
description: Audit a MERN Node/Express/Mongoose backend for architecture, security, reliability, API design, and maintainability. Use for backend-wide reviews or server architecture audits.
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
