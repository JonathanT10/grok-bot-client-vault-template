# Pilot program (30 days)

Date: {{START_DATE}}
Tags: #team #pilot
Client: {{CLIENT_NAME}}
Pilot sponsor: {{PRIMARY_CONTACT}}
Provider: {{PROVIDER_NAME}}
Pilot dates: {{PILOT_START_DATE}} to {{PILOT_END_DATE}}; readout {{PILOT_READOUT_DATE}}

A generic 30-day trial of a small Grok Bot team, built so the client can decide go / no-go on evidence instead of impressions. Run it on top of the normal [[Onboarding checklist]]; the gradual handover in [[GROK]] still applies to every routine. Lessons from past pilots: [[Lessons learned]].

## Principles
- **Baseline first.** No bot goes live on piloted work before the "before" numbers are captured.
- **Security before setup.** Access decisions are made and written down before any connector is added.
- **Draft only.** During the pilot, bots research, draft, and record. People send, post, and change systems.
- **Measure, don't estimate.** Every piloted task logs its real time. Estimates are labelled until replaced.
- **Log problems the same day** they happen, with the fix (capture entry, see [[Record Keeper]]).
- **One bot at a time**, except during the setup week if the client waives it in writing.
- **Settle ownership in writing.** Who owns notes, templates, and workflows built during the pilot, and whether the client may be named as a reference.
- **Count the real calendar.** The readout date, not "30 days", sets the time available; list what else is due in the same stretch.

## Roles during the pilot
| Who | Does |
|---|---|
| Sponsor and approver: {{PRIMARY_CONTACT}} | Sets goals, approves every action, presents the readout |
| Backup approver: {{BACKUP_CONTACT}} | Approves when the sponsor is away; logs time too if they are a pilot user |
| [[Record Keeper]] | Keeps the full record: capture entries, access log, decisions, time saved, problems and fixes; drafts the readout |
| One or two use-case bots | Usually the [[Briefing Bot]]; the [[Content Producer]] if a content backlog is a top pain point |
| [[Channel Liaison]] (if the pilot runs in a shared channel) | Keeps the channel organized, drafts replies, forwards records |
| [[Coordinator]] (if three or more bots) | Daily status and waiting-on list |
| {{PROVIDER_NAME}} | Setup, weekly check-in, readout support |

Liaison channel: {{LIAISON_CHANNEL}} on {{CHAT_PLATFORM}}, for questions, updates, and hand-offs between the client team, the provider, and the bots. No secrets, passwords, or customer data in the channel.

## Before kickoff (the proposal)
The pilot usually starts with a short proposal the sponsor takes to leadership. It should:
- Name the top 3-5 use cases, each with the "before" (who, how often, how long) and what the bot would produce.
- Show the cost and the break-even (below), with the client's own rates.
- Label every time-saved figure as estimate or measured.
- State the guardrails: draft only, what is off-limits, how data is handled.
- Offer a clear exit: "if the numbers do not hold at the readout, we stop."
Have the [[Idea Partner]] review it first (see its "Plan review" skill).

## Kickoff (day 1, 60-90 minutes)
- [ ] **Goals:** top 3 pain points from discovery and what "worth it" means to the sponsor.
- [ ] **Use cases ranked**, with an owner bot for each.
- [ ] **Success criteria** agreed (table below) with target numbers.
- [ ] **Baseline plan:**
  - Which history to pull (for example 60 days of tickets, jobs, orders, or emails).
  - A one-week time log by each pilot user, before any bot goes live on that work, using shared categories. Example categories: decisions, status updates, write-ups, training prep, customer replies, reporting.
  - "Before" for each use case: time per task, how often, output today.
- [ ] **Security plan:**
  - Admin consent for connectors given by the client's admin, scopes recorded.
  - Read-only scopes wherever possible; comment-only in task or ticket tools.
  - No write access to identity, device-management, finance, or mail administration during the pilot.
  - Credentials kept in {{PASSWORD_MANAGER}}; item names only in [[Access list]].
  - No internal hostnames, IP addresses, or incident details in prompts.
  - The AI vendor's data retention and training terms for the client's plan obtained in writing.
- [ ] **Off-limits** systems and topics listed (for example HR, payroll, finance systems, production changes, a named line-of-business system).
- [ ] **Liaison channel** created; who is in it (people and assistants); ground rules posted.
- [ ] **Documentation plan:** the Record Keeper keeps the full internal record all month; at the end, the sponsor (or provider) turns it into a readout document; any generic template built from it has all client details removed.
- [ ] **Check-in slot** booked: weekly, {{REVIEW_DAY}}.
- [ ] **Ownership** of pilot materials agreed in writing.

## Week by week
### Week 1: baseline and setup
| Day | Activity | Proof |
|---|---|---|
| 1 | Kickoff; vault repo created; [[Record Keeper]] live; first capture entries | Repo, log.md |
| 1-2 | Connectors added one by one, each with an access log row | [[Access list]] |
| 1-5 | Time log running for every pilot user | Time log |
| 2 | First use-case bot created; first output run by hand the same day | Chat, Reports/ |
| 3 | Tuning question asked; prompts updated | [[Systems and connectors]] |
| 3-5 | Routines scheduled in draft mode | [[Bot configuration]] |
| 5 | Check-in 1: is the baseline complete? any access the client is uneasy about? | Check-in note |

### Week 2: first routines
- Daily and weekly review running; first scheduled outputs delivered.
- Sponsor approves each action the bots propose (handover week 2).
- Second use-case bot added if week 1 output was USED.
- Measured runs: each use case done at least five times with time logged.
- Check-in 2: first USED / REWORKED / IGNORED grades; prompt changes as change requests.

### Week 3: routine cases alone
- Routine cases run without per-item approval; exceptions escalate (the always-approve list still applies).
- Optional live demo for leadership (format below).
- Check-in 3: draft readout numbers; list what is not working and what will not be ready.

### Week 4: measure and decide
- Repeat the one-week time log with the same categories.
- [[Record Keeper]] drafts the readout from the vault.
- Check-in 4: readout rehearsal; go / no-go recommendation.

## What the pilot tracks
| Item | Where | Who |
|---|---|---|
| Every setup step | Capture entries (Rollout log) | Record Keeper |
| Every connector, scope, and permission | [[Access list]] | Record Keeper |
| Every decision | Decisions/ | Record Keeper |
| Time per task, before and after | Time log + capture entries; totals from the [[Time savings log]] | Pilot users, bots (rows written by {{REPORTS_BOT_NAME}} only) |
| Routine runs, on time or late | Routine history, commit times | Coordinator / Record Keeper |
| Output grades | Weekly review | Record Keeper |
| Problems and fixes, same day | Capture entries, [[Bot playbook]] lessons | Whoever found it |
| Usage against plan | Usage check | Coordinator |
| Open items and owners | Project note for the pilot | Record Keeper |

## Check-in agenda (30 minutes, weekly)
1. What the bots delivered (from the weekly review, with links).
2. Grades: USED / REWORKED / IGNORED per routine.
3. Time saved this week (measured) and the running total.
4. Problems logged this week and their fixes.
5. Usage pace against the plan.
6. Changes for next week (one change request each).
7. Decisions waiting on {{PRIMARY_CONTACT}}.

## Success criteria (fill at kickoff)
| Measure | Baseline | Target | Day 30 | Source |
|---|---|---|---|---|
| Hours per week on the piloted tasks | | | | Time log |
| Time per task, measured (per use case) | | | | Capture entries |
| Time to a ready weekly brief / report | | | | Routine runs, commit times |
| Routines graded USED (share of weeks) | n/a | e.g. 3 of 4 | | Weekly reviews |
| Problems logged same day (share) | n/a | all | | Capture entries |
| Security incidents or policy breaks caused by a bot | n/a | 0 | | Incident notes |
| Posts or sends without a person pressing send | n/a | 0 | | Channel and mail history |
| Sponsor satisfaction (1-5) | n/a | | | Check-in 4 |

**Break-even check:** hours that must be saved per month = monthly plan cost / loaded hourly rate. Work it out **per person** when pilot users have different rates, and show both; a team figure at the highest rate overstates the case. Use the client's own figures; the provider does not supply rates or plan prices here.

## Live demo format (optional, week 3)
- Two bots plan a real but low-risk task in the channel while the room watches (for example, options for a routine maintenance window or a staff notice).
- Dummy values only, each labelled "(example)"; real names, tools, and groups become open questions for the approver.
- Script: the approver posts the question; bot A gives two or three options; bot B adds what it would change; bot A posts a decision log (options, recommendation, open questions, who decides) ending with "Waiting on {{PRIMARY_CONTACT}}: pick A, B or C"; the approver picks; the log updates with who decided and when.
- Nothing changes in any system. No pricing, licence, HR, payroll, or customer detail in the thread.
- Rehearse once, time it (aim under 6 minutes), keep a screenshot of the rehearsal as a fallback, and clean the channel before the live run.

## Go / no-go (readout on {{PILOT_READOUT_DATE}})
- **Go:** targets met or clearly on track, no unresolved security issue, sponsor wants to continue. Pick a tier from [[Service packages]] and move the pilot bots to handover week 4.
- **Extend:** promising but the baseline or the measurements are incomplete. Extend once, by at most 30 days, with a named fix.
- **No-go:** targets missed, or the access needed is more than the client accepts. Remove bot and provider access, keep the vault in the client's account, and record why in a decision record.

## Readout outline
1. The problem and the baseline.
2. What the bots did (links to real outputs, no mock-ups).
3. Before/after per use case, measured, with sources.
4. Guardrails: what the bots could not do, what was off-limits, problems and fixes.
5. Cost and break-even (client figures, per person).
6. What was not finished and why.
7. Recommendation and the decision needed.
