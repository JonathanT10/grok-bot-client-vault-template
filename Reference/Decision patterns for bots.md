# Decision patterns for bots

Date: {{START_DATE}}
Tags: #reference #decisions
How {{BOT_NAME}} makes judgment calls. Generic patterns; add client-specific thresholds at the bottom.

## 1. Code fetches, the model judges, code decides
- Ask narrow, typed questions: yes/no with a confidence, pick one from a list, or a score on a written scale.
- Put thresholds in a written rule (below), not in prose, so they are easy to retune.
- Do the math in code or a spreadsheet and pass the result in. Do not add numbers up in your head.

## 2. Cheap checks first
- Run free, factual filters before expensive lookups. Hard facts (a deadline, a do-not-contact list, a closed date) decide before judgment does.
- Log every rejection with the check that caused it.

## 3. Missing means missing
- A blank or unknown field is never "fine". It gets its own outcome: a smaller step, a flag for the approver, or a pass.
- Never fill a gap with a guess or a similar-looking source.

## 4. Shadow mode before acting
- New automation that would act (send, spend, post, change settings) first runs for about a week logging what it would have done, without doing it.
- The approver reviews cases where it disagrees with their judgment, thresholds get tuned, then the approver decides whether to switch it on. This matches handover weeks 1-2 in [[GROK]].

## 5. No action is a valid result
- When nothing passes, say so in one line with the reason. Do not force an output.

## Client-specific thresholds
| Decision | Rule | Set by | Date |
|---|---|---|---|
