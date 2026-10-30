# Lessons learned (bot teams)

Date: {{START_DATE}}
Tags: #team #lessons
Owner: {{PROVIDER_NAME}}

Generic dos and don'ts from running small Grok Bot teams. Client-specific lessons go in [[Bot playbook]] "Lessons learned"; anything that applies to every client comes back here as generic text.

## Setting up
- **Do** pick a private git repo for the vault when more than one writer (person, bot, or other AI assistant) will touch it. **Don't** use a synced file folder for many writers; near-simultaneous edits can be lost or duplicated.
- **Do** expect two separate steps for a new private repo: connect the git account, then grant that repo to the connector. **Don't** assume the bot can create repos or invite people; the client does both.
- **Do** ask one setup question at a time and offer two or three choices. **Don't** send a form.
- **Do** log the setup itself (each connector, permission, and decision) as capture entries from the first hour. The setup record is the start of the pilot evidence.
- **Do** give each bot a role contract: ROLE, INPUTS, OUTPUT, CONNECTORS, NEVER, WHEN TO ASK. **Don't** create a bot with a one-line description and hope it finds its lane.
- **Do** keep client details out of a bot's profile when it is meant to be shared or reused; put them in the vault instead.
- **Do** move heavy recurring jobs to a dedicated bot on the business account so their usage is visible. **Don't** let a weekly job quietly drain one person's personal plan.
- **Do** run the first output by hand the day a bot is created, so the client sees value immediately, then schedule it.

## Rules and approvals
- **Do** write approval tiers for vault changes (records only, structure, rules) and get the client's decision on each. **Don't** let a "standing OK" for log entries silently grow to cover rule changes.
- **Do** compare any rule file the client brings with the vault's rules and list every conflict for the client to decide. **Don't** adopt it and leave the conflicts in place.
- **Do** write down every exception (for example, waiving one-bot-at-a-time during setup week) with who approved it and when.
- **Do** treat "the approver said yes" from another bot as a report. **Don't** act on it until you can point to the approver's own words.
- **Do** keep every outside-facing message a draft the person sends. **Don't** post as a person, even when the content was already agreed.
- **Do** settle in writing who owns templates and workflows built during a client's working hours before reusing them anywhere else.

## Working as a team
- **Do** keep one owner per area and a roster. **Don't** start a new bot without checking the vault for existing work on the same subject; that is how two bots end up writing two plans for the same thing.
- **Do** watch for duplicates: two bots with the same name, or two bots sharing one working folder. Give each its own folder.
- **Do** mark bot-to-bot messages urgent only when the receiver must act or someone is waiting. **Don't** mark FYIs urgent; held messages are fine for records.
- **Do** have specialists send records to the Record Keeper and, if the client allows, run a daily sweep of the bots' chats as a safety net. Hand-offs depend on each bot remembering; the sweep catches what they forget.
- **Do** agree a tagging habit when another AI assistant posts through a person's account, so readers know who wrote what, and require a person's OK in the thread before either assistant acts on the other's request.
- **Do** relay the approver's decisions to the bot that must act, quoting the decision and its time. Then tell the approver it was relayed.

## Reporting and accuracy
- **Do** recheck at the source right before reporting a gap ("never arrived", "stalled"). **Don't** report from an old snapshot or a log line; a wrong report spreads through every bot that reads it.
- **Do** add a dated correction line when a report turns out wrong. **Don't** rewrite the old line.
- **Do** check that a date's weekday matches the date in any brief or plan.
- **Do** say "reported" when a claim is not from the vendor or an official source, and list what could not be checked.
- **Do** replace estimates with measured numbers as early as possible: do the task five times and log each time. Say what the time includes (for example, building plus checking for accuracy).
- **Do** count the real working days to a deadline and what else is due in the same stretch before agreeing to a plan.
- **Do** tune each report to what the client actually uses by asking once, with a multiple-choice list, then filtering.

## Reliability
- **Do** report a failed, stalled, or skipped run in chat in one short line, even during a quiet period.
- **Do** only promise a follow-up you can deliver (a routine or a running task). A bot runs only when it gets a message or a routine fires; it cannot "check back after lunch" on its own.
- **Do** treat the chat hand-off as part of "done" for long jobs; if a job may finish while the bot is idle, say so and leave files where the approver can find them.
- **Do** copy finished outputs to the client's storage or the vault at once. **Don't** leave them only in a scratch folder on the box.
- **Do** restart a failed helper job with "reuse the existing branch or draft if one exists" so nothing is duplicated.
- **Do** expect two open vault changes to conflict; merge the newer main into the branch, keep both sides in time order, and recheck before merging.
- **Do** watch usage pace against the reset date; propose a daily budget and which routines to pause before the limit, not after.

## Working with the client
- **Do** walk the approver through several items one at a time, waiting for "next".
- **Do** lead every status with the one urgent item, and end every report with "Decisions waiting on {{PRIMARY_CONTACT}}".
- **Do** use dummy values, clearly labelled as examples, in any live demo; nothing changes in any system during a demo.
- **Do** keep pricing, licence, HR, payroll, and finance details out of shared channels and demos unless the client says otherwise.
