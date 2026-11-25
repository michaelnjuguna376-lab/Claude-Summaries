# jocate-data-agent: current state

_Last updated: 2026-11-25 (seeded from Claude's project memory)_

- Submissions land in MySQL (WordPress DB, tables `jocate_*`). ETL cleans each submission inline. Admin at https://jocateorg.com/admin/ (password hash in `~/jocate-private/config.php` on the server).
- Code: local `data-agent/`; server copy is the git repo `~/jocate-agent`, outside the web root. GitHub repo `michaelnjuguna376-lab/jocate-data-agent` (private, no-PII reports only), pushed with the server deploy key.
- Data Steward agent follows PLAYBOOK.md and edits `rules/rules.json`. Cloud routine runs Mondays at 05:00 UTC.
- Weekly server job `server/bin/weekly.sh` is meant to run Mondays at 03:00 UTC via hPanel cron.

## Open items
- [ ] **hPanel crons have never fired** (found 2026-11-20). The user needs to check the Monday and Friday cron entries. The Monday one may still point at `weekly.php`.
