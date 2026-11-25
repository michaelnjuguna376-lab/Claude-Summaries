# potential-partners: current state

_Last updated: 2026-11-25_

- **Agent:** "Jocate Potential Partners" (cloud routine `trig_012B1A7DUaURtgyeexhA7toQ`, Fridays 04:00 UTC, claude-sonnet-5-5, full network access) researches industrial buyers of firewood and agro-residue boiler fuel in Kenya.
- **Monthly drafts (since 2026-11-21):** on the first Friday of each month the agent also writes `drafts/market-update-YYYY-MM.md`, a cited draft Insights article marked "DRAFT - needs human approval". The first one is due 2026-12-04.
- **Repo files:** `agent/potential-partners.md`, `PROSPECTING.md`, `knowledge/`, `.claude/skills/prospect-research`, `prospects/prospects.json` + `validate.py`.
- **Server job `server/bin/prospects.sh`:** git pull → MySQL `jocate_prospects` → email `prospects/reports/LATEST.md` to the company Gmail inbox → WhatsApp top-5 via CallMeBot. Recipients and keys are in the private server config.
- **Admin view:** `/admin/?view=partners`.
- **Status (W47):** 23 prospects in the database, 5 priority. The W47 report and WhatsApp summary were sent manually on 2026-11-20, because the cron did not fire.
- **Blocked sources:** Nation and Kenyan Wall Street return 403 to the agent.

## Open items
- [ ] Friday hPanel cron (07:00 UTC): confirm it fires on 2026-11-27. See jocate-data-agent.
- [ ] The second WhatsApp recipient (the primary number) still needs a CallMeBot key.
- [ ] Review the first monthly draft after 2026-12-04 and publish it through `site-src/insights-source.html`.
