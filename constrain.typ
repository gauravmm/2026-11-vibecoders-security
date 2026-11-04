#import "theme.typ": *

== 1. Constrain: Limit Access and Authority

#slide(
  config: config-page(margin: (left: 0pt, right: 0pt, bottom: 0pt), footer: none),
)[
  #layout(size => block(width: size.width, height: size.height, grid(
    columns: (1fr, 1fr),
    rows: (auto, 1fr),
    column-gutter: 0pt,
    row-gutter: 0.5em,
    align: center,
    [*Mistake: deletes the inbox.*#cite-source("https://www.tomshardware.com/tech-industry/artificial-intelligence/openclaw-wipes-inbox-of-meta-ai-alignment-director-executive-finds-out-the-hard-way-how-spectacularly-efficient-ai-tool-is-at-maintaining-her-inbox")[Tom's Hardware. _OpenClaw wipes inbox despite stop commands_. 24 February 2026.]], [*Injection: publishes private data.*#cite-source("https://invariantlabs.ai/blog/mcp-github-vulnerability")[Invariant Labs disclosure, 26 May 2025]],

    layout(frame => link("https://x.com/summeryue0/status/2025774069124399363", image(
      "assets/meta_email.png",
      width: frame.width,
      height: frame.height,
      fit: "cover",
    ))),
    layout(frame => link("https://invariantlabs.ai/blog/mcp-github-vulnerability", image(
      "assets/invariant-github-disclosure.png",
      width: frame.width,
      height: frame.height,
      fit: "cover",
    ))),
  )))
  #notes[
    *3:10--4:00 · 50 seconds.* Left: Summer Yue reported OpenClaw deleting and archiving inbox messages despite her instruction to confirm first. This is her published account, not an independently audited mailbox trace. The existing assets/meta_email.png is a capture of her post and chat screenshots, including a translated paragraph. Do not claim permanent loss or an established compaction root cause.

    Right: Invariant Labs demonstrated an attacker-controlled public GitHub issue inducing a connected agent to read private repositories and publish information in a public pull request. This is a researcher-controlled demonstration, not a reported customer breach. The screenshot captures the headline, date and introduction of #link("https://invariantlabs.ai/blog/mcp-github-vulnerability")[Invariant's disclosure page].

    One route is an ordinary task going wrong; the other is hostile instructions in content the agent reads. Both reach the same tools. Available credentials and tools determine the possible consequence. Bridge directly into limiting the inbox assistant's permissions.
  ]
]

#slide()[
  #principle(
    1,
    [Give each agent one specific, narrowly scoped task.],
    [The fewer different things it has to do, the simpler the permissions.],
  )
  #v(0.65em)
  #principle(
    2,
    [Give it only the tools, data and permissions that task requires.],
    [Enforce permissions at the smallest granularity possible.],
  )
  #v(0.65em)
  #principle(
    3,
    [Enforce boundaries through infrastructure.],
    [The agent cannot bypass the controls, change its permissions or obtain broader credentials.],
  )
  #v(0.7em)
  #small[
    NIST: least privilege#cite-source("https://csrc.nist.gov/glossary/term/least_privilege")[NIST CSRC. _Least privilege_. Glossary; accessed 4 November 2026.] · OWASP: excessive agency#cite-source("https://genai.owasp.org/llmrisk/llm062025-excessive-agency/")[OWASP GenAI Security Project. _LLM06:2025 Excessive Agency_. Prevention and mitigation strategies 1--7.] · IMDA: agent limits#cite-source("https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf")[Infocomm Media Development Authority (IMDA). _Model AI Governance Framework for Agentic AI_. Version 1.5. Published 20 May 2026; updated 5 June 2026.]
  ]
  #notes[
    *4:00--8:00 · 4 minutes.* Use the preceding inbox and GitHub screenshots as the motivating examples. These three points are our synthesis of the cited guidance.

    *Task:* Give each agent a specific job with a clear completion condition and explicit exclusions. For the inbox assistant, recommending a cleanup is a separate task from executing it. This task-first structure is our design recommendation: it makes the required capabilities and permissions easier to define and verify.

    *Tools, data and permissions:* NIST defines least privilege in terms of the minimum access needed for assigned tasks. OWASP LLM06, mitigation strategies 1--5, distinguishes unnecessary functionality from excessive permissions. Remove unused tools and functions; provide specific operations instead of open-ended shell access where possible. Scope the downstream identity to relevant records and required operations. A recommendation-only assistant needs no mailbox mutation authority. Read access can still disclose information through other writers, so restrict sources and destinations together.

    *Infrastructure:* IMDA's framework, section 2.1.2, recommends limits on tools, data and area of impact, including self-contained environments with limited network and data access for risky tasks such as code execution. Separating agents with different levels of trust or authority is one application: an agent reading public issues should not automatically gain private-repository or production access. Isolating development from production credentials is our application of the guidance, not a universal IMDA requirement. Separate folders alone do not isolate host secrets or broader credentials.

    *Enforcement:* OWASP LLM06, mitigation 7, calls for downstream authorization and complete mediation: validate every request against policy instead of relying on the model to decide what is allowed. The agent must not be able to edit the policy, grant itself permissions, retrieve broader credentials or reach the same resource through another tool. A restricted connector is ineffective if shell, browser or direct API access bypasses it. Keep enforcement configuration and privileged credentials outside the agent's reach, and test that alternate paths are denied. If a hosted product cannot enforce the scope, narrow its input or keep the consequential action manual. Approvals and execution limits follow under Pace.
  ]
]


#slide()[
  #set text(size: 18pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.5em,
    align: top,
    enum(
      spacing: 0.9em,
      [Read broadly; write to a fixed, authorized destination.],
      [Sensitive writes use narrow operations with deterministic checks.],
      [Private reads restrict subsequent outputs.],
      [The component reading hostile content gets no consequential tools.],
      [Fix the workflow before reading untrusted material.],
    ),
    enum(
      start: 6,
      spacing: 0.9em,
      [Bind permissions to authenticated identities, outside the model.],
      [Keep privileged credentials outside the agent's execution environment.],
      [Enforce filesystem and network boundaries together.],
      [Authorize the exact mutation, immediately before execution.],
      [Every route to the resource must cross the boundary.],
    ),
  )
]

