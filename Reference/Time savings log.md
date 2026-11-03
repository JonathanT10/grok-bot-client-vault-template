# Time savings log

Date: {{START_DATE}}
Tags: #reference #time-saved #reporting
Writer: {{REPORTS_BOT_NAME}} (the only writer)
File: `Reports/Time savings log.csv` (start it from `Templates/Time savings log.csv`, header row only)
Backups: `Reports/Time savings backups/`

One CSV holds every time-saved number the team reports: pilot readouts, the [[Monthly client report]], the [[Briefing Bot]]'s before/after sheet, and any "hours saved" line in sales material (measured rows only, and only with the client's OK to share). If a number is not in this file with evidence, it is not reported.

## One writer
- **{{REPORTS_BOT_NAME}} is the only bot that writes the file.** By default that is the Record Keeper ({{RECORD_KEEPER_BOT_NAME}}); the name is set in `client.env` and the Team roster in [[Bot configuration]].
- Every other bot sends rows to {{REPORTS_BOT_NAME}} and **never writes the file**, not even to fix its own row. People send corrections the same way.
- Row hand-off format:
```
TIME ROW for {{REPORTS_BOT_NAME}}
date: YYYY-MM-DD
bot: (who did the work)
task: (short, the same words each time for the same task)
run_id: (unique per run, for example <bot>-<date>-<n>, or the routine run id)
baseline_min: (minutes the task took before the bot)
baseline_source: measured / owner estimate / bot estimate
bot_run_min: (minutes the bot's run took, wall clock)
review_min: (minutes a person spent reviewing or fixing the output)
evidence_path: (vault path that exists: the Daily note, report, or capture entry that shows the run)
notes: (optional; "overlaps <run_id>" when it double-counts another row)
do_not_sum: (blank, or yes)
```

## Columns
| Column | Meaning | Rules |
|---|---|---|
| date | Day the work ran, YYYY-MM-DD ({{TIMEZONE}}) | Required |
| bot | Bot that did the work | Name as on the Team roster |
| task | What was done | Same wording for the same recurring task |
| run_id | Unique id of the run | No repeats; a repeated run_id is excluded from totals |
| baseline_min | Minutes the task took before the bot | Number |
| baseline_source | Where the baseline came from | Exactly `measured`, `owner estimate`, or `bot estimate` |
| bot_run_min | Minutes the bot's run took | Number |
| review_min | Minutes a person spent checking or fixing the output | Number; 0 only if nobody looked |
| evidence_path | Vault path that shows the run happened | Must exist in the vault |
| notes | Free text | Use `overlaps <run_id>` for overlaps |
| do_not_sum | `yes` if this row overlaps another and must not be added | Blank otherwise |

**Net minutes = baseline_min - bot_run_min - review_min.** A negative net is kept: it means the run cost time.

## Rules for every write
1. **Back up first.** Before every write, copy the current file to `Reports/Time savings backups/Time savings log YYYY-MM-DD-HHMM.csv` and commit the backup with the change. Keep at least the last 30 backups.
2. **Evidence or no total.** Every row needs an `evidence_path` that exists in the vault at the time of writing. {{REPORTS_BOT_NAME}} checks it before adding the row. A row without existing evidence may be kept as a placeholder, but it is **excluded from every total** until the evidence exists.
3. **Label estimates.** `baseline_source` is `measured` only when the "before" came from a time log or system record. Anything else is `owner estimate` or `bot estimate`, and reports show measured and estimated totals separately.
4. **No double counting.** When two rows cover the same minutes (for example the Coordinator's status that includes the brief the Briefing Bot already logged), set `do_not_sum` to `yes` on the later row and write `overlaps <run_id>` in `notes`. Rows marked `do_not_sum` stay in the file for the record and are never added to totals.
5. **Append, do not rewrite.** A correction is a new row with the same task and a note `corrects <run_id>`; mark the wrong row `do_not_sum` = `yes` with `notes` saying `corrected by <run_id>`.
6. **CSV hygiene.** One row per line, comma separated; wrap a field in double quotes if it contains a comma. No names of customers, no secrets, no personal details.
7. Add one log.md line per write session: `- YYYY-MM-DD HH:MM ({{TIMEZONE}}) {{REPORTS_BOT_NAME}}: N time rows added -> Reports/Time savings log.csv`.

## Totals
Run from the vault root:
```bash
./scripts/time-savings-summary.sh                              # all rows
./scripts/time-savings-summary.sh --from 2026-03-01 --to 2026-03-31
```
It prints measured, estimated, and total net minutes (and hours), totals by bot, and every excluded row with the reason (no evidence, evidence missing, do_not_sum, duplicate run_id, or an invalid value). It never edits the file. Reports quote the measured total first and label the estimated part.
