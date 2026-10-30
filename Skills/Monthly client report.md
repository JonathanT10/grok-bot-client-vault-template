# Monthly client report

Date: {{START_DATE}}
Tags: #skill #report
Status: starter (adapt and test before trusting)

A once-a-month report for {{PRIMARY_CONTACT}} on what {{BOT_NAME}} did, what it saved, what went wrong, and what is waiting on them. Also the trigger for the monthly access review.

## When to use
- The first business day of each month, for the month before. Or on request.

## Inputs
- log.md and Daily/ notes for the month; git log for the month.
- Routine run history (from the bot's routine list); routine rows in [[Bot configuration]].
- Incidents and change requests filed this month.
- "Before" numbers in [[Business profile]].
- [[Access list]], rechecked at the source.

## Steps
1. Pull the vault. Create `Reports/YYYY-MM Monthly report.md` from the [[Monthly report template]].
2. Count from the record only. Every number names its source; anything estimated says "estimate".
3. Grade each routine USED / REWORKED / IGNORED, with evidence, and recommend keep / tune / pause.
4. Recheck every [[Access list]] row at its source; list unused access as proposals (do not remove anything).
5. Fill Decisions waiting on {{PRIMARY_CONTACT}}.
6. Send to {{PROVIDER_NAME}} for review in chat; sharing with the client is a send and waits for approval.
7. Log one line, commit.

## Done when
- Success: the summary reads in a minute, every number has a source, and access was rechecked this month.
- Failure: invented time savings, missing failures, or access changes made without approval.
