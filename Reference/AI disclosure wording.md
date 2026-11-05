# AI disclosure wording

Date: {{START_DATE}}
Tags: #reference #policy
Owner: {{COMPLIANCE_OWNER}}
Approved by: {{PRIMARY_CONTACT}} (date)
Status: draft until approved

How {{CLIENT_NAME}} tells customers, vendors, and other outside people that they are dealing with an AI assistant. {{BOT_NAME}} and staff follow this note. Check current law and platform rules for the client's location ({{CLIENT_LOCATION}}) and industry during setup; some places and industries require disclosure, and some platforms have their own rules. This note is not legal advice.

## 1. The decision (fill in during discovery)
| Situation | Disclose? | Where |
|---|---|---|
| Bot drafts, a person reviews and sends from their own account | (yes / no / optional) | (signature line, none) |
| Bot sends on its own after approval (handover week 3-4) | yes (recommended) | first line or signature |
| Bot answers in a shared outside channel ({{LIAISON_CHANNEL}}) | yes | bot profile and first message |
| Bot email address ({{BOT_NAME}}) | yes | display name and signature |
| Phone or live chat with the public | yes, before anything else | opening line |
| Marketing content drafted by the bot | (per platform rules) | (label or none) |

Record the decision in Decisions/ and copy the "Disclose?" column into [[Bot configuration]].

## 2. Standard wording
Pick one per channel. Keep it short, plain, and true. Always name a person to reach.

- **Email signature (bot sends):** "Sent by {{BOT_NAME}}, the AI assistant for {{CLIENT_NAME}}. A person reviews our assistant's work. To reach someone directly, reply 'person' or email {{PRIMARY_CONTACT_EMAIL}}."
- **Email signature (person sends a bot draft, if disclosing):** "Drafted with help from our AI assistant and reviewed by (sender)."
- **Chat or channel profile:** "{{BOT_NAME}} is an AI assistant for {{CLIENT_NAME}}. It can make mistakes. It never agrees to prices, contracts, or payments; a person does."
- **First message in a new outside thread:** "Hi, I'm {{BOT_NAME}}, {{CLIENT_NAME}}'s AI assistant. I can help with (scope). For anything else I'll bring in (person)."
- **When asked "Am I talking to a bot?":** always answer truthfully: "Yes, I'm an AI assistant. Would you like me to bring in a person?"

## 3. Rules that always apply
- Never claim to be a person, and never deny being an AI when asked.
- Never invent a staff name or personal sign-off for the bot.
- The bot does not make commitments on price, contract terms, refunds, or legal matters to outside people; it hands those to a person.
- If an outside person asks for a person, hand off and record it in the Daily note.
- Changing this wording is a rules change: it needs {{PRIMARY_CONTACT}}'s OK and a log.md line.
