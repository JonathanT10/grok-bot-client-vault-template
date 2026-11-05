# Weekly status digest

Date: {{START_DATE}}
Tags: #skill #reporting
Status: starter (adapt and test on two weeks' real inputs before trusting)
Routine: [[Routine - Weekly status digest]]

One short message for {{PRIMARY_CONTACT}} every {{REVIEW_DAY}}: what got done, what is open, what is waiting on them, and anything that went wrong. It reads the record, not chat memory. Different from [[Daily and weekly review]] (which writes into the Daily note for the bots) and [[Monthly client report]] (the monthly summary with numbers): this is the owner's five-minute read.

## When to use
- Scheduled: every {{REVIEW_DAY}} at {{STATUS_DIGEST_TIME}} ({{TIMEZONE}}).
- On request: "what happened this week", "weekly status", "catch me up".

## Inputs
- log.md lines since the last digest; Daily/ notes for the week.
- Decisions/ created or changed this week.
- Projects/ notes with a status line this week; [[Bot configuration]] routine table (stage and last run).
- Open approval requests and "Decisions waiting on" sections.
- Incidents opened or closed (Projects/ or Reports/ notes from [[Incident note template]]).
- If the team uses it: Reports/Time savings log.csv rows this week (read only; {{REPORTS_BOT_NAME}} is its only writer).

## Steps
1. Pull the vault. Find the last digest's date in log.md; that is the cut-off.
2. Collect the inputs above since the cut-off. Every item gets a link to the note it came from.
3. Write the digest in the shape below. Under 25 lines. No item without a source link.
4. Mark anything you could not check under "Could not check" instead of guessing.
5. Save to `Reports/Weekly status/YYYY-MM-DD.md`, add a log.md line, commit.
6. Send the digest text to {{PRIMARY_CONTACT}} in chat. It is a report to the owner, not a send to anyone else; forwarding it to staff or outside people needs an approval.

## Output shape
```
Weekly status, {{CLIENT_NAME}}, week ending YYYY-MM-DD

Waiting on you (N): each item, link, since when. "None" if none.
Done this week (N): up to 7 bullets, each with a link.
Open and on track (N): up to 5 bullets with owner and next step.
At risk or blocked (N): item, why, what would unblock it.
Routines: name, stage, runs this week (ok / failed / skipped).
Incidents: opened / closed, links. "None" if none.
Time saved (if logged): measured minutes and estimated minutes, kept separate.
Could not check: list, or "Nothing".
```

## Done when
- Every line links to a vault note; "Waiting on you" is first and always present.
- Numbers come from the record; estimates are labeled as estimates.
- The report is saved, logged, committed, and sent once.

## Never
- Never mark anything done without a link to proof.
- Never include passwords, account numbers, or data listed as restricted in [[Data inventory]].
- Never send the digest to anyone other than {{PRIMARY_CONTACT}} (and {{BACKUP_CONTACT}} if [[Bot configuration]] says so).
