# Daily and weekly review

Date: {{START_DATE}}
Tags: #skill #review
Status: starter (adapt and test on two days before trusting)

Summarize what happened and surface what is still open, so {{PRIMARY_CONTACT}} can see the state of things in a minute.

## When to use
- Daily: end of the business day ({{TIMEZONE}}), or when asked "what happened today?" or "what's open?".
- Weekly: every {{REVIEW_DAY}}, or when asked for a weekly review.

## Inputs
- Daily: today's Daily note, today's lines in log.md, today's commits (`git log --since=midnight`), and any routine runs today.
- Weekly: the last 7 Daily notes, the last 7 days of log.md, Inbox notes with status new or parked, Next steps in Projects/ notes, and Follow-up items in Decisions/ due this week or overdue.
- Every writer's lines count. The writer is the prefix before the colon in log.md. A line with no prefix still counts; say the writer is not named.

## Steps
1. Pull the vault.
2. Read the inputs. Do not invent activity that is not written down.
3. Group log lines by writer.
4. Daily: write the Review section (see Output).
5. Weekly:
   - Grade each routine's outputs this week as USED, REWORKED, or IGNORED from the record only.
   - List Inbox items that need triage (see [[Idea triage]]).
   - Flag projects with no activity in 7 days, and notes with no update in 14+ days as possibly stale (recheck their status at the source).
   - List decisions and follow-ups that are due or overdue.
   - Suggest at most 3 focus items for next week.
6. Add one line to log.md and commit.

## Output
Append to today's Daily note. Do not create a second note for the day.

Daily:
```
## Review
- Done: (3-5 bullets; who did it, with a link)
- Still open: (with links to where each lives)
- Tomorrow: (top 1-3)
- Decisions waiting on {{PRIMARY_CONTACT}}: (or "None")
```

Weekly:
```
## Weekly review
- By writer: (one line each)
- Routines graded: (routine: USED / REWORKED / IGNORED, with the evidence)
- Inbox to triage:
- Project activity:
- Stalled or possibly stale:
- Due or overdue follow-ups:
- Focus next week (max 3):
- Decisions waiting on {{PRIMARY_CONTACT}}: (or "None")
```

## Unattended runs
- If today's Daily note is missing, create it from `Templates/Daily note template.md` (date in {{TIMEZONE}}).
- Make sure the file ends with a newline before appending.
- If a `## Review` or `## Weekly review` section already exists, replace it.
- If the push is rejected: `git pull --rebase`, keep both lines, retry once; if it still fails, report it in chat.

## Done when
- Success: readable in a minute; every open item links to where it lives; nothing is made up.
- Failure: a copy of every log line, open items with no link, invented progress, or usage numbers not in the record.
