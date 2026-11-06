# Incident notification decision aid

Date: {{START_DATE}}
Tags: #reference #incident #compliance
Owner: {{COMPLIANCE_OWNER}}
Status: draft until walked through with counsel for this client

Helps {{COMPLIANCE_OWNER}} decide whether anyone **outside** {{CLIENT_NAME}} must be notified after an incident defined in [[Guardrails policy]] section 11. This is a **checklist, not legal advice**. Outside counsel (or the client's insurer, when engaged) decides what notice is required.

## Immediate path (do this first)

Do **not** use this note instead of the incident process. Follow [[Guardrails policy]] section 11, then come back here for the notification question.

1. **Stop** — pause the routine or bot, or disconnect the connector.
2. **Report** — {{INCIDENT_CONTACT}} · {{PROVIDER_NAME}} ({{PROVIDER_CONTACT}}) · after hours {{AFTER_HOURS_CONTACT}}.
3. **Open** a note from [[Incident note template]] (facts, impact, timeline).

## Decision questions

Answer yes / no from known facts. Mark "unknown" if still investigating. Owner: {{COMPLIANCE_OWNER}}.

| # | Question | Y / N / unknown | Notes |
|---|---|---|---|
| 1 | Was personal data of employees or customers involved? | | |
| 2 | Was regulated data involved? (see Discovery questionnaire section 1b and [[Guardrails policy]] section 9) | | |
| 3 | Did data leave the company, or go to the wrong recipient? | | |
| 4 | Do any customer or partner contracts have notice clauses for this kind of event? | | |
| 5 | Is unauthorized access suspected (account takeover, injected instructions followed, unexpected reach into systems)? | | |

If any answer is **yes** or **unknown**, keep going: ask the contacts below before sending, posting, or promising notice to anyone outside the company.

## Who to ask

Prefer named roles already in [[People and roles]]. Rare contacts (outside counsel, cyber insurer) stay blank until the client fills them — do not invent placeholders for them.

| Role | Who (fill in) | Asked? (date) | Guidance received (summary only) |
|---|---|---|---|
| Compliance | {{COMPLIANCE_OWNER}} | | |
| Privacy | {{PRIVACY_CONTACT}} | | |
| Provider | {{PROVIDER_NAME}} ({{PROVIDER_CONTACT}}) | | |
| Outside counsel | _(hand-fill)_ | | |
| Cyber insurer / broker | _(hand-fill)_ | | |

## Time limits to check

Fill from **this client's** counsel and contracts. The windows below are common ones people verify — **not advice**, and not a substitute for counsel.

| Obligation source | Window to verify (client counsel fills) | Applies? | Due by (date/time, client TZ) |
|---|---|---|---|
| Regulator / statute | Confirm for this client; many breach-notice statutes use windows on the order of **24–72 hours** from discovery — verify the actual rule that applies | | |
| Customer / partner contract | Per the notice clause (hours or business days) | | |
| Cyber insurer / policy | Per the policy (often prompt notice of a claim or incident) | | |

## Decision record

- Write the call in a `Decisions/` note from [[Decision record template]] (link here: ).
- Mirror a short summary in the open [[Incident note template]] under **Client communication** (who was told, when, how — and who was **not** told, if that was the decision).
- Decider: {{COMPLIANCE_OWNER}} (with counsel as the client decides). Date:

## Related

- [[Guardrails policy]] section 11 (Stop → Report → Contain → Assess → Fix)
- [[Incident note template]]
- [[Data handling notice]]
- [[Data inventory]]
- [[Staff acceptable use guide]] "Report it"
