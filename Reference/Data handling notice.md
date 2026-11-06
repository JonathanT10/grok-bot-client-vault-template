# Data handling notice

Date: {{START_DATE}}
Tags: #reference #privacy #client-facing
Audience: {{PRIMARY_CONTACT}} (client owner / primary contact)
Owner: {{COMPLIANCE_OWNER}}
Status: draft until walked through with the client

Plain one-pager for {{CLIENT_NAME}} on what the Grok Bot platform and its connectors can see, where data is stored, how long it is kept, and who to ask. It is **not** a contract, DPA, BAA, or legal advice. For binding rules see the signed agreement and [[Guardrails policy]].

## What this notice is

- A short, non-legal overview for the person who owns the bot relationship.
- Filled during setup from [[Systems and connectors]], [[Access list]], [[Data inventory]], and current vendor documentation (checked at setup — see below).
- Updated when connectors, scopes, or retention choices change.

## Where your data lives

| Place | What is there | Who controls it |
|---|---|---|
| Client systems (email, chat, files, CRM, and so on) | The business's own records | {{CLIENT_NAME}} |
| Private vault repo `{{VAULT_REPO}}` | Durable notes, decisions, configuration, and logs the bot writes | {{CLIENT_NAME}} (provider access: {{PROVIDER_RETAINED_ACCESS}}) |
| The bot's computer / box | Working files, local clones, and any browser or connector sessions signed in for the bot | Client / provider per the agreement; clear on request at exit |
| Connected apps (via connectors) | Whatever those apps already hold; the bot sees only what the signed-in account and scopes allow | The app vendor + {{CLIENT_NAME}}'s account owners |

Chat with the bot is not the vault. Anything that must last is written into `{{VAULT_REPO}}` or left in the system that already holds it.

## What the bot can see

- Only the connectors and scopes listed in [[Systems and connectors]] and [[Access list]].
- Prefer each person's own sign-in so the bot never sees more than the person asking.
- Access starts at **read** and widens only for a named use case with approval ([[Guardrails policy]] section 7).
- Categories the business handles, and whether the bot may touch them, are in [[Data inventory]].

If a system is not on those lists, the bot should not reach it.

## What it must not store

- Passwords, API keys, tokens, one-time or recovery codes, private keys, full card numbers, and similar secrets.
- Those live in {{PASSWORD_MANAGER}} (or the connector's own sign-in), never in chat, memory, skills, or the vault. Full rules: [[Guardrails policy]] sections 5 and 6.

## Retention

Fill with the client's policy and confirm against current vendor docs at setup. Do not invent vendor numbers here.

| Kind of data | Kept where | Client policy (fill in) | Notes |
|---|---|---|---|
| Chat history with the bot | Platform / provider product | | Confirm current vendor retention/training terms in writing (checkbox below) |
| Bot memory (if used) | Platform | | Personal data is not saved to memory ([[Guardrails policy]] §5) |
| Generated files on the box | Bot computer / box | | Clear on request; list sensitive paths in [[Access list]] |
| Vault notes and git history | `{{VAULT_REPO}}` | | Client-owned; history lasts until the client changes it |
| Data in connected apps | Those apps | | Follow each app's own retention |

Questions on retention or deletion: {{PRIVACY_CONTACT}}.

## Who can read the vault

- {{CLIENT_NAME}} people the client invites to `{{VAULT_REPO}}`
- {{PROVIDER_NAME}} under {{PROVIDER_RETAINED_ACCESS}}
- The bot (write limited to this repo, as recorded in [[Access list]])

No one else. At end of service, follow [[Client exit checklist]]: provider and bot access removed; box files cleared on request; the repo stays with the client.

## Vendor docs check at setup

Platform and connector retention, training, and subprocessors change. Do not rely on this notice's blanks or on memory.

- [ ] Provider confirmed current retention / training / subprocessor terms **in writing** against the vendor's docs at setup
  - Date checked:
  - Link or doc title (no secrets):
  - Checked by: {{PROVIDER_NAME}} / {{COMPLIANCE_OWNER}}

Re-check when a major connector is added or the platform announces a policy change.

## Who to ask

| Topic | Contact |
|---|---|
| Privacy requests (access, deletion) | {{PRIVACY_CONTACT}} |
| Compliance / regulated data | {{COMPLIANCE_OWNER}} |
| Day-to-day bot ownership | {{BOT_OWNER}} |
| Setup, connectors, platform questions | {{PROVIDER_CONTACT}} ({{PROVIDER_NAME}}) |

## Related notes

- [[Guardrails policy]] §5 (data handling and privacy) and §6 (credentials)
- [[Data inventory]]
- [[Access list]]
- [[Systems and connectors]]
- [[Client exit checklist]]
- [[Service scope]]

*This notice is informational only and is not legal advice. It does not replace a DPA, BAA, or the signed service agreement.*
