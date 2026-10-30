# Idea triage

Date: {{START_DATE}}
Tags: #skill #ideas
Status: starter (adapt and test on two days before trusting)

Capture ideas and requests fast, then score them and promote the good ones to Projects/. Also the intake path for "could the bot do X?" requests.

## When to use
- Capture: any time someone has an idea, a request for the bot, or a "we should..." thought.
- Triage: during the weekly review, or when asked "what should we work on next?".

## Inputs
- Capture: the idea in a sentence or two and where it came from (person, email, own idea).
- Triage: open Inbox notes (status new or parked).

## Steps
### Capture
1. Pull the vault.
2. If a same-day Inbox note from the same source exists, add to it. Otherwise create `Inbox/YYYY-MM-DD short title.md`.
3. Write the idea, source, why it might matter, and which pain point in [[Business profile]] it touches.
4. Set `Status: new`. Add a line to log.md, commit.

### Triage
1. Score 1-5 on:
   - Value: time or money saved, or risk reduced, for {{CLIENT_NAME}}.
   - Fit: uses systems and data already connected.
   - Effort: 5 = an afternoon, 1 = months.
   - Want: does {{PRIMARY_CONTACT}} actually want it? Their call; leave `?` and ask.
2. Total out of 20:
   - 15+: promote. Create `Projects/<Name>.md` (goal, owner, first step, sources), set `Status: promoted to [[<Name>]]`. If it changes the bot setup, also file a [[Change request template]] note.
   - 10-14: park. Look again next weekly review.
   - Under 10: drop, with a one-line reason.
3. If promoting means real money, a lot of time, or is hard to undo, run the [[Decision board]] first.
4. Never delete Inbox notes; update their status.
5. Add a line to log.md, commit.

## Done when
- Success: every idea has a source and a status; promoted ideas have a project note with a clear first step.
- Failure: ideas with no status, scores with no reasons, or projects nobody asked for.
