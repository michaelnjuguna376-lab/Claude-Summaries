---
date: 2026-11-25
topic: claude-setup
title: Handoff system set up
status: in-progress
---

# Handoff system set up

## Goal
Claude should write a handoff summary after every piece of structured work. The summaries are stored locally and on GitHub and grouped by topic, and Claude references them instead of relying on cache.

## What was done
- Created `C:\Users\User\claude-handoffs\` with README, template, INDEX, `daily/`, and `topics/` (jocate-website, jocate-data-agent, potential-partners, claude-setup, general). Each topic has a `CURRENT.md`, seeded from Claude's project memory.
- Created `~/.claude/CLAUDE.md` with the global handoff rule.
- Added hooks to `~/.claude/settings.json`:
  - SessionStart → `scripts/session-start.ps1`, which injects INDEX.md into context.
  - Stop → `scripts/sync.ps1` (async), which commits and pushes when git and a remote exist.

## Result / verification
- Both scripts were pipe-tested by hand (see the session). sync.ps1 exits 0 as a no-op because git is not installed yet.

## Decisions
- One repo just for handoffs, kept separate from jocate-data-agent so its no-PII rule stays clean.
- Located outside OneDrive. Git repos inside OneDrive tend to corrupt from sync conflicts.
- Handoffs carry no secrets or personal data, because they are pushed to GitHub.

## Open items / next steps
- [ ] User: `winget install --id Git.Git -e`, then restart VS Code.
- [ ] User: create a private repo `claude-handoffs` on GitHub (empty, no README).
- [ ] Then, in `C:\Users\User\claude-handoffs`: `git init -b main`, `git remote add origin https://github.com/michaelnjuguna376-lab/claude-handoffs.git`, `git add -A`, `git commit -m "init"`, `git push -u origin main`. The first push opens a browser login. After that, the Stop hook pushes automatically.

## Pointers
- `~/.claude/CLAUDE.md`, `~/.claude/settings.json`, `C:\Users\User\claude-handoffs\scripts\`
