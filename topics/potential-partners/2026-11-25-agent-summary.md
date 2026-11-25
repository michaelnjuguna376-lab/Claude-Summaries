---
date: 2026-11-25
topic: potential-partners
title: Summary of the Potential Partners agent (2026-11-16 to 2026-11-25)
status: done
---

# Potential Partners agent: summary

## Goal
Record how the weekly prospect-research agent and its delivery pipeline work.

## What was done
- **Cloud routine:** "Jocate Potential Partners" runs Fridays at 04:00 UTC. It follows `PROSPECTING.md` and the `prospect-research` skill (a deep-research method), reads `knowledge/` (market brief, hotspots, scoring), and writes cited, company-level records to `prospects/prospects.json` and a weekly report to `prospects/reports/`.
- **Scoring:** 0–100 (heat demand 30, haul distance 20, fossil fuel 15, scale 15, signals 15, access 5). Bands: priority 75+, strong 55–74, watch 35–54.
- **Server delivery** (`server/bin/prospects.sh`, intended for Fridays 07:00 UTC via hPanel cron): import into MySQL `jocate_prospects` (team status and notes are preserved), email the report, and send a WhatsApp top-5 summary via CallMeBot.
- **Monthly market-update draft:** the routine prompt was extended 2026-11-21. The first draft is due 2026-12-04, in `drafts/`.

## Result / verification
- Three W47 runs on 2026-11-16 built the list to 23 prospects (5 priority), after network access was enabled in the cloud environment.
- The email and WhatsApp delivery were tested manually and accepted.

## Decisions
- Company-level public information only. The agent never contacts companies. Existing clients and Synresins are never listed as prospects.

## Open items / next steps
- [ ] Confirm the Friday cron fires on 2026-11-27.
- [ ] A CallMeBot key for the second WhatsApp number.
- [ ] Review the first monthly draft.

## Pointers
- Admin: `/admin/?view=partners` · Routine: https://claude.ai/code/routines/trig_012B1A7DUaURtgyeexhA7toQ
