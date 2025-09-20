# Acta Team Workflow

This document outlines how we work internally at Acta in the product teams. This is a living document that is meant to be updated and expanded as we figure out how to maximize our product velocity in this changing environment.

## Principles
- All of our work lives in linear. If something doesn't exist in linear, don't work on it.
- Use estimates in linear (8=full day, 1=~1 hour) to keep track of workload
- Self-assign issues. The default state for issues is to not be assigned to anyone.
- Default to async solutions. We are an in-person company, yet always default to recording Looms, opening threads, writing documents over meetings.
- Don't delegate your thinking to an LLM. When using cursor, make sure to think through the high-level architecture on how to build something. Check AI's work.

## Code workflow
- Main = prod. Everyone is allowed to push to main.
- Own your mistakes. The above implies you are thorough, reliable, and high in quality with your work.
- If you are unsure on code changes, open a PR and ask for feedback.
- We have no staging. It's your local env or production.

## Changelog process
- We keep a changelog. Every merge you make needs to be part of the CHANGELOG.md file. 
- Follow best practice to write changelogs as described here: https://keepachangelog.com/en/1.1.0/
- We use semantic versioning

## Definition of Done
- [ ] Code follows the best practices around the existing code base
- [ ] You tested the changes you made rigorously and vouche for it not breaking anything + having "0 bugs"
- [ ] CHANGELOG.md updated
- [ ] Lints + builds are passing