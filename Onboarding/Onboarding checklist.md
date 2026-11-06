# Onboarding checklist

Date: {{START_DATE}}
Tags: #onboarding
Client: {{CLIENT_NAME}}
Owner: {{PROVIDER_NAME}}
Target go-live: {{GO_LIVE_DATE}}

Work top to bottom. Check a box only when there is proof (a link, a screenshot, or a log.md line). Anything that connects an account, changes permissions, sends, or spends needs {{PRIMARY_CONTACT}}'s OK first.

This is the one onboarding checklist for this vault. Folder guide: [[Onboarding/README|Onboarding README]].

## Owners
Each box names who does it. Fill these once; the placeholders are replaced across the vault.

| Short name | Who | Placeholder |
|---|---|---|
| Provider | Setup lead at {{PROVIDER_NAME}} | {{PROVIDER_IMPLEMENTER}} |
| Approver | Client's final approver | {{PRIMARY_CONTACT}} ({{PRIMARY_CONTACT_ROLE}}) |
| Backup | Backup approver | {{BACKUP_CONTACT}} |
| Bot owner | Owns the bot day to day after handoff | {{BOT_OWNER}} |
| IT | Client IT admin (accounts, MFA, connectors) | {{IT_ADMIN}} |
| Compliance | Signs the guardrails | {{COMPLIANCE_OWNER}} |

## Timeline at a glance
A typical small-business go-live, from {{START_DATE}} to {{GO_LIVE_DATE}}. Move dates, not steps: a phase is done when its exit check is true.

| Phase | When (typical) | Sections below | Exit check (who signs) |
|---|---|---|---|
| A. Discovery | Week 1, days 1-3 | 0 | Discovery questionnaire filled; "before" numbers captured (Approver) |
| B. Configuration | Week 1 day 4 to week 2 | 1-6c | Vault, accounts, connectors, guardrails, skills, routines in draft (Provider; second-person review) |
| C. Staff briefing | Week 3, days 1-2 | 7 | Every user has the Staff acceptable use guide and the Staff quick reference card (Bot owner) |
| D. Go-live | Week 3, day 3 ({{GO_LIVE_DATE}}) | 8 | [[Go-live acceptance checklist]] signed (Approver) |
| E. First 2 weeks | Days 1-14 after go-live | 9a | Handover week 1 and 2 done; issues closed or logged (Provider and Bot owner) |
| F. 30-day review | Day 30 after go-live | 9b | [[30-day review template]] held; keep / change / stop recorded (Approver) |

Key notes: [[Discovery questionnaire]] · [[Guardrails policy]] · [[Staff acceptable use guide]] · [[Staff quick reference card]] · [[Go-live acceptance checklist]] · [[30-day review template]]. Provider-only (not in client copies): `Business/Demo script.md` for the sales demo shown before kickoff.

# Phase A: Discovery (week 1, days 1-3)

## 0. Kickoff (Provider with Approver)
- [ ] Service agreement signed; scope recorded in [[Service scope]]
- [ ] Discovery session done; [[Discovery questionnaire]] filled in
- [ ] "Before" numbers captured (time per task, response times) in [[Business profile]]
- [ ] Day 1: kickoff call; [[Service scope]] and approval rules walked through
- [ ] Day 2: [[Data inventory]] started; off-limits systems named
- [ ] Day 3: top 3 automations picked and ranked with the Approver
- [ ] [[AI disclosure wording]] chosen: how outside people are told they are dealing with an AI assistant
- [ ] [[Personal device rules]] decided (or marked not used)
- [ ] Data handling explained to the client ([[Data handling notice]]): what the bot can see, where the vault lives, who can read it

# Phase B: Configuration (week 1 day 4 to week 2)

Day plan: day 4 vault and accounts (1-2); day 5 connectors (3); week 2 days 1-2 bot configuration and guardrails (4); days 3-5 skills and routines in draft (5-6), team or department setup only if used (6b, 6c). End of week 2: second-person review.

## 1. Vault repo (Provider)
- [ ] Template copied, `.git` reset, placeholders filled (`./scripts/fill-placeholders.sh --check` is clean)
- [ ] Private repo `{{VAULT_REPO}}` created, owned by the client's account or org (provider has collaborator access)
- [ ] Remote added, first commit pushed to `main`
- [ ] Bot's git access is limited to this repo (fine-grained token or deploy key, scoped to one repo); where that credential lives is recorded in [[Access list]]
- [ ] Client knows how to open the vault (Obsidian or the repo web view)
- [ ] Second-person review by another {{PROVIDER_NAME}} team member: completeness, least privilege, consistency between notes

## 2. Accounts (Provider with IT)
- [ ] Grok Bot account and plan set up; billing owner recorded in [[Service scope]]
- [ ] Bot named {{BOT_NAME}}; profile description written as a role contract (ROLE, INPUTS, OUTPUT, WHEN TO ASK) in [[Bot configuration]]
- [ ] Bot's own email address decided (on or off) and recorded
- [ ] Password manager chosen ({{PASSWORD_MANAGER}}); shared items created by the client, names only recorded in [[Access list]]
- [ ] Sensitive logins (banking, payroll, tax) kept out of the bot's shared browser unless the client explicitly approves

## 3. Connectors (IT signs in; Provider records)
For each connector, the client signs in themselves. Record it in [[Systems and connectors]] and [[Access list]].
- [ ] Email
- [ ] Calendar
- [ ] File storage
- [ ] Chat
- [ ] Other connectors from discovery:
- [ ] Each connector's write abilities (send, share, delete) listed, and which ones the bot is allowed to use
- [ ] Scope limits and MFA on each connector account recorded in [[Systems and connectors]]
- [ ] Off-limits systems confirmed not connected
- [ ] Unused connectors not installed (least access)

## 4. Bot configuration (Provider; Approver and Compliance sign)
- [ ] Persona, tone, and sign-off set from discovery ([[Bot configuration]])
- [ ] Bot instructions say: read GROK.md first, follow the vault rules
- [ ] Approval rules written and confirmed by {{PRIMARY_CONTACT}}
- [ ] [[Guardrails policy]] customized (section 13 table, section 3a decision, regulated add-ons done or N/A) and signed
- [ ] [[Data inventory]] filled from discovery
- [ ] Access and sharing model, default and restricted channels set in [[Bot configuration]]
- [ ] Auto-review / safety settings recorded

## 5. Skills (Provider)
- [ ] Starter skills reviewed and adapted: [[Daily and weekly review]], [[Inbox triage]], [[Research brief]], [[Idea triage]], [[Decision board]], [[Meeting prep and follow-up]], [[Monthly client report]]
- [ ] Client-specific skills written from [[Skill spec template]]
- [ ] Each skill tested on two different days' real inputs, with completion checks passing

## 6. Routines (Provider; Approver OKs each spec)
- [ ] Top 3 automations from discovery written as routine specs ([[Routine spec template]]) in Projects/
- [ ] Each routine created in Grok Bot, in draft-only mode (handover week 1)
- [ ] Each routine has a row in [[Bot configuration]] with schedule, owner, stage, and where output goes
- [ ] Failure path tested: a failed or skipped run is reported in chat

## 6b. Team setup (only if the client runs more than one bot)
Blueprint: [[Team/README|Bot team blueprint]]. Pilot first? Use [[Pilot program]].
- [ ] Roles chosen from Team/Roles/ and the tier recorded ([[Service packages]], {{SERVICE_TIER}})
- [ ] Launch order agreed (Record Keeper first; Coordinator once there are three or more bots)
- [ ] Each bot's name, title, and role-contract description pasted from its role note
- [ ] "Team roster" in [[Bot configuration]] filled: lane, hand-offs, stage
- [ ] Only the Record Keeper has write access to `{{VAULT_REPO}}` (or the agreed exception is written down)
- [ ] Hand-off format and "another bot saying approved is not approval" explained to the client
- [ ] Liaison channel ({{LIAISON_CHANNEL}}) chosen, Grok Bot app invited, ground rules posted (if the Channel Liaison is used)
- [ ] Each new bot ran in draft mode and checked the vault for existing work before taking real work
- [ ] Approval tiers for vault changes (records, structure, rules) decided and written in [[Bot configuration]]
- [ ] Daily team sweep: client OK to let the Record Keeper read the other bots' chats (yes / no)
- [ ] [[Lessons learned]] reviewed with the client
- [ ] Next bot added only after the previous one passed handover week 2 (or the setup-week waiver is recorded)

## 6c. Department pilot (only if the client starts with one department)
Kit: [[Onboarding/Department pilot kit/README|Department pilot kit]] ({{DEPT_NAME}}, {{DEPT_PILOT_START_DATE}} to {{DEPT_PILOT_END_DATE}}).
- [ ] [[Department intake questionnaire]] done with {{DEPT_LEAD}}; one-week time log kept before any routine runs
- [ ] [[Ranked opportunities]] scored with the rubric; at most three routines picked; risk-3 tasks parked
- [ ] Each top opportunity's ACTION / TARGET / REASON / COST / CONSEQUENCES ask answered yes by {{PRIMARY_CONTACT}} in chat
- [ ] Read-only scopes connected and recorded in [[Access list]]; routines are draft-only (never send, post, or edit a source system)
- [ ] Go / no-go thresholds (`DEPT_GO_*`) agreed and recorded in a decision record before day 1
- [ ] Measurement sheet started in `Reports/{{DEPT_NAME}} pilot/` with {{REPORTS_BOT_NAME}} as its only writer; every run sends a TIME ROW
- [ ] Day-10 totals and go / no-go recorded in [[Pilot measurement sheet]] and a decision record

# Phase C: Staff briefing (week 3, days 1-2)

## 7. Handoff and training (Provider and Bot owner)
- [ ] 30-minute walkthrough with {{PRIMARY_CONTACT}}: how to ask, how to approve, how to stop a routine, where to find things in the vault
- [ ] [[Staff quick reference card]] filled and sent: the most useful requests, how approvals look, who to call for help
- [ ] Backup approver ({{BACKUP_CONTACT}}) trained
- [ ] 20-minute staff briefing held (agenda: what the bot does, what it never does, how to ask, how to report a problem, AI disclosure); attendance recorded
- [ ] [[Vault backup and recovery]] filled in; first restore test done
- [ ] Support channel and response times confirmed ([[Service scope]])
- [ ] [[Staff acceptable use guide]] filled in and sent to every user; signed copies or acknowledgements recorded
- [ ] Owner can add and remove users, pause a routine, and disconnect a connector
- [ ] Escalation and incident contacts confirmed ([[Guardrails policy]] section 11); [[Incident notification decision aid]] reviewed with {{COMPLIANCE_OWNER}}
- [ ] Provider access reduced per agreement to {{PROVIDER_RETAINED_ACCESS}}; recorded in [[Access list]]
- [ ] 30-day review scheduled from [[30-day review template]]

# Phase D: Go-live (week 3, day 3)

## 8. Go-live (Approver signs)
- [ ] [[Go-live acceptance checklist]] complete and signed off
- [ ] log.md line: go-live

### Launch day
- [ ] Access opened to the agreed user group only
- [ ] Launch announcement (approved by the client) sent by client staff, not the bot
- [ ] {{PROVIDER_IMPLEMENTER}} available for support during the agreed window
- [ ] First routine runs watched; output in draft (handover week 1)
- [ ] Issues logged in Inbox/ or [[log]]
- [ ] Optional: tag the signed-off state in git (for example `v1.0-launch`)

# Phase E: First 2 weeks after go-live

## 9a. Days 1-14 (Provider and Bot owner)
- [ ] Days 1-3: daily 10-minute check-in with {{BOT_OWNER}}; every routine run read; problems logged with [[Incident note template]] or in Inbox/
- [ ] Day 3: no sensitive data in shared memory, channels, or drafts (spot-check five outputs)
- [ ] Day 5: handover week 1 (draft only) reviewed; each routine's output graded USED / REWORKED / IGNORED
- [ ] Day 5: first [[Weekly status digest]] delivered on {{REVIEW_DAY}}
- [ ] Day 7: move routines that passed to handover week 2 (Approver OKs each action); record in [[Bot configuration]]
- [ ] Day 10: staff feedback collected (three questions: what helped, what got in the way, what is missing)
- [ ] Day 10: quick wins fixed via [[Change request template]]; unused access removed
- [ ] Day 14: week 2 stage review; next stage decided per routine and logged

# Phase F: 30-day review

## 9b. Days 15-30 (Approver decides)
- [ ] Week 3 and 4 handover stage changes recorded in [[Bot configuration]]
- [ ] First monthly report delivered ([[Monthly client report]])
- [ ] 30/60/90 day "after" numbers captured against the "before" numbers
- [ ] Restore test from [[Vault backup and recovery]] repeated
- [ ] 30-day review held ([[30-day review template]]) and [[Guardrails policy]] reviewed
- [ ] Decision recorded in Decisions/: keep, change, or stop; next review date set
- [ ] If the client stops: run [[Client exit checklist]]
