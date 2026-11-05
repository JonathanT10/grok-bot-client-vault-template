# Vault backup and recovery

Date: {{START_DATE}}
Tags: #reference #operations
Owner: {{IT_ADMIN}}
Backup owner on the client side: {{BOT_OWNER}}
Last restore test: (date, by whom, result)

How the {{CLIENT_NAME}} vault (`{{VAULT_REPO}}`) is backed up, how to restore it, and how often that is tested. Save a filled copy as `Reference/Vault backup and recovery.md`. No credentials here: name where they live ([[Access list]]).

## 1. What is backed up
| Copy | Where | Who can reach it | How often | Kept for |
|---|---|---|---|---|
| Primary | `{{VAULT_REPO}}` (private repo, client-owned) | client admins; bot (write); provider ({{PROVIDER_RETAINED_ACCESS}}) | every commit | forever (git history) |
| Second copy | (client-owned mirror, cloud drive, or offline drive) | {{IT_ADMIN}} | (weekly recommended) | (e.g. 12 weeks) |
| Device copies | staff laptops with the vault cloned | each user | on pull | until device is retired |

Not in git, and so not backed up here: the bot's built-in memory, chat history, connector settings, and routine definitions in Grok Bot. [[Bot configuration]] is the written copy of the routines and settings; keep it current so they can be rebuilt.

## 2. Weekly backup steps ({{IT_ADMIN}})
1. `git clone --mirror` the repo (or `git remote update` an existing mirror) to the second-copy location.
2. Check the newest commit date matches the repo.
3. Add a log.md line: `- YYYY-MM-DD ({{TIMEZONE}}) {{IT_ADMIN}}: vault backup ok (commit abc1234)`.

## 3. Restore (when the repo is lost, corrupted, or a bad change was pushed)
Any restore is a rules-level change: tell {{PRIMARY_CONTACT}} first, and pause every routine that writes to the vault.
- **A bad note or bad commit:** `git revert <commit>` and push. Never force-push or rewrite history without {{PRIMARY_CONTACT}}'s OK.
- **A deleted file:** `git log --diff-filter=D -- "<path>"`, then `git checkout <commit>^ -- "<path>"`, commit, push.
- **Repo gone or unreadable:** create a new private repo owned by the client, push the newest mirror to it, update `{{VAULT_REPO}}` in [[Access list]] and [[Bot configuration]], re-issue the bot's repo credential (scoped to the one repo), then resume routines one at a time.
- **Bot settings lost:** rebuild from [[Bot configuration]] and the Projects/ routine specs, in draft mode first.

After any restore: record it with [[Incident note template]], run `./scripts/check-no-client-data.sh`, and confirm the newest Daily note and log.md are present.

## 4. Restore test (every 90 days, and in the first 30 days)
- [ ] Clone the second copy to a scratch folder; open it in Obsidian; spot-check five notes and the newest log.md line
- [ ] Time it; note anything missing
- [ ] Record date and result at the top of this note
