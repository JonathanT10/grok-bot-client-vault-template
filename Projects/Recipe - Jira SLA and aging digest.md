# Jira SLA and aging-ticket digest

Date: {{START_DATE}}
Tags: #recipe #tickets #reporting
Owner: {{PRIMARY_CONTACT}}
Status: untested recipe. Needs client setup and {{PRIMARY_CONTACT}}'s written approval before anything is scheduled or run. Source-checked on 2026-11-18; re-check the sources at setup.

A generic recipe for {{BOT_NAME}} and {{PROVIDER_NAME}}: Jira SLA and aging-ticket digest. It is a specification only. Nothing here is scheduled, saved as a routine or skill, or run. Where this note says "unverified", no official source answered the question; do not fill the gap from memory.

## Purpose / scope
A read-only digest of tickets that the help desk tool reports as SLA-breached or near breach, plus tickets with no update in N days. It never comments on, transitions, or reassigns a ticket.
- **Jira Service Management SLA fields** (for example "Time to resolution", "Time to first response", or a custom SLA name) are documented as used in service spaces only. The SLA JQL functions apply only to sites with a Jira Service Management subscription. The digest reports what JSM shows. It never recalculates SLA status itself.
- **Generic issue age** (no update in more than N days) works in any Jira project. It is labelled "age", **not SLA**.
- The digest makes no SLA calculation of its own. SLA status depends on the client's SLA calendars, conditions (start, pause, stop) and goals, and this recipe does not take those on.

## Inputs and configuration (client fills)
- **Fill in: Jira project keys**: project keys in scope.
- **Fill in: aging days (N)**: the N for "no update in N days".
- **Fill in: Jira SLA field names**: the exact names of the JSM SLA fields, if any (custom SLA names differ per site). The client admin confirms them; blank means age only.
- **Fill in: near-breach window**: how close to the goal counts as "near breach", for example `2h`. Atlassian defines no standard threshold, so it is the client's choice.
- Recipient: {{PRIMARY_CONTACT}}. Timezone: {{TIMEZONE}}. Connector: the client's approved Jira connector. Its available search/read actions are confirmed at setup, not assumed.
- Identity requirements (Cloud docs): to see an issue in search results the account needs **Browse projects** on the project, plus issue-level security permission if that is configured. The JSM SLA REST endpoint additionally requires the caller to be an **agent** for the service space (a licensed role). Whether JQL SLA filtering needs an agent seat is **unverified**. The recipe asks for read access only.

## Read-only workflow
1. Run saved, client-reviewed JQL through the **enhanced search** endpoint, `GET` or `POST /rest/api/3/search/jql`. The older `/rest/api/3/search` endpoints are documented as deprecated and being removed; do not use them. Age part, example: `project in (<keys>) AND statusCategory != Done AND updated <= -<N>d`. Always include a unit: for relative dates Atlassian says the default unit is minutes, and values without quote marks or a unit can be read as milliseconds.
2. SLA part, only for the SLA names the client listed. Documented functions: `breached()` (the **most recent** SLA cycle missed its goal), `everBreached()` (any cycle missed a goal), `paused()`, `running()`, `completed()`, `withinCalendarHours()`, `elapsed()` and `remaining()`. Examples from Atlassian: `"Time to resolution" = breached()` and `"Time to resolution" < remaining("2h")`.
   - `remaining()` includes **both** unbreached and already-breached items: positive values mean time left, negative values mean time since breach. For "near breach, not yet breached" combine it with `!= breached()` (Atlassian's own tip), for example `"<SLA name>" < remaining("<near-breach window>") AND "<SLA name>" != breached()`.
   - `breached()` looks at the latest cycle only. Use `everBreached()` only if the client wants history.
   - Functions support the operators Atlassian lists (for example `=`/`!=` for `breached()`, and the comparison operators for `elapsed()`/`remaining()`); other operators are unsupported.
3. Page through all results with `nextPageToken` until the response has no further token (`isLast`). The enhanced search returns no total count. If a total is wanted, use `POST /rest/api/3/search/approximate-count` with the same JQL; the count is approximate.
4. Group the results by assignee (or "unassigned").
5. Write the draft digest. For a ticket in the SLA sections, the SLA detail (goal, elapsed, remaining, breach time) can be read from `GET /rest/servicedeskapi/request/{issueIdOrKey}/sla` (paged with `start`/`limit`; it returns `completedCycles` and at most one `ongoingCycle`). This is one call per ticket, so keep it to the listed tickets only. Whether SLA field values can be read directly from the search response: **unverified**.

## Suggested cadence (not saved)
Daily on business days, early in {{TIMEZONE}}. Relative-date JQL (`-Nd`) and date-only values are interpreted in the **searching account's configured time zone** (default: the Jira server's time zone), so the result can differ by account. Check the connector account's time zone at setup. SLA calendar hours follow the SLA's own calendar, not this setting. Search results may lag recent edits (Atlassian documents a `reconcileIssues` option for read-after-write consistency), so the digest states its run time.

## Rate limits and retries
Jira Cloud returns **HTTP 429** when a limit is exceeded; honour `Retry-After` (seconds), then back off exponentially with jitter and cap retries. Atlassian describes three limit systems: a points-based hourly quota, per-second burst limits per endpoint, and per-issue write limits (not relevant to a read-only recipe). The points-based enforcement applies to Forge, Connect and OAuth 2.0 (3LO) apps; Atlassian says API-token traffic stays under the existing burst limits. Which credential type the client's connector uses: **unverified**. Specific numeric limits: **unverified**. The digest runs one paged search plus one SLA call per listed ticket, which should be small, but a failed or throttled call must be reported, not hidden.

## Output shape
Sections: **SLA breached (as reported by JSM)** · **Near breach (as reported)** · **Aging (no update ≥ N days; not SLA)**. Rows: link to the ticket, summary truncated, assignee, status, last updated. A ticket in an SLA section is not repeated under Aging.

## Evidence / source links
Every row links its ticket URL. The JQL used, the endpoint, the account's time zone and the run time appear in the footer.

## Failure / staleness
- Connector or auth error, or an HTTP 429 that ran out of retries: report the failure. Never report "0 breaches" when the query didn't run.
- SLA field missing, renamed or unreadable: say "SLA data unavailable; age-only digest".
- More pages than were read: report the count shown versus the approximate total, or say the total is unknown.

## Approvals
Delivered only to the agreed recipient. No comments, transitions, or assignments. Any follow-up is drafted for a human to send.

## Acceptance tests (fictional fixtures; not run)
1. Fixture with fictional EX-1 (JSM breached) and EX-2 (14 days idle, no SLA): expect EX-1 under Breached and EX-2 under Aging only.
2. Project with no SLA fields: expect the age-only notice.
3. Query error: expect a failure message, not an empty digest.
4. Fixture where an SLA was breached in an earlier cycle but the latest cycle met its goal: expect it **not** under Breached (it only appears if the client chose `everBreached()`).
5. Fixture "2h left" and "-30m left" on the same SLA: expect "near breach" for the first and "breached" for the second, with no duplicate row.
6. Search response with a further `nextPageToken`: expect the next page to be fetched; a 429 with `Retry-After` expected to delay, not fail silently.
7. Fixture query using a relative date without a unit: expect the recipe to reject or fix it, not run it.

## Sources checked
- A1 Write JQL queries for SLAs (Cloud): https://support.atlassian.com/jira-service-management-cloud/docs/write-jql-queries-for-slas/
- A2 JQL functions (Cloud): https://support.atlassian.com/jira-service-management-cloud/docs/jql-functions/
- A3 JQL fields (Cloud; the Jira Software copy was fetched): https://support.atlassian.com/jira-software-cloud/docs/jql-fields/ (the Service Management copy was linked from search at https://support.atlassian.com/jira-service-management-cloud/docs/jql-fields/ and its text is the same navigation shell; the SLA, Updated, Resolved and statusCategory text was read on the Software copy)
- A4 What are app roles in Jira Service Management: https://support.atlassian.com/jira-service-management-cloud/docs/what-are-app-roles-in-jira-service-management/
- A5 Find the total number of work items in Jira Cloud: https://support.atlassian.com/jira/kb/find-the-total-number-of-work-items-in-jira-cloud-using-jql-or-issue-search/
- D1 Jira Cloud REST API v3, issue search: https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/
- D2 JSM Cloud REST API, request group (SLA endpoints): https://developer.atlassian.com/cloud/jira/service-desk/rest/api-group-request/
- D3 Jira Cloud rate limiting: https://developer.atlassian.com/cloud/jira/platform/rate-limiting/
- D4 Build an app that respects rate limits: https://developer.atlassian.com/cloud/jira/platform/build-an-app-that-respects-rate-limits/
- D5 Search and Reconcile: https://developer.atlassian.com/cloud/jira/platform/search-and-reconcile/
Excluded as not on the two allowed hosts, even though they appeared in search: confluence.atlassian.com pages (including the Data Center function reference and a KB saying the legacy search endpoint is fully removed), community.atlassian.com and community.developer.atlassian.com threads (including the 5,000 / 100 `maxResults` claim), and third-party blogs.

## Unverified items
- Whether SLA field values can be returned directly in the search response `fields`, and their format. Only the dedicated SLA REST endpoint was read.
- Whether a project must have SLAs configured for the fields to exist (inferred).
- Whether a licensed agent seat is needed for JQL SLA queries, and what SLA data a non-agent account can see.
- SLA JQL behavior and SLA REST availability in team-managed spaces, and everything about Data Center (the Data Center pages are on a non-allowed host).
- Numeric rate-limit values (points per call, hourly quota, burst rates); which credential type the connector uses.
- The per-page `maxResults` limit for enhanced search (only a community thread stated it).
- Exact removal date of legacy search (D1 says "currently being removed").
- Whether `breached()`/`remaining()` consider only the ongoing cycle's goal for paused SLAs.
- Date-only JQL values and daylight-saving edge cases.
