> **FICTIONAL EXAMPLE DATA.** Example Landscaping LLC and its accounts payable team are made up for demos. Every name, email, phone number, date, and number in this file is example data. Do not add real client, prospect, vendor, or personal data.

# Routine: Invoice approval follow-ups

Date: 2026-03-06
Tags: #routine #pilot #department
Status: active (pilot, 2026-03-09 to 2026-03-20)
Owner (bot): Ops Assistant
Approver: Alex Sample; reviewer: Jordan Example (sends every follow-up herself)
Handover stage: week 1 (draft only) for the whole pilot
Kit starter: [[Routine - Status tracker follow-ups]]

## Purpose
Save Jamie the daily walk through the invoice approval tracker: list invoices waiting on an approver for 3+ days or on a vendor query for 5+ days, and draft the follow-ups Jordan reviews and sends.

## Trigger
- Schedule (time zone) or event: weekdays 10:00 America/New_York, cron `0 10 * * 1-5`.
- Skips / quiet days: weekends; no holidays in the pilot window.

## Inputs
- Sources: Invoice approval tracker (status, sent-for-approval date, approver, query date); approver and vendor business contacts from the demo vault People and roles.
- Access level needed: **read only** (approved 2026-03-05 by Alex Sample; rows in the demo vault Access list).

## Steps
1. Read the tracker; for each open row work out status, days waiting, and who it waits on.
2. Flag rows over the follow-up rule, and rows that look inconsistent (approved with no date). Recheck each at the source.
3. Draft one follow-up per flagged row: to, subject, two sentences, the invoice reference only (no amounts, no bank details).
4. Send counts, flags, and drafts to Jordan; send the time row; ask for review minutes, drafts sent as-is / edited / discarded, and missed rows at 16:00.

## Output
- Where it goes: `Reports/Accounts payable pilot/YYYY-MM-DD Tracker status.md` (saved by Record Keeper) and the reviewer's chat.
- log.md line format: `- YYYY-MM-DD HH:MM (America/New_York) Record Keeper: Tracker status saved -> Reports/Accounts payable pilot/YYYY-MM-DD Tracker status.md`

## Approval gates
- Never sends, posts, replies, files, or edits a source system. Every follow-up or forward is a person's own action.
- Nothing runs alone beyond the pilot; moving past draft-only is decided at the readout.

## Done when
- Success: every overdue row flagged; drafts sent with light edits; nothing changed in the tracker.
- Failure looks like: a missed item, sensitive data in the output, or any action in a source system.

## Failure handling
- Missing input: say so in the first line. Error or usage out: one line in chat. One retry after 15 minutes.

## Time-savings row (every run)
Sent to Record Keeper (the reports writer): baseline_min 50 (measured), bot_run_min from the run, review_min from the reviewer, evidence_path the day's output note, notes with flags raised / correct / missed. Rows land in `Pilot measurement sheet - Accounts payable.csv`.

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | 2026-03-09 | Alex Sample | Draft only for the whole pilot |
| Week 2 approve each | n/a in pilot | | Decided at the readout |
