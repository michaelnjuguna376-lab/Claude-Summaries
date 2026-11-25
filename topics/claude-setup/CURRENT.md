# claude-setup: current state

_Last updated: 2026-11-25_

- **Handoff system** (since 2026-11-25): this repo at `C:\Users\User\claude-handoffs`.
  - The rule is in `~/.claude/CLAUDE.md` (global, all projects).
  - Hooks in `~/.claude/settings.json`: SessionStart runs `scripts/session-start.ps1`, which injects INDEX.md. Stop runs `scripts/sync.ps1`, which does git commit + push.
- Project skills installed in the website project: frontend-design, ui-ux-pro-max, design-taste-frontend, impeccable, web-design-guidelines.
- Custom agents: data-steward, potential-partners.

## Open items
- [ ] Install Git for Windows, create the private GitHub repo `claude-handoffs`, and connect it (steps in the 2026-11-25 handoff). Until then, sync is a no-op and handoffs are local only.
