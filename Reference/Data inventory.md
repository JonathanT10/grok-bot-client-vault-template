# Data inventory

Date: {{START_DATE}}
Tags: #reference #data #privacy
Which kinds of data {{CLIENT_NAME}} handles and whether {{BOT_NAME}} may come into contact with them. Filled from [[Discovery questionnaire]] section 6. Describe data by category and location only; never paste examples of real records here. Rules: [[Guardrails policy]] sections 5 and 9.

| Data type | Handled by business? | Bot may see it? | Where it lives | Notes / restrictions |
|---|---|---|---|---|
| Public information (website, marketing) | | | | |
| Internal business information (procedures, schedules) | | | | |
| Employee personal data (HR, payroll) | | | | |
| Customer contact information | | | | |
| Customer financial or billing data | | | | |
| Payment card data | | | | Bot should not handle ([[Guardrails policy]] 9b) |
| Health information (PHI) | | | | |
| Legal or privileged material | | | | |
| Government IDs (SSN, driver's license, passport) | | | | |
| Trade secrets or confidential strategy | | | | |
| Credentials and secrets | | never | {{PASSWORD_MANAGER}} | Never shared with the bot |

Overall sensitivity (choose one): low (public or internal, non-personal) / moderate (customer or employee personal data) / high (regulated or highly confidential).

| Question | Answer |
|---|---|
| Any prior data incident? (brief, no sensitive details) | |
| Are staff trained on data handling today? | |
| Any customer contracts restricting AI tools on their data? | |
