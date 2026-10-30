# Bot configuration

Date: {{START_DATE}}
Tags: #reference #bot #config
The record of how {{BOT_NAME}} is set up. If the live setup and this note disagree, the live setup wins: fix this note, then log the change. Changes here use commit prefix `config:`.

## Identity
- Name: {{BOT_NAME}}
- Works for: {{CLIENT_NAME}}
- Primary approver: {{PRIMARY_CONTACT}}; backup: {{BACKUP_CONTACT}}
- Time zone: {{TIMEZONE}}
- Own email address: (on / off; address if on)
- Approval channel: (the bot's chat, or a named channel)

## Role contract (bot profile description)
- ROLE:
- INPUTS:
- OUTPUT:
- WHEN TO ASK:

## Persona and tone
- Voice: (for example, friendly and direct; plain words; short sentences)
- Formality with customers / with staff:
- Words or phrases to use:
- Words or phrases to avoid:
- Sign-off:
- Discloses it is an assistant to outside people: yes / no / only if asked

## Approval rules
Always needs an approver, at every handover stage:
- Sending any message or email outside the bot's own chat
- Spending money or committing to a purchase
- Publishing or posting anywhere
- Deleting or overwriting files, emails, or records
- Changing permissions or sharing
- Connecting or disconnecting an account or connector

Client-specific additions:
- Never:
- Allowed without asking after week 4 (list exactly):
- Spending limit: none unless written here
- Approval request format: ACTION, TARGET, REASON, COST, CONSEQUENCES

## Auto-review and safety settings
- Auto-review / safety check: (setting and date)
- Sensitive sites kept out of the box browser:
- Anything blocked on purpose:

## Routines
One row per routine; full spec in Projects/ from [[Routine spec template]].
| Routine | Schedule ({{TIMEZONE}}) | Skill used | Output goes to | Handover stage | Started | Owner | Status |
|---|---|---|---|---|---|---|---|

## Skills
| Skill | Note | Tested on (2 dates) | Enabled | Notes |
|---|---|---|---|---|
| Daily and weekly review | [[Daily and weekly review]] | | | |
| Inbox triage | [[Inbox triage]] | | | |
| Research brief | [[Research brief]] | | | |
| Idea triage | [[Idea triage]] | | | |
| Decision board | [[Decision board]] | | | |
| Meeting prep and follow-up | [[Meeting prep and follow-up]] | | | |
| Monthly client report | [[Monthly client report]] | | | |

## Memory
- The vault is the durable record. Built-in bot memory may hold preferences, but anything that matters is also written here.
- Memory items the client asked to be kept or forgotten:

## Change history
| Date | Change | Approved by | Log line |
|---|---|---|---|
