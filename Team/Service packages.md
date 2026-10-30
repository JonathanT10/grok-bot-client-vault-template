# Service packages

Date: {{START_DATE}}
Tags: #team #service
Owner: {{PROVIDER_NAME}}
Client tier: {{SERVICE_TIER}}

Draft tiers for setting up and running a Grok Bot team. Prices are placeholders set by {{PROVIDER_NAME}}; none are suggested here. The client's own Grok Bot plan and connector subscriptions are billed to the client and are not part of these prices unless the agreement says so. The signed agreement and [[Service scope]] are binding; this note is the menu.

## At a glance
| | Pilot | Starter | Team | Managed |
|---|---|---|---|---|
| Price | {{PRICE_PILOT}} | {{PRICE_STARTER_SETUP}} setup + {{PRICE_STARTER_MONTHLY}}/month | {{PRICE_TEAM_SETUP}} setup + {{PRICE_TEAM_MONTHLY}}/month | {{PRICE_MANAGED_MONTHLY}}/month |
| Length | 30 days | Ongoing | Ongoing | Ongoing |
| Bots | Record Keeper + 1 | Record Keeper + 1 | Up to 5 starter roles | Team + add-ons as agreed |
| Vault and onboarding | Yes | Yes | Yes | Yes |
| Routines included | Up to 3 | Up to 3 | Up to 10 | As agreed |
| Change requests included / month | 1 | 1 | 3 | As in agreement |
| Check-ins | Weekly | Monthly | Every two weeks | Weekly |
| Monthly report | Readout at day 30 | Yes | Yes | Yes, plus quarterly review |
| Daily team sweep | Optional | n/a | Yes | Yes |
| Provider response time | {{SUPPORT_RESPONSE_TIME}} | {{SUPPORT_RESPONSE_TIME}} | {{SUPPORT_RESPONSE_TIME}} | Priority, as in agreement |

## Pilot
The [[Pilot program]].
- **Includes:** discovery, baseline plan, security plan, vault, [[Record Keeper]] and one use-case role (usually the [[Briefing Bot]] or [[Content Producer]]), weekly check-ins, readout draft, go / no-go meeting.
- **Deliverables:** vault with capture entries for every step, access log, measured before/after per use case, readout document.
- **Client provides:** a sponsor, time-log participation for one week at the start and end, admin consent for connectors, written vendor data terms.
- **Exit:** if the numbers do not hold, stop; the vault stays with the client. The pilot fee may be credited toward a tier if the agreement says so.

## Starter
For a first bot team of one or two.
- **Roles:** [[Record Keeper]] + one of [[Briefing Bot]], [[Channel Liaison]], [[Idea Partner]], or [[Content Producer]].
- **Routines:** daily review, weekly review, and one scheduled report or one event watch.
- **Skills:** the starter set in Skills/, adapted and tested on two days' inputs.
- **Connectors:** up to three (for example the vault repo, email, chat).
- **Support:** {{PROVIDER_CONTACT}}, response time as in [[Service scope]].
- **Setup timeline:** week 1 vault and Record Keeper; week 2 second bot; weeks 3-4 handover.

## Team
The full starter team, launched one bot at a time over 6 to 8 weeks.
- **Roles:** [[Record Keeper]], [[Briefing Bot]], [[Channel Liaison]], [[Idea Partner]], then [[Coordinator]]. [[Content Producer]] as an add-on or in place of one role.
- **Routines:** everything in Starter, plus the Coordinator's morning status, weekly team review, and usage check; the liaison's channel watch; the weekly idea triage; the Record Keeper's daily team sweep.
- **Team setup:** roster and lanes in [[Bot configuration]], hand-off formats, approval tiers, shared [[Bot playbook]] lessons.
- **Connectors:** as discovery calls for, least access.
- **Setup timeline:**
  | Week | Adds |
  |---|---|
  | 1 | Vault, Record Keeper |
  | 2 | Briefing Bot (or the top use case) |
  | 3-4 | Channel Liaison or Idea Partner |
  | 5-6 | The other one |
  | 6-8 | Coordinator, daily sweep, team review |

## Managed
The provider runs the team for the client month to month.
- Everything in Team.
- Monthly report and access review, prompt tuning from the weekly grades, pausing ignored routines, usage-pace watch, lessons kept in the [[Bot playbook]].
- New skills and routines within the included change requests.
- Quarterly review against the pilot baseline, with a short "keep / change / stop" list per routine.
- Incident handling: a provider-written [[Incident note template]] note within one business day of any bot mistake.

## Add-ons
| Add-on | Price | Notes |
|---|---|---|
| Extra role (beyond the tier) | {{PRICE_ADDON_ROLE}} | Uses the matching note in Team/Roles/, [[Skill spec template]], and [[Routine spec template]] |
| Content Producer | {{PRICE_ADDON_CONTENT}} | Library review plus an agreed number of drafts per month |
| Extra change request | {{PRICE_CHANGE_REQUEST}} | [[Change request template]] |
| Custom skill | {{PRICE_ADDON_SKILL}} | Tested on two days' inputs before go-live |
| Leadership demo or readout prep | {{PRICE_ADDON_DEMO}} | Dummy data only; see [[Pilot program]] "Live demo format" |
| Shareable bot template | {{PRICE_ADDON_TEMPLATE}} | A copy of one bot's setup with every client detail removed, for the client to share internally |

## How to pick a tier (for the sales conversation)
| If the client... | Suggest |
|---|---|
| Is unsure, or must convince leadership | Pilot |
| Has one clear recurring job (a weekly report, an inbox, a channel) | Starter |
| Has several people and three or more recurring jobs | Team |
| Wants results without managing the bots | Managed |

## Always included, every tier
- No secrets in the vault; credentials stay in the client's password manager.
- Client owns the vault repo; provider and bot access removed at the end of service.
- The approval rules in [[GROK]]: the client approves anything that sends, spends, publishes, deletes, changes permissions, or connects or disconnects an account.
- Draft-only first weeks under the gradual handover.
- Every report ends with "Decisions waiting on {{PRIMARY_CONTACT}}".
