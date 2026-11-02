# Annotated bibliography

Research snapshot: 2 November 2026. Full annotations are maintained with their topic research to keep each source beside the recommendations it supports. Entries identify publisher, date where known, what the source contributes, and limits on interpretation. Some sources appear in multiple collections.

| Collection | Coverage | Full annotations |
|---|---|---|
| SaaS security | Identity, sessions, OAuth, offboarding, data recovery, logging, procurement; 13 entries | [SaaS bibliography](research-saas.md#annotated-sources) |
| AI tools and agents | Prompt injection, least authority, connectors, coding agents, privacy terms, automated red-teaming; 19 entries | [AI bibliography](research-ai.md#annotated-sources) |
| Cross-cutting evidence | Standards, empirical research, incident mechanisms; 15 entries | [Evidence bibliography](research-evidence.md#annotated-sources) |

## Suggested starting sources

- **[NIST CSF 2.0](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=957258)** — Organizing framework for governance through recovery. Use it to assign responsibility; it does not prescribe a universal startup checklist.
- **[CIS Controls](https://www.cisecurity.org/controls/v8)** — Practical safeguard catalog for access, logs, and recovery. Scale implementation to data and business impact.
- **[Joint secure AI development guidance](https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development)** — Lifecycle guidance for AI builders and integrators. High-level principles need application-specific implementation and tests.
- **[Google's Drift investigation](https://cloud.google.com/blog/topics/threat-intelligence/data-theft-salesforce-instances-via-salesloft-drift/)** — Compelling evidence for integration-token risk. Scope is limited to observed campaign activity.
- **[Microsoft emergency access revocation](https://learn.microsoft.com/en-us/entra/identity/users/users-revoke-access)** — Explains the distinction between central authentication and app-managed sessions. Verify behavior separately for each application.
- **[Invariant's GitHub MCP disclosure](https://invariantlabs.ai/blog/mcp-github-vulnerability)** — Concrete demonstration connecting indirect injection to private-data disclosure. A tested setup is not a prevalence estimate.

For automated red-team tooling, see the Promptfoo, PyRIT, and garak entries in the AI bibliography, alongside the [automated red-teaming plan](startup-security-proposal.md#automated-red-teaming-as-a-release-and-regression-control). Tool choice should follow the application boundary and observable failure conditions.
