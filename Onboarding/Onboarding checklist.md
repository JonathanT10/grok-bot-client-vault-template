# Onboarding checklist

Date: {{START_DATE}}
Tags: #onboarding
Client: {{CLIENT_NAME}}
Owner: {{PROVIDER_NAME}}
Target go-live: {{GO_LIVE_DATE}}

Work top to bottom. Check a box only when there is proof (a link, a screenshot, or a log.md line). Anything that connects an account, changes permissions, sends, or spends needs {{PRIMARY_CONTACT}}'s OK first.

## 0. Kickoff
- [ ] Service agreement signed; scope recorded in [[Service scope]]
- [ ] Discovery session done; [[Discovery questionnaire]] filled in
- [ ] "Before" numbers captured (time per task, response times) in [[Business profile]]
- [ ] Data handling explained to the client: what the bot can see, where the vault lives, who can read it

## 1. Vault repo
- [ ] Template copied, `.git` reset, placeholders filled (`./scripts/fill-placeholders.sh --check` is clean)
- [ ] Private repo `{{VAULT_REPO}}` created, owned by the client's account or org (provider has collaborator access)
- [ ] Remote added, first commit pushed to `main`
- [ ] Bot's git access is limited to this repo (fine-grained token or deploy key, scoped to one repo); where that credential lives is recorded in [[Access list]]
- [ ] Client knows how to open the vault (Obsidian or the repo web view)
- [ ] Second-person review by another {{PROVIDER_NAME}} team member: completeness, least privilege, consistency between notes

## 2. Accounts
- [ ] Grok Bot account and plan set up; billing owner recorded in [[Service scope]]
- [ ] Bot named {{BOT_NAME}}; profile description written as a role contract (ROLE, INPUTS, OUTPUT, WHEN TO ASK) in [[Bot configuration]]
- [ ] Bot's own email address decided (on or off) and recorded
- [ ] Password manager chosen ({{PASSWORD_MANAGER}}); shared items created by the client, names only recorded in [[Access list]]
- [ ] Sensitive logins (banking, payroll, tax) kept out of the bot's shared browser unless the client explicitly approves

## 3. Connectors
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

## 4. Bot configuration
- [ ] Persona, tone, and sign-off set from discovery ([[Bot configuration]])
- [ ] Bot instructions say: read GROK.md first, follow the vault rules
- [ ] Approval rules written and confirmed by {{PRIMARY_CONTACT}}
- [ ] [[Guardrails policy]] customized (section 13 table, section 3a decision, regulated add-ons done or N/A) and signed
- [ ] [[Data inventory]] filled from discovery
- [ ] Access and sharing model, default and restricted channels set in [[Bot configuration]]
- [ ] Auto-review / safety settings recorded

## 5. Skills
- [ ] Starter skills reviewed and adapted: [[Daily and weekly review]], [[Inbox triage]], [[Research brief]], [[Idea triage]], [[Decision board]], [[Meeting prep and follow-up]], [[Monthly client report]]
- [ ] Client-specific skills written from [[Skill spec template]]
- [ ] Each skill tested on two different days' real inputs, with completion checks passing

## 6. Routines
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

## 7. Handoff and training
- [ ] 30-minute walkthrough with {{PRIMARY_CONTACT}}: how to ask, how to approve, how to stop a routine, where to find things in the vault
- [ ] Quick reference sent: the 5 most useful requests, how approvals look, who to call for help
- [ ] Backup approver ({{BACKUP_CONTACT}}) trained
- [ ] Support channel and response times confirmed ([[Service scope]])
- [ ] [[Staff acceptable use guide]] filled in and sent to every user; signed copies or acknowledgements recorded
- [ ] Owner can add and remove users, pause a routine, and disconnect a connector
- [ ] Escalation and incident contacts confirmed ([[Guardrails policy]] section 11)
- [ ] Provider access reduced per agreement to {{PROVIDER_RETAINED_ACCESS}}; recorded in [[Access list]]
- [ ] 30-day review scheduled from [[30-day review template]]

## 8. Go-live
- [ ] [[Go-live acceptance checklist]] complete and signed off
- [ ] log.md line: go-live

### Launch day
- [ ] Access opened to the agreed user group only
- [ ] Launch announcement (approved by the client) sent by client staff, not the bot
- [ ] {{PROVIDER_IMPLEMENTER}} available for support during the agreed window
- [ ] First routine runs watched; output in draft (handover week 1)
- [ ] Issues logged in Inbox/ or [[log]]
- [ ] Optional: tag the signed-off state in git (for example `v1.0-launch`)

## 9. After go-live
- [ ] Week 2, 3, 4 handover stage changes recorded in [[Bot configuration]]
- [ ] First monthly report delivered ([[Monthly client report]])
- [ ] 30/60/90 day "after" numbers captured against the "before" numbers
- [ ] Days 1 to 3: check in with {{BOT_OWNER}}; week 1: review routine output, approvals, and that no sensitive data landed in shared memory or channels; week 2: collect user feedback, fix quick wins, remove unused access
- [ ] 30-day review held ([[30-day review template]]) and [[Guardrails policy]] reviewed
