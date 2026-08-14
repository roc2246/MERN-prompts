---
name: mern-explain-code
description: Explain MERN JavaScript/TypeScript, React, Express, Mongoose, or SCSS code clearly, including data flow, responsibilities, and maintainability concerns. Use when the user asks how code works.
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
