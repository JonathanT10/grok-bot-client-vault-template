# Discovery questionnaire

Date: {{START_DATE}}
Tags: #onboarding
Client: {{CLIENT_NAME}}
Interviewer: {{PROVIDER_NAME}}
Interviewee: {{PRIMARY_CONTACT}}, {{PRIMARY_CONTACT_ROLE}}

Run this as a 60 to 90 minute conversation. Write answers inline, then move each answer to the note named in brackets. Do not record passwords or account numbers, even if offered; note only where they are kept.

## 1. The business -> [[Business profile]]
- What does {{CLIENT_NAME}} do, in one sentence a customer would use?
- Industry, size (staff, locations), years in business.
- Who are the customers? How do they find you, and how do they contact you?
- Hours of operation and time zone ({{TIMEZONE}}?). Busy seasons or days?
- Main products or services and rough price points the bot may quote (or "never quote prices").
- What does a great week look like? A bad one?
- Top 3 goals for the next 6 to 12 months.
- Anything the business is regulated on (licensing, health, finance, privacy, records retention)? Use the checklist in 1b.

## 1b. Regulatory and compliance -> [[Business profile]] "Regulatory or compliance notes", [[Guardrails policy]] section 9
Check every one that applies, even if only part of the business is affected.
- [ ] HIPAA: protected health information
- [ ] PCI DSS: stores, processes, or transmits payment card data
- [ ] Legal / attorney-client privilege
- [ ] GLBA / consumer financial privacy
- [ ] SOX / public-company financial controls
- [ ] FERPA: student education records
- [ ] GDPR / UK GDPR: personal data of people in the EU or UK
- [ ] US state privacy laws (for example CCPA/CPRA):
- [ ] Government contracts (for example CUI, CMMC):
- [ ] Industry certification kept or pursued (for example SOC 2, ISO 27001)
- [ ] Contractual data obligations to customers (NDAs, DPAs, data residency)
- [ ] Records retention or legal hold
- [ ] Other:
- [ ] None known

Also ask: who owns compliance ({{COMPLIANCE_OWNER}}?); existing written security or privacy policies; whether BAAs, DPAs, or other vendor agreements are required; data residency; retention periods; last security assessment (date, by whom). If any regulated box is checked, the matching add-on in [[Guardrails policy]] section 9 must be completed and the compliance owner signs off before go-live.

## 2. People -> [[People and roles]]
- Who works here, and what does each person own?
- Who can approve the bot's actions? Any spending or sending limits per person?
- Who should the bot never contact or act for?
- Who fills these roles (business contact details only)? Executive sponsor; IT or systems admin ({{IT_ADMIN}}); security or compliance owner ({{COMPLIANCE_OWNER}}); bot owner after handoff ({{BOT_OWNER}}); bot managers ({{BOT_MANAGERS}}); incident contact ({{INCIDENT_CONTACT}}) and after-hours contact ({{AFTER_HOURS_CONTACT}}); privacy requests ({{PRIVACY_CONTACT}}).
- Is written approval needed for anything, or is an OK in chat enough?
- Key outside people: accountant, IT support, main vendors, partners.
- How does each person prefer to be reached (email, chat, text), and during what hours?

## 3. Tools and systems -> [[Systems and connectors]], [[Access list]]
For each, note: what it is used for, who owns the account, how many users, whether the bot should read, draft, or act.
- Email and calendar (Google Workspace, Microsoft 365, other):
- File storage and documents:
- Chat (Slack, Teams, other):
- Accounting and invoicing:
- CRM, customer list, or booking system:
- Point of sale or e-commerce:
- Website and listings (CMS, Google Business Profile, review sites):
- Social media accounts:
- Phone, texting, or call answering:
- Project or task tracking:
- Industry-specific software:
- Password manager in use (or none yet):
- Who is the IT contact, if any?
- Identity provider or single sign-on in use?
- Is multi-factor authentication enforced for all staff?
- Who approves granting a new app access to company systems?
- Tools the bot must **never** connect to (record in [[Systems and connectors]] "Not connected on purpose"):

## 4. Pain points -> [[Business profile]] "Pain points"
- What repetitive tasks eat the most time each week? Roughly how many hours?
- What falls through the cracks (missed emails, late follow-ups, forgotten renewals)?
- What questions do customers ask over and over?
- What reports or numbers do you wish you had but never get to?
- What has been tried before (tools, assistants, staff) and why did it not stick?

## 5. What to automate -> [[Bot configuration]], Projects/
For each candidate, capture: trigger, input, output, who reviews it, how often, and what "done right" looks like.
- Daily: (for example, morning brief of email and calendar, end-of-day summary)
- Weekly: (for example, weekly review, overdue invoice list, review-site summary)
- On request: (for example, research a vendor, draft a proposal, prep for a meeting)
- Event-driven: (for example, new lead email arrives, new review posted)
- Rank them: which 3 would make the biggest difference in the first month? For each, note who uses it, how often, systems involved, time spent today, and must-have or nice-to-have.
- What should the bot explicitly **not** do (goes to [[Bot configuration]] "Never")?

## 6. Boundaries and comfort level -> [[Bot configuration]] "Approval rules"
- What should the bot never do, even if asked?
- Is the bot allowed to send anything on its own after the handover period? To whom?
- Spending: may it ever spend money? Up to what amount, on what?
- Tone: how formal? Any words or phrases to use or avoid? Sign-off?
- Should outside people know they are talking with an assistant?
- What information is too sensitive for the bot to see at all?
- Data sensitivity: walk the table in [[Data inventory]] (data type, handled?, bot may see it?, where it lives) and pick an overall rating (low, moderate, high). Any customer contracts restricting AI tools on their data? Staff trained on data handling today?

## 7. Service and success -> [[Service scope]]
- Who on the client side is the day-to-day contact for the setup?
- Preferred check-in rhythm (weekly call, monthly report)?
- How will we measure success at 30, 60, 90 days? (hours saved, response time, tasks completed)
- Before numbers to capture now (time per task today, backlog size, response time):
- Pilot group, preferred training format (live, recorded, written), blackout dates or busy seasons, budget or plan constraints.

## Follow-ups from this session
- [ ] Item, owner, date
