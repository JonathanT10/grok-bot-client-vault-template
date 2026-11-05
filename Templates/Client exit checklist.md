# Client exit checklist

Date: {{date:YYYY-MM-DD}}
Tags: #offboarding #template
Client: {{CLIENT_NAME}}
Owner: {{PROVIDER_IMPLEMENTER}} ({{PROVIDER_NAME}})
Approver: {{PRIMARY_CONTACT}}
Notice given: (date) · Agreed end date: (date) · Notice terms: {{CANCELLATION_NOTICE}}

Use when the client stops the service, pauses it, or moves the setup in-house. Goal: the client keeps the complete record, every bot stops cleanly, and the provider ends with only the access the agreement allows (usually none). Check a box only with proof (a link, a screenshot, or a log.md line). Every disconnect, permission change, or deletion needs {{PRIMARY_CONTACT}}'s OK in chat first.

## 1. Agree the exit (provider with approver)
- [ ] End date, and whether this is a stop, a pause, or a handover to the client's own staff, recorded in a decision record
- [ ] Who on the client side takes over the vault and the bot account (if anything keeps running): name recorded in [[People and roles]]
- [ ] What the provider keeps after exit agreed in writing (default: nothing). Was: {{PROVIDER_RETAINED_ACCESS}}
- [ ] Final invoice and any open change requests settled or closed ([[Service scope]])

## 2. Stop the work (bot owner)
- [ ] Every routine paused or deleted in Grok Bot; list each one with its final state in [[Bot configuration]]
- [ ] Open drafts, approval requests, and hand-offs listed in the last Daily note, each marked "dropped" or "handed to (name)"
- [ ] Last [[Weekly status digest]] or a final summary sent to {{PRIMARY_CONTACT}} by client staff
- [ ] Outside contacts who were told they were dealing with an AI assistant ([[AI disclosure wording]]) told who to contact now, if anything changes for them

## 3. Hand over the record (provider)
- [ ] Vault pulled, last commit pushed to `{{VAULT_REPO}}`; `git status` clean
- [ ] Repo ownership confirmed on the client's account or org (not the provider's)
- [ ] Export given to the client: a zip of the repo at the final commit, plus any Reports/ PDFs; delivery recorded in log.md
- [ ] [[Vault backup and recovery]] updated with the client-only backup owner
- [ ] `./scripts/check-no-client-data.sh` run on any provider-side template change made during the engagement, so none of this client's data went into the template

## 4. Remove access (client IT with provider)
For each row in [[Access list]] and [[Systems and connectors]]:
- [ ] Connectors disconnected, or ownership moved to the client's own account
- [ ] Bot's git credential (token or deploy key) revoked
- [ ] Provider removed as a collaborator on `{{VAULT_REPO}}` (or reduced to the agreed level)
- [ ] Shared items in {{PASSWORD_MANAGER}}: provider removed; client rotated any password the provider ever saw
- [ ] Bot email address and chat app access closed, or moved to the client
- [ ] Grok Bot account and plan: cancelled or billing moved; billing owner recorded
- [ ] Access list updated so every row shows the final state and the date

## 5. Provider-side cleanup (provider)
- [ ] Local clones, downloads, screenshots, and notes about this client deleted from provider machines, except what the agreement says to keep
- [ ] This client added to the provider's local denylist (`scripts/denylist.txt`, never committed) so their names never enter another vault
- [ ] Lessons that apply to every client written back to the template as generic text only

## 6. Close
- [ ] Exit summary sent to {{PRIMARY_CONTACT}} by the provider: what was handed over, what was removed, what (if anything) the provider still holds
- [ ] Decision record and log.md line: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{PROVIDER_NAME}}: client exit complete`
