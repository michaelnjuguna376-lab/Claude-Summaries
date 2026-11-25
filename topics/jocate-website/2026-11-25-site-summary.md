---
date: 2026-11-25
topic: jocate-website
title: Full summary of jocateorg.com as built (2026-11-15 to 2026-11-25)
status: done
---

# jocateorg.com: full build summary

## Goal
A record of everything built for jocateorg.com (Jocate Enterprises Limited, a firewood and agro-waste boiler-fuel supplier in Kenya), so a new session can pick it up without chat history.

## What was done
- **Static site** in `c:\Users\User\OneDrive\Documentos\Jocate - org website\site`, deployed over SSH/scp to the Hostinger web root `domains/jocateorg.com/public_html`, next to an unused WordPress install. DirectoryIndex is set to `index.html` first.
- **Pages (live, clean URLs):**
  - `/` is "About us": hero, stats, clients, three lines of business, how fuel reaches the boiler, values, company details and profile PDF. The separate About page was merged into it on 2026-11-21, and `/about` 301s to `/`.
  - `/products/` plus 7 product pages, one per UNSPSC code: 11121610, 11122004, 14101501, 23181522, 50221108, 50221114, 80161701.
  - `/market`, `/calculator` (fuel calculator: steam, oil and power modes; pressure and feedwater inputs; methodology checked against standard references).
  - `/suppliers` ("Sell to Us") and `/tuuzie` (Swahili version, hreflang-linked), `/partner` (enquiry form), `/credits`.
  - `/insights/` with 14 sourced articles. The 3 newest (2026-11-20) are clean-energy-industry, climate-summits-future and biomass-clean-energy.
- **Build:** `tools/build-site.ps1` generates insights, products, SEO tags, JSON-LD, sitemap.xml (29 URLs) and robots.txt. `tools/make-swahili-suppliers.ps1` builds `/tuuzie` from suppliers.html. Both scripts must be saved as UTF-8 **with BOM**. CSS/JS cache version is `20261121m`.
- **Content sources:** articles in `site-src/insights-source.html`, products in `site-src/products.json`, company profile in `site-src/company-profile.html`, printed to `site/assets/jocate-company-profile.pdf` with headless Chrome.
- **Brand:** forest green, gold and logo lime; black for text. Montserrat headings, IBM Plex Sans body. Logo assets in `site/assets/img/jocate-*`.
- **Server rules (`.htaccess`, JOCATE-URLS block):** www to apex; old `.html` addresses 301 to clean ones (also for `/products/*` and `/insights/*`); `/about` 301 to `/`; HTML served no-cache.
- **SEO:**
  - Google Search Console verified with a URL-prefix property `https://jocateorg.com/` using the HTML meta tag on the home page. **Never remove that tag.**
  - The Domain property's DNS TXT record disappeared when email was set up, and the user's re-add did not publish.
  - IndexNow key file: `/0cf40b3c2fac567d7e3dbabbc15a9382.txt`.
- **Contact:**
  - Public email is info@jocateorg.com (Hostinger mailbox; MX, SPF, DKIM and DMARC p=none).
  - WhatsApp and the phone numbers live in `site/assets/main.js` (`window.JOCATE`) and the build script.
- **Analytics:** first-party and cookieless. `main.js` sends page views and contact clicks to `/api/track.php`, which writes to MySQL `jocate_analytics`. Admin view: `/admin/?view=analytics`.

## Result / verification
- Live checks on 2026-11-21 found every page returning 200 and no broken internal links. Redirects were verified, the HTML validator showed 0 errors on the pages it checked, and layouts were checked at desktop and phone widths.
- First Mak-0 runs on 2026-11-25 independently re-checked uptime, redirects, TLS and exposure. See topic `mak-0`.

## Decisions
- Articles and products are published as static pages built by the scripts, not as WordPress posts. WordPress is installed but unused.
- Product copy avoids invented specifications; each page asks buyers for theirs.

## Open items / next steps
- [ ] **Privacy policy page:** required by the Kenya DPA 2019, because the forms collect personal data. Flagged by Mak-0. Claude can draft it when asked.
- [ ] Credit the source of `east-africa-satellite` on `/credits` (flagged by Mak-0).
- [ ] Add security headers (HSTS, X-Frame-Options, nosniff, Referrer-Policy, Permissions-Policy) in `.htaccess`.
- [ ] Block or remove the unused WordPress surface (wp-login.php, readme.html, wp-json, xmlrpc).
- [ ] From the user:
  - real photos, client quotes with permission, company registration details
  - Google Business Profile
  - product specifications for the sheller, pulp, rice and wheat pages
- [ ] Re-add the Search Console Domain TXT record (optional now).

## Pointers
- Live: https://jocateorg.com/ · Admin: https://jocateorg.com/admin/ (password hash in `~/jocate-private/config.php` on the server)
- Deploy: `scp -i ~/.ssh/hostinger_ed25519 -P 65002 ...` to the web root, then `chmod 644` the files
- Claude memory: `memory/site-deployment.md`
