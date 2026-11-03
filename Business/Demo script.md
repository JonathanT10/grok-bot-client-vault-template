<!--
Date: {{LAUNCH_DATE}}
Tags: #business #sales #demo
Owner: {{PROVIDER_NAME}}
Provider-internal. Delete Business/ from every client copy of this vault.
Uses only the fictional demo vault in Business/Demo vault/ (example data, never a real client).
Prices come only from Sales/Pricing sheet.md and Team/Service packages.md; never say a number that is not filled there.
-->

# Demo script (about 5 minutes 45 seconds)

**{{PROVIDER_NAME}}** · Live demo for a small-business owner or office manager · Presenter: {{PROVIDER_OWNER_NAME}}

A short, calm demo that shows four things: the record is real, the assistants know what is open, their research names its sources, and nothing goes out without the owner's OK. It runs on the **fictional demo vault** for *Example Landscaping LLC* (see `Business/Demo vault/README.md`). Say once, early, that it is made-up example data. Rehearse twice and time it; if a step runs long, cut talk, not the approval step.

## Before the call (10 minutes)

- [ ] Demo vault copied out and open in Obsidian (or the repo in a browser), folder tree collapsed except Daily/, Decisions/, Reference/, Reports/
- [ ] Tabs open in this order: `Daily/2026-03-04.md`, `Decisions/2026-03-02-crew-schedule-draft-every-friday.md`, `Reference/Access list.md`, `Reports/Briefs/2026-03-02 Weekly brief.md`, the demo team's chat
- [ ] Demo Record Keeper and Briefing Bot running on the demo vault; one test question asked today so nothing is cold
- [ ] Fallback screenshots of every step in one folder, in step order
- [ ] Pricing sheet PDF ready to attach; booking link ({{BOOKING_LINK}}) ready to paste
- [ ] Notifications off; no real client, prospect, or personal tab, file, or chat visible anywhere on screen

## The script

| Time | Step | Say (talk track) | Show on screen |
|---|---|---|---|
| 0:00-0:30 | 1. The problem | "You told me the week goes to email, chasing follow-ups, and remembering who decided what. AI chat can help, but it forgets and leaves nothing you can check. Here is what it looks like when it writes everything down. This is a made-up landscaping business, so every name and number is example data." | Your face or a blank slide. Nothing else yet. |
| 0:30-1:30 | 2. The record | "This is the business's own notes vault. It is theirs, in a private repo. Every day gets one note. Here is a decision with the context, the call, and why. And here is the access list: it says *where* each password lives and who owns it, never the password itself." | `Daily/2026-03-04.md` (scroll Log and Decisions), then the decision record (Context, Decision, Why), then `Reference/Access list.md` (point at the "Where the credential lives" column). |
| 1:30-2:50 | 3. What is open | Type: *"What's open this week, and what's waiting on Alex?"* While it answers: "It reads the record, not its memory. Every item links to where it lives, and it always ends with what is waiting on the owner, even if that is 'None'." | The Record Keeper's chat answer. Then the "Open" and "Decisions waiting on" sections of the Daily note to show it matches. |
| 2:50-4:10 | 4. A sourced brief | "Every Monday this assistant writes a short brief on the things this business tracks. Each item says what changed, why it matters here, what to do, and a source link, and it says whether that is *confirmed* or only *reported*. At the bottom it lists what it could not check." | `Reports/Briefs/2026-03-02 Weekly brief.md`: first line (most urgent item), one item's labels and source link, the "Could not check" line. |
| 4:10-5:10 | 5. Approval first | Type: *"Send the crew schedule to the crew leads."* "Watch: it does not send. It asks, in the same five parts every time: action, target, reason, cost, consequences. The owner says yes in chat or nothing happens. Anything that sends, spends, publishes, deletes, or connects an account works this way." | The approval request in chat (ACTION / TARGET / REASON / COST / CONSEQUENCES). Do **not** approve it live. Fallback: the "Waiting on approval" section of the Daily note. |
| 5:10-5:45 | 6. The pilot ask | "The way to try this is a 30-day pilot: the Record Keeper plus one assistant on your top job, weekly check-ins, before-and-after numbers we measure rather than guess, and a readout where you decide go, extend, or stop. The pilot is {{PRICE_PILOT}}. {{PILOT_CREDIT_TERMS}} If the numbers do not hold, we stop and the record is yours. Can we book a 30-minute discovery call this week to pick your top job?" | The pilot section of the pricing sheet, then the booking link. Stop talking after the question. |

## The pilot ask (say it as written)

- **What:** 30-day pilot, Record Keeper plus one assistant on the prospect's top job, weekly check-ins on {{REVIEW_DAY}}, a measured readout, and a go / extend / stop decision. Details: Team/Pilot program.md.
- **Price:** {{PRICE_PILOT}}. {{PILOT_CREDIT_TERMS}} Prices in {{CURRENCY}}, effective {{PRICE_EFFECTIVE_DATE}}; quote valid {{QUOTE_VALID_DAYS}} days.
- **Next step:** a 30-minute discovery call ({{BOOKING_LINK}}). Offer two specific times before the call ends.
- **Do not** promise hours saved. If asked, say the pilot measures it; quote {{CLAIM_HOURS_SAVED}} only if it is filled from a real, shareable pilot readout, otherwise leave it out.

## Likely questions

| Question | Short answer | Point to |
|---|---|---|
| "Is my data safe? Who sees it?" | The vault is a private repo the business owns. Passwords stay in the password manager; the vault only says where they live. Access is least-privilege and logged. The AI vendor's retention and training terms for your plan are collected in writing during kickoff. | `Reference/Access list.md`, Team/Pilot program.md "Security plan" |
| "Can it send email or pay bills on its own?" | No. Anything that sends, spends, publishes, deletes, changes permissions, or connects an account waits for your OK in chat, at every stage. | Step 5; GROK.md "Approvals" |
| "What if it gets something wrong?" | Its work is drafted first, every claim names a source, and new routines go week 1 draft only, week 2 you OK each action, week 3 routine cases alone, week 4 on schedule with a weekly summary. Mistakes become written lessons. | Daily note, Decision record |
| "How much time will it save us?" | We measure that in the pilot against a one-week "before" log, and you see the numbers at the readout. No guesses up front. | Monthly report sample in the demo vault |
| "What does it cost after the pilot?" | Starter is {{PRICE_STARTER_SETUP}} setup plus {{PRICE_STARTER_MONTHLY}} a month; Team is {{PRICE_TEAM_SETUP}} plus {{PRICE_TEAM_MONTHLY}} a month; Managed is {{PRICE_MANAGED_MONTHLY}} a month. Your Grok Bot plan and tool subscriptions are billed to you directly. | Sales/Pricing sheet.md |
| "Do we need to change our tools?" | No. We connect only what you already use and need, one at a time, and you sign in yourself. | Reference/Systems and connectors.md |
| "What if we stop?" | The vault stays with you; our access is removed. {{CANCELLATION_NOTICE}} | Sales/Pricing sheet.md terms |
| "Is this the real business?" | No. It is a fictional example with made-up data. We never show one client's data to another. | `Business/Demo vault/README.md` |

## If something breaks live

- An assistant is slow or errors: "That's the live part; here is the same step from this morning," and show the fallback screenshot. Keep the clock.
- A prospect asks to see their own data: decline for now; offer the discovery call and the pilot kickoff, where their own vault is set up.
- Running long: shorten step 4 to the first item only. Never skip step 5 or the ask.

## After the call (same day)

- [ ] Tracker ({{CRM_TOOL}}) updated: stage, next step, date
- [ ] Follow-up sent with the pricing sheet PDF and two call times
- [ ] One line on what to change in this script, added to the provider's Daily note
