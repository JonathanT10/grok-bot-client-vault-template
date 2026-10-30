# Access list

Date: {{START_DATE}}
Tags: #reference #security #access

**No secret values in this note, ever.** This records *what* the bot can reach, *where* each credential lives, who owns it, and when it was last reviewed. If a value is ever pasted here, remove it, tell {{PRIMARY_CONTACT}} and {{PROVIDER_NAME}}, and rotate it.

Credential locations look like: `{{PASSWORD_MANAGER}} -> item "Accounting read-only"`, `Grok Bot vault -> "Website admin"`, `connector sign-in (held by the connector, not stored on the box)`, `client keeps it; bot has no copy`.

## (a) Connected accounts
| Account / connector | What it unlocks | Signed in as (role) | Credential location | Owner | Scope / limits | Last reviewed |
|---|---|---|---|---|---|---|

## (b) Box logins and local credentials (existence only)
| Item | Present? | Location (path, no contents) | Scope | Needed for | Last reviewed |
|---|---|---|---|---|---|
| Git access to `{{VAULT_REPO}}` | | | this repo only | vault sync | |
| Browser sign-ins on the box | | | | | |

## (c) Sensitive files on the box
| Path | Content type (rough) | Sensitivity | Owner | Still needed? | Action (pending approval) |
|---|---|---|---|---|---|

## (d) Approval rules in force
- Summary of [[Bot configuration]] "Approval rules". Anything that sends, spends, publishes, deletes, changes permissions, or connects or disconnects an account waits for an approver.

## (e) Activity tracking
- What is recorded (log.md, git history, routine run history) and the known gaps.

## (f) Unused access
| Access | Evidence it is unused | Proposed action | Client decision |
|---|---|---|---|

## Review rhythm
- Monthly (with the [[Monthly client report]]): recheck every row at its source, remove unused access with the client's OK, and log the review.

## Decisions waiting on {{PRIMARY_CONTACT}}
- None
