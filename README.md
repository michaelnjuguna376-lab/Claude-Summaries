# Claude Handoffs

The running record of Claude's work, one handoff per piece of structured output. Claude reads this at the start of every session, so a new session picks up where the last one stopped without relying on a prompt cache or chat history.

## Layout

```
claude-handoffs/
├── INDEX.md                  ← newest first, one line per handoff, grouped by topic. Loaded at every session start.
├── _template.md              ← copy this for a new handoff
├── daily/YYYY-MM-DD.md       ← that day's log: one line per handoff written that day
├── topics/<topic>/
│   ├── CURRENT.md            ← living state of the topic: what is true right now, open items
│   └── YYYY-MM-DD-<slug>.md  ← one handoff per work output
└── scripts/
    ├── session-start.ps1     ← SessionStart hook: feeds INDEX.md to Claude
    └── sync.ps1              ← Stop hook: git commit + push (only when git and a remote exist)
```

## Topics

| Folder | Covers |
|---|---|
| `jocate-website` | jocateorg.com static site: pages, design, deploys, Hostinger |
| `jocate-data-agent` | Submissions DB, ETL, /admin, Data Steward agent, weekly jobs |
| `potential-partners` | Prospect research agent, prospects.json, reports, WhatsApp/email digests |
| `claude-setup` | Claude Code settings, hooks, skills, agents, this handoff system |
| `general` | Anything that fits nowhere else |

Make a new topic folder (with a `CURRENT.md`) when a new project or stream of work starts.

## Rules

1. **Every structured output gets a handoff**: code, a page, a deploy, a report, a document, a config change, research. Quick Q&A does not.
2. **Same day, same work → update the existing handoff file** rather than adding a second one.
3. **Update `CURRENT.md`** for the topic when the state of things changed.
4. **Add a line to `INDEX.md`** (top of the topic section) and to `daily/<today>.md`.
5. **No secrets or personal data**: no passwords, API keys, tokens, phone numbers, or customer details. Point to where they live (e.g. "key in `~/jocate-private/config.php`") instead.
6. Dates are absolute (`2026-11-25`), never "yesterday".
