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
| Connector | Status (connected / not signed in) | Signed in as (role, not password) | Write abilities it has | Write abilities the bot may use | Date checked |
|---|---|---|---|---|---|

## Not connected on purpose
- (systems the client chose to keep away from the bot, and why)

## Change history
Connector added or removed: one line here and one in [[log]], with who approved it.
