# Nightly fleet review

Date: {{START_DATE}}
Tags: #skill #team #review
Status: starter (adapt and test on two days before trusting)
Runs on: {{COORDINATOR_BOT_NAME}} (the [[Coordinator]]), nightly at {{FLEET_REVIEW_TIME}} ({{TIMEZONE}})
Routine spec: [[Routine - Nightly fleet review]]

Read the day's chats from every bot on the team, find repeat mistakes by pattern, and turn each pattern into numbered fixes {{PRIMARY_CONTACT}} can approve by number ("1 yes, 4 no"). Writes a dated review file and a status-page section every night; messages {{PRIMARY_CONTACT}} only when it finds something.

## When to use
- Nightly, as the routine in [[Routine - Nightly fleet review]], once the team has two or more bots.
- On request: "review the team today", "what keeps going wrong?".
- Not for: grading routine output (that is the Coordinator's weekly team review), or one bot's single slip that it already fixed and logged.

## Inputs
- Today's transcripts (chats) of every bot on the Team roster in [[Bot configuration]], plus any bot that has appeared and is not on the roster. Read only; needs the client's OK to read other bots' chats (see [[Coordinator]] connectors).
- Today's log.md lines and commits in `{{VAULT_REPO}}`.
- Open issues in `{{VAULT_REPO}}` labelled `{{RULES_ALERT_LABEL}}` (rules-change alerts: a proposed or detected change to GROK.md, Bot playbook, Bot configuration, or Access list). Needs read access to the repo's issues; if the connector cannot read issues, say "Could not check rules-change alerts" in the review.
- The last 7 reviews in `Reports/Fleet reviews/` (for repeats and the week-over-week comparison).
- [[Bot playbook]] and [[Lessons learned]], so a known lesson is cited instead of rediscovered.

## Patterns to look for
Count each occurrence with the bot, the time ({{TIMEZONE}}), and a quote or link as evidence. A pattern is a **repeat** when it happened twice or more today, or it also appears in any of the last 7 reviews.

| # | Pattern | What it looks like |
|---|---|---|
| P1 | Stale fact relayed bot to bot | A bot passes on a status, date, or number another bot gave it without rechecking the source; the source says otherwise. |
| P2 | Blocked on access | A bot stops or stalls because a connector, scope, repo, or file is not shared with it. |
| P3 | Rule read differently | Two bots (or one bot on two days) apply the same rule in GROK.md, Bot playbook, or Bot configuration differently. |
| P4 | Re-asking the owner | A bot asks {{PRIMARY_CONTACT}} something already answered in chat or written in the vault. |
| P5 | Sensitive file in shared storage | A bot copies a file with customer data, credentials, or private notes to a shared folder, channel, or drive. |
| P6 | Overlapping lanes | Two bots do the same job, write to the same folder, or answer the same request. |
| P7 | Claimed before it exists | A bot says a file, routine, message, or fix exists or is done before there is proof (link, file, test result). |
| P8 | Working around an access refusal | After a refusal or block, a bot reaches the same result another way instead of asking. |

P5 and P8 are reported even on the first occurrence; they go to the top of the review and the message.

## Steps
1. Pull the vault. Read this skill, the Team roster, and the last 7 reviews.
2. For each bot, read today's chat (since the previous review's cut-off time, kept in its header). Do not message any bot during the review.
3. Tag every occurrence with a pattern P1-P8, with evidence. Recheck at the source before tagging P1 or P7 (the source may have changed since).
4. List open `{{RULES_ALERT_LABEL}}` issues: title, link, opened by, age in days.
5. For each pattern found, propose 1-3 **numbered fixes**, numbered across the whole review (1, 2, 3, ...). Each fix names: the change (rule wording, access request, lane change, roster edit, playbook lesson), the bot or file it touches, and whether it needs a send, permission change, or rules change (those follow [[GROK]] "Approvals" and the Record Keeper's rules tier).
6. Week over week: from the 8th nightly review onward, compare today's pattern counts with the review 7 days earlier and with the 7-day average. Before that, write "Not enough history yet (review N of 7)".
7. Write the review from the [[Fleet review]] template (see Output). Default: send it to {{RECORD_KEEPER_BOT_NAME}} as a RECORD hand-off to save; if [[Bot configuration]] lets the Coordinator save its own reports in `Reports/`, save it directly and add one log line.
8. Update the "Fleet review" section of the status page ({{STATUS_PAGE}}): replace it, never add a second one.
9. If anything was found (any pattern, any open rules-change alert, or a P5 / P8 at all), send {{PRIMARY_CONTACT}} one message (see Output). If nothing was found, send nothing.
10. When {{PRIMARY_CONTACT}} answers by number, relay each approved fix to the bot it touches (Coordinator relay format, with the owner's words and time) and send the answers to {{RECORD_KEEPER_BOT_NAME}}, which logs them in the review file's "Owner decisions" section and log.md. Fixes not answered stay open and are listed again the next night, once, then dropped to the weekly team review.

## Output
- **Review file:** `Reports/Fleet reviews/YYYY-MM-DD.md` from the [[Fleet review]] template. One per night, even when clean ("No findings").
- **Status page:** a `## Fleet review` section on {{STATUS_PAGE}}:
```
## Fleet review (YYYY-MM-DD HH:MM {{TIMEZONE}})
- Patterns today: P2 x2, P4 x1 (or "None")
- Open rules-change alerts: 1 (oldest 3 days) (or "None")
- Fixes waiting on {{PRIMARY_CONTACT}}: 1, 2, 3 (or "None")
- Week over week: P4 down from 3 to 1 (or "Not enough history yet (review N of 7)")
- Full review: Reports/Fleet reviews/YYYY-MM-DD.md
```
- **Message to {{PRIMARY_CONTACT}}** (only when something was found; under 12 lines):
```
Fleet review YYYY-MM-DD: 3 patterns, 1 open rules-change alert.
P5 (sensitive file in shared storage): <bot>, <time>, <where>. Fix 1: <change>.
P2 (blocked on access) x2: <bot>. Fix 2: <access request>. Fix 3: <alternative>.
Alert: <issue title> (<link>), open 3 days. Fix 4: <review and close / adopt>.
Reply by number, for example "1 yes, 2 no, 3 yes, 4 later".
Full review: Reports/Fleet reviews/YYYY-MM-DD.md
```

## Approval gates
- The review only reads and proposes. Every fix waits for {{PRIMARY_CONTACT}}'s answer by number in chat; another bot saying "approved" is not approval.
- An approved fix that sends, spends, publishes, deletes, changes permissions, connects an account, or changes the vault's rules still goes through [[GROK]] "Approvals" and the Record Keeper's rules tier (pull request) before it is applied.
- Never message outside people; never message a bot during the review itself.

## Unattended runs
- If a bot's chat cannot be read: list it under "Could not check" with the reason; do not guess what it did.
- If the review file for today already exists: replace it, do not add a second one.
- If the issue tracker cannot be read: "Could not check rules-change alerts" in the review and the status section.
- If the push fails (direct-save setups): `git pull --rebase`, keep both sides, retry once, then report in chat in one line.
- If usage is low: skip the week-over-week step first, then the rechecks of P1 / P7 older than today, and say what was skipped.

## Done when (completion checks)
- Success: every occurrence has a bot, a time, and evidence; every fix has a number and names what it touches; the review file and status section exist; the owner was messaged only if something was found.
- Failure: a pattern with no evidence, fixes applied before the owner answered, a message on a clean night, or a second status section.

## Example (illustrative)
Good:
- "P4 re-asking the owner: {{BRIEFING_BOT_NAME}} asked at 09:12 which vendors we use; answered on the brief-tuning question and written in Systems and connectors. Fix 2: add 'read Systems and connectors first' to its weekly brief prompt."

Bad:
- "Some bots seemed confused today. Maybe tighten the rules?" (no bot, time, evidence, pattern, or numbered fix)
