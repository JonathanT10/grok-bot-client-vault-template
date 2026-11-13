# AD shutdown to Entra and Intune runbook

Date: {{START_DATE}}
Tags: #reference #identity #change
Owner: {{IT_OWNER}}
Status: draft until {{PRIMARY_CONTACT}} accepts the scope and this note is filled for {{CLIENT_NAME}}

A working plan for retiring on-premises Active Directory at {{CLIENT_NAME}} and running identity and device management on Microsoft Entra ID and Microsoft Intune. This is a **checklist and staging guide, not a vendor procedure**. Where Microsoft behavior, limits, restore windows, license needs, or commands matter, **verify against current Microsoft documentation** before acting. Do not estimate those from memory or the web.

## How this note is used

- {{BOT_NAME}} and {{PROVIDER_NAME}} **draft and check only**. They record findings, draft tickets, communications, and approval asks, and they do read-only checks the owner has allowed.
- Every **live change** (directory, identity, device, DNS, DHCP, network, file share, application, certificate, backup, or power state) requires **written approval** from {{PRIMARY_CONTACT}} for that specific action, in the form ACTION / TARGET / REASON / COST / CONSEQUENCES. Use [[Change request template]] when a formal change record helps.
- Fill _(hand-fill)_ cells from **this client's** evidence. Do not copy another client's facts into this note.
- Times are in {{TIMEZONE}}. Agreed change window: {{CHANGE_WINDOW}}.

## Bottom line

Fill after the first readiness pass and the inventory. Leave a line blank until there is a source.

- Desired end state (pick one; record it under [[#Record of the decision]]):
  - **Soft shutdown only:** domain controllers powered off and kept, a rollback window held, no deletion yet.
  - **Full decommission:** after the rollback window, directory metadata cleaned up, DNS and DHCP moved off the former domain controllers, then the retired hosts and disks removed.
- Why this work is happening: _(hand-fill)_
- In scope (forests, domains, sites, sync tools, device fleets): _(hand-fill)_
- Out of scope: _(hand-fill)_
- Target date, if any, and what "done" must mean by that date: _(hand-fill)_
- Long pole (usually identities, devices, or a line-of-business app): _(hand-fill)_

## Who does what

| Role | Who | Does | Does not |
|---|---|---|---|
| Client approver | {{PRIMARY_CONTACT}} | Written approval for every live change; go / no-go at each gate; final sign-off | Need not execute the technical steps |
| Identity / AD owner | {{IT_OWNER}} | Plans the work, fills this note, assigns or performs technical steps once approved | Does not treat a draft or a bot check as approval |
| Day-to-day IT | {{IT_ADMIN}} | On-site or hands-on work for devices, printers, and network as assigned | Does not approve live changes unless also named as {{PRIMARY_CONTACT}} |
| Provider | {{PROVIDER_NAME}} | Drafts, read-only checks, records, and (only when the written approval names them) approved hands-on work | Does not make an unapproved live change |
| Bot | {{BOT_NAME}} | Drafts this plan, tickets, communications, and approval asks; records results and proof | Never makes live directory, identity, network, device, or power-state changes |

Named backups and on-call coverage for {{CHANGE_WINDOW}}: _(hand-fill)_

## Prerequisites and readiness checks

Complete these **before** any live change. A "no" or "unknown" is a gate, not something to skip. Re-run the checks that can drift (licenses, enrollment, Conditional Access) before each later stage.

| # | Check | What "ready" looks like | How to verify | Y / N / unknown | Evidence (date, source) |
|---|---|---|---|---|---|
| R1 | Device join state | Every in-scope workstation and server has a known join type (domain-joined, Microsoft Entra joined, hybrid joined, workgroup, or unmanaged) and a named disposition | Directory computer accounts; Intune / Entra device lists; a floor or site walk for unknowns | | |
| R2 | Intune enrollment | Devices that should be managed are enrolled, check in, and can receive policy; Autopilot or other provisioning, if used, is understood | Intune enrollment and compliance reports; confirm against current Microsoft documentation for the intended join type | | |
| R3 | Identity sync or cloud-only | It is known whether users, groups, and contacts are synced (for example Microsoft Entra Connect or Cloud Sync), federated, or already cloud-only; the sync server or agent is identified; a method for moving a synced identity to cloud-only has been read from current Microsoft documentation (not invented) | Sync tool console and Entra sign-in / provisioning reports; do not assume a convert-in-place method | | |
| R4 | Licensing | Each in-scope person and device has the licenses needed for the intended Entra join, Intune enrollment, MFA, and Conditional Access | License assignment vs current Microsoft documentation and the client's agreement; no guessed SKUs | | |
| R5 | MFA | MFA is required for staff and for all admin roles that will remain after cutover; recovery paths for lost authenticators are documented | Entra MFA registration and policy; help-desk reset procedure | | |
| R6 | Conditional Access | Policies are documented; they will still allow legitimate sign-in after domain controllers and any on-premises MFA or RADIUS are gone; trusted locations and device conditions are not still pointing at the retiring directory | Policy export or screenshots; a test user and a test device; verify against current Microsoft documentation | | |
| R7 | Admin accounts | Privileged work uses named admin accounts, not daily-driver accounts; unused privileged accounts are listed for disable (never delete until the rollback window ends) | Directory and Entra role assignments; recent privileged sign-in logs | | |
| R8 | Break-glass | At least two emergency-access accounts exist, are excluded from the Conditional Access and MFA policies that could lock everyone out, are stored in {{PASSWORD_MANAGER}}, and have been tested in a controlled way the owner approved | Confirm current Microsoft guidance on emergency-access accounts; test sign-in proof | | |
| R9 | Backups and restore path | System-state (or equivalent) backups of every domain controller, plus VM or image backups if they are virtual, exist and are newer than the last directory change; a restore has been tested, or the gap is recorded as a risk | Backup consoles; restore-test record or explicit "not tested" note | | |
| R10 | Time sync | It is known which host is the authoritative time source today, and what will replace it after the PDC emulator is gone | Domain controller and member-server time configuration; network time sources | | |
| R11 | Password and sign-in health | Password hash sync, pass-through authentication, or federation (whichever is in use) is healthy, or the gap is known so batches are not cut over on stale passwords | Sync or federation health; a sample of recent password-change times | | |
| R12 | Service health | There is no open Microsoft (or other identity-vendor) incident that should postpone {{CHANGE_WINDOW}} | Vendor service-health dashboard, checked just before each stage | | |

If R8 or R9 is "no" or "unknown", do not start Stage 1.

## Inventory of what still depends on AD

Take a **read-only** sweep first. Export Group Policy (backup plus a readable report). Review recent domain-controller sign-in and authentication logs for a window the owner agrees is long enough to catch weekly and month-end jobs. Draft one ticket per dependency found; do not fix anything during the sweep.

| Dependency | What we know | How we find out | Owner | Disposition (move / replace / retire / accept) | Approval |
|---|---|---|---|---|---|
| DNS (zones, forwarders, client DNS settings, cloud virtual-network DNS) | _(hand-fill)_ | Zone list on each DNS server; DHCP and router DNS options; cloud network DNS; VPN/client suffix | {{IT_OWNER}} | | |
| DHCP (scopes, options, and whether a domain controller still holds the DHCP role) | _(hand-fill)_ | DHCP consoles; network-equipment DHCP; a check that no domain controller is still serving DHCP | {{IT_ADMIN}} | | |
| Group Policy → Intune (or other MDM) policy mapping | _(hand-fill)_ | GPO export and a settings map: keep / replace in Intune / drop | {{IT_OWNER}} | | |
| File shares and permissions (NTFS, SMB, cloud file shares that still use AD DS authentication or AD groups) | _(hand-fill)_ | Share list, permission export, authentication method | {{IT_OWNER}} | | |
| Printers, print servers, and scan-to-folder / LDAP address books | _(hand-fill)_ | Print-server queues; device web pages; domain-controller logs | {{IT_ADMIN}} | | |
| Line-of-business apps (including reporting or database Windows logins) | _(hand-fill)_ | App owners; connection strings and data sources that use Windows or LDAP authentication; a flag-only question list if a vendor app is off-limits | _(hand-fill)_ | | |
| LDAP, Kerberos, and service accounts (including scheduled tasks, services, and IIS or similar app pools) | _(hand-fill)_ | Service "log on as"; task scheduler; recent sign-ins by non-person accounts | {{IT_OWNER}} | | |
| RADIUS / NPS, Wi-Fi, and VPN | _(hand-fill)_ | Network policy servers; Wi-Fi and VPN auth settings; certificate vs username auth | {{IT_ADMIN}} | | |
| Certificates and AD CS (and anything that still trusts an internal CA) | _(hand-fill)_ | Whether a CA role is installed; issued-certificate consumers (Wi-Fi, VPN, TLS, code signing, document signing) | {{IT_OWNER}} | | |
| Scheduled tasks and low-frequency jobs (month-end, quarterly) | _(hand-fill)_ | Task inventory on servers; the soak window after soft shutdown | {{IT_OWNER}} | | |
| Backups that still target or authenticate to AD, and backup-account rights | _(hand-fill)_ | Backup product settings; service-account rights | {{IT_OWNER}} | | |
| Time sync (PDC emulator and downstream sources) | _(hand-fill)_ | See R10 | {{IT_OWNER}} | | |
| Directory sync tool (server or agent location, source of authority) | _(hand-fill)_ | Sync console; staging-mode options; export of the current configuration | {{IT_OWNER}} | | |
| User, group, and contact objects still sourced from AD | _(hand-fill)_ | Entra source-of-authority / sync reports; a count of synced vs cloud-only | {{IT_OWNER}} | | |
| Workstations still domain-joined or hybrid-joined | _(hand-fill)_ | See R1; include unknowns | {{IT_ADMIN}} | | |
| Servers and other member computers still domain-joined | _(hand-fill)_ | Computer accounts; application owners for each server | {{IT_OWNER}} | | |
| Forest or domain trusts, and DNS forwarders that exist only for those trusts | _(hand-fill)_ | Trust list; stub or conditional forwarders | {{IT_OWNER}} | | |
| Mail or other products that read the on-premises directory | _(hand-fill)_ | Product directory-sync or LDAP settings (read-only). Any change that could affect mail delivery needs its own approval | _(hand-fill)_ | | |
| Privileged and built-in accounts still in use (including unexplained sign-ins) | _(hand-fill)_ | Recent privileged sign-in logs; do not disable an account until its workload has moved | {{IT_OWNER}} | | |
| Authoritative time, FSMO roles, and recycle-bin / krbtgt hygiene | _(hand-fill)_ | Role holders; recycle-bin state; last krbtgt reset — follow current Microsoft documentation if a domain will **remain**; if the whole forest will be retired, role transfer is usually unnecessary | {{IT_OWNER}} | | |

Add rows for anything else the sweep finds (print accounting, badge systems, phone systems, vendor support tools, and similar).

## Staged plan

Do not start a stage until its go / no-go gate is a written yes. Record old values before every change. Prefer after-hours work in {{CHANGE_WINDOW}} for anything that can drop name resolution or sign-in.

### Stage 0 — Safety net and look-around

Read-only work plus backups. No identity or DNS cutover yet.

| # | Step | Who | Approval needed? | Safety / undo |
|---|---|---|---|---|
| 0.1 | Fresh backups of every domain controller (system state or equivalent, plus VM or image backups if virtual). Confirm each restore point exists. Record whether a restore has been tested. | {{IT_OWNER}} | Written OK for backup jobs that change nothing else; written OK before any restore test that could be disruptive | This is the safety net for later stages. Do not continue without confirmed restore points. |
| 0.2 | Export every Group Policy object (backup plus a readable report) from every in-scope domain. | {{IT_OWNER}} | Usually none if the export is files-only; confirm if the tool requires a write | Nothing in the directory changes. |
| 0.3 | Read-only sweep: replication health; DNS zones and forwarders; DHCP or CA or RADIUS roles on any domain controller; recent sign-in logs; service accounts and task "run as"; computer-account recount; member-server list. | {{IT_OWNER}} / {{BOT_NAME}} (draft and check) | Read-only | None needed. |
| 0.4 | Read-only network pass: DHCP DNS options at each site; VPN DNS suffix; LDAP or RADIUS; printer and scanner address books and scan-to-folder targets. | {{IT_ADMIN}} | Read-only | None needed. |
| 0.5 | Privilege hygiene: record group memberships first; disable (do not delete) accounts that should no longer have admin rights. Investigate unexplained privileged sign-ins before disabling the account they used. | {{IT_OWNER}} | Written OK per account | Re-add membership or re-enable if something breaks. |
| 0.6 | Record sweep results in this note; draft one ticket per dependency. | {{BOT_NAME}} drafts; {{IT_OWNER}} assigns | Drafts only | No live change. |

### Stage 1 — Pilot

Move a small, named pilot group (IT or other volunteers) and a small set of devices. Keep the rest of the company on the current path.

| # | Step | Who | Approval needed? | Safety / undo |
|---|---|---|---|---|
| 1.1 | Gate 1: review inventory; decide move, replace, retire, or accept for each dependency; choose the user cut-over method from current Microsoft documentation; name the pilot group. | {{PRIMARY_CONTACT}}, {{IT_OWNER}} | Decision record | Pause here if a line-of-business app or break-glass path is still unknown. |
| 1.2 | If DNS must be repointed for the pilot, change **one** network (or a lab) first, after hours. Write down old values. | {{IT_ADMIN}} | Written OK | Revert the DNS option in minutes. |
| 1.3 | Recreate the Group Policy settings the pilot needs as Intune (or other MDM) policies. Test on pilot devices only. | {{IT_OWNER}} | Written OK to assign policy to the pilot | Remove the pilot assignment; domain GPOs are still there. |
| 1.4 | Move the pilot identities to cloud-only (or the chosen method). Test sign-in, MFA, device sign-in, mail, chat, and files. | {{IT_OWNER}} | Written OK for the named pilot accounts | Follow current Microsoft documentation for restoring or rolling back a cloud identity; have a password reset ready. |
| 1.5 | Reset or re-join pilot devices to the intended Entra / Intune state. Copy or confirm user files first (for example to the client's cloud file service). | {{IT_ADMIN}} | Written OK per device or batch | Do not wipe a device without a confirmed file copy and written OK. |
| 1.6 | Pilot any file-share, printer, or app change the wider cut-over will need, on pilot accounts only. | {{IT_OWNER}} | Written OK | Put the old group, share, or connection back. |

Pilot sign-off (what must work, who tested, date): _(hand-fill)_

### Stage 2 — Broaden

Expand in small batches. Do not do the whole company in one step.

| # | Step | Who | Approval needed? | Safety / undo |
|---|---|---|---|---|
| 2.1 | Gate 2: pilot results are acceptable; remaining risks are owned. | {{PRIMARY_CONTACT}} | Written OK to broaden | Stay in Stage 1 if sign-in, mail, or files failed for a pilot user. |
| 2.2 | Users and groups to cloud-only (or the chosen method) in small batches. Check password and license status before each batch. Schedule leadership or other high-impact accounts last, with someone on hand. | {{IT_OWNER}}; {{IT_ADMIN}} on-site as needed | Written OK per batch | Small batches. Restore or reset per current Microsoft documentation. |
| 2.3 | Remaining domain-joined workstations to the intended Entra join and Intune enrollment, site by site or batch by batch. | {{IT_ADMIN}} | Written OK per batch | Files confirmed first. |
| 2.4 | Member servers and apps off the retiring domain: one at a time, after a snapshot or backup, with the app owner. Retire what is no longer needed; do not delete a powered-off host until Stage 5. | {{IT_OWNER}} | Written OK each | Snapshot, then power off; deletion waits for the rollback window. |
| 2.5 | Service accounts, task identities, and database or reporting Windows logins: change one, test, then disable (do not delete) the old account. | {{IT_OWNER}} | Written OK each | Re-enable the old account if the new one fails. |
| 2.6 | File-share permissions to Entra or cloud groups as decided; confirm cloud file shares no longer depend on AD DS authentication if that is the plan. | {{IT_OWNER}} | Written OK | Export permissions first. |
| 2.7 | Finish Intune (or MDM) replacements for the remaining Group Policy settings that will still be needed. | {{IT_OWNER}} | Written OK | Keep GPOs until after soft shutdown if they are still a rollback path. |
| 2.8 | Printers, scanners, and print servers: repoint anything that still uses the retiring directory. | {{IT_ADMIN}} | Written OK | Note old settings. |
| 2.9 | New hires during the window: create them by the post-cut-over (cloud-only) process, not the old sync process. | {{IT_OWNER}} / HR contact _(hand-fill)_ | Written OK for the process change | Avoid a hire that exists only in a directory that is about to be cut. |

### Stage 3 — Cut directory sync

Only when every in-scope identity that still needs a mailbox, sign-in, or group membership is already cloud-only (or otherwise no longer sourced from the retiring directory), and when device and app cut-overs that depended on sync are done.

| # | Step | Who | Approval needed? | Safety / undo |
|---|---|---|---|---|
| 3.1 | Gate 3: synced-object count in scope is zero (or the remaining objects are explicitly accepted and documented). Config of the sync tool is exported. Domain-controller snapshots or backups are current. | {{IT_OWNER}} | Written OK | Do not cut sync if any in-scope user, group, or contact still lists the retiring directory as source of authority. |
| 3.2 | Turn off or remove directory sync by the method in current Microsoft documentation. Do not invent a sequence or a waiting period. | {{IT_OWNER}} | Written OK (treat as hard to reverse until documentation says otherwise) | Export and snapshots first. Confirm current Microsoft documentation for whether, and how, sync can be turned back on. |

### Stage 4 — Soft shutdown and rollback window

Domain controllers are **powered off, not deleted**. This is the reversible "AD is down" test.

| # | Step | Who | Approval needed? | Safety / undo |
|---|---|---|---|---|
| 4.1 | Final read-only sweep: domain-controller logs should show no remaining people or apps that still need the directory. | {{IT_OWNER}} / {{BOT_NAME}} (draft and check) | Read-only | Stop and fix if anything still uses AD. |
| 4.2 | Final backups of every domain controller, kept for at least the rollback window (and longer if a legal or backup policy says so). | {{IT_OWNER}} | Written OK | The undo for everything after. |
| 4.3 | Remove or disable trusts and DNS forwarders that exist only for the retiring forest, if that is in scope and already approved. | {{IT_OWNER}} | Written OK | Record settings; they can be recreated. |
| 4.4 | Gate 4: go / no-go to power off. | {{PRIMARY_CONTACT}} | Written OK | If no-go, stay powered on and return to the inventory. |
| 4.5 | Power off (do not delete) all in-scope domain controllers together. If a host also runs other virtual machines, either move those workloads first or leave that host up and remove only the domain-controller role's reach, as decided in writing. | {{IT_OWNER}}; {{IT_ADMIN}} on-site as needed | Written OK | Power them all back on together if something breaks. |
| 4.6 | Watch help-desk, sign-ins, printing, file access, VPN, Wi-Fi, and line-of-business apps for the rollback window. Fix stragglers or roll back. | {{IT_ADMIN}}, {{IT_OWNER}} | Fixes that change production need their own OK unless already covered | Power-on is the undo. |
| 4.7 | Soak: no further decommission work. A named on-call person covers the window. | _(hand-fill on-call)_ | No changes | Domain controllers stay off but recoverable. |

Rollback window (start, end, {{TIMEZONE}}): _(hand-fill)_

### Stage 5 — Final decommission

Only after the rollback window ends with a written sign-off that no material issue remains.

| # | Step | Who | Approval needed? | Safety / undo |
|---|---|---|---|---|
| 5.1 | Gate 5: sign-off that identity, devices, DNS, DHCP, files, printing, VPN/Wi-Fi, and line-of-business apps work with domain controllers off. | {{PRIMARY_CONTACT}} | Written OK | If issues remain, extend the window or power back on; do not delete. |
| 5.2 | Move any DNS or DHCP that still lives on a powered-off domain controller to its permanent home (if not already done). Confirm clients resolve names and renew leases. | {{IT_ADMIN}} / {{IT_OWNER}} | Written OK | Keep the old servers off but not deleted until this is proven. |
| 5.3 | Metadata cleanup for the retired domain or forest, and removal of lingering records, **per current Microsoft documentation**. Do not invent cleanup commands. | {{IT_OWNER}} | Written OK | After metadata cleanup, putting the same directory back is no longer a simple power-on. |
| 5.4 | Decommission retired hosts, disks, and backup jobs that exist only for those domain controllers, after the retention the owner set. | {{IT_OWNER}} | Written OK, separate from 5.3 | Restore from the Stage 4 backups only if the owner accepts that this is a disaster-recovery act, not a simple rollback. |
| 5.5 | Close tickets; update [[Systems and connectors]], [[Access list]] (locations only, never values), and the decision record with what actually happened. | {{BOT_NAME}} drafts; {{IT_OWNER}} confirms | Drafts and record updates | No further live change. |

## Go / no-go gates

Each gate is a written yes or no from the named owner. A missing answer is a no.

| Gate | When | Question | Owner | Decision (yes / no / date) | Evidence |
|---|---|---|---|---|---|
| G0 | Before Stage 0 backups that the owner considers disruptive, and before Stage 1 | Are readiness checks R1–R12 complete enough to start, and are break-glass (R8) and backups (R9) not "unknown"? | {{PRIMARY_CONTACT}} | | |
| G1 | End of Stage 0 | Is the inventory complete enough to choose dispositions and a user cut-over method, and may the pilot start? | {{PRIMARY_CONTACT}} | | |
| G2 | End of Stage 1 | Did the pilot sign-in, MFA, device, mail, and files tests pass, and may we broaden? | {{PRIMARY_CONTACT}} | | |
| G3 | End of Stage 2 | Are in-scope identities, devices, and apps off the retiring directory, and may we cut sync? | {{PRIMARY_CONTACT}} | | |
| G4 | End of Stage 3 and pre-shutdown sweep | May we power off all in-scope domain controllers? | {{PRIMARY_CONTACT}} | | |
| G5 | End of the rollback window | May we clean up metadata and decommission hosts? | {{PRIMARY_CONTACT}} | | |

## Rollback plan per stage

| Stage | What rollback means | How | Time sensitivity | Limit |
|---|---|---|---|---|
| 0 | Usually nothing to roll back | Restore from the new backups only if a backup or export job caused harm | Low | Do not use an untested restore as the first experiment on a production domain controller |
| 1 | Pilot users and devices go back to the pre-pilot path | Revert DNS on the pilot network; restore or re-enable identities per current Microsoft documentation; re-assign or remove Intune pilot policy; re-join devices only if that was approved | Hours, while the rest of the company is still on the old path | A wipe or a directory-wide change is out of scope for "easy" rollback |
| 2 | Stop the current batch; keep completed batches unless they are failing | Re-enable disabled service accounts; restore share permissions from the export; do not rush a mass undo | Same day for a failed batch | Users already moved may need a password reset rather than a full reverse |
| 3 | Turn sync back on only if current Microsoft documentation says that is possible for this configuration | Use the exported sync configuration and the snapshots taken immediately before the cut | Verify the documented window; do not invent one | Treat this as hard to reverse until documentation and the export say otherwise |
| 4 | AD is back | Power all domain controllers back on together; re-check replication and DNS; temporarily revert client DNS if name resolution was already moved | Minutes to hours | Works only while the hosts still exist and metadata has not been cleaned up |
| 5 | Not a simple rollback | Disaster recovery from Stage 4 backups, if the owner accepts the risk and the backup is still within retention | Days, and maybe not complete | Do not start Stage 5 until G5 is a written yes |

## Risks

| Risk | Effect | How we reduce it |
|---|---|---|
| Lockouts or failed sign-in during user cut-over | People cannot work | Small batches, IT pilot first, on-site or help-desk cover, password reset ready, restore path verified against current Microsoft documentation |
| Passwords or authentication out of step (failed hash sync, broken pass-through, or stale federation) | A batch signs in with the wrong password state | Check sync or federation health before each batch (R11) |
| Directory sync cut is hard to reverse | Identities cannot be re-sourced from AD as before | Only after in-scope synced objects are zero or explicitly accepted; export config and snapshot first |
| Hidden dependents (scanners, month-end jobs, forgotten service accounts) | Something breaks after power-off | Log review over a long enough window; power off before delete; keep a rollback window |
| Backups missing or never restored successfully | Weak or false undo | Fresh backups in Stage 0 and again in Stage 4; record "restore not tested" as an open risk if that is the truth |
| Quiet period or holiday during the soak | Fewer people to notice or fix issues | Prefer a soft-shutdown day that leaves a normal workday in the window; name on-call |
| A line-of-business app still binds to LDAP, Kerberos, or AD groups | Business-process outage | Flag-only questions until the app owner answers; do not cut over that app's identities until then |
| File-share permissions still use retiring AD groups | Shared-folder access loss | Export ACLs; remap to cloud or Entra groups in Stage 2; test with a pilot user |
| DNS or DHCP change | Brief site outage | One network first, after hours, old values recorded, quick revert |
| New hires during the window | A new person is created only in the old sync path | Switch the hire process in Stage 2 |
| Vendor service incident | Identity or mail work is slower or unsafe | Check service health (R12); shift {{CHANGE_WINDOW}} if needed |
| Lost admin or break-glass access | No one can sign in to fix a failure | Confirm credentials in {{PASSWORD_MANAGER}} and test break-glass before Stage 1 (R7, R8) |
| Certificates issued by an internal CA | Wi-Fi, VPN, or TLS fails after AD CS is gone | Inventory issued certificates; replace or re-issue from the post-cut-over CA before Stage 4 |
| Time sync still aimed at a retiring domain controller | Authentication failures, log skew | Move time sources before soft shutdown (R10) |
| Conditional Access still assumes on-premises signals | Everyone, or all admins, locked out | Review policies and break-glass exclusions; test with a pilot account |

## User communications (drafts only)

{{BOT_NAME}} may **draft** these. {{BOT_NAME}} does **not** send them. A named human sends only after {{PRIMARY_CONTACT}} approves the text and the audience.

Replace the bracketed prompts before a draft leaves this note. Do not invent dates, outage lengths, or "Microsoft says" timings.

### Draft A — Pilot group

To: _(hand-fill pilot group)_
From: {{IT_OWNER}}
Subject: Pilot: signing in without the old office directory

We are testing a new way for {{CLIENT_NAME}} staff to sign in, using our Microsoft work accounts and company device management, during {{CHANGE_WINDOW}}. You are in the small pilot group.

What we need from you: on the day we confirm with you, sign in as usual, complete MFA if prompted, and tell {{IT_ADMIN}} if mail, files, or your computer sign-in does not work. Keep this message internal.

If you have a problem: _(hand-fill help-desk path)_.

### Draft B — All staff, before the broader cut-over

To: _(hand-fill staff list or channel)_
From: {{IT_OWNER}}
Subject: Upcoming sign-in change at {{CLIENT_NAME}}

We will move remaining staff sign-in off the old on-premises directory and onto our Microsoft work accounts during {{CHANGE_WINDOW}}.

What to expect: you may be asked to reset a password or to complete MFA. Your computer may need a short setup or a restart. Files you keep only on the computer should already be in _(hand-fill file location)_.

We will send a short reminder the day before your group is scheduled. If you are traveling or out of the office that day, tell {{IT_ADMIN}} now.

### Draft C — Day-of reminder

To: _(hand-fill that day's batch)_
From: {{IT_ADMIN}}
Subject: Today: sign-in change

Today is your scheduled sign-in change for {{CLIENT_NAME}}. Before you start work, _(hand-fill: what to do, where to go for help, and whether to wait for IT)_. If something does not work, do not keep retrying a wrong password; contact _(hand-fill)_ instead.

### Draft D — During the rollback window (domain controllers off)

To: _(hand-fill staff and help desk)_
From: {{IT_OWNER}}
Subject: Directory change is in its watch period — please report issues

The old on-premises directory is now powered off for a watch period through _(hand-fill end of rollback window, {{TIMEZONE}})_. Please report any problem with sign-in, files, printing, Wi-Fi, VPN, or line-of-business apps promptly to _(hand-fill)_ so we can fix it or turn the old directory back on.

### Draft E — Completion

To: _(hand-fill)_
From: {{IT_OWNER}}
Subject: Sign-in change complete

The planned move off the old on-premises directory is complete as of _(hand-fill)_. If you still see a problem, contact _(hand-fill)_. New staff will be created with the new process; HR and IT have that checklist.

## Post-cutover verification

Use this after Stage 4 (soft shutdown) and again after Stage 5 (if full decommission was approved). Mark the source of each check.

| # | Check | Expected | After Stage 4 | After Stage 5 | Source |
|---|---|---|---|---|---|
| V1 | In-scope domain controllers | Stopped / powered off (Stage 4); decommissioned only after G5 (Stage 5) | | | |
| V2 | Directory sync | Off, with in-scope synced-object count at the agreed number (usually zero) | | | |
| V3 | Staff sign-in sample (several people, more than one site if applicable) | MFA works; mail, chat, and files open | | | |
| V4 | Admin and break-glass sign-in | Named admin path works; break-glass still works | | | |
| V5 | Device sample | Entra join / Intune check-in and compliance as planned | | | |
| V6 | Name resolution and DHCP | Clients resolve internal and public names; leases renew | | | |
| V7 | File shares and cloud files | Pilot and non-pilot users open the shares they should; permissions match the export plus approved changes | | | |
| V8 | Printing and scanning | Queues and scan destinations work without the retiring directory | | | |
| V9 | VPN, Wi-Fi, and RADIUS | Network sign-in works with the post-cut-over method | | | |
| V10 | Line-of-business apps | Each in-scope app has an owner sign-off | | | |
| V11 | Certificates and time sync | No critical service still depends on a retired CA or a powered-off time source | | | |
| V12 | Help-desk volume | No open Sev-1 or unexplained sign-in failures attributed to this change | | | |
| V13 | New-hire path | A dry-run (or the first real hire) works without the old sync tool | | | |
| V14 | Record updates | [[Systems and connectors]], [[Access list]], and the decision note match reality | | | |

## Record of the decision

Write the call in a `Decisions/` note from [[Decision record template]] (link here: ). Mirror the short version below once {{PRIMARY_CONTACT}} has decided. Leave this section blank until then.

- Decider: {{PRIMARY_CONTACT}}. Date ({{TIMEZONE}}):
- End state chosen: soft shutdown only / full decommission / other _(describe)_:
- User cut-over method (cite the Microsoft documentation used, not a remembered recipe):
- {{CHANGE_WINDOW}} and rollback window:
- What will happen to file shares, printers, and each line-of-business app:
- On-call during the rollback window:
- What would change the call:

## Decisions waiting on {{PRIMARY_CONTACT}}

A suggested order. Strike or add rows as the inventory fills. None of these is decided until a written answer is recorded.

| # | Question | Needed by (stage) | Answer | Date |
|---|---|---|---|---|
| D1 | Is the target a soft shutdown only, or a full decommission after a rollback window? | G1 | | |
| D2 | Which user cut-over method should we follow, after we have read current Microsoft documentation? | G1 | | |
| D3 | Who is in the pilot, and when is {{CHANGE_WINDOW}}? | G1 | | |
| D4 | May unused privileged accounts be disabled (not deleted) after their memberships are recorded? | Stage 0 | | |
| D5 | What is the disposition of each file share and cloud file share that still uses AD? | G2 | | |
| D6 | What is the disposition of each line-of-business app that still binds to AD, LDAP, or Kerberos? | G2 | | |
| D7 | May directory sync be cut once the in-scope synced-object count is zero? | G3 | | |
| D8 | May all in-scope domain controllers be powered off together on the agreed date? | G4 | | |
| D9 | After the rollback window, may we clean up metadata and decommission the hosts? | G5 | | |
| D10 | Who is on-call, and which communications (Drafts A–E) may be sent, to whom, and when? | Before each send | | |

## Related

- [[Systems and connectors]] (identity provider, MFA, and what the bot may not touch)
- [[Access list]] (where credentials live — never values)
- [[People and roles]]
- [[Change request template]]
- [[Decision record template]]
- [[Guardrails policy]] (approval rules)
- [[Vault backup and recovery]]
