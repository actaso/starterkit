# Acta Team Workflow

This document outlines how we work internally at Acta in the product teams. This is a living document that is meant to be updated and expanded as we figure out how to maximize our product velocity in this changing environment.

## Principles
- All of our work lives in linear. If something doesn't exist in linear, don't work on it.
- Use estimates in linear (8=full day, 1=~1 hour) to keep track of workload
- Self-assign issues. The default state for issues is to not be assigned to anyone.
- Default to async solutions. We are an in-person company, yet always default to recording Looms, opening threads, writing documents over meetings.
- Don't delegate your thinking to an LLM. When using cursor, make sure to think through the high-level architecture on how to build something. Check AI's work.

## Code workflow
- **Dev branch integration** - All development work goes to the `dev` branch through PRs.
- **Main = prod** - The `main` branch represents production-ready code.
- **Regular releases** - We promote `dev` to `main` every few days as releases.
- Own your mistakes. The above implies you are thorough, reliable, and high in quality with your work.
- If you are unsure on code changes, open a PR to `dev` and ask for feedback.
- We have no staging. It's your local env, dev branch, or production.
- Always open a PR to `dev` that you squash + merge for a clean commit history.
- Release PRs from `dev` to `main` should include comprehensive changelog updates.

## Release process
- **Regular releases** - We promote `dev` to `main` every few days (typically 2-3 days).
- **Release responsibility** - Any team member can initiate a release by creating a PR from `dev` to `main`.
- **Release PR requirements**:
  - [ ] All changes since last release are documented in CHANGELOG.md
  - [ ] Version number updated following semantic versioning
  - [ ] All tests pass and builds are successful
  - [ ] Brief release notes summarizing key changes
- **Post-release** - Tag the main branch with the version number after merge.

## Changelog process
- We keep a changelog. Every merge to `dev` needs to be part of the CHANGELOG.md file. 
- Follow best practice to write changelogs as described here: https://keepachangelog.com/en/1.1.0/
- We use semantic versioning
- During releases, consolidate and organize changelog entries for the version being released

## Definition of Done
### For regular PRs to `dev`:
- [ ] Code follows the best practices around the existing code base
- [ ] You tested the changes you made rigorously and vouche for it not breaking anything + having "0 bugs"
- [ ] CHANGELOG.md updated with your changes
- [ ] Lints + builds are passing
- [ ] PR approved and squash + merged to `dev`

### For release PRs from `dev` to `main`:
- [ ] All individual changes documented in CHANGELOG.md
- [ ] Version number bumped appropriately
- [ ] Release notes summarizing key changes
- [ ] All tests pass and builds successful
- [ ] Tagged after merge to `main`

## How to talk to AI
- For medium-large changes, ask AI to understand the current repo + implementation first and to suggest a plan. Confirm this carefully prior to getting into actual engineering work