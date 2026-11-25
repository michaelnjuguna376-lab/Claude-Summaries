# mak-0: current state

_Last updated: 2026-11-25_

- **What:** Mak-0, a local Windows bot (PowerShell 5.1, MIT licence) that watches jocateorg.com for security and legal-compliance problems. It is read-only towards the server and only reports and alerts.
- **Where:** `C:\Users\User\Mak-0` (local git repo, branch `main`, no remote yet). Entry point `Mak0.ps1 -Mode Watch|Daily|Weekly|Update|Baseline|SelfTest`. Config in `config\mak0.config.json`, which is gitignored; a sanitised example is committed.
- **Schedule** (Windows Task Scheduler, current user, no administrator rights):
  - Watch: hourly
  - Update: daily 05:30 (3-hour limit)
  - **Daily: Mondays and Thursdays at 06:15** (the user asked for "bi-weekly"; read as twice a week)
  - Weekly: Sundays 07:00
- **Tools:** YARA 4.6.0 and ClamAV, portable builds verified against GitHub's sha256 digests. Rules come from signature-base (DRL 1.1, web-shell files) and php-malware-finder (LGPL-3.0); only `.yar` files are extracted, never the malware samples. Downloads use curl.exe.
- **Integrity:**
  - Baseline of 14,902 server files, recorded 2026-11-25.
  - WordPress core checked against the api.wordpress.org checksums; plugins against downloads.wordpress.org plugin checksums.
  - Your own deploys are recognised against the local `site/` build.
- **Outputs:** `reports\latest.html` (HTML + JSON per run), `logs\mak0-*.jsonl`, `logs\runs.jsonl`. Weekly archives in `backups\` (4 kept).
- **Admin integration:** after every Watch, Daily, Weekly or Update run, Mak-0 uploads `latest-<Mode>.json/.html` and `history.json` to `~/jocate-private/mak0` on the server (no personal data). The Jocate admin shows them at `/admin/?view=security`, flagging a mode as overdue after 2 h (Watch), 96 h (Daily), 192 h (Weekly) or 50 h (Update). Server commit 0a00a2b.
- **Fixes applied from the first report (2026-11-25):** the `.htaccess` block JOCATE-HARDENING adds the five security headers, turns off directory listing and blocks the unused WordPress endpoints with 403. Every page was re-checked and still returns 200.
- **First results (2026-11-25):** 0 fail, 10 warn. Malware clean. The warnings were security headers, the unused WordPress surface, MariaDB 11.8.10 available, and DMARC p=none. The report was emailed to info@jocateorg.com via the Gmail connector (sender account: the connected Gmail).

## Open items
- [x] ClamAV 1.5.5 installed with current signatures (2026-11-25). The first full ClamAV + YARA scan of 14,904 files was clean, and the weekly backup is 86 MB, sha256-verified.
- Latest weekly result (2026-11-25 17:53): 1 fail (no privacy policy), 7 warn (all legal or low priority).
- [ ] For automatic report emails from Mak-0 itself: the user runs `tools\Set-Mak0Secret.ps1 -Name smtp` with the info@ mailbox password, then sets `alerts.email.enabled` to true. `sendReportFor` is already Daily and Weekly.
- [ ] Optional free keys: `-Name urlhaus` (auth.abuse.ch), `-Name safebrowsing` (Google).
- [ ] Self-update: add a private GitHub remote (see README).
- [ ] Legal attestations in the config: `legal.odpc.status` and `legal.clientNamesPermission.confirmed`.
- [ ] Fix the site-side findings (topic jocate-website): privacy policy, headers, WordPress surface, satellite image credit.
