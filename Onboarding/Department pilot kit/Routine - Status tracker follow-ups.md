# Routine: Status tracker follow-ups

Date: {{START_DATE}}
Tags: #routine #pilot #department
Status: proposed (starter from the department pilot kit; rename and adapt)
Owner (bot): {{BOT_NAME}}
Approver: {{PRIMARY_CONTACT}}; reviewer and sender: {{DEPT_LEAD}}
Handover stage: week 1 (draft only) for the whole pilot
Kit: [[Onboarding/Department pilot kit/README|Department pilot kit]]

## Purpose
Save the team the daily walk through the tracker: list items that are overdue or waiting on someone, and draft the follow-up messages a person reviews, edits, and sends.

## Trigger
- Schedule (time zone) or event: weekdays at {{STATUS_TRACKER_TIME}} ({{TIMEZONE}}). Cron `0 10 * * 1-5` (set to {{STATUS_TRACKER_TIME}}).
- Skips / quiet days: weekends and holidays.

## Inputs
- Sources (connector, folder, note): the department's tracker or spreadsheet (named in the intake), its status column and "waiting on" column; the follow-up rules from the intake (how long before a follow-up is due, who may be chased); the business contacts in [[People and roles]].
- Access level needed (read / draft / act): **read only** on the tracker; drafts only (in chat, or saved as unsent drafts if the client allows draft access in the mailbox). No edits to the tracker, ever.

## Steps
1. Pull the vault; read this note and the last run's output (for items already drafted and not yet sent).
2. Read the tracker. For each open row, work out: status, days since last change, who it waits on, and whether a follow-up is due under the rules.
3. Raise a **flag** on each row that is overdue, stuck, or inconsistent (for example marked done with no date). Recheck the row at the source before flagging.
4. For each due follow-up, write a short draft: to (business contact), subject, two or three sentences, the tracker reference. Never include account or card numbers, tax IDs, or amounts unless the intake says the recipient already has them.
5. Write the output (below) and send it to the reviewer. **The reviewer sends any follow-up by hand**; the bot never sends and never updates the tracker.
6. Send the time-savings row; note flags raised and drafts written.
7. Ask the reviewer at end of day: minutes spent, flags right, drafts sent as-is / edited / discarded, anything missed. Send the update to {{REPORTS_BOT_NAME}}.

## Output
- What it produces: `## Tracker status YYYY-MM-DD`: counts by status, flagged rows (reference, why, waiting on, days), follow-up drafts (one block each), and "Could not check".
- Where it goes (note path, chat, email draft): `Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD Tracker status.md` (saved by {{RECORD_KEEPER_BOT_NAME}}) and the reviewer's chat.
- log.md line format: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{RECORD_KEEPER_BOT_NAME}}: tracker status saved (n flags, n drafts) -> Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD Tracker status.md`

## Approval gates
- Actions that wait for an approver (always: send, spend, publish, delete, permissions, connect/disconnect): all of them. This routine never sends, posts, replies, files, or edits a source system, at any stage of the pilot.
- Connecting the source and its read scope: approved through the matching ask in [[Ranked opportunities]], recorded in [[Access list]].
- What it may do alone at week 3-4 (list exactly): nothing beyond this pilot. Moving past draft-only is a decision at the readout, not a schedule step.
- Sending a follow-up is always the reviewer's own action in their own mailbox.

## Done when
- Success: every overdue row is flagged with its reason; drafts need little or no editing; nothing changed in the tracker or the mailbox.
- Failure looks like: a missed overdue row, a follow-up drafted for a row that was already done, a draft with sensitive data, or any send or tracker edit by the bot.

## Failure handling
- If an input is missing: list it first; do not draft follow-ups from a partial read.
- If it errors or runs out of usage: report in chat in one line.
- Retry policy: one retry after 15 minutes; then report.

## Time-savings row (every run)
Send one row to {{REPORTS_BOT_NAME}} (format in [[Onboarding/Department pilot kit/README|Department pilot kit]]; rules in [[Time savings log]]). Never write the CSV yourself.
- baseline_min: minutes the team spent checking the tracker and writing follow-ups (intake sections 4 and 6, with its source).
- bot_run_min: run wall-clock minutes. review_min: the reviewer's answer, including editing drafts.
- evidence_path: the day's tracker status note. notes: `flags raised n / correct n / missed n; drafts n (as-is n, edited n, discarded n)`.

## Cost and usage
- Expected runs per week: 5
- Expected usage per run (estimate, say so): grows with open rows; record the first week's measured figure here.

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | {{DEPT_PILOT_START_DATE}} | | Draft only for the whole pilot |
| Week 2 approve each | n/a in pilot | | Decided at the readout |
| Week 3 routine alone | n/a in pilot | | |
| Week 4 scheduled | n/a in pilot | | |
