# Systems and connectors

Date: {{START_DATE}}
Tags: #reference #systems
Every tool the business uses, and how (or whether) {{BOT_NAME}} reaches it. Credentials: see [[Access list]] (locations only).

Access levels: **none** (bot never touches it), **read**, **draft** (bot prepares, a person acts), **act** (bot may act within the approval rules).

## Systems
| System | Used for | Account owner | Users | Bot reaches it via | Bot access level | Notes |
|---|---|---|---|---|---|---|
| Email | | | | connector / none | | |
| Calendar | | | | | | |
| File storage | | | | | | |
| Chat | | | | | | |
| Accounting | | | | | | |
| CRM / booking | | | | | | |
| Website / listings | | | | | | |
| Social media | | | | | | |
| Phone / texting | | | | | | |
| Vault repo `{{VAULT_REPO}}` | durable record | client | provider, bot | git | act (commit/push) | |

## Connectors installed in Grok Bot
Check status at the source (the bot's connector list) before relying on this table; date every change.
Start at **read**; widen only for a named use case with approval ([[Guardrails policy]] section 7). Limit scope to specific mailboxes, folders, sites, channels, or projects. Prefer each user's own sign-in so the bot never sees more than the person asking. Check each connector's permissions and data handling in the vendor's current docs at setup.
| Connector | Needed for (use case) | Status (connected / not signed in) | Signed in as (role, not password; own account or service account) | Scope limits | Write abilities it has | Write abilities the bot may use | MFA on account? | Approved by | Date enabled / checked |
|---|---|---|---|---|---|---|---|---|---|

## Identity and access
- Identity provider / single sign-on:
- MFA enforced for all staff:
- Who approves new app access: {{IT_ADMIN}}

## Not connected on purpose
- (systems the client chose to keep away from the bot, and why)

## Change history
Connector added or removed: one line here and one in [[log]], with who approved it.
