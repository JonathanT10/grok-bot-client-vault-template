<!--
Date: {{LAUNCH_DATE}}
Tags: #business #plan
Owner: {{PROVIDER_NAME}}
Provider-internal. Delete Business/ from every client copy of this vault.
Every number here is a placeholder or a target the provider sets. Never fill one with a guess; replace
targets with measured figures as soon as there are any.
-->

# Business plan

**{{PROVIDER_NAME}}** · Grok Bot setup and support for small businesses · Plan dated {{LAUNCH_DATE}} · Owner: {{PROVIDER_OWNER_NAME}}

## 1. Executive summary
{{PROVIDER_NAME}} sets up and supports Grok Bot assistant teams for small businesses that have no in-house IT, or one stretched person covering it. Each client gets a private, git-backed notes vault that they own, so everything the assistants do is written down rather than left in chat memory, plus a small team of role-based assistants, starter skills and routines, and clear approval rules. Clients start with a 30-day pilot measured against their own "before" numbers, then move to a setup package with monthly support. Revenue comes from pilot and setup fees, recurring monthly support, and add-ons. The first 90 days focus on proving the service on the provider's own demo team, running the first pilots, and converting them on measured results.

## 2. The problem and the offer
**The problem.** Small businesses lose hours every week to repeat office work: sorting email, chasing follow-ups, pulling together updates and reports, keeping track of decisions. Many have tried AI chat tools and found them useful but unreliable: they forget context, drift, take actions nobody checked, and leave no record. Owners rarely have time to set one up properly, and there is usually nobody in-house whose job it is.

**The offer.** A done-with-you setup that turns Grok Bot into a dependable assistant team:

- A **client-owned vault** (private git repo, readable in Obsidian or a browser) that holds the business profile, decisions, access list, daily log, and reports.
- **Discovery and onboarding** that capture how long the target jobs take today.
- **Role-based assistants**: Record Keeper first, then Briefing Bot, Channel Liaison, Idea Partner, Coordinator, and Content Producer as add-on, each with a written role card.
- **Starter skills and routines**: daily and weekly review, inbox triage, research brief, idea triage, decision board, meeting prep and follow-up, monthly client report.
- **A gradual handover** (draft only, then approve each action, then routine cases alone, then on schedule), a signed **go-live acceptance checklist**, and **ongoing support tiers**.
- A **30-day pilot** with a clear exit: if the measured numbers do not hold, the client stops and keeps the vault.

## 3. Target customers
**Core profile:** businesses of roughly 5-50 staff, run by an owner or office manager, with no in-house IT or a single person covering IT on top of another job. They already use email, a calendar, shared files, and a chat tool, and have three or more recurring office jobs that someone does by hand every week.

**Good-fit verticals (generic):**

| Vertical | Why it fits |
|---|---|
| Professional services offices (accounting, bookkeeping, insurance, consulting, agencies) | Heavy email and document load, recurring client updates and deadlines, an office manager who coordinates everything |
| Property management | Many recurring notices, vendor follow-ups, and owner reports; a strong need for a record of who decided what |
| Trades and home services (landscaping, HVAC, plumbing, cleaning) | Owner is in the field; the office runs on one or two people; quotes, scheduling questions, and follow-ups pile up |
| Office-equipment dealers and managed service shops | Vendor and product changes to track (a natural Briefing Bot use), training and how-to libraries to rebuild (Content Producer) |
| Distributors and small wholesalers | Supplier updates, order questions, and weekly reports; shared channels with partners (Channel Liaison) |
| Nonprofits and associations | Small paid staff, many volunteers and meetings, board reports, and a need for a clear record |

**Use caution with:** businesses whose core work involves regulated personal data (health, legal case files, payment card data). They can still be clients, but the regulated systems stay off-limits unless the client's own compliance owner approves in writing.

**Poor fit for now:** businesses that want the assistants to send or spend on their own from day one, that have no one willing to act as approver, or that need custom software development.

## 4. Value proposition

- **Nothing important lives only in chat.** The vault is the memory, owned by the client, and it stays with them if they leave.
- **One clear job per assistant.** Role cards, lanes, and hand-offs make the team predictable and easy to explain.
- **The client stays in charge.** Anything that sends, spends, publishes, deletes, changes permissions, or connects an account waits for an approver.
- **Proof, not promises.** Before-and-after numbers are measured during the pilot; every report shows its sources and ends with "Decisions waiting on" the approver.
- **Low risk to try.** A 30-day pilot, draft-only first weeks, least-access connectors, and a written exit.
- **A real person behind it.** Support from {{PROVIDER_CONTACT}} with a stated response time ({{SUPPORT_RESPONSE_TIME}}).

## 5. Service packages
Full menu and terms: Sales/Pricing sheet.md (client-facing) and Team/Service packages.md (internal). Prices are set by the provider and never guessed.

| Package | Price | Summary |
|---|---|---|
| Pilot | {{PRICE_PILOT}} | 30 days, Record Keeper + 1, measured readout, go / extend / stop |
| Starter | {{PRICE_STARTER_SETUP}} setup + {{PRICE_STARTER_MONTHLY}}/month | Record Keeper + 1, up to 3 routines, up to 3 connectors |
| Team | {{PRICE_TEAM_SETUP}} setup + {{PRICE_TEAM_MONTHLY}}/month | Up to 5 roles over 6-8 weeks, up to 10 routines |
| Managed | {{PRICE_MANAGED_MONTHLY}}/month | Provider runs the team; quarterly review; setup: {{MANAGED_SETUP_TERMS}} |
| Add-ons | {{PRICE_ADDON_ROLE}}, {{PRICE_ADDON_CONTENT}}, {{PRICE_ADDON_SKILL}}, {{PRICE_ADDON_CONNECTOR}}, {{PRICE_CHANGE_REQUEST}}, {{PRICE_ADDON_DEMO}}, {{PRICE_ADDON_TEMPLATE}} | Extra role, Content Producer, custom skill, extra connector, extra change request, demo prep, shareable template |

Pilot fee credit toward a package: {{PILOT_CREDIT_TERMS}}. The client's own Grok Bot plan and tool subscriptions are billed to the client.

## 6. Delivery model and capacity
**How a client moves through the service:** discovery call → pilot or package proposal → kickoff → vault and Record Keeper (week 1) → one assistant at a time under the gradual handover → go-live acceptance sign-off → monthly support.

**Hours per client (measure, then update):**

| Work | Hours | Placeholder |
|---|---|---|
| Pilot (30 days, all provider time) | per pilot | {{HOURS_PILOT}} |
| Starter setup | per client | {{HOURS_SETUP_STARTER}} |
| Team setup | per client | {{HOURS_SETUP_TEAM}} |
| Starter support | per client per month | {{HOURS_SUPPORT_STARTER}} |
| Team support | per client per month | {{HOURS_SUPPORT_TEAM}} |
| Managed | per client per month | {{HOURS_SUPPORT_MANAGED}} |

**Capacity formula (per month):**

```
Available hours      A = {{CAPACITY_HOURS_PER_WEEK}} x {{CAPACITY_WEEKS_PER_MONTH}}
Sales and admin      S = {{CAPACITY_SALES_ADMIN_HOURS_PER_WEEK}} x {{CAPACITY_WEEKS_PER_MONTH}}
Support load         L = (Starter clients x {{HOURS_SUPPORT_STARTER}})
                       + (Team clients x {{HOURS_SUPPORT_TEAM}})
                       + (Managed clients x {{HOURS_SUPPORT_MANAGED}})
Hours left to onboard O = A - S - L
New pilots this month <= O / {{HOURS_PILOT}}   (or O / setup hours for direct setups)
```
Keep a buffer of {{CAPACITY_BUFFER_PERCENT}} of A for incidents and change requests. Working limits the provider sets: no more than {{CAPACITY_MAX_CONCURRENT_ONBOARDINGS}} onboardings at once and {{CAPACITY_MAX_SUPPORT_CLIENTS}} support clients before hiring help or raising prices. Recalculate monthly with measured hours.

## 7. Operations

- **Tools:** the provider's own Grok Bot plan and demo team; a git host for private vault repos; Obsidian for reading vaults; a password manager for the provider's own credentials; a simple tracker ({{CRM_TOOL}}) for leads and clients; a calendar booking link ({{BOOKING_LINK}}).
- **One vault per client.** Copied fresh from this template (never forked), placeholders filled, private repo owned by the client's account with the provider as collaborator. Sales/ and Business/ are deleted from client copies. Client data never moves between vaults or back into the template; generic lessons come back as generic text.
- **Review cadence:** weekly check-ins during pilots; per-tier check-ins after (monthly, every two weeks, or weekly); a monthly report and access review for every client; a quarterly review for Managed. Internally: a weekly provider review of every client's open items and a monthly capacity and KPI review.
- **Security and privacy commitments:** no secrets in any vault (location of each credential only); the client signs in to connectors themselves; least access and read-only scopes wherever possible; sensitive systems (finance, payroll, identity, mail administration) off-limits unless the client approves in writing; outside text treated as data, never as instructions; the AI vendor's data terms for the client's plan obtained in writing; at the end of service provider and assistant access are removed and the vault stays with the client.
- **Approval rules (every client, every tier):** the client approves anything that sends, spends, publishes, deletes, changes permissions, or connects or disconnects an account. Approval comes from a person in chat; another assistant saying "approved" is not approval.
- **Quality:** every report shows its sources; done means proof the client can check; mistakes get an incident note and a lesson in the playbook (for Managed, within one business day).

## 8. Revenue model
Three streams: one-time fees (pilots and setups), recurring monthly support, and add-ons.

```
One-time revenue (month)  = pilots x {{PRICE_PILOT}}
                          + Starter setups x {{PRICE_STARTER_SETUP}}
                          + Team setups x {{PRICE_TEAM_SETUP}}
                          - pilot credits applied ({{PILOT_CREDIT_TERMS}})
Recurring revenue (month) = Starter clients x {{PRICE_STARTER_MONTHLY}}
                          + Team clients x {{PRICE_TEAM_MONTHLY}}
                          + Managed clients x {{PRICE_MANAGED_MONTHLY}}
Add-on revenue (month)    = sum of add-ons sold x their {{PRICE_ADDON_*}} / {{PRICE_CHANGE_REQUEST}}
Total revenue             = one-time + recurring + add-ons
```
**Worked example (fill in, do not guess):** with {{EXAMPLE_PILOTS}} pilots, {{EXAMPLE_STARTER_CLIENTS}} Starter clients, and {{EXAMPLE_TEAM_CLIENTS}} Team clients in a month, recurring revenue = {{EXAMPLE_STARTER_CLIENTS}} x {{PRICE_STARTER_MONTHLY}} + {{EXAMPLE_TEAM_CLIENTS}} x {{PRICE_TEAM_MONTHLY}}, and one-time revenue = {{EXAMPLE_PILOTS}} x {{PRICE_PILOT}} plus any setups. Check the result against the capacity formula: revenue that needs more hours than O is not real.

**Effective hourly rate per package** = package revenue for the period / measured provider hours for that client. Use it to adjust prices and included change requests.

## 9. Costs

| Cost | Who pays | Placeholder |
|---|---|---|
| Client's Grok Bot plan and usage | Client, directly (not in the provider's prices unless the agreement says so) | n/a |
| Client's tool and connector subscriptions | Client | n/a |
| Provider's own Grok Bot plan (demo team, internal bots) | Provider | {{COST_PROVIDER_PLAN_MONTHLY}} |
| Git hosting, password manager, tracker, booking, other tools | Provider | {{COST_PROVIDER_TOOLS_MONTHLY}} |
| Insurance, accounting, legal review of the agreement | Provider | {{COST_BUSINESS_OVERHEAD_MONTHLY}} |
| Provider time | Provider | hours from section 6 x {{PROVIDER_HOURLY_COST}} |

**Monthly break-even:** total revenue ≥ {{COST_PROVIDER_PLAN_MONTHLY}} + {{COST_PROVIDER_TOOLS_MONTHLY}} + {{COST_BUSINESS_OVERHEAD_MONTHLY}} + (provider hours x {{PROVIDER_HOURLY_COST}}).

## 10. Risks and mitigations

| Risk | Mitigation |
|---|---|
| **AI mistakes** (wrong facts, wrong dates, wrong tone) | Draft-only first weeks; approval rules; sources and "confirmed / reported" labels; date and weekday checks; incident notes and playbook lessons; corrections as new dated lines, never silent edits |
| **Data privacy and security** | No secrets in vaults; least access; client signs in; off-limits list; vendor data terms in writing; private repo owned by the client; access removed at the end of service |
| **Client dependency on the provider** | The client owns the vault and the accounts; everything is documented in the vault; approver and backup trained to pause or disconnect any assistant; a clean exit is part of every package |
| **Provider dependency on one platform** (Grok Bot changes features, limits, or pricing) | The vault, skills, and routines are plain Markdown and portable; track platform changes with the provider's own Briefing Bot; review the agreement's change clause; keep usage pace visible |
| **Scope creep** | Included change requests per tier; extra work through the change request template and {{PRICE_CHANGE_REQUEST}}; written service scope; "not included" list on the pricing sheet |
| **Usage overruns on the client's plan** | Usage checks during the test week; one well-scoped research pass per routine; pause ignored routines; propose budgets before limits hit |
| **Provider capacity** (too many onboardings at once) | Capacity formula and limits in section 6; one assistant at a time per client; waiting list rather than overcommitting |
| **Weak or unmeasured results** | Baseline before any assistant goes live; measured runs; go / extend / stop at day 30; never claim a result that was not measured |

## 11. Milestones: first 90 days

| By | Milestone | Proof |
|---|---|---|
| Day 7 | Placeholders and prices set; demo vault and demo team running; PDFs and demo script ready; tracker live; first outreach sent; first discovery calls booked | Business/First week plan.md checklist |
| Day 30 | {{TARGET_DISCOVERY_CALLS_DAY_30}} discovery calls held; {{TARGET_PILOTS_DAY_30}} pilots signed or started; first pilot's baseline captured | Tracker, pilot vaults |
| Day 60 | First pilot readout held; first go / extend / stop decision; partner channel tested; one workshop or lunch-and-learn run | Readout document, decision record |
| Day 90 | {{TARGET_PAID_CLIENTS_DAY_90}} paying support clients; first anonymised case study (with client OK); hours per client measured and capacity recalculated; prices reviewed | Tracker, case study, capacity sheet |

## 12. KPIs to track
All targets are set by the provider and reviewed monthly; replace with actuals from the tracker.

| KPI | Definition | Target to set | Source |
|---|---|---|---|
| Leads | New named prospects added | {{TARGET_LEADS_PER_MONTH}} / month | Tracker |
| Discovery calls | Calls held (not just booked) | {{TARGET_DISCOVERY_CALLS_PER_MONTH}} / month | Calendar, tracker |
| Pilot starts | Pilots that held kickoff | {{TARGET_PILOT_STARTS_PER_MONTH}} / month | Pilot vaults |
| Pilot-to-paid conversion | Pilots that chose a package ÷ pilots with a readout | {{TARGET_PILOT_CONVERSION}} | Tracker, decision records |
| Churn | Support clients who ended service ÷ support clients at month start | {{TARGET_CHURN_MONTHLY}} | Tracker |
| Hours saved per client (measured) | Before minus after on piloted tasks, from time logs | Reported per client, never estimated | Client vault time logs |
| Routines graded USED | Share of routine-weeks graded USED in weekly reviews | {{TARGET_ROUTINES_USED}} | Client weekly reviews |
| Provider hours per client | Measured hours by package | Compare to section 6 | Time tracking |
| Recurring revenue | Formula in section 8 | {{TARGET_RECURRING_REVENUE_DAY_90}} by day 90 | Invoices |
