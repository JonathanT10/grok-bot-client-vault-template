> **FICTIONAL EXAMPLE DATA.** Example Landscaping LLC is a made-up business for demos. Every name, email, phone number, date, and number in this file is example data. Do not add real client, prospect, or personal data.

# Demo vault: Example Landscaping LLC (fictional)

Provider-internal demo kit. It lives under `Business/`, so it is **deleted from every client copy** along with the rest of `Business/` and `Sales/`.

A small, filled-in example of what a populated client vault looks like after a 30-day pilot, for a **fictional** landscaping business. Use it with [[Demo script]] (`Business/Demo script.md`) so prospects see real-looking notes without anyone's real data.

## What is in it
| File | Shows | Demo step |
|---|---|---|
| `client.env` | The template's client values filled for the fictional business | (setup) |
| `index.md`, `log.md` | Map of the demo vault; one line per change, with who made it | 2 |
| `Reference/Business profile.md` | A filled business profile with dated, sourced facts and before / after numbers | 2 |
| `Reference/People and roles.md` | Fictional people, roles, and approval limits | 2, 3 |
| `Reference/Access list.md` | Where each credential lives and who owns it, never the value | 2 |
| `Daily/2026-03-04.md` | A day's log, decisions, an approval request, open items, and review | 2, 3, 5 |
| `Decisions/2026-03-02-crew-schedule-draft-every-friday.md` | A decision record: context, options, decision, why, follow-up | 2 |
| `Projects/Routine - Friday crew schedule draft.md` | A routine spec at handover week 2 | 3 |
| `Reports/Briefs/2026-03-02 Weekly brief.md` | A sourced brief with confirmed / reported labels | 4 |
| `Reports/2026-02 Monthly report.md` | A monthly report with sources and measured time saved | Questions |
| `Department pilot - Accounts payable/` | A filled two-week department pilot for the fictional AP team, from the blank kit in `Onboarding/Department pilot kit/` | Questions, follow-up demo |

## Copy it out for a demo
The notes link to each other by short name (for example the business profile note), so open the demo vault as **its own vault**, not inside the template, where the template's notes of the same name would clash.

Option A, quick (demo notes only):
```bash
cp -r "Business/Demo vault" ~/demo-example-landscaping
cd ~/demo-example-landscaping
git init -b main && git add -A && git commit -m "vault: fictional demo vault"
# Open the folder in Obsidian as a vault. Push only to the provider's private demo repo.
```

Option B, full vault (every template note, filled for the fictional business):
```bash
cp -r grok-bot-client-vault-template ~/demo-example-landscaping && cd ~/demo-example-landscaping
rm -rf .git && git init -b main
cp "Business/Demo vault/client.env" client.env
rm -rf Business Sales                      # as for any client copy (delete those index.md lines too)
./scripts/fill-placeholders.sh client.env  # fills the template notes with the fictional values
./scripts/fill-placeholders.sh --check     # anything still left is a provider value or filled by hand
# then copy the demo notes from the template's Business/Demo vault/ over the top
```

## Rules for the demo vault
- **Fictional only.** Names use obvious placeholders (Alex Sample, Jordan Example), emails use example.com, phone numbers use the reserved 555-0100 to 555-0199 range, and links point at example.com or example.org. Keep it that way when you add notes.
- **Every file starts with the fictional-data label.** Add it to any new demo note.
- **Every number is example data**, including hours, counts, and time saved. Never present them as a real result.
- Run `./scripts/check-no-client-data.sh` (with the provider's local denylist) before committing any change here.
- `client.env` is normally git-ignored; this one file is committed on purpose because it is fictional. The `.gitignore` exception names it exactly. Never put a real value in it.
- The demo vault has **no unfilled template placeholders**, so `./scripts/fill-placeholders.sh --check` on the template reports exactly what it did before this kit was added.
