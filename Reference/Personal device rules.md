# Personal device rules

Date: {{START_DATE}}
Tags: #reference #policy #optional
Owner: {{IT_ADMIN}}
Approved by: {{PRIMARY_CONTACT}} (date)
Status: optional. Delete this note if staff use only business-owned devices, and record that in [[Guardrails policy]].

Rules for staff who use a personal phone, tablet, or computer to reach {{BOT_NAME}}, the vault, or a connected business account. Keep them short enough that people follow them. Pair with the [[Staff acceptable use guide]].

## 1. Allowed or not (decide in discovery)
| Use | Allowed on personal devices? |
|---|---|
| Chat with {{BOT_NAME}} in {{CHAT_PLATFORM}} | (yes / no) |
| Approve bot actions (ACTION / TARGET / ... asks) | (yes / approvers only / no) |
| Open the vault (Obsidian or repo web view) | (yes / read only / no) |
| Business email and calendar | (yes / no; per existing company policy) |
| Download vault files or reports | (no recommended) |

## 2. Minimum device rules (if any use is allowed)
- Screen lock with PIN, password, or biometrics; auto-lock within 5 minutes.
- Operating system and apps kept up to date.
- Multi-factor sign-in on every business account; never save business passwords in the device's browser if the business uses {{PASSWORD_MANAGER}}.
- No shared family accounts or profiles for business apps.
- Don't screenshot, forward, or copy bot outputs or vault notes into personal apps, personal cloud storage, or other AI tools.
- Use the business's own apps and accounts only; don't connect personal accounts to {{BOT_NAME}}.

## 3. Lost, stolen, replaced, or leaving
- Report a lost or stolen device to {{IT_ADMIN}} the same day (after hours: {{AFTER_HOURS_CONTACT}}).
- {{IT_ADMIN}} signs the device out of business accounts and records it in log.md; rotate any password the device held.
- Before selling, replacing, or leaving the business: sign out of every business app and remove business data. {{IT_ADMIN}} confirms in [[Access list]].

## 4. What the business can and cannot see
State this plainly to staff: the business manages business accounts and data, not personal content on the device. Record any device-management tool the business uses in [[Systems and connectors]].
