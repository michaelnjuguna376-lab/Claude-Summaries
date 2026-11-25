# potential-partners: current state

_Last updated: 2026-11-25 (seeded from Claude's project memory)_

- Agent "Jocate Potential Partners" researches industrial buyers of firewood/agro-residue boiler fuel in Kenya. Cloud routine runs Fridays at 04:00 UTC.
- Repo files: `agent/potential-partners.md`, `PROSPECTING.md`, `knowledge/`, `.claude/skills/prospect-research`, `prospects/prospects.json` + `validate.py`.
- Server `server/bin/prospects.sh`: pull → MySQL `jocate_prospects` → email `prospects/reports/LATEST.md` → WhatsApp top-5 via CallMeBot (keys in the private server config).
- Admin view: `/admin/?view=partners`.
- W47: 23 prospects in DB, 5 priority (commit 3d5b451). The W47 report was sent manually on 2026-11-20.
- Sources that return 403: Nation, Kenyan Wall Street.

## Open items
- [ ] Friday hPanel cron (07:00 UTC) has not fired. See jocate-data-agent.
- [ ] The second WhatsApp recipient still needs a CallMeBot key.
