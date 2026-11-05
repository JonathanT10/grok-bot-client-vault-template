# 30-day review: {{BOT_NAME}}

Date: {{date:YYYY-MM-DD}}
Tags: #review #onboarding
Client: {{CLIENT_NAME}}
Go-live: {{GO_LIVE_DATE}}
Attendees:

Held about 30 days after go-live. Every number names its source (see [[GROK]] "Show your work"); if a number can't be sourced, leave it out. Use the "before" numbers in [[Business profile]] and the latest [[Monthly client report]] rather than re-measuring.

## 1. Adoption and value
| Measure | Before (source) | Target | Actual (source) | Notes |
|---|---|---|---|---|
| Active users | | | | |
| Use case 1 success rate | | | | |
| Use case 2 success rate | | | | |
| Use case 3 success rate | | | | |
| Time saved per week ([[Time savings log]]) | | | | |
| User satisfaction (1 to 5) | | | | |

## 2. Safety and compliance
| Question | Answer (with source) |
|---|---|
| Incidents reported (count, summary, no sensitive details) | |
| Any action taken without required approval? | |
| Any data moved to a wider audience than intended? | |
| Any secrets pasted into chat? Were they rotated? | |
| Any prompt-injection attempts observed? | |
| Connector access still least-privilege? Anything to remove? | |
| Memory and vault Reference notes reviewed and cleaned? | |
| Usage within plan and budget? | |
| Handover stage of each routine ([[Bot configuration]]) | |

## 3. Changes
| Change | Reason | Owner | Due | Policy change needed? |
|---|---|---|---|---|

## 4. Decision
- [ ] Continue as configured
- [ ] Continue with the changes in section 3
- [ ] Expand (new users, use cases, or connectors): update [[Discovery questionnaire]] answers, [[Bot configuration]], and [[Guardrails policy]] first
- [ ] Pause or roll back. Reason:

Record the decision with [[Decision record template]]. Review [[Guardrails policy]] section 14 now. Next review: (default quarterly).

## Decisions waiting on {{PRIMARY_CONTACT}}
- None

## Sign-off
| Role | Name | Approval | Date |
|---|---|---|---|
| Client approver | {{PRIMARY_CONTACT}} | | |
| Bot owner | {{BOT_OWNER}} | | |
| Provider | {{PROVIDER_NAME}} | | |
