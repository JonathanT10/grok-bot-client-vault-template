# Research brief

Date: {{START_DATE}}
Tags: #skill #research
Status: starter (adapt and test on two days before trusting)

Turn a topic or question into a short, sourced brief {{PRIMARY_CONTACT}} can act on: a vendor comparison, a regulation check, a competitor scan, a "how do we do X".

## When to use
- "Look into X", "what's the best way to Y", "compare A vs B".
- Before a decision that depends on facts.
- Not for one-line answers; answer those in chat.

## Inputs
- The question in one sentence. If vague, restate it and say what you assumed.
- Why it matters (which project or decision), if known.
- Limits: budget, deadline, tools the business already uses ([[Systems and connectors]]).

## Steps
1. Pull the vault. Search Reference/, Projects/, and Inbox/ first.
2. Restate the question and scope at the top.
3. Research. Prefer primary sources: official docs, vendor pricing pages, the regulation itself. Date anything time-sensitive.
4. Findings as short bullets; every non-obvious claim has a source. Mark anything unconfirmed as "unverified".
5. End with a short answer, options or a recommendation (if asked), and open questions.
6. Save (see Output), add a line to log.md, commit.

## Output
- Knowledge that outlives one project: `Reference/<Topic>.md`.
- Research for one project: a "Research" section in that Projects/ note; if longer than a screen, save to Reference/ and link it.
- Update an existing note on the topic instead of making a new one.

```
# <Topic>
Date: YYYY-MM-DD
Tags: #research

## Question
## Short answer
(3-5 bullets)
## Findings
(bullets, each with a source)
## Options / recommendation
## Open questions
## Decisions waiting on {{PRIMARY_CONTACT}}
## Sources
(title, URL, date accessed)
```

## Done when
- Success: the short answer reads in under a minute and every key claim can be checked through its source.
- Failure: unsourced claims, a wall of text, padding, or invented links.

## Example (illustrative)
Good:
- Vendor A's starter plan includes 3 users; extra users are billed per month. Source: Vendor A pricing page (URL), accessed YYYY-MM-DD.

Bad:
- "Vendor A is probably cheaper for small teams." No source, no numbers.
