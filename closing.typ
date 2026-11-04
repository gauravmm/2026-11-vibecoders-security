#import "theme.typ": *

#slide(title: [One useful inbox agent. Four safeguards.])[
  #grid(
    columns: (1fr, 1fr),
    rows: (auto, auto),
    gutter: 0.8em,
    card([Constrain], [Relevant mail. Drafts. No permanent deletion.]), card([Pace], [Exact-action approval. Small batches. Execution caps.]),

    card([Observe], [Actual tool outcomes. Adversarial regression tests.]), card([Recover], [Independent stop. Protected backups. Practised restore.]),
  )
  #notes[
    *18:00--19:00 · 60 seconds.* Reassemble the inbox assistant from the opening. It still summarizes relevant mail, suggests cleanup and drafts replies. Consequential actions are gated outside the model; a hostile message cannot authorize itself. Real tool outcomes are visible; failures are retained as tests. If the agent runs away, a separate stop exists and data recovery is practised.

    Four verbs are the only framework to remember. The same pattern applies to a coding agent: isolated development, reviewed promotion, bounded execution, verified actions and rehearsed recovery. Avoid expanding into general SaaS procurement, compliance or every vulnerability generated code might contain.

    *Author:* If time is short, use this as the closing slide and speak the commitment from the next slide. Do not cut the concrete red-team or recovery material to preserve all closing prose.
  ]
]

#slide(title: [This week: choose one agent workflow.])[
  #big[Add one missing safeguard.]
  #v(1em)
  #callout[When the agent gets it wrong, your system should contain the mistake.]
  #notes[
    *19:00--20:00 · 60 seconds.* Ask each founder to choose one agent workflow and one missing safeguard to implement this week. Examples: remove permanent-delete authority; keep final send manual; enforce a tool cap; record real outcomes; run a UAT restore. No new security department or shopping list.

    Pause so they can pick a concrete workflow. Close with the line on screen. Twenty minutes of content ends here. Invite the separate five-minute Q&A; optional references follow it, not within the speaking budget.

    *Author:* This is a proposed talk deck, not an implemented control system or evidence that any test has passed. Rehearse the twenty-minute budget and shorten optional examples before cutting the four actions.
  ]
]

#slide(title: [Questions · 5 minutes])[
  #big[Constrain. Pace. Observe. Recover.]
  #v(1em)
  #accent[gauravmanek.com]
  #v(0.6em)
  #small[Optional implementation references follow.]
  #notes[
    *20:00--25:00 · Separate Q&A.* Prefer questions about one actual workflow, its authority and the missing boundary. Avoid unsupported product-specific guarantees: verify current plan/settings and actual enforcement. Hosted-tool users can disconnect a capability and retain the final step manually.

    Appendix A covers refresh and recovery separation; appendix B covers a tiny test suite. Sources and caveats live in each slide's notes and in docs/research-ai.md. The appendix is optional and outside the twenty-minute talk.
  ]
]

#slide(title: [Appendix A · Realistic staging data, safely.])[
  #tag[OPTIONAL · OUTSIDE THE 20-MINUTE TALK]
  #v(0.6em)
  #align(center)[#big[Extract → sanitize → validate → publish]]
  #v(0.9em)
  Keep raw data and credentials inside the protected boundary.
  #v(0.75em)
  #small[One-way scheduled refresh. Synthetic identities. Test integrations. No raw extracts in staging.]
  #v(0.35em)
  #small[Sources: #cite-source("https://owasp.github.io/DevSecOpsGuideline/3-Governance/3-2-Data-protection/")[OWASP data protection]]
  #notes[
    *Optional Q&A detail.* Suggested cadence: weekly and after material schema changes, chosen for the product. A narrowly scoped production-side job extracts a needed subset without disrupting production, replaces identifying fields consistently and strips secrets/live integrations. Exclude or sanitize free text, attachments, logs and combinations that could identify someone. Replacing names alone does not establish anonymity. When safe de-identification is uncertain, use synthetic fixtures.

    Validate relationships, schema, sensitive-field absence and captured delivery destinations. Fail closed on failed validation/unhandled schema. Publish only validated output to staging, retain date/version and delete temporary raw extracts under the production policy. Never write staging data back to production. Staging users/agents cannot access the processing area or its credentials. Restrict derived datasets too.

    Backups are separate, versioned recovery assets with production-level protection. A raw restore drill belongs in an isolated recovery environment; sanitize/validate before any ordinary staging access. Serialize refreshes and drills so refresh cannot conceal the injected failure. Details: docs/recovery-drill.md. #link("https://owasp.github.io/DevSecOpsGuideline/3-Governance/3-2-Data-protection/")[OWASP data protection].
  ]
]

#slide(title: [Appendix B · The smallest useful test suite.])[
  #tag[OPTIONAL · OUTSIDE THE 20-MINUTE TALK]
  #v(0.5em)
  #dtable(
    columns: (1.1fr, 1.7fr),
    size: 0.75em,
    inset: 7pt,
    [Direct policy test],
    [Then exercise the complete agent workflow],
    [A cannot read B's record],
    [Hostile retrieved content requests B's record],
    [Unapproved send is denied],
    [An email asks for a send; change approved arguments],
    [Tool cap cannot be exceeded],
    [A task induces a bounded retry/tool loop],
  )
  #v(0.6em)
  #accent[Assert from logs and state. Keep every demonstrated failure.]
  #v(0.35em)
  #small[Sources: #cite-source("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo configuration], #cite-source("https://microsoft.github.io/PyRIT/latest/code/framework/")[PyRIT framework], #cite-source("https://github.com/NVIDIA/garak")[garak repository]]
  #notes[
    *Optional Q&A detail.* Use two synthetic customers, canary records, an approved test inbox and a controlled sink. First prove the normal workflow works. Test the backend directly, then repeated hostile inputs through the agent. Ensure attack content was read. Check retrieval/tool logs, policy decisions, actual messages/state and cap alerts. Model refusal alone does not test backend authorization. If a test never reaches the intended boundary, mark that limit.

    Preserve a critical failure as a regression, fix or disable its path, and rerun after model/prompt/tool/policy changes. Record versions and cap test spend/time. Promptfoo and PyRIT can orchestrate app tests; garak provides model/endpoint probes. None certifies security or replaces outcome assertions. A high average pass rate cannot cancel a demonstrated critical unauthorized action.

    *Sources:* #link("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo configuration]; #link("https://microsoft.github.io/PyRIT/latest/code/framework/")[PyRIT framework]; #link("https://github.com/NVIDIA/garak")[garak repository]. Full teaching recipe: docs/research-ai.md. These are implementation starting points, not benchmark results.
  ]
]

// Collected in first-use order, including sources registered only in notes.
#reference-slides()
