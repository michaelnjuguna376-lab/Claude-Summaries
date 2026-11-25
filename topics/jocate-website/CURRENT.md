# jocate-website: current state

_Last updated: 2026-11-25 (seeded from Claude's project memory)_

- Static site for jocateorg.com, built locally in `c:\Users\User\OneDrive\Documentos\Jocate - org website`.
- Hosted on Hostinger next to an empty WordPress install (DirectoryIndex routes to the static site). Deploys go over SSH with the key `~/.ssh/hostinger_ed25519`; site root `domains/jocateorg.com/public_html`.
- After a deploy: purge the Hostinger CDN and check asset permissions (`chmod -R u+rwX`); Windows tar keeps read-only dir modes.
- Forms (partner, supplier, calculator) POST to `public_html/api/submit.php` and then hand off to WhatsApp/Gmail. See [jocate-data-agent](../jocate-data-agent/CURRENT.md).
- Company email changed to jocateent@gmail.com on 2026-11-21 (site + build script).
- The local machine has no git, Node or Python (as of 2026-11-15).

## Open items
- [ ] None recorded yet. Add them here as they come up.
