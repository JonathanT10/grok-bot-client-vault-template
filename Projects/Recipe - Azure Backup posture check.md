# Azure Backup posture and deletion-event check

Date: {{START_DATE}}
Tags: #recipe #backup #azure
Owner: {{IT_OWNER}}
Status: untested recipe. Needs client setup and {{PRIMARY_CONTACT}}'s written approval before anything is scheduled or run. Source-checked on 2026-11-06; re-check the sources at setup.

A generic recipe for {{BOT_NAME}} and {{PROVIDER_NAME}}: Azure Backup posture and deletion-event check. It is a specification only. Nothing here is scheduled, saved as a routine or skill, or run. Where this note says "unverified", no official source answered the question; do not fill the gap from memory.

## Purpose / scope
A read-only report for {{CLIENT_NAME}} that covers:
- backup item health and latest recovery points
- built-in Azure Backup security and job alerts
- Activity Log control-plane events around backup protection

**No remediation**: it does not re-protect, restore, delete, acknowledge or close alerts, or change monitoring settings.
**Absence is not evidence.** "No alert" or "no event found" never means "no deletion happened" or "backups are fine". It means only that "nothing was visible to this identity, in this scope, in this retention window".

## Applicability (S1, S5, S8)
- **Recovery Services vault** (`Microsoft.RecoveryServices`): Azure VMs, SQL/SAP HANA in VMs, Azure Files, agent/DPM/MABS.
- **Backup vault** (`Microsoft.DataProtection`): newer workloads such as Blobs, Disks, and PostgreSQL.
The client lists which vault types are in scope. The report states which types were covered.

## Configuration (client fills; proposals)
- **Fill in: Azure Backup scope**: subscriptions/resource groups and the vaults (by type) in scope.
- **Fill in: stale recovery point threshold (hours)**: the stale-recovery-point threshold, set by the client.
- **Fill in: expected changes record**: where approved changes are recorded, used to mark events "expected".
- **Fill in: Activity Log lookback (days)**: must be 90 or less unless the client confirms a diagnostic export (S4).
- Recipient/approver: {{PRIMARY_CONTACT}}. Times are reported in {{TIMEZONE}}.

## Permissions and approval gate (do not grant from this doc)
| Need | Candidate built-in role | Scope | What else it allows (S2, S3) |
|---|---|---|---|
| Backup items, jobs, recovery points, backup alerts (both vault types) | **Backup Reader** | Vault(s) or their resource group(s) | Includes `monitoringAlerts/write` and `monitoringConfigurations/*`. The recipe must never use them. |
| Activity Log events | **Not in Backup Reader.** Options are Monitoring Reader or Reader. | Subscription or resource group(s) of the vaults | Monitoring Reader = `*/read` across the scope, plus Log Analytics search and `Microsoft.Support/*`. Reader = broad read. |

Any role assignment is a change to the client's tenant. It needs a written request that names the identity, role, and scope, explicit approval from {{PRIMARY_CONTACT}} , and an entry in the client's [[Access list]]. A narrower custom role is possible but **unverified** and needs separate design. This recipe grants nothing.

## Read-only workflow (concept; no queries written here)
1. **Inventory**: list protected items/backup instances per in-scope vault, with protection state and latest recovery point (portal Backup Items, or ARG `RecoveryServicesResources`; S6, S8).
2. **Freshness**: flag items whose latest recovery point is older than the threshold, or whose state is ProtectionStopped, SoftDeleted, or ProtectionError (documented states, S8).
3. **Jobs**: read failed or warning jobs. ARG keeps only **≤14 days** of jobs; older history needs a vault diagnostics export to Log Analytics, if one exists (S8, S7).
4. **Security alerts**: read built-in Azure Monitor backup alerts (Delete Backup Data, Upcoming Purge, Purge Complete, Soft Delete Disabled, shorter-retention changes, MUA Disabled). Note the timing rule: for a Backup vault with soft delete on, Delete Backup Data fires **at purge**, not at delete (S7). Do not rely on classic alerts, which are deprecated 31 March 2026.
5. **Activity Log**: read control-plane events on the vaults within the lookback window (90 days by default; S4). Match each event to an expected change, or mark it "needs check". "Who" comes only from the event's caller field.
6. Write the draft report. Do not act on any finding.

Exact operation names and query text are **out of scope**. They need a cloud coding handoff with the client's approval before anything is built.

## Suggested cadence (not saved)
Weekly, plus an on-request lookback. A lookback is limited to 90 days unless logs are exported.

## Output shape
1. Coverage header: identity used, scopes read, vault types covered, any scopes denied, and the retention window.
2. Protected items table: item, vault type, protection state, latest recovery point, and a flag.
3. Jobs table, with a note on the 14-day window.
4. Security alerts table: alert, time, item, state as read.
5. Activity events table: time, operation, caller, then either the matched change or "needs check".
6. A closing line: "Absence of alerts/events is not evidence of no deletion".

## Evidence / source links
Every row cites its source surface (vault, ARG, Azure Monitor alert, or Activity Log) and the resource or event ID. Template-level claims cite S1–S8 with the date checked.

## Failure / staleness
- Permission denied or a partial scope: list exactly what was not read, and do not claim "healthy".
- Lookback longer than retention: report "not checkable before <date>".
- Activity Log entries can lag by 3–20 minutes (S4), so a very recent event may not show yet.
- Actions taken in the agent, DPM, or MABS UIs are outside the Azure Backup RBAC roles (S1) and may not appear in the same way.

## Approvals
The recipe is read-only. Role grants, diagnostic-export setup, alert notification rules, and any remediation are separate approved changes, never part of this recipe.

## Acceptance criteria (fictional fixtures; **NOT executed**)
1. A fictional RSV item `vm-example-01` whose latest recovery point is 72 h old, with a threshold of 48 h. Expected: flagged.
2. A fictional Backup vault item with soft delete on, where a delete happened today. Expected: the report says a Delete Backup Data alert may only appear at purge, and does not claim "no deletion".
3. A lookback of 120 days with no export. Expected: "not checkable" for days 91–120.
4. Activity Log access denied. Expected: the events section is marked "not read". No empty "0 events" is shown.
5. A fictional event with no matching change. Expected: "needs check".
6. A run attempting to acknowledge an alert. Expected: refused, because it is outside the recipe.

## Sources checked
- S1 "Manage Backups with Azure role-based access control": https://learn.microsoft.com/en-us/azure/backup/backup-rbac-rs-vault. Sections: role intro and "Mapping Backup built-in roles to backup management actions".
- S2 "Azure built-in roles for Storage", **Backup Reader** entry (JSON role definition, 64 actions): https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/storage
- S3 "Azure built-in roles for Monitor", **Monitoring Reader** entry: https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/monitor
- S4 "Activity Log in Azure Monitor". Sections: "Activity log entries", "Retention period", "Export activity log", "Identify resource creation". https://learn.microsoft.com/en-us/azure/azure-monitor/platform/activity-log
- S5 "Overview of the Backup vaults": https://learn.microsoft.com/en-us/azure/backup/backup-vault-overview
- S6 "Monitor Azure Backup protected workloads". Section: "Backup Items in Recovery Services vault". https://learn.microsoft.com/en-us/azure/backup/backup-azure-monitoring-built-in-monitor
- S7 "Monitoring and reporting solutions for Azure Backup". Sections: scenarios table, "Azure Monitor alerts for Azure Backup" table. https://learn.microsoft.com/en-us/azure/backup/monitoring-and-alerts-overview
- S8 "Query your backups using Azure Resource Graph". Sections: "Getting started" note, "Sample queries". https://learn.microsoft.com/en-us/azure/backup/query-backups-using-azure-resource-graph

## Unverified items
- The exact Activity Log `operationName` strings for stop-protection and delete-data were not identified. Finding them needs query or implementation research, left for a **cloud coding handoff** if this is ever built.
- The S7 alert table seems to have misaligned descriptions for Purge Complete and Soft Delete Disabled (the description text looks swapped). Only the alert names are relied on.
- Whether the Backup vault `backupInstances` ARG fields match the RSV `lastRecoveryPoint` was not confirmed. S8 shows that field only for RSV protected items.
- No per-tenant facts were read. Whether any client has diagnostics export, soft delete, or MUA turned on is unknown until that client's admin confirms.
- A narrower custom role (Backup Reader actions plus only `Microsoft.Insights/eventtypes/values/read`) is plausible, but this note does not verify it. Custom-role design is implementation work.
