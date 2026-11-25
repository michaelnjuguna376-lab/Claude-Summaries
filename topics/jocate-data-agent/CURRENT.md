# jocate-data-agent: current state

_Last updated: 2026-11-25_

- **Data flow:** submissions land in MySQL (the WordPress database, tables `jocate_*`), and the ETL cleans each submission inline. Admin at https://jocateorg.com/admin/; the password hash is in `~/jocate-private/config.php` on the server.
- **Admin views:**
  - contacts (default)
  - `?view=analytics`: first-party website analytics, table `jocate_analytics`, endpoint `/api/track.php`
  - `?view=partners`
  - `?view=estimates`
- **Code:** local `data-agent/`. The server copy is the git repo `~/jocate-agent`, outside the web root. GitHub repo `michaelnjuguna376-lab/jocate-data-agent` (private, reports without personal data), pushed with the server deploy key. Last server commit on 2026-11-21: bf17b1c (analytics).
- **Data Steward agent:** follows PLAYBOOK.md and edits `rules/rules.json`. Cloud routine `trig_01SSWmK4FSrSywvGcaduAQL8` runs Mondays at 05:00 UTC.
- **Weekly server job:** `server/bin/weekly.sh` is meant to run Mondays at 03:00 UTC via hPanel cron.
- **Email routing:** agent report emails go to the company Gmail inbox (`report_email` default in `server/lib/prospects.php`). The public site email is info@jocateorg.com.
- **Personal data:** stays on the server. Mak-0 counts submissions older than 24 months each week (retention check).

## Open items
- [ ] **hPanel crons have never fired** (found 2026-11-20). The user updated them on 2026-11-21; confirm after the next Monday 03:00 UTC and Friday 07:00 UTC runs by checking for "start" lines in `~/jocate-private/logs/weekly.log` and `prospects.log`.
- [ ] A test cron script exists at `~/jocate-private/cron-test.sh`, writing to `logs/cron-test.log`. Delete it once cron is proven to work.
- [ ] The admin password should be changed by the user (`php ~/jocate-agent/server/bin/setup.php --password ...`).
