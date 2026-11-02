# Taxonomy of sources

Research snapshot: 2 November 2026. Source authority and empirical strength are separate: a standard can recommend a control without measuring its effect, while a narrow experiment can demonstrate a failure without establishing its prevalence.

| Source type | Examples in this collection | Best use | Main limitation |
|---|---|---|---|
| Government frameworks and joint guidance | NIST CSF/AI RMF/SSDF; CISA; NCSC | Establish scope, responsibility, lifecycle, and broadly supported practices | Usually normative and voluntary; not causal evidence or automatic legal requirements |
| Practitioner control catalogs and risk taxonomies | CIS Controls; OWASP LLM Top 10 and MCP cheat sheet | Turn risks into review questions and safeguards | Consensus prioritization is not an incident-frequency ranking |
| Empirical datasets and academic research | Verizon DBIR; NDSS cloud-configuration study; prompt-injection papers | Establish observed patterns or experimentally feasible attacks | Sampling, study date, system version, and definitions constrain generalization |
| Primary incident investigations | Mandiant Snowflake; Google Drift; Okta; CircleCI | Explain attack mechanisms and connect controls to real consequences | Investigator visibility and provider incentives can limit completeness; cases are not prevalence estimates |
| Researcher demonstrations and disclosures | Invariant GitHub MCP; Trail of Bits Copilot; Orca RoguePilot | Build realistic attack scenarios and regression tests | Particular configurations may be required; later fixes can remove the demonstrated vulnerability |
| First-party product and contract documentation | Microsoft session revocation and Copilot privacy; Google Workspace privacy; GitHub firewall docs | Determine what a particular service promises or exposes | Product-, plan-, and configuration-specific; intended behavior is not independent assurance |
| Testing-tool documentation | Promptfoo; Microsoft PyRIT; NVIDIA garak | Understand integration options, execution models, and test coverage | Tool capabilities and output do not establish the security of the tested system |
| Secondary incident reporting | Reporting on Samsung employee chatbot submissions | Illustrate employee behavior when primary evidence is unavailable | Attribute explicitly; do not infer training, exploitation, or measurable harm from submission alone |

## How to use this evidence

Use guidance to choose goals, incident reports to explain mechanisms, product documentation to configure controls, and local tests to establish whether the control works in your deployment. Prefer primary sources for technical claims. Label researcher demonstrations separately from observed attacks. Preserve dataset dates and denominators when citing statistics.

A practical evidence chain is: incident mechanism → relevant guidance → configured safeguard → local verification. For example, stolen integration tokens motivate scoped connector access and a tested revocation procedure. The local test is essential because the incident report cannot establish how your tenant behaves.

The [evidence research note](research-evidence.md) maps sources to risk areas and adds interpretation guardrails. Its A/B/C/D labels are shorthand for source character; they should not be read as a universal quality ranking. The [bibliography](annotated-bibliography.md) links the annotated collections.
