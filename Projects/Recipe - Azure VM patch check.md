# Azure VM patch and OS-version check

Date: {{START_DATE}}
Tags: #recipe #patching #azure
Owner: {{IT_OWNER}}
Status: untested recipe. Needs client setup and {{PRIMARY_CONTACT}}'s written approval before anything is scheduled or run. Source-checked on 2026-11-18; re-check the sources at setup.

A generic recipe for {{BOT_NAME}} and {{PROVIDER_NAME}}: Azure VM patch and OS-version check. It is a specification only. Nothing here is scheduled, saved as a routine or skill, or run. Where this note says "unverified", no official source answered the question; do not fill the gap from memory.

## Purpose / scope
A weekly read-only view of which in-scope Azure VMs show patch assessment/installation records and what OS name/version the VM reports. It also checks whether a client-named maintenance configuration shows a run record in its window. **No remediation**: it never installs, assesses, assigns, or changes configuration.
- Update Manager records exist only for machines it assessed or patched. Learn lists patch orchestration modes where the OS updates itself (Windows Automatic Updates / `AutomaticByOS`) or updates are manual. Whether such machines leave any record is **unverified**. "No record" therefore means **unknown**, not unpatched.
- `osName`/`osVersion` are what the VM reports through its agent. They are **not** a guaranteed patch-level or build number: the Learn sample shows a Windows value like "Microsoft Windows NT 10.0.14393.0". Whether that string moves with each monthly update is **unverified**. Linux values: **unverified** (no Learn sample found).

## Inputs and configuration (client fills)
- <Azure subscriptions in scope> and <Azure resource scope>: subscriptions/resource groups in scope, approved by the client.
- **Fill in: maintenance configurations to watch**: maintenance configurations to watch, with expected windows in {{TIMEZONE}}. Learn gives an upper maintenance window of 3 hours 55 minutes (portal wording for the Guest scope).
- Identity: a read-only identity. The built-in **Reader** role (`*/read`, no data actions) covers every read permission Learn lists for viewing Update Manager data: `Microsoft.Compute/virtualMachines/read`, `.../patchAssessmentResults/read`, `.../patchAssessmentResults/softwarePatches/read`, `.../patchInstallationResults/read`, `.../patchInstallationResults/softwarePatches/read` (Azure Arc-enabled servers have matching `Microsoft.HybridCompute/machines/...` entries), plus `Microsoft.Maintenance/*/read` actions. The client admin grants it; the recipe never requests more. The write-capable permissions (`assessPatches/action`, `installPatches/action`, `virtualMachines/write`, `Microsoft.Maintenance/.../write`) must not be granted for this recipe.

## Read-only workflow (verify command names against current docs at setup)
1. OS name/version per VM, either way:
   - `az vm get-instance-view` (documented; returns the VM instance view, whose `osName` and `osVersion` fields are described as the operating system and its version), or
   - Azure Resource Graph `resources` table, `type =~ 'microsoft.compute/virtualmachines'`, fields `properties.extended.instanceView.osName` and `.osVersion`. Learn states these fields update at a **slower cadence** and converge over time, so treat them as possibly stale. Record the query time.
2. Azure Resource Graph queries on `patchassessmentresources` (latest assessment: `properties.lastModifiedDateTime`, `properties.osType`, `properties.availablePatchCountByClassification`) and `patchinstallationresources` (`properties.status`, `installedPatchCount`, `failedPatchCount`, `pendingPatchCount`, `maintenanceWindowExceeded`, `maintenanceRunId`, `startDateTime`, `lastModifiedDateTime`). Use `where type !has "softwarepatches"` for summary rows, as Learn's samples do. Filter to Azure VMs (`microsoft.compute/virtualmachines`) if Azure Arc-enabled servers are out of scope: the tables cover both.
3. Maintenance configurations and their runs, also from Resource Graph:
   - configurations: `resources | where type =~ 'microsoft.maintenance/maintenanceconfigurations'`;
   - assignments: `maintenanceresources | where type =~ 'microsoft.maintenance/configurationassignments'` (`properties.maintenanceConfigurationId`, `properties.resourceId`);
   - run records: `maintenanceresources | where type == 'microsoft.maintenance/applyupdates' | where properties.maintenanceScope == 'InGuestPatch'` (`startDateTime`, `endDateTime`, `correlationId`).
   The `applyupdates` properties Learn lists carry no success/failure field. Pair a run record with the matching `patchinstallationresults` row (`status`) for the outcome.
4. Flag: OS version unchanged since the client's reference date, no patch record (unknown), assessment older than the client's threshold, a failed or window-exceeded install, or a watched window with no run record.

## Retention limits (read before trusting "no record")
The Learn query-logs page gives two statements: assessment history for the last **7 days** and installation history for the last **30 days**, and elsewhere that logs "are available for 30 days". They disagree, so the effective window is **unverified**. The recipe must treat anything older than 7 days as possibly gone. Weekly runs should store their own results.

## Suggested cadence (not saved)
Weekly, after the client's patch window. Periodic assessment, when **enabled**, runs every 24 hours per Learn; when it is off, assessment data appears only after an on-demand assessment, so staleness is expected.

## Output shape
A table per VM: name, `osName`/`osVersion` (current/previous, with query time), last assessment time, last install `status`, flag, link to the resource. Plus a section on whether the window shows a run record. Timestamps in `patchassessmentresults` and `patchinstallationresults` are UTC per Learn; convert to {{TIMEZONE}}. The time zone of `applyupdates` `startDateTime`/`endDateTime` is **unverified**; label it as stored.

## Evidence / source links
Each row cites the command or query and the run time. No inferred patch status without a record.

## Failure / staleness
Permission denied or partial scope: list what could not be read. Resource Graph returns only what the identity may read, so a missing row may be a permission gap (not verified in the Learn pages read for this review). Assessment data older than the client's threshold: mark it stale.

## Approvals
Read-only. Enabling periodic assessment or changing patch mode is a change: Learn lists `Microsoft.Compute/virtualMachines/write` for it. It needs a separate change request approved by the client's approver ({{PRIMARY_CONTACT}}).

## Acceptance tests (fictional fixtures; not run)
1. Fictional vm-example-01 with an unchanged `osVersion` and no patch records: expect "unknown — no Azure patch record", not "unpatched".
2. A watched window with no `applyupdates` record: expect a flag.
3. Reader denied on one resource group: expect that group listed as not read.
4. Fixture where `osVersion` is null: expect "OS version unavailable", not a flag for "unchanged".
5. Fixture install row with `status` = `Failed` and `failedPatchCount` > 0: expect a failed-install flag.
6. Fixture assessment `lastModifiedDateTime` 10 days old: expect "stale" (and no claim of a current assessment).

## Sources checked
- L1 Update Manager overview: https://learn.microsoft.com/en-us/azure/update-manager/overview
- L2 Query logs (tables and properties): https://learn.microsoft.com/en-us/azure/update-manager/query-logs
- L3 Sample queries: https://learn.microsoft.com/en-us/azure/update-manager/sample-query-logs
- L4 Roles and permissions: https://learn.microsoft.com/en-us/azure/update-manager/roles-permissions
- L5 Reader built-in role (General category): https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles/general
- L6 Manage update settings: https://learn.microsoft.com/en-us/azure/update-manager/manage-update-settings
- L7 Scheduled patching: https://learn.microsoft.com/en-us/azure/update-manager/scheduled-patching
- L8 `az vm` reference (get-instance-view): https://learn.microsoft.com/en-us/cli/azure/vm?view=azure-cli-latest#az-vm-get-instance-view
- L9 REST "Virtual Machines - Instance View" (API 2025-04-01): https://learn.microsoft.com/en-us/rest/api/compute/virtual-machines/instance-view?view=rest-compute-2025-04-01
- L10 Resource Graph troubleshooting, "fields not being updated immediately": https://learn.microsoft.com/en-us/azure/governance/resource-graph/troubleshoot/general (seen as a search result excerpt, not opened in full)
Not used as sources: community Q&A and blog results. A fetch of `/azure/update-manager/manage-access` returned 404 and is not cited.

## Unverified items
- Effective Resource Graph retention (7 vs 30 days conflict on L2).
- Whether `osVersion` changes with each cumulative update, and what Linux `osName`/`osVersion` look like.
- Whether `AutomaticByOS` or manual machines leave any Update Manager record.
- Time zone of `applyupdates` start and end times.
- Whether Auto VM Guest Patching runs appear as `applyupdates` records (L2 says `maintenanceRunId` in installation results covers Auto VM Guest Patching or schedule runs; `applyupdates` coverage not stated).
- That Resource Graph hides rows the caller cannot read (not found in the pages read this session).
- Exact Reader behavior for each `Microsoft.Maintenance` read action: inferred from `*/read`.
- Null `osName`/`osVersion` when the VM agent is not ready.
- Arc-enabled server specifics beyond the permission names.
