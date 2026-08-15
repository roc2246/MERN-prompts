---
name: mern-backend-review
description: Specialized backend architecture audit for a MERN Node/Express/Mongoose backend focusing on design patterns, security, reliability, API design, dependency flow, and database strategy. Use for backend-wide reviews, server architecture audits, or dependency/integration analysis. For general backend code review when architecture is not the focus, use mern-code-review instead.
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
