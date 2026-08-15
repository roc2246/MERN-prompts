---
name: mern-explain-code
description: Explain MERN JavaScript/TypeScript, React, Express, Mongoose, or SCSS code clearly, including data flow, responsibilities, and maintainability concerns. Use when the user asks how code works.
metadata:
  author: riley-childs
  version: "2.0"
---

# MERN Explain Code

## Workflow

1. Start with the selected code; inspect imports or call sites only when needed to explain behavior accurately.
2. State the code's responsibility, inputs, outputs, and important side effects.
3. Walk through meaningful control/data flow from the outside in.
4. Explain framework-specific behavior only where it affects understanding.
5. Mention maintainability or correctness concerns only when useful to the user's question.
6. Do not load project standards or broad checklists unless the user explicitly asks for a best-practices or architecture analysis.

## Output

Prefer a concise explanation with exact file/function references. Use small code excerpts only when they materially improve understanding.
