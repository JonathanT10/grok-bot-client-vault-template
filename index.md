# Index

Map of the {{CLIENT_NAME}} vault. {{BOT_NAME}} reads this right after [[GROK]]. Update it when folders, key notes, skills, or active projects change.

## Root files
- [[GROK]]: rules for how {{BOT_NAME}} reads and writes this vault
- [[log]]: one-line pointers to every meaningful change

## Folders
- Onboarding/: discovery, setup checklist, go-live sign-off; Department pilot kit/ for a two-week department pilot
- Reference/: durable facts about the business and the bot setup
- Skills/: repeatable workflows, one note each
- Team/: bot team blueprint, roles, pilot program, service packages
- Templates/: note templates
- Sales/: provider sales materials (pitch one-pager, pricing sheet)
- Business/: provider-internal plans (business plan, first week plan, customer acquisition plan), demo script, and the fictional demo vault; delete from client copies
- Inbox/: raw ideas and requests to sort later (each with a Status line)
- Daily/: one note per day, named YYYY-MM-DD
- Decisions/: dated decision records (YYYY-MM-DD-short-title)
- People/: one note per person, only when useful and agreed
- Projects/: one note per active project or automation
- Reports/: monthly client reports and other periodic outputs; Fleet reviews/ (one per night), Time savings log.csv and its backups

## Onboarding
- [[Discovery questionnaire]]: first conversation with {{PRIMARY_CONTACT}}
- [[Onboarding checklist]]: accounts, connectors, routines, skills, vault repo, training
- [[Go-live acceptance checklist]]: what must be true before {{BOT_NAME}} works unsupervised
- [[Staff acceptable use guide]]: one-page dos and don'ts for every staff user
- [[Onboarding/Department pilot kit/README|Department pilot kit]]: two-week, read-only, draft-only pilot for one department ({{DEPT_NAME}})
  - [[Department intake questionnaire]]: mailboxes, reports, trackers, meetings, hand-offs, time per task, access
  - [[Ranked opportunities]]: scoring rubric, ranked table, approval asks
  - [[Routine - Daily FYI digest]], [[Routine - Status tracker follow-ups]], [[Routine - Weekly notice digest]]: starter routine specs
  - [[Pilot measurement sheet]]: daily rows per routine (with `Pilot measurement sheet.csv`) and the go / no-go

## Reference
- [[Business profile]]: what {{CLIENT_NAME}} does, hours, customers, priorities
- [[People and roles]]: who is who, who can approve what
- [[Systems and connectors]]: every tool the business uses and how the bot reaches it
- [[Access list]]: what the bot can reach and where each credential lives (never the value)
- [[Bot configuration]]: name, persona, tone, routines, skills, approval rules
- [[Guardrails policy]]: client-signed rules, approval matrix, incident steps, optional regulated-data add-ons
- [[Data inventory]]: data types the business handles and whether the bot may see them
- [[Service scope]]: what the service covers, response times, what is out of scope
- [[Glossary]]: the business's own words, acronyms, product names
- [[Bot playbook]]: shared rules and lessons learned
- [[Decision patterns for bots]]: how the bot makes judgment calls
- [[Time savings log]]: the one time-saved CSV, its single writer ({{REPORTS_BOT_NAME}}), and the evidence, estimate, and overlap rules

## Team
- [[Team/README|Bot team blueprint]]: starter team, role contract, lanes, hand-off pattern, start-small plan
- [[Record Keeper]]: owns the vault; daily and weekly review
- [[Coordinator]]: routes work, team status, waiting-on list
- [[Briefing Bot]]: scheduled, sourced brief on {{BRIEF_TOPIC}}
- [[Channel Liaison]]: watches {{LIAISON_CHANNEL}}, drafts replies, forwards records
- [[Idea Partner]]: sharpens ideas into briefs, keeps the idea list
- [[Content Producer]]: drafts {{CONTENT_TYPE}}; library review and rebuild (add-on)
- [[Lessons learned]]: generic dos and don'ts for bot teams
- [[Pilot program]]: 30-day pilot playbook and go / no-go
- [[Service packages]]: tiers and what each includes

## Sales (provider materials)
- [[Pitch one-pager]]: one-page pitch for small-business owners and office managers
- [[Pricing sheet]]: setup and monthly tiers, add-ons, pilot terms, payment terms (matches [[Service packages]])

## Business (provider-internal; delete from client copies)
- [[Business plan]]: offer, target customers, packages, capacity and revenue formulas, costs, risks, 90-day milestones, KPIs
- [[First week plan]]: day-by-day launch plan with deliverables and done-checklists
- [[Customer acquisition plan]]: ideal customer, ranked channels, outreach templates, discovery script, funnel, objections, 30/60/90 cadence
- [[Demo script]]: timed demo (about 5:45) with talk track, what to show, the pilot ask, and likely questions
- [[Business/Demo vault/README|Demo vault]]: filled example vault for the fictional Example Landscaping LLC (example data only); copy it out to demo
- [[Business/Demo vault/Department pilot - Accounts payable/README|AP department pilot example]]: the department pilot kit filled for the fictional AP team (example data only)

## Skills
- [[Daily and weekly review]]: summary and open items, appended to the Daily note
- [[Inbox triage]]: sort the email inbox into act, reply, read, and ignore, with drafts only
- [[Research brief]]: topic or question to a sourced brief
- [[Idea triage]]: capture requests and ideas, score them, promote the good ones
- [[Decision board]]: five-advisor review of a big or hard-to-undo decision
- [[Meeting prep and follow-up]]: brief before a meeting, notes and action items after
- [[Monthly client report]]: what the bot did this month, with sources
- [[Nightly fleet review]]: Coordinator's nightly read of every bot's chat for repeat mistakes, with numbered fixes

## Templates
- [[Daily note template]]
- [[Decision record template]]
- [[Routine spec template]]
- [[Skill spec template]]
- [[Meeting note template]]
- [[Incident note template]]
- [[Change request template]]
- [[Monthly report template]]
- [[30-day review template]]: adoption, safety, changes, and decision 30 days after go-live
- [[Fleet review]]: nightly fleet review file (saved to Reports/Fleet reviews/YYYY-MM-DD.md)
- Time savings log.csv: header row for Reports/Time savings log.csv

## Active projects
- [[Routine - Nightly fleet review]]: proposed starter routine, owner {{COORDINATOR_BOT_NAME}} (delete if the client runs one bot)
- (add one line per project with a link and an owner)
