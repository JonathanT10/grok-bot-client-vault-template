# Pilot program (30 days)

Date: {{START_DATE}}
Tags: #team #pilot
Client: {{CLIENT_NAME}}
Pilot sponsor: {{PRIMARY_CONTACT}}
Provider: {{PROVIDER_NAME}}
Pilot dates: {{PILOT_START_DATE}} to {{PILOT_END_DATE}}; readout {{PILOT_READOUT_DATE}}

A generic 30-day trial of a small Grok Bot team, built so the client can decide go / no-go on evidence instead of impressions. Run it on top of the normal [[Onboarding checklist]]; the gradual handover in [[GROK]] still applies to every routine.

## Principles
- **Baseline first.** No bot goes live before the "before" numbers are captured.
- **Security before setup.** Access decisions are made and written down before any connector is added.
- **Draft only.** During the pilot, bots research, draft, and record. People send, post, and change systems.
- **Log problems the same day** they happen, with the fix (see the capture entry in [[Record Keeper]]).
- **One bot at a time**, except during the setup week if the client waives it in writing.
- **Settle ownership in writing.** Who owns notes, templates, and workflows built during the pilot, and whether the client may be named as a reference.

## Roles during the pilot
- Sponsor and approver: {{PRIMARY_CONTACT}}. Backup: {{BACKUP_CONTACT}}.
- Pilot bots: [[Record Keeper]] plus one or two from discovery (usually the [[Briefing Bot]]). Add the [[Channel Liaison]] if the pilot runs in a shared channel with outside people.
- Liaison channel: {{LIAISON_CHANNEL}} on {{CHAT_PLATFORM}}, for questions, updates, and hand-offs between the client team, the provider, and the bots. No secrets, passwords, or customer data in the channel.
- Provider: setup, weekly check-in, readout.

## Kickoff (day 1, 60 minutes)
- [ ] Goals: the top 3 pain points from discovery and what "worth it" means to the sponsor.
- [ ] Success criteria agreed (below) with target numbers.
- [ ] Baseline plan: which history to pull (for example 60 days of tickets, jobs, or emails), and a one-week time log by each pilot user with shared categories (for example: decisions, status updates, write-ups, training prep, customer replies).
- [ ] Security plan: read-only scopes where possible; comment-only access in task or ticket tools; no write access to identity, device-management, finance, or mail admin; credentials kept in {{PASSWORD_MANAGER}}; no internal hostnames, IP addresses, or incident details in prompts; the AI vendor's data retention and training terms for the client's plan obtained in writing.
- [ ] Off-limits systems and topics listed (for example HR, payroll, finance systems, production changes).
- [ ] Liaison channel created; who is in it; ground rules posted.
- [ ] Check-in slot booked: weekly, {{REVIEW_DAY}}.
- [ ] Ownership of pilot materials agreed in writing.

## Week by week
### Week 1: baseline and setup
- Capture the baseline (time log, history pull). Record it in [[Business profile]] "Before".
- Vault created, placeholders filled, [[Record Keeper]] live in draft mode.
- Connectors added one by one, each with an access log row.
- First routine (usually the weekly brief) runs once by hand; the sponsor reads it.
- Check-in 1: is the baseline complete? Any access the client is uneasy about?

### Week 2: first routines
- Daily and weekly review running; first scheduled brief delivered.
- Sponsor approves each action the bots propose (handover week 2).
- Second pilot bot added if week 1 output was USED.
- Check-in 2: first USED / REWORKED / IGNORED grades; adjust prompts.

### Week 3: routine cases alone
- Routine cases run without per-item approval; exceptions escalate (the always-approve list still applies).
- Optional demo for leadership: two bots plan a real but low-risk task in the channel, using dummy values, and end with a decision log and "Waiting on {{PRIMARY_CONTACT}}: pick A, B or C". Nothing changes in any system.
- Check-in 3: draft readout numbers; list what is not working.

### Week 4: measure and decide
- Repeat the one-week time log with the same categories.
- [[Record Keeper]] drafts the readout from the vault: before/after per task, routines graded, problems and fixes, usage against plan, open risks.
- Check-in 4: readout rehearsal; go / no-go recommendation.

## Check-in agenda (30 minutes, weekly)
1. What the bots delivered (from the weekly review, with links).
2. Grades: USED / REWORKED / IGNORED per routine.
3. Problems logged this week and their fixes.
4. Usage pace against the plan.
5. Changes for next week (one change request each).
6. Decisions waiting on {{PRIMARY_CONTACT}}.

## Success criteria (fill at kickoff)
| Measure | Baseline | Target | Day 30 | Source |
|---|---|---|---|---|
| Hours per week on the piloted tasks | | | | Time log |
| Time to a ready weekly brief / report | | | | Routine runs, commit times |
| Routines graded USED (share of weeks) | n/a | e.g. 3 of 4 | | Weekly reviews |
| Problems logged same day (share) | n/a | all | | Capture entries |
| Security incidents or policy breaks caused by a bot | n/a | 0 | | Incident notes |
| Sponsor satisfaction (1-5) | n/a | | | Check-in 4 |

**Break-even check:** hours that must be saved per month = monthly plan cost / loaded hourly rate. Work it out **per person** when pilot users have different rates, and show both. Use the client's own figures; the provider does not supply rates or plan prices here.

## Go / no-go (readout on {{PILOT_READOUT_DATE}})
- **Go:** targets met or clearly on track, no unresolved security issue, sponsor wants to continue. Pick a tier from [[Service packages]] and move the pilot bots to handover week 4.
- **Extend:** promising but the baseline or the measurements are incomplete. Extend once, by at most 30 days, with a named fix.
- **No-go:** targets missed, or the access needed is more than the client accepts. Remove bot and provider access, keep the vault in the client's account, and record why in a decision record.

## Readout outline
1. The problem and the baseline.
2. What the bots did (links to real outputs, no mock-ups).
3. Before/after per task, with sources.
4. Guardrails: what the bots could not do, what was off-limits, problems and fixes.
5. Cost and break-even (client figures).
6. Recommendation and the decision needed.
