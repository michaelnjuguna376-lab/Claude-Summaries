# jocate-website: current state

_Last updated: 2026-11-25_

- **Site:** static site for jocateorg.com, built locally in `c:\Users\User\OneDrive\Documentos\Jocate - org website`. The source of truth is `site/` plus `site-src/`. Build with `tools/build-site.ps1`, then `tools/make-swahili-suppliers.ps1` whenever suppliers.html changes.
- **Hosting:** Hostinger shared hosting, next to an unused WordPress 7.1.5 install. Deploy with scp to `domains/jocateorg.com/public_html` using the key `~/.ssh/hostinger_ed25519`.
- **Pages:**
  - `/` is "About us" (the About page was merged in; `/about` 301s to `/`).
  - `/products/` plus 7 UNSPSC product pages.
  - `/market`, `/calculator`, `/suppliers`, `/tuuzie` (Swahili), `/partner`, `/credits`.
  - `/insights/` with 14 articles.
  - Sitemap has 29 URLs.
- **Public email:** info@jocateorg.com (Hostinger mailbox). Agent reports go to the company Gmail inbox set in the server config.
- **Forms** (partner, supplier, calculator) POST to `/api/submit.php`, then hand off to WhatsApp or email. Page views and contact clicks go to `/api/track.php` (first-party, cookieless analytics). See [jocate-data-agent](../jocate-data-agent/CURRENT.md).
- **Search Console:** verified by the HTML meta tag (URL-prefix property). Never remove the tag from the home page.
- **Monitoring:** Mak-0 (local bot, topic [mak-0](../mak-0/CURRENT.md)) watches the site. Results show in the admin under Security (Mak-0) at `/admin/?view=security`.
- **Hardening (2026-11-25):** HSTS, nosniff, X-Frame-Options, Referrer-Policy and Permissions-Policy headers; directory listing off; wp-login.php, xmlrpc.php, readme.html, license.txt and the WordPress user-list API return 403. All in the `.htaccess` block JOCATE-HARDENING (remove the block to undo).
- **Build gotchas:** CSS/JS version is `20261121m`; bump `$ver` in build-site.ps1 when CSS or JS change. Save the PowerShell build scripts as UTF-8 with BOM, or PowerShell 5.1 garbles non-ASCII characters.

## Open items
- [x] Privacy policy published at /privacy on 2026-11-25 (footer and form links). The user should review the wording.
- [x] Satellite map image credited (NASA Blue Marble via GIBS) on 2026-11-25. Terms of use published at /terms.
- [x] Security headers and blocks on the unused WordPress endpoints: applied 2026-11-25 (.htaccess block JOCATE-HARDENING; backup .htaccess.bak-hardening).
- [ ] User-supplied: photos, client permissions or quotes, registration details, Google Business Profile, product specifications.
- [ ] Optional: re-add the Search Console Domain TXT record.
