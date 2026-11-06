# Incident response

Date: {{START_DATE}}
Tags: #skill #incident #safety
Status: starter (adapt after the first real incident drill; do not invent a parallel process)
Policy: [[Guardrails policy]] §11

Ties the existing incident pieces together when something goes wrong. Same steps as Guardrails §11: Stop → Report → Contain → Assess → Fix and record. Does not replace the policy, the decision aid, or the note template.

## When to use
- Trigger phrases: "we had an incident", "something went out without approval", "secret was pasted", "wrong recipient", "report an incident".
- Also when staff use the "Report it" section of [[Staff acceptable use guide]], or when a routine or connector behaves in a way Guardrails §11 calls an incident.
- Not for: ordinary bugs that need a [[Change request template]], scope questions (escalation level 1), or general "something feels off" without a concrete event — ask one clarifying question, then either run this skill or point them to the right owner.

## Inputs
- What the reporter said (facts only); chat or connector evidence they point to.
- [[Guardrails policy]] §11; [[People and roles]] (who can pause, who is {{INCIDENT_CONTACT}} / {{COMPLIANCE_OWNER}} / {{IT_ADMIN}}).
- [[Access list]] (where credentials live — never values); [[Data inventory]] and [[Data handling notice]] (what kinds of data may be involved).
- [[Incident note template]]; [[Incident notification decision aid]]; [[Bot playbook]] (for lasting lessons).
- Open incident notes under `Projects/Incidents/` and recent log.md lines (avoid a duplicate note for the same event).

## Steps
1. **Stop.** Confirm whether a routine, bot, or connector should be paused. Who can: {{BOT_OWNER}}, {{BOT_MANAGERS}}, {{IT_ADMIN}}. If the reporter cannot pause it, draft the pause ask for someone who can; do not take irreversible stop actions you are not authorized for.
2. **Report.** Tell {{INCIDENT_CONTACT}} (and {{PROVIDER_NAME}} via {{PROVIDER_CONTACT}} when Guardrails §11 requires it) that an incident is open. Point staff at "Report it" in [[Staff acceptable use guide]] if they have not already. This is an internal alert, not an outside notice.
3. **Contain.** Rotate exposed credentials (tell the human to rotate; never handle or store the secret). Recall or correct messages where the platform allows and an approver agrees. Restore deleted items if that is the fix. Record each containment step with a time and source.
4. **Assess.** Was regulated or restricted data involved, and might anyone outside the company need notice? Owner: {{COMPLIANCE_OWNER}}. Work [[Incident notification decision aid]] before promising or drafting outside notice. Link the filled aid (or its answers) from the incident note.
5. **Fix and record.** Fill [[Incident note template]] and save it (see Output). Add a log.md line (counts and links only — no secrets, no full message bodies). If the cause applies broadly, draft a short lesson for [[Bot playbook]] and leave it for {{BOT_OWNER}} to accept.
6. **Outside notice, if any.** The bot does **not** notify regulators, customers, insurers, or press on its own. Draft only, for {{COMPLIANCE_OWNER}} / {{INCIDENT_CONTACT}}, and only after the decision aid says notice may apply. Any outbound notice waits on approval in the form ACTION / TARGET / REASON / COST / CONSEQUENCES.

## Output shape
Save to `Projects/Incidents/YYYY-MM-DD-short-title.md` (create `Projects/Incidents/` on first use). Keep Status: open until closed in the note; do not move the file just to close it. [[Weekly status digest]] already looks under Projects/ for incident notes.

```
# Incident: <short title>

Date: YYYY-MM-DD
Tags: #incident
Severity: low / medium / high
Status: open
Reported by:
Owner: {{INCIDENT_CONTACT}} (or the person assigned)

## What happened
(Facts only, times in {{TIMEZONE}}, sources linked.)

## Impact
- Who or what was affected:
- Anything sent, spent, published, or deleted by mistake:
- Data exposed: (categories from [[Data inventory]] only — never paste secrets)

## Timeline
| Time | Event | Source |
|---|---|---|

## Why it happened
- Cause:
- What we are guessing (say so):

## Fix
- Immediate:
- Lasting (rule, skill, or routine change):
- Playbook lesson added: yes / no -> [[Bot playbook]]

## Client communication
- Told: who, when, how (internal)
- Outside notice: not applicable / draft pending approval / sent (date, by whom) — only after [[Incident notification decision aid]]

## Closed
- Date, by whom, proof:
```

Also: one log.md line with the note link; chat summary for {{INCIDENT_CONTACT}} with the same link and the next human action.

## Done when
- Stop / Report / Contain are done or clearly waiting on a named person.
- An incident note exists at the path above, with facts, impact, and timeline filled from sources.
- Assess has either "no outside notice" recorded or a draft for {{COMPLIANCE_OWNER}} tied to the decision aid — never a send.
- No secret values appear in the note, chat, or commit; rotation was requested if exposure was possible.
- log.md has one line with the note link.

## Never
- Never notify regulators, customers, insurers, or press without an approved draft for {{COMPLIANCE_OWNER}} / {{INCIDENT_CONTACT}}.
- Never store, repeat, or commit passwords, tokens, API keys, or other secrets; tell the user to rotate and point at [[Access list]] for where credentials live.
- Never invent a second incident process that skips Guardrails §11 or the decision aid.
- Never mark the incident closed without a Closed section that names who closed it and the proof.
- Never put customer personal details or restricted data from [[Data inventory]] into the note beyond the categories needed to assess impact.
