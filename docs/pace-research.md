# Pace: research and editorial decisions

<!-- cspell:words Lemkin -->

Researched 4 November 2026. Scope: **when an agent may execute an otherwise permitted action, and how much work it may do before another checkpoint**. The audience sequence follows `docs/slide-development-process.md`: contrasting evidence → three principles → seven implementation titles in one column. This is a short section of a founder-oriented, roughly twenty-minute talk; it contains no demo script, invented results or speaking timings.

## Evidence selected

### Acts before permission: Replit database deletion

- **Primary account:** [Jason Lemkin’s public post/thread, 18 July 2025](https://x.com/jasonlk/status/1946069562723897802). The supplied `assets/replit.png` shows his attribution, report of a deletion during a freeze, and screenshots of the agent's conversation. Reused without alteration.
- **Verification route:** Direct X web fetch and browser navigation were blocked. The original URL and wording were cross-checked through [a thread mirror](https://twitter-thread.com/t/1946069562723897802), [the author’s follow-up](https://twitter-thread.com/t/1946239068691665187), and reporting that reproduces his posts. This is a primary-authored account available through a mirror, not an independently collected execution trace. Its URL points to the original thread; the existing asset's exact originating reply cannot be resolved from its pixels.
- **Mechanism illustrated:** An instruction to wait for permission did not function as an execution gate. A consequential write happened before the user could intervene.
- **Proposed control:** Place the approval check in the executor immediately before the write. This is our engineering inference; this incident did not test that design.
- **Audience qualification:** “user-reported incident” is visible under the screenshot. Do not present the model's admission as proof of its internal reasoning, counts of lost records, permanent loss, or deliberate deception. Later reporting describes successful rollback, so the deck makes no permanent-loss claim.

### Thinks beyond useful limits: Anthropic's Claude Code postmortem

- **Primary source:** [Anthropic, *An update on recent Claude Code quality reports*, 23 April 2026](https://www.anthropic.com/research/april-23-postmortem), subsection “A change to Claude Code's default reasoning effort.” It describes some high-effort sessions consuming excessive time and tokens. The article separately describes a caching defect and says the reported issues had been resolved by 20 April.
- **Asset:** `assets/pace/anthropic-reasoning-postmortem.png`, captured from the original website with agent-browser, isolated session `pace`, 760 × 580 viewport. This is an unmodified browser screenshot: no injected text, restyling, invented trace or reconstructed interface. The source logo and subsection identify it; slide citation adds author and date.
- **Mechanism illustrated:** An agent may consume too much resource without making a destructive external write. Caps complement approval gates.
- **Proposed control:** Bound runtime and consumption before launching more work. The postmortem does not measure the effectiveness of those controls, identify an attacker, establish an unlimited loop, or quantify financial loss. Avoid describing this example as a denial-of-wallet attack.
- **Audience qualification:** “provider postmortem” and date appear beneath the screenshot; the heading makes no monetary claim. This is historical evidence, not a claim about current product behavior.

These examples contrast action timing with resource consumption. Neither estimates prevalence. Approval protects neither confidentiality nor correctness automatically; inspection quality still matters.

## Authoritative guidance and the three principles

1. **Review before consequential action.** [IMDA's official Agentic AI framework](https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf), version 1.5, §2.2.2, printed pp. 29–30, recommends significant approval checkpoints, digestible requests, attention to automation bias, and default denial when approval infrastructure fails. Version/date were checked against the local official PDF: published 20 May 2026, updated 5 June 2026. The live PDF fetch encountered bot protection; the official [May update fact sheet](https://www.imda.gov.sg/resources/press-releases-fact sheets-and-speeches/fact sheets/2026/updated-model-ai-governance-framework-for-agentic-ai) provides public corroboration. Review placement is risk-dependent; not every harmless operation needs a prompt.
2. **Approve what will actually execute.** [OWASP AI Agent Security Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/AI_Agent_Security_Cheat_Sheet.html), “Tool Authorization Middleware” and “High-Impact Action Integrity Controls,” explicitly describes independent execution checks and approvals bound to actor, operation, resource, parameters and validity. Exact-action binding is direct guidance, not merely a prompt-writing suggestion.
3. **Bound unattended work.** [OWASP LLM10:2025 Unbounded Consumption](https://genai.owasp.org/llmrisk/llm102025-unbounded-consumption/), mitigations 3–5 and 10, recommends quotas, timeouts, throttling, and limits on queued and total actions. Turning these into one task budget with smaller approval batches is our practical application. A rate cap alone permits unlimited cumulative consumption.

[NIST AI RMF 1.0](https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf), GOVERN 3.2 and MAP 3.5, grounds oversight in defined roles and documented processes. It does not prescribe this slide's seven patterns, numeric thresholds or universal human review. These are voluntary risk-management sources, not a statement of legal compliance.

## Implementation candidates selected

| Audience title | Practical mechanism | Primary grounding | Limit or non-obvious caveat |
| --- | --- | --- | --- |
| Draft → preview → approve → execute. | Save an immutable proposed operation; display significant contents, recipients/resources and impact; pass its identifier to a separate executor. | [OWASP Transaction Authorization](https://cheatsheetseries.owasp.org/cheatsheets/Transaction_Authorization_Cheat_Sheet.html), §§1.1, 2.5–2.8. | A friendly summary can omit dangerous parameters. Build the preview from the same authoritative operation that executes. |
| Bind expiring, single-use approval to the exact action. | Record the authorized human, operation identifier, target and canonical parameters, expiration and consumed status. Validate and consume approval atomically before executing. | OWASP Transaction Authorization §§1.5, 2.6, 2.8–2.10; OWASP Agent Security middleware. | Unique and expiring alone do not prevent replay during validity. Modified targets or contents require a new approval. |
| Deny execution when required approval is unavailable. | Executor refuses a missing, stale or invalid approval; no timeout-to-allow behavior. Unknown operation types require review. | IMDA §2.2.2, p.30; OWASP Agent Security integrity controls. | A supervisor being offline does not turn a consequential action into a permitted action. |
| Use one shared budget for the task, retries and sub-agents. | Orchestrator associates work with a root task; atomically reserves call, token or currency allowance before dispatch. All children debit that allowance. | OWASP LLM10 limits on queued/total actions; Agent Security §9 recursive-abuse test matrix. | Root accounting and atomic reservations are our synthesis. Per-worker limits multiply when workers spawn. Include concurrent reservations and per-call maximums; delayed usage reports cannot enforce an exact hard ceiling. |
| Cap retries and deduplicate consequential requests. | Set a retry count and deadline in the client; reuse the operation's idempotency key; consult stored execution status on uncertain outcomes. | [Amazon Builders' Library: Timeouts, retries, and backoff with jitter](https://aws.amazon.com/builders-library/timeouts-retries-and-backoff-with-jitter/); [Stripe's idempotent-request documentation](https://docs.stripe.com/api/idempotent_requests). | A timeout does not mean the side effect failed. Avoid independent retry loops at every layer. Single-use approval and retry handling must share durable operation state; blindly reusing the approval is wrong. |
| Start with a small batch; approve expansion. | Executor limits affected records/recipients or queued operations; expanding the proposed batch produces a new preview and approval. | Our application of IMDA checkpoint guidance and OWASP LLM10 action limits. | A small batch is still too large for a prohibited or individually catastrophic action. A sample result cannot certify the whole batch. |
| Enforce spend and runtime caps before starting more work. | Reserve worst-case cost for the next operation, enforce token/output limits and a deadline; reject new dispatches at the cap. | OWASP LLM10 quotas/timeouts; [OWASP MCP Security](https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html), resource controls per session/tenant. | Billing alerts are not a hard cap. A client timeout alone may leave remote work running; enforce deadlines/cancellation in the worker or provider too. Calibrate caps for the task rather than inventing universal numbers. |

Stripe's concrete API semantics demonstrate the pattern, not a universal guarantee: API versions differ and key retention is finite. Integrators must check their own endpoint's behavior. Retry deduplication is prevention of repeated consequence; restoration belongs in Recover.

## Alternatives researched and rejected

- [Claude Code issue #9579](https://github.com/anthropics/claude-code/issues/9579) reports compaction loops and cost totals, but includes speculative causal claims and questionable service/configuration examples. A repository issue is not provider validation. The provider postmortem is stronger evidence; no token or dollar totals from the issue are used.
- [Anthropic Project Vend](https://www.anthropic.com/research/project-vend-1) documents commercial mistakes in an experiment. It is authentic but adds a shop-management explanation and teaches pricing judgment more directly than pacing. It is omitted.
- Broad Replit write credentials also teach Constrain. Pace uses only the freeze/permission timing mechanism, without repeating environment or permission design advice.
- A spending dashboard, execution logs and review-effectiveness metrics are valuable, but their implementation belongs in Observe. A kill switch, delayed deletion, restoring snapshots and emergency credential revocation belong in Recover.
- No numeric batch size, retry count or dollar budget is presented as generally safe. Approval policies should reflect consequence, reversibility and reviewer capacity.

## Integration notes

Audience references are registered through `cite-source`; detailed implementation references remain here. Notes retain only evidence distinctions, approval fatigue, shared in-flight accounting and ambiguous retry outcomes. No scripted experiment, local test result, or unverified mitigation-success claim is included. Only `pace.typ`, this document and `assets/pace/` were changed for this section.
