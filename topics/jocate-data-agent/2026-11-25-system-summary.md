---
date: 2026-11-25
topic: jocate-data-agent
title: Summary of the Jocate data system, admin and Data Steward agent (2026-11-16 to 2026-11-25)
status: done
---

# Jocate data system: summary

## Goal
Record how the website's data pipeline, admin page, analytics and Data Steward agent work, so a new session can continue without chat history.

## What was done
- **Capture:** `public_html/api/submit.php` stores every form submission (partner enquiry, supplier registration, calculator estimate) in MySQL before the visitor is handed to WhatsApp or email.
- **ETL** (`server/lib`: bootstrap, transform, etl, report) cleans each submission inline (names, phones, counties, units), merges duplicates and scores leads. Rules live in `rules/rules.json`.
- **Admin** at `/admin/`, password-protected (hash in the private server config):
  - contacts and follow-ups
  - calculator estimates
  - potential partners
  - website analytics (added 2026-11-21)
- **Analytics** (first-party, cookieless, added 2026-11-21): `lib/analytics.php`, `/api/track.php` and table `jocate_analytics`.
  - Records page views, referrer host, utm_source, mobile or desktop, and a daily salted visitor hash. No IP addresses are stored.
  - Records clicks on WhatsApp, call, email, PDF download and the enquiry form.
  - Bots and Do-Not-Track browsers are excluded.
- **Weekly jobs:**
  - `server/bin/weekly.sh` (Monday 03:00 UTC): ETL, then a report without personal data pushed to GitHub.
  - Data Steward cloud routine (Monday 05:00 UTC): reviews the report, improves the rules and writes findings, learnings and skills.
- **Repo:** `michaelnjuguna376-lab/jocate-data-agent` (private), pushed with the server deploy key.

## Result / verification
- The analytics endpoint was tested end to end on 2026-11-21 with a test view and click: both were recorded, then deleted.
- The Data Steward cloud run succeeded after the Claude GitHub App was installed (commit 2691576).

## Decisions
- Personal data never leaves the server. GitHub only gets aggregates.
- Analytics stays first-party, so no cookie banner is needed.

## Open items / next steps
- [ ] Confirm the hPanel cron jobs fire (they never had as of 2026-11-20; the user updated them 2026-11-21).
- [ ] Delete `~/jocate-private/cron-test.sh` once cron is confirmed.
- [ ] The user should change the admin password.

## Pointers
- Server code: `~/jocate-agent` · Logs: `~/jocate-private/logs/`
- Claude memory: `memory/data-agent.md`
