> **FICTIONAL EXAMPLE DATA.** Example Landscaping LLC is a made-up business for demos. Every name, email, phone number, date, and number in this file is example data. Do not add real client, prospect, or personal data.

# Routine: Friday crew schedule draft

Date: 2026-02-16
Tags: #routine
Status: active
Owner (bot): Record Keeper
Approver: Jordan Example (Alex Sample when Jordan is out)
Handover stage: week 2 (approver OKs each action)

## Purpose
Save the office manager about 2 hours every Friday (example) by drafting next week's crew schedule from the scheduling spreadsheet.

## Trigger
- Schedule (time zone) or event: Fridays 11:00 America/New_York (cron `0 11 * * 5`)
- Skips / quiet days: national holidays; December 20 to January 5

## Inputs
- Sources: scheduling spreadsheet (tab "Jobs"), crew calendar (read only), skip-a-week emails in the shared mailbox
- Access level needed: read; write to the "Draft" tab only

## Steps
1. Pull the vault; read this note and the latest decision on the crew schedule.
2. Read next week's jobs and skip requests; build routes per crew lead.
3. Write the schedule to the "Draft" tab; list any conflicts at the top.
4. Ask Jordan for approval to send, in ACTION / TARGET / REASON / COST / CONSEQUENCES format.
5. After approval, send from the shared mailbox; log the send in the Daily note and log.md.

## Output
- What it produces: next week's crew schedule and a conflicts list
- Where it goes: scheduling spreadsheet "Draft" tab; approval request in chat; email to crew leads after approval
- log.md line format: `- YYYY-MM-DD HH:MM (America/New_York) Record Keeper: crew schedule drafted / sent -> Daily/YYYY-MM-DD.md`

## Approval gates
- Waits for an approver: the email send, every week.
- What it may do alone at week 3-4: nothing beyond drafting (decision of 2026-03-02).

## Done when
- Success: draft ready by noon Friday with conflicts flagged; sent by 3 PM after approval.
- Failure looks like: draft missing at noon, a skip request missed, or a send without approval.

## Failure handling
- If an input is missing: draft what is possible, list the gap first, and tell Jordan in chat.
- If it errors or runs out of usage: report in chat in one line.
- Retry policy: one retry at 11:30; then report.

## Cost and usage
- Expected runs per week: 1
- Expected usage per run: low (estimate)

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | 2026-02-16 | Jordan Example | 2 drafts, 2 lines changed |
| Week 2 approve each | 2026-03-02 | Alex Sample | Per decision 2026-03-02 |
| Week 3 routine alone | not planned | | Send stays approved by a person |
| Week 4 scheduled | not planned | | |
