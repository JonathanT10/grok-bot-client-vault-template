# Routine: Daily FYI digest

Date: {{START_DATE}}
Tags: #routine #pilot #department
Status: proposed (starter from the department pilot kit; rename and adapt)
Owner (bot): {{BOT_NAME}}
Approver: {{PRIMARY_CONTACT}}; reviewer: {{DEPT_LEAD}}
Handover stage: week 1 (draft only) for the whole pilot
Kit: [[Onboarding/Department pilot kit/README|Department pilot kit]]

## Purpose
Save the team the morning sort of the {{DEPT_NAME}} mailbox: one digest of what came in since the last run, which items are FYI only, and which need a person, so nobody reads every email to find the few that matter.

## Trigger
- Schedule (time zone) or event: weekdays at {{DIGEST_TIME}} ({{TIMEZONE}}). Cron `30 7 * * 1-5` (set to {{DIGEST_TIME}}).
- Skips / quiet days: weekends and the client's holidays; the Monday run covers since Friday's run.

## Inputs
- Sources (connector, folder, note): the department's shared mailbox (named in the intake), since the last run's cut-off; the intake's list of email kinds; this note's rules.
- Access level needed (read / draft / act): **read only.** No send, no move, no label, no delete.

## Steps
1. Pull the vault; read this note and yesterday's digest (for the cut-off time and items still open).
2. Read new mail since the cut-off. Classify each: FYI (no action), needs a person (say who and why), or unsure.
3. Raise a **flag** on every "needs a person" item: what it is, why it needs action, by when, and a link to the message. Never copy account numbers, card numbers, tax IDs, or attachments into the digest.
4. Write the digest (Output). List "unsure" items separately; never guess.
5. Send the digest to the reviewer in chat as a draft for them to read. It is not forwarded to anyone else.
6. Send the time-savings row; note flags raised.
7. Ask the reviewer at end of day: minutes spent on the digest, flags that were right, and anything missed. Send the update to {{REPORTS_BOT_NAME}}.

## Output
- What it produces: `## FYI digest YYYY-MM-DD` with counts, flagged items (with links and due dates), FYI items grouped by kind, unsure items, and "Could not check".
- Where it goes (note path, chat, email draft): `Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD FYI digest.md` (saved by {{RECORD_KEEPER_BOT_NAME}}) and the reviewer's chat.
- log.md line format: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{RECORD_KEEPER_BOT_NAME}}: FYI digest saved (n emails, n flags) -> Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD FYI digest.md`

## Approval gates
- Actions that wait for an approver (always: send, spend, publish, delete, permissions, connect/disconnect): all of them. This routine never sends, posts, replies, files, or edits a source system, at any stage of the pilot.
- Connecting the source and its read scope: approved through the matching ask in [[Ranked opportunities]], recorded in [[Access list]].
- What it may do alone at week 3-4 (list exactly): nothing beyond this pilot. Moving past draft-only is a decision at the readout, not a schedule step.

## Done when
- Success: digest ready by {{DIGEST_TIME}}; every flag has a link, a reason, and a date; the reviewer reads it in under the agreed minutes.
- Failure looks like: a missed "needs a person" item, a flag on an FYI item, sensitive data in the digest, or any action taken in the mailbox.

## Failure handling
- If an input is missing: say which in the digest's first line; do not send a partial digest without saying so.
- If it errors or runs out of usage: report in chat in one line.
- Retry policy: one retry after 15 minutes; then report.

## Time-savings row (every run)
Send one row to {{REPORTS_BOT_NAME}} (format in [[Onboarding/Department pilot kit/README|Department pilot kit]]; rules in [[Time savings log]]). Never write the CSV yourself.
- baseline_min: minutes the team spent on the morning sort (intake section 2, with its source).
- bot_run_min: run wall-clock minutes. review_min: the reviewer's answer.
- evidence_path: the day's digest note. notes: `flags raised n / correct n / missed n`.

## Cost and usage
- Expected runs per week: 5
- Expected usage per run (estimate, say so): grows with mail volume; record the first week's measured figure here.

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | {{DEPT_PILOT_START_DATE}} | | Draft only for the whole pilot |
| Week 2 approve each | n/a in pilot | | Decided at the readout |
| Week 3 routine alone | n/a in pilot | | |
| Week 4 scheduled | n/a in pilot | | |
