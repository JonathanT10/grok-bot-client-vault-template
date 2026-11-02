# Grok Bot client vault template

A starting point for the **client vault**: the git-backed Obsidian vault that holds the durable record of one small-business customer's Grok Bot setup. Each new client gets their own copy. The bot's built-in memory is a convenience; this vault is the source of truth for who the client is, what is connected, what the bot is allowed to do, what was decided, and what changed.

This copy is generic. It contains no real client data. Everything client-specific is a `{{PLACEHOLDER}}`.

## Spin up a new client

1. **Copy the template** (do not fork it, so the client repo has its own clean history):
   ```bash
   cp -r grok-bot-client-vault-template "{{CLIENT_SHORT}}-grok-vault"
   cd "{{CLIENT_SHORT}}-grok-vault"
   rm -rf .git && git init -b main
   ```
2. **Fill the placeholders.** Copy `client.env.example` to `client.env` (git-ignored), fill in the values, then run:
   ```bash
   ./scripts/fill-placeholders.sh client.env      # replaces {{UPPER_CASE}} tokens
   ./scripts/fill-placeholders.sh --check          # lists any placeholders still left
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
| `Onboarding/` | Discovery questionnaire, onboarding checklist, go-live acceptance checklist. |
| `Reference/` | Durable facts: business profile, people and roles, systems and connectors, access list (where credentials live, never values), bot configuration, service scope, glossary, bot playbook, decision patterns. |
| `Skills/` | Repeatable workflows the bot runs, one note each. |
| `Team/` | Bot team blueprint: starter team and hand-off pattern (`Team/README.md`), one note per role in `Team/Roles/`, the 30-day [[Pilot program]], and draft [[Service packages]]. |
| `Sales/` | Provider sales materials: `Pitch one-pager.md` and `Pricing sheet.md`. Prices are `{{PRICE_*}}` placeholders matching `Team/Service packages.md`; the provider fills them, never guesses. Fill with the provider section of `client.env.example` and print to PDF for prospects. Delete `Sales/` from a client's copy if the client should not see it. |
| `Templates/` | Note templates (daily note, decision, routine spec, skill spec, meeting, incident, change request, monthly report). |
| `Inbox/` | Raw ideas, requests, and dumps waiting to be sorted. Each has a Status line. |
| `Daily/` | One note per day (`YYYY-MM-DD.md`). |
| `Decisions/` | Dated decision records (`YYYY-MM-DD-short-title.md`). |
| `People/` | One note per person, only when context is useful and the client agreed. |
| `Projects/` | One note per active project or automation. |
| `Reports/` | Monthly client reports and other periodic outputs. |
| `scripts/` | Setup helpers (placeholder fill and check). Not used by the bot day to day. |
| `.obsidian/` | Minimal Obsidian config: daily notes in `Daily/`, templates from `Templates/`. No community plugins are bundled; add a git sync plugin per device if the client wants one. |

## Rules that never change between clients

- **No secrets in the vault.** Ever. The access list records *where* a credential lives (for example, "{{PASSWORD_MANAGER}} item: `Bookkeeping admin`"), never the value.
- **Client data stays in the client's vault.** Never copy one client's notes, names, or numbers into another client's vault or back into this template.
- **The client approves anything that sends, spends, publishes, deletes, changes permissions, or connects or disconnects an account.**
- Improvements that apply to every client go back into this template as generic text, with no client details.
