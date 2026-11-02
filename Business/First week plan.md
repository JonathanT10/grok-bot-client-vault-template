<!--
Date: {{LAUNCH_DATE}}
Tags: #business #launch
Owner: {{PROVIDER_NAME}}
Provider-internal. Delete Business/ from every client copy of this vault.
Check a box only when the deliverable exists and you can point to it (a file, a link, a tracker row).
-->

# First week plan

**{{PROVIDER_NAME}}** · Launch week starting {{LAUNCH_DATE}} · Owner: {{PROVIDER_OWNER_NAME}}

The goal for week one: by Friday the service is real enough to sell. Prices are set, the provider runs its own assistant team on its own vault (dogfooding), the sales PDFs and a short demo are ready, a prospect list exists, warm outreach has gone out, and the first discovery calls are on the calendar. Plan for about {{CAPACITY_HOURS_PER_WEEK}} hours this week; if a day runs long, move the lowest item to the catch-up block, not the next morning's first hour.

## Day 1: Decide the numbers and fill the placeholders
**Deliverables:** a filled provider env file, final prices, a provider copy of the Sales docs.

- Decide every price in Team/Service packages.md: {{PRICE_PILOT}}, setup and monthly prices for each tier, and each add-on. Write down the reasoning (target hours per package × {{PROVIDER_HOURLY_COST}}, plus margin) in a decision record.
- Decide the terms: {{PILOT_CREDIT_TERMS}}, {{PAYMENT_TERMS}}, {{MINIMUM_TERM}}, {{CANCELLATION_NOTICE}}, {{SUPPORT_RESPONSE_TIME}}, {{SUPPORT_HOURS}}.
- Copy the template to a provider working folder, copy `client.env.example` to `client.env`, fill the provider section, and run `./scripts/fill-placeholders.sh client.env`, then `--check`.
- Draft the service agreement outline from Reference/Service scope.md; book a legal review if one is needed.
- Set up the tracker ({{CRM_TOOL}}). A spreadsheet is enough: name, business, vertical, size, source, warm or cold, stage, last contact, next step and date, notes.

**Done when:**

- [ ] Every `{{PRICE_*}}` value decided and recorded in a decision record
- [ ] Provider env filled; `--check` on the provider copy shows only fields left blank on purpose
- [ ] Agreement outline drafted
- [ ] Tracker created with the stage list from the Customer acquisition plan

## Day 2: Build the demo vault and demo team (dogfooding)
**Deliverables:** {{DEMO_VAULT_REPO}} live, a Record Keeper and one or two more assistants running on the provider's own work.

- Create the demo vault from this template for the provider's own business (or a clearly labelled fictional example business with dummy data only). Private repo: {{DEMO_VAULT_REPO}}.
- Launch the Record Keeper first: role card from Team/Roles/Record Keeper.md, read GROK.md first, daily and weekly review routines in draft mode.
- Add a Briefing Bot on a topic the provider really needs (for example platform changes and small-business tool news) and an Idea Partner for the provider's own plans.
- Run each assistant's first output by hand the same day. Log every step as the client would see it.
- Start a provider time log now: it becomes the first measured "before / after" story.

**Done when:**

- [ ] Demo vault exists, is private, and has its first commits
- [ ] Record Keeper role card confirmed; first daily review delivered
- [ ] At least one more assistant created and its first output delivered
- [ ] No real client or prospect data anywhere in the demo vault

## Day 3: Sales materials and demo script
**Deliverables:** final one-pager and pricing PDFs, a 5-6 minute demo script, a one-page discovery call guide.

- Render Sales/Pitch one-pager.md and Sales/Pricing sheet.md with the filled values; read both aloud; fix anything that sounds like hype. Remove the optional measured-result line until there is a real one.
- Write the demo script (rehearse twice, time it):
  1. (30 sec) The problem in the prospect's words.
  2. (60 sec) Open the demo vault: the daily note, a decision record, the access list showing where credentials live but no values.
  3. (90 sec) Ask the Record Keeper for the week's open items; show the "Decisions waiting on" section.
  4. (90 sec) Show a Briefing Bot brief with sources and "confirmed / reported" labels.
  5. (60 sec) Ask an assistant to send something; show it asks for approval first in the ACTION / TARGET / REASON / COST / CONSEQUENCES format.
  6. (30 sec) The pilot offer and the next step.
- Keep a screenshot of every demo step as a fallback.
- Print or save the discovery call guide from the Customer acquisition plan.

**Done when:**

- [ ] Both PDFs final and saved where they can be attached
- [ ] Demo rehearsed twice, under 6 minutes, screenshots saved
- [ ] Discovery call guide ready

## Day 4: Prospect list and warm outreach
**Deliverables:** 25-50 named prospects in the tracker; first warm messages sent.

- List everyone in the warm network who owns, manages, or advises a small business: past clients and employers, colleagues, friends, local business owners, accountants and bookkeepers, IT and office-equipment contacts.
- Add 25-50 prospects that fit the ideal customer profile (5-50 staff, no in-house IT or a stretched office manager). Tag each with vertical, source, and warm or cold.
- Pick the top 10-15 warm contacts and send the warm intro email or LinkedIn message from the Customer acquisition plan, personalised in one or two lines each.
- Send 3-5 referral asks to people who know many small business owners (accountants, bookkeepers, IT providers).
- Post one short, plain LinkedIn note about launching the service (what it is, who it is for, the pilot).

**Done when:**

- [ ] 25-50 prospects in the tracker with a stage and a next step
- [ ] 10-15 warm messages sent and logged
- [ ] 3-5 referral asks sent
- [ ] One launch post published

## Day 5: Book calls, follow up, review the week
**Deliverables:** first discovery calls on the calendar; end-of-week review written.

- Reply to every response within the business day; offer two or three call times or the booking link ({{BOOKING_LINK}}).
- Send the first follow-up to anyone who opened a conversation but has not booked.
- Run a practice discovery call with a friendly contact using the call guide; note what to change.
- Write the week's review in the provider's Daily note, using the checklist below.

**Done when:**

- [ ] First discovery calls booked (target to set: {{TARGET_FIRST_WEEK_CALLS}})
- [ ] Every reply answered; follow-ups scheduled in the tracker
- [ ] Practice call done and the guide updated
- [ ] End-of-week review written

## Weekend or catch-up block

- Finish anything that slipped, in this order: tracker accurate → follow-ups scheduled → demo working → materials polished.
- Read the demo team's weekly review; grade each routine USED, REWORKED, or IGNORED; pause anything ignored.
- Rest. The service is sold on calm, reliable follow-through, which does not survive a seven-day week.

## End-of-week review checklist

- [ ] Prices, terms, and the agreement outline are decided and written down
- [ ] Demo vault and demo team ran all week; their output was actually used by the provider
- [ ] Provider time log started; first measured comparison noted (or "not enough data yet")
- [ ] PDFs final; demo rehearsed and timed
- [ ] Prospects in tracker: ___ (target 25-50); warm messages sent: ___; referral asks: ___
- [ ] Replies: ___; discovery calls booked: ___; held: ___
- [ ] What worked, what did not, and one change for next week
- [ ] Next week's top three actions, each with a date
- [ ] Decisions waiting on {{PROVIDER_OWNER_NAME}}: (list, or "None")
