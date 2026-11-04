# Recover: research and slide decisions

Sources checked 4 November 2026. Three audience slides follow the Constrain workflow: concrete failure → three principles → six implementation patterns with a practical rehearsal visual. The drill is proposed practice, not a performed experiment.

## Selected failure: DataTalks.Club infrastructure deletion, 26 February 2026

[Alexey Grigorev's operator postmortem](https://aishippingblog.com/p/how-i-dropped-our-production-database), published 6 March 2026, reports Claude Code running Terraform destruction against the DataTalks.Club production infrastructure on 26 February. An archived state file had replaced the current state. The database and automated snapshots were deleted. AWS support found a snapshot unavailable in the operator's console; he reports full recovery in about 24 hours and checked the restored records before returning the platform to service.

The slide labels the evidence an operator postmortem. It is an agentic incident with human infrastructure and permission decisions central to the failure, not an independently audited execution trace. Do not describe the 2.5 years of stored coursework as permanently lost. The exceptional provider-assisted restoration is not a guaranteed recovery mechanism, and this incident does not establish failure rates or a universal recovery duration.

Why selected: it connects an agent's destructive action to both actual recovery and concrete changes afterward. The operator added backups outside the Terraform lifecycle and an automated daily restore-and-query workflow. These directly illustrate protected recovery copies and rehearsed restoration. His query check is narrower than a complete application acceptance test. The slide uses the original AWS restoration email published in the postmortem. This replaces the earlier GitLab operational precedent at the user's request.

Screenshot provenance and crop coordinates are in [assets/recover/README.md](../assets/recover/README.md). The current DataTalks.Club homepage establishes the organization on the left; the recovery account and original AWS email appear on the right. The homepage is not an incident-state capture. No reconstructed interface or generated incident evidence is used.

## Authoritative principles

1. **Stop execution without the model's cooperation.** [OWASP GenAI Security Project, Securing Agentic Applications Guide v1.0](https://genai.owasp.org/download/49059/?tmstv=1753666640), 28 July 2025, §4.1.4, printed p. 50, recommends manual/automated emergency stops and immediate privilege revocation. Our application places stop controls outside agent authority and includes schedulers, tool gateways, pending queues and accepted remote work. Revocation alone is not cancellation.
2. **Protect the recovery path from the agent.** [UK NCSC, Mitigating malware and ransomware attacks](https://www.ncsc.gov.uk/guidance/mitigating-malware-and-ransomware-attacks), Action 1, recommends separate/offline or purpose-designed cloud backups, protection of older versions from immediate deletion, backup security and restoration testing. Applying this to an agent means its app/delete credentials cannot also erase recovery copies or acquire restoration authority. A replica, staging refresh or continuously overwritten copy can reproduce damage.
3. **Rehearse restoration before you need it.** [NIST SP 800-61r3](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-61r3.pdf), April 2025, RC.RP-03–06, printed pp. 34–35, covers integrity of restoration assets, restored-system verification, root-cause remediation before production use and incident documentation. Our startup application verifies records, relationships, attachments, permissions and an actual application flow, then records elapsed recovery and newest recovered data.

[IMDA's Model AI Governance Framework for Agentic AI v1.5](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf) was also checked using the local official PDF after its web endpoint returned an anti-bot page. Its risk assessment includes reversibility; its human-accountability examples identify sending communications and payments as irreversible actions. It corroborates the scope limitation: restoring local state cannot recall disclosed information or undo every external effect. It is not separately cited on these slides because the three operational references directly support the selected principles and keep the visible source line focused.

## Six implementation patterns

| Audience title | Practical implementation | Evidence basis and limitation |
|---|---|---|
| Independent emergency stop | Human-operated control disables the runner, dispatch and tools; the agent cannot re-enable them. Preserve logs while containing harm. | OWASP emergency stops. The exact control-plane design is our application; killing a chat tab may leave workers running. |
| Credential revocation and job quarantine | Revoke affected tool identities; stop dispatch, quarantine pending work, cancel supported remote jobs, and reconcile already accepted/completed effects before replay. | OWASP revocation; provider-specific cancellation must be verified. Quarantine avoids “draining” a queue by executing harmful work. |
| Protected, versioned backups | Select retention/frequency from acceptable lost work and downtime; use separately controlled, deletion-protected copies of records, uploads and essential configuration. Monitor backup completion and age. | NCSC Action 1. Managed snapshots still need retention/deletion and restore checks; the agent must not hold backup-admin credentials. |
| Separate code and data recovery plans | Keep a known-good release and data/migration recovery plan; code rollback cannot reverse arbitrary database migrations or external messages. | NIST recovery planning; DataTalks.Club's separate infrastructure rebuild and database restore. Restoring older data can discard legitimate newer changes, requiring reconciliation. |
| Verified restore before reconnecting | Restore in a restricted environment, verify source integrity and application behavior, close the failure path, then deliberately reconnect. | NIST RC.RP-03–05. Raw production backups retain sensitive information; ordinary UAT must not expose them. |
| Monthly UAT drill and recovery receipt | Select one bounded failure against a known baseline; demonstrate the expected failure, contain it, recover, verify and retain evidence plus one follow-up. | NIST recovery documentation; [Principles of Chaos Engineering](https://principlesofchaos.org/) on controlled experiments and minimizing impact. Monthly cadence and UAT restriction are this talk's proposal, not a cited standard or guarantee. |

## Wheel and drill decisions

Preserve the existing `assets/recovery-wheel.svg` alongside the six titles. Its wedges are deleted records, bad change, revoked tool key and runaway agent. The wheel creates a take-home practice within slide three, avoiding a fourth slide and keeping the same three-slide structure as Constrain.

Use a disposable, isolated UAT target with separate credentials, captured deliveries and no production queue or connector access. For a runaway-agent wedge, a bounded test worker repeatedly attempts a harmless test action; trigger the external stop and verify that dispatch, capability access and pending work remain stopped. Do not run an unbounded agent or inject failures into production. The runner needs only UAT authority. No such experiment was executed during slide development.

The audience sees the essential qualification: UAT success does not prove production recovery time. A receipt should record scenario, environment/build, owner, baseline/backup timestamp where relevant, observed failure, recovery duration, lost data, verification and one follow-up. Failed injection is invalid, not a pass. Serialize scheduled refreshes and drills so refresh cannot mask failed restoration.

`docs/recovery-drill.md` is the detailed take-home reference. Integration aligned its fourth wedge with the wheel's runaway agent and retained provider outage as an additional candidate. The emergency-stop exercise uses a bounded, harmless UAT worker and checks quarantine and reconciliation before resumption.

## Presentation boundaries

Containment follows Observe's detection; this section covers an independent response path and recovery evidence. Credential revocation here is emergency response, not a repeat of Constrain's initial permission design. Protected recovery copies concern restoration authority, not ordinary data access. Essential caveats appear on audience slides: operator-reported evidence, successful recovery, disclosure irreversibility, proposed drill and UAT limitation. Notes contain only non-obvious implementation caveats and no timings.
