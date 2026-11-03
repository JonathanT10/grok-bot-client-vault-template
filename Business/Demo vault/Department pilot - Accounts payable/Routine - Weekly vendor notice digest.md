> **FICTIONAL EXAMPLE DATA.** Example Landscaping LLC and its accounts payable team are made up for demos. Every name, email, phone number, date, and number in this file is example data. Do not add real client, prospect, vendor, or personal data.

# Routine: Weekly vendor notice digest

Date: 2026-03-06
Tags: #routine #pilot #department
Status: active (pilot, 2026-03-09 to 2026-03-20)
Owner (bot): Ops Assistant
Approver: Alex Sample; reviewer: Robin Example (Jordan reads it too)
Handover stage: week 1 (draft only) for the whole pilot
Kit starter: [[Routine - Weekly notice digest]]

## Purpose
Collect the week's vendor and supplier notices (price changes, new remit-to details, holiday cut-offs, statement dates) into one sourced digest for Robin.

## Trigger
- Schedule (time zone) or event: Mondays 08:00 America/New_York, cron `0 8 * * 1`.
- Skips / quiet days: weekends; no holidays in the pilot window.

## Inputs
- Sources: Notice emails in ap@example.com from the senders listed in the intake; the public supplier pages listed in the intake (placeholder links on example.org in this demo).
- Access level needed: **read only** (approved 2026-03-05 by Alex Sample; rows in the demo vault Access list).

## Steps
1. Collect notices from the last 7 days and anything due in the next 14.
2. For each: what changed, why it matters to AP, what to do by when, source, confirmed / reported. Check every weekday.
3. Flag anything due within 14 days. A notice that changes remit-to or bank details is flagged and marked "verify by phone with the vendor before any change"; the bot never records the new details.
4. Send to Robin and Jordan; send the time row; ask for review minutes and missed notices by end of day.

## Output
- Where it goes: `Reports/Accounts payable pilot/YYYY-MM-DD Notice digest.md` (saved by Record Keeper) and the reviewer's chat.
- log.md line format: `- YYYY-MM-DD HH:MM (America/New_York) Record Keeper: Notice digest saved -> Reports/Accounts payable pilot/YYYY-MM-DD Notice digest.md`

## Approval gates
- Never sends, posts, replies, files, or edits a source system. Every follow-up or forward is a person's own action.
- Nothing runs alone beyond the pilot; moving past draft-only is decided at the readout.

## Done when
- Success: every notice sourced and labelled; deadlines in the next 14 days flagged; review under 15 minutes.
- Failure looks like: a missed item, sensitive data in the output, or any action in a source system.

## Failure handling
- Missing input: say so in the first line. Error or usage out: one line in chat. One retry after 15 minutes.

## Time-savings row (every run)
Sent to Record Keeper (the reports writer): baseline_min 60 (owner estimate (no time log for notices)), bot_run_min from the run, review_min from the reviewer, evidence_path the day's output note, notes with flags raised / correct / missed. Rows land in `Pilot measurement sheet - Accounts payable.csv`.

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | 2026-03-09 | Alex Sample | Draft only for the whole pilot |
| Week 2 approve each | n/a in pilot | | Decided at the readout |
