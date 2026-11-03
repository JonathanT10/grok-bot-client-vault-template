# Routine: Weekly notice digest

Date: {{START_DATE}}
Tags: #routine #pilot #department
Status: proposed (starter from the department pilot kit; rename and adapt)
Owner (bot): {{BOT_NAME}}
Approver: {{PRIMARY_CONTACT}}; reviewer: {{DEPT_LEAD}}
Handover stage: week 1 (draft only) for the whole pilot
Kit: [[Onboarding/Department pilot kit/README|Department pilot kit]]

## Purpose
Save the team the weekly hunt through notices (policy changes, vendor and supplier notices, deadlines, system announcements) by collecting them into one sourced digest with what each means for {{DEPT_NAME}} and by when.

## Trigger
- Schedule (time zone) or event: {{NOTICE_DIGEST_DAY}} at 08:00 ({{TIMEZONE}}). Cron `0 8 * * 1` (set the weekday to {{NOTICE_DIGEST_DAY}}).
- Skips / quiet days: holiday weeks, if the reviewer says so.

## Inputs
- Sources (connector, folder, note): notice emails in the shared mailbox (senders and subjects listed in the intake), the notices folder or page the team uses, and public pages named in the intake; last week's digest.
- Access level needed (read / draft / act): **read only.** Web reads of public pages only.

## Steps
1. Pull the vault; read this note and last week's digest.
2. Collect notices from the last 7 days plus anything with a deadline in the next 14 days.
3. For each: what changed, why it matters to {{DEPT_NAME}}, what to do and by when, a source link, and "confirmed" (from the issuer) or "reported" (second-hand). Check every date's weekday.
4. Raise a **flag** on each notice that needs action within 14 days.
5. Write the digest (most urgent first) and send it to the reviewer. Nothing is forwarded, posted, or filed by the bot.
6. Send the time-savings row; note flags raised.
7. Ask the reviewer by end of day: minutes spent, flags right, anything missed. Send the update to {{REPORTS_BOT_NAME}}.

## Output
- What it produces: `## Notice digest YYYY-MM-DD`: most urgent item first, then items by deadline, each with confirmed / reported and a source; "Could not check"; "Decisions waiting on {{PRIMARY_CONTACT}}".
- Where it goes (note path, chat, email draft): `Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD Notice digest.md` (saved by {{RECORD_KEEPER_BOT_NAME}}) and the reviewer's chat.
- log.md line format: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{RECORD_KEEPER_BOT_NAME}}: notice digest saved (n notices, n flags) -> Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD Notice digest.md`

## Approval gates
- Actions that wait for an approver (always: send, spend, publish, delete, permissions, connect/disconnect): all of them. This routine never sends, posts, replies, files, or edits a source system, at any stage of the pilot.
- Connecting the source and its read scope: approved through the matching ask in [[Ranked opportunities]], recorded in [[Access list]].
- What it may do alone at week 3-4 (list exactly): nothing beyond this pilot. Moving past draft-only is a decision at the readout, not a schedule step.

## Done when
- Success: every notice has a source and a label; every deadline in the next 14 days is flagged; the reviewer does not have to look elsewhere.
- Failure looks like: a missed deadline, an unsourced item, a wrong weekday, or anything sent or posted.

## Failure handling
- If an input is missing: list it under "Could not check".
- If it errors or runs out of usage: report in chat in one line.
- Retry policy: one retry after 30 minutes; then report.

## Time-savings row (every run)
Send one row to {{REPORTS_BOT_NAME}} (format in [[Onboarding/Department pilot kit/README|Department pilot kit]]; rules in [[Time savings log]]). Never write the CSV yourself.
- baseline_min: minutes the team spent finding and reading notices each week (intake sections 2 and 3, with its source).
- bot_run_min: run wall-clock minutes. review_min: the reviewer's answer.
- evidence_path: the week's notice digest note. notes: `flags raised n / correct n / missed n`.

## Cost and usage
- Expected runs per week: 1
- Expected usage per run (estimate, say so): one research pass; record the first run's measured figure here.

## Handover log
| Stage | Start date | Approved by | Notes |
|---|---|---|---|
| Week 1 draft only | {{DEPT_PILOT_START_DATE}} | | Draft only for the whole pilot |
| Week 2 approve each | n/a in pilot | | Decided at the readout |
| Week 3 routine alone | n/a in pilot | | |
| Week 4 scheduled | n/a in pilot | | |
