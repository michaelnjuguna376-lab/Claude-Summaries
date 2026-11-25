---
date: 2026-11-25
topic: jocate-website
title: Privacy policy page published (/privacy), linked from footers and forms
status: done
---

# Privacy policy page

## Goal
The user asked for a draft privacy policy. Mak-0 had flagged its absence as a high-severity legal failure (Kenya DPA 2019 s.29).

## What was done
- `site-src/privacy-body.html`, rendered to `/privacy` by `tools/build-site.ps1` (WebPage JSON-LD, in the sitemap). The sitemap now has 30 URLs; the version tag is `20261125n`.
- **12 sections:**
  1. who we are (the controller)
  2. what is collected, by form, plus the hashed IP and cookieless analytics
  3. purposes and lawful bases
  4. the WhatsApp and Gmail hand-off
  5. sharing (Hostinger, staff, authorities)
  6. transfer outside Kenya: the server is in Manchester, UK (Hostinger Operations UAB), under DPA ss.48–50
  7. retention: 24 months after last contact; anonymous statistics 24 months; 4 weekly file backups that do not include the database
  8. security, including 72-hour breach notice to the ODPC
  9. DPA rights, with the complaint route to the ODPC
  10. cookies (none public; an admin session cookie; Google Fonts)
  11. children
  12. changes
- **Links:** "Privacy policy" in the footer of every page. Short notices next to the partner and supplier forms (Swahili on /tuuzie) and the calculator.
- `.htaccess`: `privacy.html` 301s to `/privacy` (backup `.htaccess.bak-privacy`). Mak-0 baseline re-accepted.

## Result / verification
- `/privacy` returns 200, the old `.html` address 301s, and /partner and /tuuzie return 200.
- Mak-0 checks: "Privacy policy found at /privacy and covers the key DPA topics", with no form missing a policy link. Cookies check passes.

## Decisions
- Only actual practices are described (verified against the code: submit.php, track.php, main.js, suppliers.js).
- Retention set at 24 months, matching the Mak-0 retention check.

## Open items / next steps
- [ ] The user should review the wording, especially retention, the services listed and the contact details. Legal review is optional but recommended.
- [ ] Add the ODPC registration number if or when the company registers.
- [ ] Optional: a terms of use page (Mak-0 low warning).

## Pointers
https://jocateorg.com/privacy
