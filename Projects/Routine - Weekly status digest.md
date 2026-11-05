# Routine: Weekly status digest

Date: {{START_DATE}}
Tags: #routine #reporting
Status: proposed (starter)
Owner (bot): {{RECORD_KEEPER_BOT_NAME}}
Approver: {{PRIMARY_CONTACT}}
Handover stage: week 1 (draft only)

## Purpose
Give {{PRIMARY_CONTACT}} one five-minute read each week of what was done, what is open, and what is waiting on them. Skill: [[Weekly status digest]].

## Trigger
- Schedule (time zone) or event: every {{REVIEW_DAY}} at {{STATUS_DIGEST_TIME}} ({{TIMEZONE}}). Cron `0 15 * * 5` is an example only (15:00 on Friday); set minute, hour, and day of week to {{STATUS_DIGEST_TIME}} and {{REVIEW_DAY}}. Timing: may start up to 60 minutes late.
- Skips / quiet days: business holidays (list in [[Business profile]]); a week with no activity sends "Quiet week: nothing new, nothing waiting on you."

## Inputs
- Sources: log.md, Daily/, Decisions/, Projects/, [[Bot configuration]], incident notes, Reports/Time savings log.csv (read only).
- Access level needed: read the vault; write only `Reports/Weekly status/` and log.md.

## Prompt intent
```
Run the Weekly status digest skill for {{CLIENT_NAME}}. Pull the vault. Use the last digest's log.md line as the cut-off. Build the digest in the skill's output shape, under 25 lines, "Waiting on you" first, every item linked to its vault note, estimates labeled. List anything you could not check. Save to Reports/Weekly status/YYYY-MM-DD.md, add a log.md line, commit and push. Send the digest to {{PRIMARY_CONTACT}} in chat only. Do not send it to anyone else. If anything fails, say so in chat in one line.
```

## Steps
1. Pull the vault; find the cut-off.
2. Gather inputs and write the digest.
3. Save, log, commit.
4. Send to {{PRIMARY_CONTACT}} (week 1: post as a draft for {{PROVIDER_IMPLEMENTER}} to check first).

## Output
- What it produces: one dated digest and one chat message.
- Where it goes: `Reports/Weekly status/YYYY-MM-DD.md`; chat to {{PRIMARY_CONTACT}}.
- log.md line format: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{RECORD_KEEPER_BOT_NAME}}: weekly status digest saved -> Reports/Weekly status/YYYY-MM-DD.md`

## Approval gates
- Actions that wait for an approver (always: send, spend, publish, delete, permissions, connect/disconnect): forwarding the digest to anyone besides {{PRIMARY_CONTACT}}.
- What it may do alone at week 3-4 (list exactly): write, save, and send the digest to {{PRIMARY_CONTACT}}.

## Done when
- Success: a digest every {{REVIEW_DAY}}, every line linked, nothing invented.
- Failure looks like: a missed week, an unlinked claim, or a digest sent to the wrong person.

## Failure handling
- If an input is missing: list it under "Could not check" and continue.
- If it errors or runs out of usage: report in chat in one line.
- Retry policy: one retry 60 minutes later; then report and skip to next week.

## Cost and usage
- Expected runs per week: 1
- Expected usage per run: low (estimate; replace with the measured figure after week 1)

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | | | Provider checks the digest before the owner sees it |
| Week 2 approve each | | | Owner OKs each digest's format |
| Week 3 routine alone | | | Sent on schedule |
| Week 4 scheduled | | | Reviewed in the 30-day review |
