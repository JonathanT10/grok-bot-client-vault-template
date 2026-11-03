# Pilot measurement sheet

Date: {{START_DATE}}
Tags: #onboarding #pilot #department #measurement
Client: {{CLIENT_NAME}}
Department: {{DEPT_NAME}}
Pilot: {{DEPT_PILOT_START_DATE}} to {{DEPT_PILOT_END_DATE}} (10 working days); readout {{DEPT_PILOT_READOUT_DATE}}
Writer: {{REPORTS_BOT_NAME}} (the only writer)
File: `Reports/{{DEPT_NAME}} pilot/Pilot measurement sheet.csv`, started from `Pilot measurement sheet.csv` in this kit (header row only)
Kit: [[Onboarding/Department pilot kit/README|Department pilot kit]]

One row per routine per run day, for the two weeks of the pilot. It is the pilot's view of the same runs the [[Time savings log]] records, plus how good each routine's flags were. Both files have one writer, {{REPORTS_BOT_NAME}}; the routines send their numbers as TIME ROW hand-offs and never write either file. Back up before every write, as for the time-savings log.

## Columns
| Column | Meaning | How it is filled |
|---|---|---|
| date | Run day, YYYY-MM-DD ({{TIMEZONE}}) | From the run |
| routine | Routine name, same words every day | From the routine spec |
| run_id | Same run_id as the time-savings log row | From the TIME ROW |
| baseline_min | Minutes the task took before the pilot, per run | Intake time log |
| baseline_source | measured / owner estimate / bot estimate | Intake |
| bot_min | Wall-clock minutes of the run | From the run |
| review_min | Minutes the reviewer spent on the output (reading, checking, editing drafts) | Asked of the reviewer; never guessed |
| net_min | baseline_min - bot_min - review_min | Calculated |
| flags_raised | Items the routine flagged as needing a person | From the output |
| flags_correct | Flags the reviewer agreed with | Reviewer |
| flags_missed | Items that needed a person but were not flagged | Reviewer (and next-day checks) |
| flag_accuracy | flags_correct / flags_raised (blank when flags_raised is 0) | Calculated, 2 decimals |
| recall | flags_correct / (flags_correct + flags_missed) (blank when both are 0) | Calculated, 2 decimals |
| evidence_path | Vault path of the run's output note; must exist | From the run |
| notes | Anything unusual: partial run, reviewer away, overlap with another row | Free text |

Rules:
- A day the routine did not run still gets a row with `bot_min` blank and `notes: missed run (reason)`; it counts against the run rate.
- A row whose `review_min` is not yet known stays `pending` and is left out of net totals until filled.
- A row without an existing `evidence_path` is left out of every total (same rule as the [[Time savings log]]).
- Estimates stay labelled. Net minutes from `owner estimate` or `bot estimate` baselines are reported separately from measured ones.
- Flag numbers are always the reviewer's judgment, recorded the same day or the next morning.

## Daily check (two minutes, {{REPORTS_BOT_NAME}})
- Every scheduled run has a row; pending review minutes chased once.
- Any routine with a flag_accuracy or recall under the go threshold two days running is raised with {{DEPT_LEAD}} in chat.

## Totals at day 10
| Routine | Runs (scheduled / delivered) | Net min, measured | Net min, estimated | Net min per week | Median review min per run | Flag accuracy (sum correct / sum raised) | Recall (sum correct / (sum correct + sum missed)) |
|---|---|---|---|---|---|---|---|
| | | | | | | | |
| **All routines** | | | | | | | |

Use sums across the two weeks for accuracy and recall, not an average of daily ratios.

## Go / no-go (at the end of the 2 weeks)
Set every threshold with {{PRIMARY_CONTACT}} and {{DEPT_LEAD}} **before day 1** and record them in a decision record. Do not change them during the pilot.

| Criterion | Threshold | Result | Met? |
|---|---|---|---|
| Net minutes saved per week, all routines (measured baselines only) | at least {{DEPT_GO_MIN_NET_MIN_PER_WEEK}} | | |
| Flag accuracy, per routine | at least {{DEPT_GO_MIN_FLAG_ACCURACY}} | | |
| Recall, per routine | at least {{DEPT_GO_MIN_RECALL}} | | |
| Median review minutes per run, per routine | at most {{DEPT_GO_MAX_REVIEW_MIN_PER_RUN}} | | |
| Runs delivered on time (share of scheduled) | at least {{DEPT_GO_MIN_RUN_RATE}} | | |
| Share of baseline minutes that are measured (not estimated) | at least {{DEPT_GO_MIN_MEASURED_SHARE}} | | |
| Sends, posts, or source-system edits by a bot | 0 (fixed, not adjustable) | | |
| Sensitive data found in a digest or draft | 0 (fixed, not adjustable) | | |

Decision:
- **Go** (per routine): every threshold met for that routine and both fixed rules held. Pick the next step from [[Service packages]] and the [[GROK]] gradual handover; a routine moves past draft-only only with a new approval.
- **Extend** (once, up to 2 more weeks): net minutes or accuracy close to threshold with a named fix, or the baseline was mostly estimated.
- **No-go** (per routine): a threshold clearly missed, or either fixed rule broken. Stop the routine, disconnect what it used, and record why.
- Record the decision in `Decisions/YYYY-MM-DD-{{DEPT_NAME}}-pilot-go-no-go.md` with this table filled, and log it.
