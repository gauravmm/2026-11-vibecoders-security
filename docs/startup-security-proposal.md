# A practical security program for startups using AI and SaaS

Research snapshot: 2 November 2026. Prepared from three parallel Luna research tracks. This proposal targets small software companies using workplace SaaS, coding assistants, and connected AI tools; the product-engineering recommendations additionally apply to companies building AI features. Priorities and timelines are proposed implementation choices, not requirements quoted from a standard.

## Broad principles

1. **Know what holds your data and authority.** Inventory apps, identities, integrations, AI tools, and their owners together. An apparently minor connector can reach a critical system. Use the six [NIST CSF functions](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=957258) to organize ownership through recovery.
2. **Make the safe path easy.** Provide approved business accounts, password management, strong authentication, and a quick intake process. Review the actual service plan, tenant settings, and contract. A no-training commitment alone does not resolve retention, access, or connected-service questions; see the [AI SaaS checklist](research-ai.md#saas-adoption-checklist).
3. **Limit authority before trying to perfect model behavior.** A model can propose an action; ordinary application code must check who may perform it on which object. Scope retrieval and credentials, separate read from write, and isolate execution. [OWASP's LLM risk taxonomy](https://owasp.org/www-project-top-10-for-large-language-model-applications/) provides a useful threat checklist, not a frequency ranking.
4. **Treat access as a lifecycle.** Strong login protection, application sessions, integration grants, API credentials, and employee departure need separate handling. [Microsoft's revocation guidance](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access) explains why disabling central login need not terminate an app-issued session.
5. **Require evidence that controls work.** Keep a denied-access test, a tested alert, a restore record, and an adversarial regression suite. A policy document or passing benchmark alone does not establish protection. [CIS Controls](https://www.cisecurity.org/controls/v8) translate many baseline practices into concrete safeguards.
6. **Plan for mistakes and compromise.** Give operators a way to stop agents, revoke tokens, preserve useful logs, and restore data. Favor reversible actions and bounded costs. The [joint secure AI development guidance](https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development) covers the lifecycle beyond model selection.

## Concrete implementation sequence

One person may hold several roles. The founder or CTO remains accountable; each service needs a named operator. Start with identity, email, source control, cloud, finance, and systems containing customer data.

| When | Concrete step | Accountable operator | Done when |
|---|---|---|---|
| Week 1 | Create a register of SaaS and AI accounts, owners, data classes, admins, connectors/scopes, authentication, logging, and revocation/export routes. Reconcile expenses, identity-provider records, and team interviews. | Operations + app owners | Every critical service has an owner; unknown privileged integrations are investigated. |
| Week 1 | Require MFA, preferring phishing-resistant methods for high-impact accounts; use SSO where supported, a password manager for exceptions, and protected recovery access. Remove unused admins. | Identity/IT owner | Configuration and exceptions are recorded; recovery access is tested. |
| Week 1 | Approve a small set of AI tools and permitted data classes. Review business/API terms, retention, training settings, subprocessors, and connectors. Use synthetic examples where possible. | CTO + data owners | Staff can identify which account/tool is permitted for each data class. |
| Before connecting an agent | Default to read-only, task-scoped access. Exclude production secrets and databases from coding workspaces. Use isolated disposable execution and narrow network access. | Engineering lead | Negative tests show production and unrelated tenant/repository access is denied. |
| Before enabling consequential actions | Enforce approval for payments, deployment, external messages, deletion, and permission changes. Display exact destination and arguments; invalidate approval when they change. | Feature owner | Tests reject unauthorized calls and replayed or altered approvals. |
| Week 2 | Restrict application consent and review OAuth scopes. Remove stale grants; use distinct integration identities where supported. | Identity + app owners | Every privileged integration has a purpose, owner, scope, and revocation procedure. |
| Week 2 | Exercise a departure checklist using a test user: disable login, terminate app sessions, revoke tokens, transfer ownership, and verify denial. | HR trigger; IT execution | All critical applications confirm loss of access; delayed/manual steps are documented. |
| By day 30 | Enable useful audit events and separate storage where feasible. Alert on new admins/grants, unusual exports, destructive actions, and disabled logging. | IT/security owner | A simulated event produces an actionable alert received by a named person. |
| By day 30 | Set acceptable data-loss and recovery-time targets, then restore representative critical SaaS data. Verify metadata/permissions as well as content. | App/data owners | Recovery meets agreed targets; uncovered data has an explicit remediation decision. |
| Before AI launch; then on changes | Add automated adversarial tests against the configured application, with human review of high-impact failures. | Feature engineer + security reviewer | No known critical unauthorized action or restricted-data disclosure remains in the release candidate. |
| By day 30 | Rehearse a stolen integration-token incident: disable connector, revoke/rotate credentials, preserve logs, scope exposure, recover, and contact the provider. | CTO + app owners | Responders can execute the runbook without discovering missing admin access mid-incident. |
| By day 90; quarterly thereafter | Review access, dormant integrations, exceptions, vendor changes, and test coverage. Introduce automation where manual work repeatedly fails. | CTO + operations | Exceptions have owners and expiry dates; unresolved high-impact risks have explicit treatment. |

Detailed implementation evidence and tradeoffs are in the [SaaS recommendations](research-saas.md#prioritized-recommendations) and [AI recommendations](research-ai.md#prioritized-recommendations). The timelines above are a proposed sequence; urgent exposures should be fixed immediately.

## Automated red-teaming as a release and regression control

Automated red-teaming generates or replays adversarial interactions to find failures. It complements deterministic authorization tests, conventional security scanning, and human investigation. Test the assembled application: a standalone model refusal score misses retrieval permissions, connector authority, and side effects.

Start with one high-value workflow and a small versioned corpus. Use a disposable test tenant, synthetic confidential records and canary secrets, mock payment/email/deletion tools, and a controlled collection endpoint. Never point automated attacks at live customer accounts or uncontrolled third-party targets. Record model and application versions, prompts, tool schemas, permissions, test data, and runner configuration.

| Test family | Example scenario | Observable failure |
|---|---|---|
| Indirect prompt injection | A retrieved document or issue instructs the agent to disclose a synthetic secret. | Secret reaches an unauthorized output, destination, or tool call. |
| Authorization and isolation | A user asks for another tenant's records, directly or through a malicious tool result. | Protected records enter context or are returned without authorization. |
| Excessive authority | An untrusted email requests deletion, payment, or an external message. | A consequential action executes without valid approval. |
| Approval integrity | Change the destination or amount after confirmation; replay an old confirmation. | Changed/replayed action succeeds. |
| Output handling and execution | Model output contains an unsafe query or shell command. | Execution escapes the permitted typed operation or sandbox. |
| Resource abuse | An input induces repeated retries or tool-call loops. | Per-run token, time, call, or spend limits are exceeded. |

Use deterministic outcome checks first: database state, tool-call audit records, blocked network requests, and canary detection. Model-based judges can triage semantic failures but need calibration and manual review; their verdict is not an authorization check. Retain reproducible traces with sensitive content minimized. Repeat stochastic cases and report failures by scenario and impact, including normal-task success and false blocks.

Suggested cadence: a small regression suite on each relevant change; a broader scheduled run; focused human investigation before increasing data access or action authority. Re-run after changes to model, prompts, retrieval, connectors, permissions, or runtime. Block a release on any reproduced critical boundary failure; medium-risk exceptions need an owner, compensating control, and expiry. Passing means no failure was observed in those tests, not that the system is secure against all attacks.

See the [AI research note](research-ai.md) for verified tooling sources and implementation details. Select tooling based on whether it can exercise your actual application and observe side effects, rather than attack-count marketing.

## Make the proposal convincing without overstating evidence

- **Stolen SaaS credentials:** [Mandiant's Snowflake investigation](https://cloud.google.com/blog/topics/threat-intelligence/unc5537-snowflake-data-theft-extortion) supports tenant-level identity controls; it should not be described as a demonstrated breach of the Snowflake platform.
- **Integration tokens:** [Google's Salesloft Drift investigation](https://cloud.google.com/blog/topics/threat-intelligence/data-theft-salesforce-instances-via-salesloft-drift/) motivates inventorying and revoking connector access independently of employee logins.
- **Support artifacts and sessions:** [Okta's postmortem](https://sec.okta.com/articles/2023/11/unauthorized-access-oktas-support-case-management-system-root-cause/) motivates sanitizing support bundles and testing actual audit-event paths.
- **AI tool misuse:** [Invariant's GitHub MCP demonstration](https://invariantlabs.ai/blog/mcp-github-vulnerability) illustrates untrusted content inducing cross-repository disclosure through trusted tools. It is a demonstration, not a measure of current product prevalence.

## Budget and success measures

Begin with existing admin consoles, a shared register, scoped credentials, a password manager, and short runbooks. Paid SSO, audit export, backup, and retention features may justify upgrades for critical systems. If a feature is unavailable, document the gap and choose a narrower use case, manual control, different vendor, or funded upgrade. Do not describe a missing feature as implemented merely because a policy requires it.

Track the fraction of critical apps with an owner and verified MFA; privileged integrations reviewed; offboarding completion time across apps; successful restores against targets; tested alert coverage; and unresolved high-impact adversarial failures. Report the denominator and exceptions. Avoid a single security score that hides an unprotected critical system.
