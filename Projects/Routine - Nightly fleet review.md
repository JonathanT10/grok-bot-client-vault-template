# Routine: Nightly fleet review

Date: {{START_DATE}}
Tags: #routine #team
Status: proposed (starter; delete this note if the client runs a single bot)
Owner (bot): {{COORDINATOR_BOT_NAME}}
Approver: {{PRIMARY_CONTACT}}
Handover stage: week 1 (draft only)

## Purpose
Catch the same team mistakes before they repeat for a week, and turn each into a fix {{PRIMARY_CONTACT}} can approve by number. Skill: [[Nightly fleet review]].

## Trigger
- Schedule (time zone) or event: every night at {{FLEET_REVIEW_TIME}} ({{TIMEZONE}}). Cron `30 21 * * *` (set minute and hour to {{FLEET_REVIEW_TIME}}). Timing: flexible, may start up to 30 minutes late, never early (the day's work must be done).
- Skips / quiet days: none; a night with no bot activity writes "No findings" and sends nothing.

## Inputs
- Sources: every rostered bot's chat for the day (read only, with the client's OK); log.md and today's commits; open `{{RULES_ALERT_LABEL}}` issues in `{{VAULT_REPO}}`; the last 7 files in `Reports/Fleet reviews/`.
- Access level needed: read only. Writing the review is done by {{RECORD_KEEPER_BOT_NAME}} unless [[Bot configuration]] lets the Coordinator save its own reports in `Reports/`.

## Prompt intent
```
Run the Nightly fleet review skill for {{CLIENT_NAME}}'s bot team. Read-only: do not message any bot. Pull the vault; read the Team roster in Bot configuration and the last 7 reviews in Reports/Fleet reviews/. Read each bot's chat since the last review's cut-off. Tag repeat mistakes with patterns P1-P8 (stale facts relayed bot to bot, blocked on access, rules read differently, re-asking {{PRIMARY_CONTACT}}, sensitive files copied to shared storage, overlapping lanes, claiming something exists before it does, working around an access refusal), each with bot, time, and evidence; recheck the source before tagging P1 or P7. List open {{RULES_ALERT_LABEL}} issues in {{VAULT_REPO}}. Propose numbered fixes across the review. From the 8th review on, add the week-over-week comparison; before that say "Not enough history yet (review N of 7)". Write the review from the Fleet review template and send it to {{RECORD_KEEPER_BOT_NAME}} to save as Reports/Fleet reviews/YYYY-MM-DD.md; replace the Fleet review section on {{STATUS_PAGE}}. Only if something was found, send {{PRIMARY_CONTACT}} one message under 12 lines that ends "Reply by number". If anything fails, say so in chat in one line.
```

## Steps
1. Pull the vault; read the roster and the last 7 reviews.
2. Read each bot's chat for the day; tag occurrences P1-P8 with evidence.
3. List open rules-change alert issues.
4. Propose numbered fixes; add the week-over-week comparison from review 8 on.
5. Hand the review to {{RECORD_KEEPER_BOT_NAME}} to save; replace the status-page section.
6. Message {{PRIMARY_CONTACT}} only if something was found.
7. On the owner's answer by number: relay approved fixes; {{RECORD_KEEPER_BOT_NAME}} logs the answers.

## Output
- What it produces: a dated review, a status-page section, and (only with findings) one message.
- Where it goes: `Reports/Fleet reviews/YYYY-MM-DD.md`; the `## Fleet review` section on {{STATUS_PAGE}}; chat to {{PRIMARY_CONTACT}}.
- log.md line format: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{RECORD_KEEPER_BOT_NAME}}: fleet review saved (N patterns, M fixes) -> Reports/Fleet reviews/YYYY-MM-DD.md`

## Approval gates
- Actions that wait for an approver (always: send, spend, publish, delete, permissions, connect/disconnect): applying any fix; every fix is approved by number by {{PRIMARY_CONTACT}}. Rules changes also go through the Record Keeper's rules tier.
- What it may do alone at week 3-4 (list exactly): write the review and the status section; send the owner message when something was found. Never apply a fix alone.

## Done when
- Success: review file and status section exist every night; every finding has evidence; the owner hears only when something was found.
- Failure looks like: a missing night, a message on a clean night, a finding without evidence, or a fix applied without a numbered yes.

## Failure handling
- If an input is missing: list it under "Could not check" and continue with the rest.
- If it errors or runs out of usage: report in chat in one line.
- Retry policy: one retry 30 minutes later; then report and skip to the next night.

## Cost and usage
- Expected runs per week: 7
- Expected usage per run: moderate, grows with the number of bots and chat volume (estimate; replace with the measured figure after week 1)

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | | | Reviews written; owner message drafted in chat for the provider to check |
| Week 2 approve each | | | Owner OKs each night's message before it is sent |
| Week 3 routine alone | | | Clean nights silent; messages sent when something is found |
| Week 4 scheduled | | | Weekly summary of fleet reviews in the Coordinator's weekly team review |
