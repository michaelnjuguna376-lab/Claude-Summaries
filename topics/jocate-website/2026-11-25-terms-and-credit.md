---
date: 2026-11-25
topic: jocate-website
title: Terms of use page (/terms) and satellite image credit added
status: done
---

# Terms page and satellite image credit

## Goal
Clear the last two Mak-0 legal warnings: the uncredited satellite image and the missing terms of use.

## What was done
- **Credits:** `site/credits.html` has a new row for the East Africa map imagery: "Blue Marble: Next Generation" by NASA Earth Observatory (Reto Stöckli), via NASA GIBS (WMS layer BlueMarble_NextGeneration), public domain with credit requested, used on Insights: supply lines. The source was confirmed from the session transcript (it was fetched from gibs.earthdata.nasa.gov). Mak-0 config: `east-africa-satellite` added to image.credited.
- **Terms:** `site-src/terms-body.html` is rendered to `/terms` by build-site.ps1 (in the sitemap, which now has 31 URLs). 12 sections:
  1. about these terms
  2. estimates and quotes are indicative, not offers; written agreements prevail
  3. research articles are general information
  4. submissions; sellers must have the right to sell
  5. acceptable use (Computer Misuse and Cybercrimes Act 2018)
  6. intellectual property; third-party images under their licences
  7. outside links
  8. availability
  9. liability, limited to the extent Kenyan law allows, with the Consumer Protection Act 2012 preserved
  10. Kenyan law and courts
  11. changes
  12. contact
- "Terms of use" link in every footer. `.htaccess`: `terms.html` 301s to `/terms` (backup `.htaccess.bak-terms`). Mak-0 baseline re-accepted.

## Result / verification
- `/terms` returns 200, `/terms.html` 301s, and /privacy, /credits and / return 200. All 32 pages link /terms.
- Mak-0 checks: "All 18 photos in use are credited", the privacy policy passes, and identity passes. With /terms present, the terms check raises no finding.

## Open items / next steps
- [ ] The user reviews the wording of /terms and /privacy.
