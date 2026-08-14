Go through each Agent Skill in my MERN prompts project and evaluate whether it follows good Agent Skill design practices.

For each skill:

* Check whether the skill has one clear, specific purpose.
* Check whether the `SKILL.md` contains only the instructions needed to guide the agent.
* Identify information that should be moved to a reference file because it is contextual or only needed sometimes.
* Identify deterministic or repeatable logic that should be moved to a script instead of being explained in `SKILL.md`.
* Look for duplicated, unnecessary, overly verbose, or redundant instructions that waste context-window tokens.
* Check whether the skill is modular rather than trying to handle too many unrelated tasks.
* Check whether the skill description/frontmatter is specific enough for an AI agent to know when the skill should activate.
* Keep the instructions as LLM-agnostic as reasonably possible.
* Recommend changes that reduce token usage without removing information necessary for the skill to work correctly.

For each skill, tell me:

1. What is already good.
2. What should be changed.
3. What should remain in `SKILL.md`.
4. What should move to a reference file.
5. What should move to a script, if anything.
6. Whether the skill should be split into multiple skills.
7. Whether any content can simply be removed.

Prioritize minimal token usage, clear activation criteria, modularity, and reliable AI behavior.
