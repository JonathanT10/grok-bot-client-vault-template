> **FICTIONAL EXAMPLE DATA.** Example Landscaping LLC and its accounts payable team are made up for demos. Every name, email, phone number, date, and number in this file is example data. Do not add real client, prospect, vendor, or personal data.

# Routine: AP inbox FYI digest

Date: 2026-03-06
Tags: #routine #pilot #department
Status: active (pilot, 2026-03-09 to 2026-03-20)
Owner (bot): Ops Assistant
Approver: Alex Sample; reviewer: Jordan Example (Jamie Sample reads it too)
Handover stage: week 1 (draft only) for the whole pilot
Kit starter: [[Routine - Daily FYI digest]]

## Purpose
Give Jamie the first part of the morning back: one digest of what reached ap@example.com overnight, with invoices and payment questions flagged and statements and notices listed as FYI.

## Trigger
- Schedule (time zone) or event: weekdays 07:30 America/New_York, cron `30 7 * * 1-5`.
- Skips / quiet days: weekends; no holidays in the pilot window.

## Inputs
- Sources: ap@example.com since the last run; the intake's email kinds (invoice, statement, payment question, notice, other).
- Access level needed: **read only** (approved 2026-03-05 by Alex Sample; rows in the demo vault Access list).

## Steps
1. Read new mail since the cut-off; classify each by kind.
2. Flag invoices (vendor, invoice date, due date, link) and payment questions (vendor, question in one line, link). Never copy bank details or amounts.
3. List statements and notices as FYI; list anything unclear as unsure.
4. Send the digest to Jordan and Jamie; send the time row; ask for review minutes and missed items at 16:00.

## Output
- Where it goes: `Reports/Accounts payable pilot/YYYY-MM-DD FYI digest.md` (saved by Record Keeper) and the reviewer's chat.
- log.md line format: `- YYYY-MM-DD HH:MM (America/New_York) Record Keeper: FYI digest saved -> Reports/Accounts payable pilot/YYYY-MM-DD FYI digest.md`

## Approval gates
- Never sends, posts, replies, files, or edits a source system. Every follow-up or forward is a person's own action.
- Nothing runs alone beyond the pilot; moving past draft-only is decided at the readout.

## Done when
- Success: digest by 07:45; every invoice and payment question flagged; review under 10 minutes.
- Failure looks like: a missed item, sensitive data in the output, or any action in a source system.

## Failure handling
- Missing input: say so in the first line. Error or usage out: one line in chat. One retry after 15 minutes.

## Time-savings row (every run)
Sent to Record Keeper (the reports writer): baseline_min 35 (measured), bot_run_min from the run, review_min from the reviewer, evidence_path the day's output note, notes with flags raised / correct / missed. Rows land in `Pilot measurement sheet - Accounts payable.csv`.

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | 2026-03-09 | Alex Sample | Draft only for the whole pilot |
| Week 2 approve each | n/a in pilot | | Decided at the readout |
