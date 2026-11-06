# Service scope

Date: {{START_DATE}}
Tags: #reference #service
Working notes on what the service covers. The signed agreement is the binding document; this note links to where it is kept and summarizes it for the bot. No pricing or payment details beyond what the client is comfortable having the bot read.

## Parties
- Client: {{CLIENT_NAME}}, contact {{PRIMARY_CONTACT}}
- Provider: {{PROVIDER_NAME}}, contact {{PROVIDER_CONTACT}}
- Service tier: {{SERVICE_TIER}}
- Start date: {{START_DATE}}; go-live target: {{GO_LIVE_DATE}}
- Signed agreement kept at: (location, not a copy)
- Provider implementer: {{PROVIDER_IMPLEMENTER}}; access kept after handoff: {{PROVIDER_RETAINED_ACCESS}}
- 30-day review date: (from [[30-day review template]])

## In scope
- Setup: vault, bot configuration, connectors listed in [[Systems and connectors]]
- Skills and routines listed in [[Bot configuration]]
- Training: walkthrough for approvers
- Support: (channel, hours, response time)
- Monthly report and access review
- Changes: (how many change requests per month are included)

## Out of scope
- (for example: running the client's IT, holding the client's passwords, legal or tax advice, actions the approval rules forbid)

## Responsibilities
| Item | Client | Provider |
|---|---|---|
| Grok Bot account and plan billing | | |
| Signing in to connectors | x | |
| Approving actions | x | |
| Vault structure and rules | | x |
| Keeping business facts current | x | |
| Monthly report | | x |

## Data handling
- Client-facing one-pager: [[Data handling notice]] (what the platform can see, where data lives, retention, who to ask).
- Where data lives: client's own systems, the bot's box, and the private repo `{{VAULT_REPO}}`.
- Who can read the vault: client, provider, bot.
- At end of service: (repo ownership stays with the client; provider access and bot access removed; box files cleared on request)

## Review
- Check-in rhythm:
- Success measures (from discovery):
