# Technical Rules

This document captures engineering practices that keep quality high while maximizing iteration speed. It is a living document.

## Prefer tiny PRs

Small, focused pull requests lead to faster reviews, fewer defects, and easier rollbacks.

### Why this matters
- Faster review cycles and higher reviewer throughput
- Lower cognitive load and clearer intent per change
- Reduced merge conflicts and safer deploys
- Easier to bisect and revert when issues arise

### Guidelines
- Aim for PRs that can be reviewed in ≤ 10 minutes
- Scope each PR to a single change or concern
- Do not mix refactors with behavior changes; land preparatory refactors separately
- Split work if it touches many files or requires substantial diff volume
- Keep diffs focused; avoid drive-by changes unrelated to the scope
- Provide crisp context in the description (what/why, screenshots if UI, migration notes)
- Include tests for changed behavior (unit/integration/e2e as appropriate)
- Open Draft PRs early to gather feedback and surface risks
- If a large PR is unavoidable: outline the plan, call out risk areas, and list follow-ups

### Reviewer expectations
- Prioritize small PRs for quick turnaround
- If a PR feels too large, request a split into smaller, self-contained changes

### Related
- See `product/TEAMWORKFLOW.md` for the Definition of Done and release process

