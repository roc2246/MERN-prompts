---
name: mern-typescript-review
description: Recursively audit handwritten TypeScript/TSX for type safety, idiomatic TypeScript, runtime-boundary validation, compiler configuration, and safe refactors. Use for TypeScript best-practices reviews.
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
