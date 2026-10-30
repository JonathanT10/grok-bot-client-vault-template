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

## Team roster
Fill this when the client runs more than one bot. Roles, profiles, routines, and hand-offs: [[Team/README|Bot team blueprint]] and the notes in Team/Roles/. One owner per area; the Record Keeper owns the vault.
| Bot | Role note | Lane (owns) | Hands off to | Launched | Handover stage | Status |
|---|---|---|---|---|---|---|
| {{RECORD_KEEPER_BOT_NAME}} | [[Record Keeper]] | The vault, daily and weekly review | everyone (confirmations) | | | |
| {{COORDINATOR_BOT_NAME}} | [[Coordinator]] | Routing, team status, waiting-on list | Record Keeper | | | |
| {{BRIEFING_BOT_NAME}} | [[Briefing Bot]] | {{BRIEF_TOPIC}} brief | Record Keeper, Coordinator | | | |
| {{LIAISON_BOT_NAME}} | [[Channel Liaison]] | {{LIAISON_CHANNEL}} on {{CHAT_PLATFORM}} | Record Keeper, Coordinator | | | |
| {{IDEA_BOT_NAME}} | [[Idea Partner]] | Idea list | Coordinator, Record Keeper | | | |
| {{CONTENT_BOT_NAME}} | [[Content Producer]] | Draft {{CONTENT_TYPE}} | Record Keeper, Coordinator, Idea Partner | | | |

Vault change tiers (see [[Record Keeper]] "Approval rules"): records only = ask / no need to ask; structure = ask / no need to ask; rules = pull request reviewed by the approver unless an exception is written below.

Team exceptions agreed in writing (for example, waiving one-bot-at-a-time during setup week, or letting the Record Keeper merge records-only pull requests):
- (exception, approved by, date)

Lessons for every client: [[Lessons learned]].

Pilot: [[Pilot program]] ({{PILOT_START_DATE}} to {{PILOT_END_DATE}}). Tier: {{SERVICE_TIER}}, see [[Service packages]].

## Role contract (bot profile description)
- ROLE:
- INPUTS:
- OUTPUT:
- CONNECTORS:
- NEVER:
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
