# Department automation pilot kit

Date: {{START_DATE}}
Tags: #onboarding #pilot #department
Client: {{CLIENT_NAME}}
Department: {{DEPT_NAME}} (lead: {{DEPT_LEAD}})
Pilot dates: {{DEPT_PILOT_START_DATE}} to {{DEPT_PILOT_END_DATE}}; readout {{DEPT_PILOT_READOUT_DATE}}
Owner: {{PROVIDER_NAME}}

A two-week, read-only, draft-only pilot for **one department** (for example accounts payable, the front office, or dispatch). It finds where the team's time goes, ranks what a bot could take off their plate, runs up to three safe routines, and measures the result every day so the go / no-go is decided on numbers. It is a smaller, faster version of the 30-day [[Pilot program]] and follows the same rules: baseline first, security before setup, draft only, measure rather than estimate.

A fully filled example for a **fictional** department lives in `Business/Demo vault/Department pilot - Accounts payable/` (provider-internal; deleted from client copies with the rest of `Business/`).

## The kit, in the order you use it
| Step | Note | What it produces | When |
|---|---|---|---|
| 1 | [[Department intake questionnaire]] | Mailboxes, reports, trackers, meetings, hand-offs, time per task, and the systems and access each needs | Day -5 to -1, a 60-minute session with {{DEPT_LEAD}} plus a one-week time log |
| 2 | [[Ranked opportunities]] | Scored, ranked list of tasks; an approval ask for each top opportunity | Day -1 |
| 3 | [[Routine - Daily FYI digest]] | Morning digest of what came in and what needs a person | Days 1-10 |
| 3 | [[Routine - Status tracker follow-ups]] | Tracker status check plus follow-up drafts a person reviews and sends | Days 1-10 |
| 3 | [[Routine - Weekly notice digest]] | Weekly digest of notices (policy, vendor, deadline) with sources | Weeks 1 and 2 |
| 4 | [[Pilot measurement sheet]] (and `Pilot measurement sheet.csv`) | Daily rows per routine: minutes, flags, accuracy; the go / no-go at day 10 | Daily, then the readout |

Pick **at most three** routines, one per top opportunity. Use the three routine specs as starters; rename and adapt them to the ranked tasks.

## Guardrails for every routine in this kit
- **Read-only.** Connectors are read scopes only. The bot never edits a source system (mailbox, tracker, spreadsheet, accounting or ticket tool).
- **Draft-only.** The bot never sends, posts, replies, files, or approves. Drafts go to the department's reviewer, who sends them by hand. This holds for the whole pilot; the [[GROK]] gradual handover beyond week 1 is a separate decision after the readout.
- **Access asked for first.** Every connector and scope is approved through the ACTION / TARGET / REASON / COST / CONSEQUENCES asks in [[Ranked opportunities]], then recorded in [[Access list]].
- **No sensitive data in outputs.** Digests and drafts never contain full account or card numbers, tax IDs, passwords, or personal details beyond a business contact.
- **Every run is counted.** Each run sends one row to {{REPORTS_BOT_NAME}} for the [[Time savings log]] and the day's line in the measurement sheet. Other bots never write either file.

## Time-savings row (same for every routine)
After each run the routine's bot sends:
```
TIME ROW for {{REPORTS_BOT_NAME}}
date: YYYY-MM-DD
bot: (the routine's bot)
task: (routine name, same words every run)
run_id: (routine-short-name-YYYY-MM-DD)
baseline_min: (minutes the task took before, from the intake time log)
baseline_source: measured / owner estimate / bot estimate
bot_run_min: (wall-clock minutes of the run)
review_min: (minutes the reviewer spent; ask, never guess; "pending" until known)
evidence_path: (vault path of the run's output note)
notes: (flags raised / correct / missed for the measurement sheet; "overlaps <run_id>" if it double-counts)
do_not_sum: (blank, or yes)
```
Net minutes = baseline_min - bot_run_min - review_min. {{REPORTS_BOT_NAME}} checks the evidence path exists, writes the [[Time savings log]] row, and adds the day's row to the measurement sheet.

## Where things live during the pilot
- Intake answers and the ranked list: `Projects/{{DEPT_NAME}} pilot/` (copy the two notes there and fill them).
- Routine specs: `Projects/` (one note per routine, from the starters here), plus a row each in [[Bot configuration]].
- Daily outputs: `Reports/{{DEPT_NAME}} pilot/YYYY-MM-DD <routine>.md`.
- Measurement sheet: `Reports/{{DEPT_NAME}} pilot/Pilot measurement sheet.csv` (single writer {{REPORTS_BOT_NAME}}).
- Readout and decision: a decision record in `Decisions/`.
