<!--
Date: {{LAUNCH_DATE}}
Tags: #business #sales
Owner: {{PROVIDER_NAME}}
Provider-internal. Delete Business/ from every client copy of this vault.
UPPER_CASE placeholders are filled once from client.env. lower_case fields such as {{prospect_first_name}}
are filled by hand for each message; fill-placeholders.sh leaves them alone on purpose.
Never add a statistic, result, or quote that was not measured or given with permission.
-->

# Customer acquisition plan

**{{PROVIDER_NAME}}** · Plan dated {{LAUNCH_DATE}} · Owner: {{PROVIDER_OWNER_NAME}} · Region served: {{PROVIDER_REGION}}

For a solo or very small provider, customers come from trust first and reach second. This plan starts with people who already know the provider, adds people who advise small businesses, and only then builds wider visibility. Everything leads to one offer: the 30-day pilot.

## 1. Ideal customer profile

| | Good fit | Not yet a fit |
|---|---|---|
| **Size** | Roughly 5-50 staff | Solo with no recurring office work, or large enough to have an IT department |
| **Who decides** | Owner, or an office manager the owner trusts | A committee with no single sponsor |
| **IT** | No in-house IT, or one person covering IT on top of another job | A team that wants to build its own automation |
| **Tools** | Email, calendar, shared files, a chat tool already in use | Mostly paper, or no shared accounts |
| **Pain** | Three or more recurring jobs done by hand each week (inbox, follow-ups, reports, updates, how-to material) | No clear repeat work |
| **Attitude** | Curious about AI, wants control and a record | Wants assistants to send and spend alone from day one |
| **Approver** | Someone willing to review drafts for the first weeks | No one with time to approve |

**Trigger events that make now a good time:** a new office manager, a key person leaving, a growth spurt, a backlog of outdated guides, a new partner channel, or a failed earlier try with an AI chat tool.

Good-fit verticals are in Business/Business plan.md section 3.

## 2. Channels, ranked for a solo or small provider

| Rank | Channel | Why here | First action |
|---|---|---|---|
| 1 | **Warm network** (past clients, employers, colleagues, friends who run businesses) | Trust already exists; fastest path to a first pilot | Day 4 of the First week plan |
| 2 | **Referrals** from early contacts and pilot clients | Each satisfied sponsor knows other owners | Ask at every readout and after every good check-in |
| 3 | **Local business groups and chambers of commerce** | Owners in one room; short talks are welcome | Join one; offer a 10-minute talk |
| 4 | **Partnerships** with managed IT providers, accountants, bookkeepers, and office-equipment dealers | They already advise the ideal customer and are asked about AI | Offer a referral arrangement ({{PARTNER_REFERRAL_TERMS}}) and a free walkthrough of the demo |
| 5 | **Industry associations** for the chosen verticals | Shared problems, newsletters, events | Offer an article or a session on "AI assistants with a record and an approver" |
| 6 | **Free workshops and lunch-and-learns** | Shows the demo live; low pressure | Run one by day 60 |
| 7 | **LinkedIn content** | Keeps the provider visible to the warm network | One plain post a week: a lesson, a demo clip, or a how-to |
| 8 | **Short demo videos** (2-3 minutes, dummy data) | Easy to forward; answers "what does it look like?" | Record the demo script as a video by day 30 |
| 9 | **Case studies after pilots** | The strongest proof, once real | Only with the client's written OK; measured numbers only |

Do not start cold advertising until channels 1-4 have been worked and the pilot converts.

## 3. The offer
**The 30-day pilot ({{PRICE_PILOT}}).** Record Keeper plus one assistant on the prospect's top job, a measured baseline, draft-only work, weekly check-ins, and a readout with a go / extend / stop decision. If the numbers do not hold, the client stops and keeps the vault. Pilot fee credit: {{PILOT_CREDIT_TERMS}}. Full terms: Sales/Pricing sheet.md.

## 4. Outreach templates
Keep every message short, personal, and free of claims you cannot show. Personalise the first line every time.

**Warm intro email**

```
Subject: Something I'm starting, and a question for you

Hi {{prospect_first_name}},

I've started {{PROVIDER_NAME}}. I set up AI assistants for small offices, done carefully:
every assistant has one job, you approve anything it sends or spends, and everything it does
is written down in a private record that you own.

I thought of you because {{personal_reason}}. Would a 30-minute call be useful to see whether
something like this would help with {{pain_point}}? If it's not a fit, I'd still value your view.

Book a time here: {{BOOKING_LINK}}, or just reply with a couple of times that suit you.

{{PROVIDER_OWNER_NAME}}
{{PROVIDER_NAME}} · {{PROVIDER_PHONE}} · {{PROVIDER_WEBSITE}}
```

**LinkedIn message**

```
Hi {{prospect_first_name}}, I've started helping small businesses set up AI assistants that
draft the routine office work (inbox, follow-ups, weekly updates), with the owner approving
anything that goes out and a written record of everything. Given {{personal_reason}}, I'd value
15 minutes of your thoughts. Open to a quick call?
```

**Follow-up (5-7 business days later, once only, then wait for a trigger)**

```
Hi {{prospect_first_name}}, just floating this back up in case it got buried. I've attached a
one-page summary. If {{pain_point}} isn't a priority right now, no problem at all. Would it be
OK if I checked back in {{follow_up_month}}?
```

**Referral ask (to an advisor, partner, or happy client)**

```
Hi {{prospect_first_name}}, a small favour. I'm looking for two or three small businesses
(roughly 5-50 people, no in-house IT) that spend too much time on repeat office work. I offer a
30-day pilot with a clear exit. Does anyone come to mind? I'm happy to send a one-pager you
can forward, and I'll keep you posted on how it goes. {{PARTNER_REFERRAL_TERMS}}
```

## 5. Discovery call script (30 minutes)
Goal: decide together whether a pilot makes sense. Listen far more than talk. The full onboarding questionnaire comes later; this is the short version.

1. **Open (2 min).** Thank them; agree the goal and the time. "By the end we'll both know whether a pilot is worth it."
2. **Their business (5 min).** What do you do, for whom? How many people? Who does the office work?
3. **Pain (8 min).** Which jobs repeat every week? Roughly how long do they take, and who does them? What falls through the cracks? What have you tried before, including AI chat tools, and why didn't it stick?
4. **Tools (4 min).** Email and calendar, files, chat, any industry software. Who owns the accounts?
5. **Comfort and boundaries (4 min).** What should an assistant never do? What information is too sensitive to touch? Who would approve drafts?
6. **Short demo (5 min, only if useful).** Show the part that matches their top pain.
7. **Close (2 min).** Summarise their top three jobs back to them. Propose the pilot or say honestly it is not a fit. Agree the next step and date.

**Qualifying questions (all should be "yes" for a pilot):**

- [ ] Are there at least two or three recurring jobs someone does by hand each week?
- [ ] Is there one person who will sponsor and approve during the pilot?
- [ ] Can the pilot users log their time for one week at the start and one week at the end?
- [ ] Can the account owner sign in to the tools the pilot needs?
- [ ] Is the budget for the pilot and the client's own Grok Bot plan available?
- [ ] Are they comfortable with draft-only work for the first weeks?

## 6. Funnel stages and metrics
Track every prospect in {{CRM_TOOL}} at one stage. Targets are set by the provider and reviewed monthly; replace with actuals as they come in.

| Stage | Moves on when | Metric | Target to set |
|---|---|---|---|
| 1. Lead | Named person added who fits the profile | Leads added / month | {{TARGET_LEADS_PER_MONTH}} |
| 2. Contacted | First personal message sent | Contact rate | {{TARGET_CONTACT_RATE}} |
| 3. Conversation | They replied | Reply rate | {{TARGET_REPLY_RATE}} |
| 4. Discovery held | Call took place | Calls held / month | {{TARGET_DISCOVERY_CALLS_PER_MONTH}} |
| 5. Pilot proposed | Written proposal sent | Proposal rate (calls → proposals) | {{TARGET_PROPOSAL_RATE}} |
| 6. Pilot started | Kickoff held | Pilot starts / month; win rate (proposals → pilots) | {{TARGET_PILOT_STARTS_PER_MONTH}}; {{TARGET_PILOT_WIN_RATE}} |
| 7. Readout | Day-30 readout held | Pilots completed | n/a |
| 8. Paid | Package signed | Pilot-to-paid conversion | {{TARGET_PILOT_CONVERSION}} |
| 9. Retained | Still a client after 3 months | Monthly churn | {{TARGET_CHURN_MONTHLY}} |

Also track by channel (which source each paid client came from), days from lead to pilot, and measured hours saved per client from their pilot time logs (never estimated).

## 7. Objection handling
Acknowledge the concern first; it is usually a fair one. Answer with how the service works, not with promises.

| Objection | Response |
|---|---|
| **"Is it secure? What about our data?"** | "Fair question. You sign in to each tool yourself, and we connect only what the job needs, read-only wherever possible. Passwords stay in your password manager; the record only says where each one lives. Sensitive systems such as payroll or banking stay off-limits unless you decide otherwise in writing. We get the AI vendor's data terms for your plan in writing before we start. The record lives in a private repository that you own." |
| **"What does it cost?" / "It's too expensive."** | "The pilot is {{PRICE_PILOT}} and your Grok Bot plan is billed to you directly. During the pilot we measure your real time on the piloted jobs, before and after, using your own hourly rates, so you can see whether it pays for itself. If the numbers don't hold, you stop." |
| **"We already use ChatGPT (or another AI chat tool)."** | "Good, so you know what these tools can do. The difference here is the setup around the assistant: a written record you own, assistants with one job each, routines that run on a schedule, and approval rules. Keep using whatever you like for one-off questions; this is for the repeat office work." |
| **"AI makes mistakes."** | "It does, and we plan for it. For the first weeks the assistants only draft and you approve. Reports show their sources and mark anything unconfirmed. Mistakes get written up with a fix, and corrections are added as new dated lines so nothing is quietly changed." |
| **"We don't have time to adopt something new."** | "That's the usual reason the work piles up. Your part is one discovery conversation, a week of simple time logging at the start and end, a 30-minute walkthrough, and reading drafts during the first weeks. We do the setup, and we add one assistant at a time." |
| **"What if we want to stop?"** | "You keep the record and the accounts. We remove our access and the assistants' access, and everything that was built is documented in your vault." |
| **"Can it just handle things on its own?"** | "Routine cases can run on their own after the handover, once you're comfortable. Anything that sends, spends, publishes, deletes, or changes access always waits for you." |

## 8. 30/60/90-day acquisition cadence

| Period | Weekly rhythm | Goals (targets to set) |
|---|---|---|
| **Days 1-30: warm start** | 10-15 personal messages, 3-5 referral asks, 1 LinkedIn post, follow-ups on schedule, every reply answered within a business day | {{TARGET_DISCOVERY_CALLS_DAY_30}} discovery calls; {{TARGET_PILOTS_DAY_30}} pilots signed or started; 2-3 partner conversations; demo video recorded |
| **Days 31-60: widen** | Keep the warm rhythm; one partner meeting a week; one local group or association event; weekly pilot check-ins | First readout held; first referral arrangement agreed; one workshop or lunch-and-learn run; outreach templates tuned from replies |
| **Days 61-90: proof and referrals** | Ask every pilot sponsor for a referral at readout; publish a case study only with written OK and measured numbers; review the funnel by channel | {{TARGET_PAID_CLIENTS_DAY_90}} paying clients; first case study; double down on the two best channels, drop the weakest |

**Every Friday:** update the tracker, count each funnel stage, note one thing to change, and list the decisions waiting on {{PROVIDER_OWNER_NAME}}.
