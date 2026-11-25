---
date: 2026-11-25
topic: mak-0
title: Built Mak-0 (local security + legal bot), first daily scan, report emailed, twice-weekly schedule
status: done
---

# Mak-0: build and first scan

## Goal
The user asked for a local bot called Mak-0 to handle legal and security operations for their websites. It should auto-update, research new and updated software and malware, use only free open-source code and keep logs. Later requests in the same turn: run the daily scan, show and email the report, and set the scan to "bi-weekly".

## What was done
- **Research** (written up in `C:\Users\User\Mak-0\RESEARCH.md`):
  - Tools: ClamAV and YARA.
  - Free intelligence: CISA KEV, NVD 2.0 (5 requests per 30 s without a key), endoflife.date, wordpress.org core and plugin checksums, RDAP, MDN Observatory v2, the Quad9/Cloudflare filtering-resolver trick.
  - Keyed sources: URLhaus and Safe Browsing need free keys; Spamhaus refuses public-resolver queries.
  - Kenya DPA 2019 duties: notice under s.29, 72-hour breach reporting, ODPC registration with the exemption below KES 5 million turnover.
- **Code** in `C:\Users\User\Mak-0`:
  - `Mak0.ps1` (entry point), `lib\Core.ps1`, `Security.ps1`, `Integrity.ps1`, `Intel.ps1`, `Legal.ps1`, `Update.ps1`, `Report.ps1`
  - `tools\Install-Mak0.ps1` and `tools\Set-Mak0Secret.ps1` (DPAPI-encrypted secrets)
  - README, RESEARCH, LICENSE (MIT), `.gitignore`
- **Git commits:** 95b7019 (1.0.0), facc6b8 (twice-weekly schedule, report emails, safer rule extraction), plus a third commit (plugin checksums, graded heuristics).
- **Scheduled tasks registered:** "Mak-0 Watch" hourly, "Mak-0 Update" 05:30, "Mak-0 Daily" Mondays and Thursdays 06:15, "Mak-0 Weekly" Sundays 07:00.
- **Emailed** the latest report and the full-scan report to info@jocateorg.com through the Gmail connector.

## Result / verification
- Self-test: every script parses.
- Watch run: 10 pages up.
- Daily run:
  - 14,902 files YARA-scanned: clean.
  - 3,336 WordPress core files and 3,249 plugin files match the official checksums.
  - TLS valid for 80 days; domain has 355 days left; Defender on.
- Final report: 0 fail, 10 warn.
- Problems found and fixed during testing:
  - Git's tar was picked up instead of Windows tar.
  - A missing include in the php-malware-finder rules.
  - Defender quarantined the real malware samples bundled in the rule repository; the fix extracts only `.yar` files.
  - The "xxx" phone placeholder raised a spam false positive.
  - The rotating CDN A records looked like DNS hijacks.
  - NVD keyword noise.
  - 82 plugin heuristic false positives, now cleared by official checksums.
  - 139 heuristics on Hostinger vendor files, now graded low on full scans.
- **Not verified:** ClamAV. Its install was still downloading at the end of the session.

## Decisions
- PowerShell only, because this PC has no Python or Node. Portable tools, so no administrator rights are needed.
- Mak-0 never changes the server. Fixes stay a human decision.
- Heuristic YARA hits are graded by context: low on a full baseline scan, medium on changed files. ClamAV and high-confidence web-shell rules stay high or critical.
- "Bi-weekly" was read as twice a week (Mondays and Thursdays), because every two weeks is too sparse for malware and integrity checks. The user can change it in `tools\Install-Mak0.ps1`.

## Follow-ups the same day
- **"Apply the What to do sections":** the `.htaccess` block JOCATE-HARDENING was prepended (backup `.htaccess.bak-hardening`). It adds HSTS (1 year, no includeSubDomains), nosniff, X-Frame-Options SAMEORIGIN, Referrer-Policy, Permissions-Policy, unsets X-Powered-By, turns on Options -Indexes, and returns 403 for wp-login.php, xmlrpc.php, readme.html, license.txt, wp-config-sample.php, /wp-json/wp/v2/users and ?rest_route=/wp/v2/users. Verified: the headers are present, those paths return 403, and every site page plus /admin/ and /sitemap.xml returns 200.
- **Not applicable from here:** the MariaDB 11.8.10 patch (applied by Hostinger) and DMARC p=none → quarantine (a DNS change in hPanel, best after a few weeks of clean reports).
- **"Include this security in the Jocate admin":** `Publish-Mak0Status` in `lib\Report.ps1` (config `adminStatus.remoteDir = jocate-private/mak0`), plus the admin view `?view=security` and the protected full-report route `?mak0report=<Mode>`. Verified by rendering the page server-side with a throwaway session: the tiles are correct, 11 attention rows, no PHP warnings. Mak-0 commit 769b64d.

## Open items / next steps
- [ ] Confirm the ClamAV install finished (`bin\clamav-*`, `state\clamdb`).
- [ ] The user stores the SMTP secret so Mak-0 emails reports itself.
- [ ] The user sets up a private GitHub remote for self-update.
- [ ] Fix the site findings: headers, WordPress surface, privacy policy, satellite credit.

## Pointers
- Report: `C:\Users\User\Mak-0\reports\latest.html` · Logs: `C:\Users\User\Mak-0\logs\`
- Install or reinstall: `powershell -ExecutionPolicy Bypass -File C:\Users\User\Mak-0\tools\Install-Mak0.ps1`
