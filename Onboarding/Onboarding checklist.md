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
- [ ] Unused connectors not installed (least access)

## 4. Bot configuration
- [ ] Persona, tone, and sign-off set from discovery ([[Bot configuration]])
- [ ] Bot instructions say: read GROK.md first, follow the vault rules
- [ ] Approval rules written and confirmed by {{PRIMARY_CONTACT}}
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

## 7. Handoff and training
- [ ] 30-minute walkthrough with {{PRIMARY_CONTACT}}: how to ask, how to approve, how to stop a routine, where to find things in the vault
- [ ] Quick reference sent: the 5 most useful requests, how approvals look, who to call for help
- [ ] Backup approver ({{BACKUP_CONTACT}}) trained
- [ ] Support channel and response times confirmed ([[Service scope]])

## 8. Go-live
- [ ] [[Go-live acceptance checklist]] complete and signed off
- [ ] log.md line: go-live

## 9. After go-live
- [ ] Week 2, 3, 4 handover stage changes recorded in [[Bot configuration]]
- [ ] First monthly report delivered ([[Monthly client report]])
- [ ] 30/60/90 day "after" numbers captured against the "before" numbers
