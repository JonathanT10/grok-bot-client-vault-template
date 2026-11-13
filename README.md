# Grok Bot client vault template

A starting point for the **client vault**: the git-backed Obsidian vault that holds the durable record of one small-business customer's Grok Bot setup. Each new client gets their own copy. The bot's built-in memory is a convenience; this vault is the source of truth for who the client is, what is connected, what the bot is allowed to do, what was decided, and what changed.

This copy is generic. It contains no real client data. Everything client-specific is a `{{PLACEHOLDER}}`.

## Spin up a new client

1. **Copy the template** (do not fork it, so the client repo has its own clean history):
   ```bash
   cp -r grok-bot-client-vault-template "{{CLIENT_SHORT}}-grok-vault"
   cd "{{CLIENT_SHORT}}-grok-vault"
   rm -rf .git && git init -b main
   rm -rf Business Sales     # provider-only material; never ship it to a client
   # then delete the "Sales" and "Business" sections and folder lines from index.md
   ```
2. **Fill the placeholders.** Copy `client.env.example` to `client.env` (git-ignored), fill in the values, then run:
   ```bash
   ./scripts/fill-placeholders.sh client.env      # replaces {{UPPER_CASE}} tokens
   ./scripts/fill-placeholders.sh --check          # lists any placeholders still left
   ./scripts/check-no-client-data.sh --history     # no other client's data, no secrets (see below)
   ```
   Lower-case tokens such as `{{date:YYYY-MM-DD}}` and `{{title}}` are Obsidian template variables. The script leaves them alone on purpose.
3. **Run discovery** with the client using `Onboarding/Discovery questionnaire.md`. Copy the answers into the Reference/ notes it points to.
4. **Work the onboarding checklist** in `Onboarding/Onboarding checklist.md`, top to bottom.
5. **Create the private repo** (`{{VAULT_REPO}}`), add it as the remote, commit, and push. Give the client's bot write access to that repo only.
6. **Point the bot at the vault.** In the bot's instructions, tell it to read `GROK.md` first, every session.
7. **Plan the team.** If the client will run more than one bot, pick roles from `Team/README.md`, launch them one at a time, and record the lanes in `Reference/Bot configuration.md` ("Team roster"). For a trial first, use `Team/Pilot program.md`.
8. **Go live** only when every box in `Onboarding/Go-live acceptance checklist.md` is checked and signed off.

## Folder map

| Path | What goes there |
|---|---|
| `GROK.md` | Operating rules the client's bot follows in this vault. Read first, every time. |
| `index.md` | Map of the vault: folders, key notes, active projects. |
| `log.md` | One line per meaningful change, newest at the bottom, prefixed with who made it. |
| `Onboarding/` | Discovery questionnaire, onboarding checklist (with launch day), go-live acceptance checklist, staff acceptable use guide. `Onboarding/Department pilot kit/`: a two-week, read-only, draft-only pilot for one department: intake questionnaire, ranked opportunities (scoring rubric and ACTION / TARGET / REASON / COST / CONSEQUENCES asks), three starter routine specs (daily FYI digest, status tracker follow-ups, weekly notice digest), and a measurement sheet (`.md` plus `.csv`) with go / no-go thresholds as `{{DEPT_GO_*}}` placeholders. A filled fictional example is in `Business/Demo vault/Department pilot - Accounts payable/`. |
| `Reference/` | Durable facts: business profile, people and roles, systems and connectors, access list (where credentials live, never values), bot configuration, AI disclosure wording, optional personal device rules, guardrails policy (client-signed, with optional HIPAA / PCI / legal add-ons), data inventory, data handling notice (client-facing one-pager), incident notification decision aid (checklist, not legal advice), AD shutdown to Entra and Intune runbook (staged retirement plan; drafts and checks only), service scope, glossary, bot playbook, decision patterns. |
| `Skills/` | Repeatable workflows the bot runs, one note each (including the [[Weekly status digest]] for the owner and [[Incident response]] for Guardrails §11). |
| `Team/` | Bot team blueprint: starter team and hand-off pattern (`Team/README.md`), one note per role in `Team/Roles/`, the 30-day [[Pilot program]], and draft [[Service packages]]. |
| `Sales/` | Provider sales materials: `Pitch one-pager.md` and `Pricing sheet.md`. Prices are `{{PRICE_*}}` placeholders matching `Team/Service packages.md`; the provider fills them, never guesses. Fill with the provider section of `client.env.example` and print to PDF for prospects. Provider-only: delete `Sales/` from every client copy (see step 1). |
| `Business/` | Provider-internal plans: `Business plan.md`, `First week plan.md`, `Customer acquisition plan.md`. Demo kit: `Demo script.md` (timed demo, about 10 minutes, with the pilot ask and likely questions) and `Demo vault/`, a filled example vault for the **fictional** Example Landscaping LLC (example data only, every file labelled; its `client.env` is the one env file committed on purpose; see `Business/Demo vault/README.md` to copy it out). The demo vault has no `{{UPPER_CASE}}` placeholders, so `--check` is unaffected. All numbers are `{{PRICE_*}}`, `{{CAPACITY_*}}`, `{{HOURS_*}}`, `{{COST_*}}`, or `{{TARGET_*}}` placeholders the provider sets. Lower-case fields such as `{{prospect_first_name}}` in the outreach templates are filled by hand per message and are left alone by the script. **Delete `Business/` (and `Sales/`) from every client copy.** |
| `Templates/` | Note templates (daily note, decision, routine spec, skill spec, meeting, incident, change request, monthly report, 30-day review, fleet review, client exit checklist, staff quick reference card, vault backup and recovery) and `Time savings log.csv` (header row only). |
| `Inbox/` | Raw ideas, requests, and dumps waiting to be sorted. Each has a Status line. |
| `Daily/` | One note per day (`YYYY-MM-DD.md`). |
| `Decisions/` | Dated decision records (`YYYY-MM-DD-short-title.md`). |
| `People/` | One note per person, only when context is useful and the client agreed. |
| `Projects/` | One note per active project or automation. `Projects/Incidents/YYYY-MM-DD-short-title.md` holds incident notes from [[Incident response]]. |
| `Reports/` | Monthly client reports and other periodic outputs. `Reports/Fleet reviews/YYYY-MM-DD.md` holds the Coordinator's [[Nightly fleet review]]; `Reports/Time savings log.csv` is the one time-saved log (single writer {{REPORTS_BOT_NAME}}; rules in `Reference/Time savings log.md`), backed up to `Reports/Time savings backups/` before every write. |
| `scripts/` | Setup helpers: `fill-placeholders.sh` (placeholder fill and check) and `check-no-client-data.sh` (client-data and secrets scan, with `denylist.example.txt` showing the denylist format), and `time-savings-summary.sh` (totals net minutes from the time-savings log, excluding rows without evidence, overlaps, and duplicates; estimates shown separately). Not used by the bot day to day. |
| `.obsidian/` | Minimal Obsidian config: daily notes in `Daily/`, templates from `Templates/`. No community plugins are bundled; add a git sync plugin per device if the client wants one. |

## Rules that never change between clients

- **No secrets in the vault.** Ever. The access list records *where* a credential lives (for example, "{{PASSWORD_MANAGER}} item: `Bookkeeping admin`"), never the value.
- **Client data stays in the client's vault.** Never copy one client's notes, names, or numbers into another client's vault or back into this template.
- **The client approves anything that sends, spends, publishes, deletes, changes permissions, or connects or disconnects an account.**
- **Check vendor features, permissions, and pricing against current docs at setup.** Don't copy assumptions from an older client vault.
- Improvements that apply to every client go back into this template as generic text, with no client details.

## Check for client data before every commit and push

This template must stay generic. Before **every commit and push** to the template, and every time you **build a client copy**, run:

```bash
./scripts/check-no-client-data.sh              # working tree
./scripts/check-no-client-data.sh --history    # also every commit's content and every commit message
./scripts/check-no-client-data.sh --include-pdf ../exported-pdfs   # also the text of PDFs you hand out
```

- It reads a **denylist** of real names (clients, prospects, people, places, vendors) from `scripts/denylist.txt`, or `--denylist PATH`, or `DENYLIST_FILE`. That file holds real names, so the provider keeps it **locally only**; it is git-ignored and must never be committed. Start one from `scripts/denylist.example.txt`, which documents the format (whole word by default, `substr:` for substrings, `re:` for an extended regex; all case-insensitive).
- Built-in pattern checks (turn off with `--no-patterns`) flag email addresses outside example.com / example.org / example.net, phone numbers outside the fictional 555-0100 to 555-0199 range, IPv4 addresses outside the documentation ranges and 127.0.0.1 / 0.0.0.0, and strings that look like API keys, tokens, or private keys.
- Exit code 0 means clean, 1 means findings (each printed as `file:line: [kind] detail`), 2 means a usage error. Fix every finding before committing. A finding in `--history` means the data is already in a commit: stop and treat removing it as a provider task; do not push.
- In a client copy, put the *other* clients' names in the denylist so nothing crosses between vaults.
