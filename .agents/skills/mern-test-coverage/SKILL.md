---
name: mern-test-coverage
description: Audit MERN source files for missing unit tests, propose exact tests, and generate approved tests using the existing framework. Use for test coverage audits or missing-test generation.
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
