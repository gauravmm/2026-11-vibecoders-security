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
    [*Mistake: deletes the inbox.*#cite-source("https://www.tomshardware.com/tech-industry/artificial-intelligence/openclaw-wipes-inbox-of-meta-ai-alignment-director-executive-finds-out-the-hard-way-how-spectacularly-efficient-ai-tool-is-at-maintaining-her-inbox")[Tom's Hardware. _OpenClaw wipes inbox despite stop commands_. 24 February 2026.]\ #small[User-reported incident]], [*Injection: publishes private data.*#cite-source("https://invariantlabs.ai/blog/mcp-github-vulnerability")[Invariant Labs disclosure, 26 May 2025]\ #small[Research demonstration]],

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
    Distinguish the evidence: OpenClaw is a user-reported incident; Invariant is a controlled researcher demonstration. Neither establishes current product-wide exposure or failure prevalence.
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
    Task-first decomposition is our synthesis. Read-only access protects integrity, not confidentiality. A restricted connector is ineffective if shell or other credentials offer broader access. Development/production isolation is an application of IMDA guidance, not a universal requirement.
  ]
]


#slide()[
  #enum(
    spacing: 0.9em,
    [Keep credentials outside the agent's execution environment.],
    [Every route to the agent must cross a security boundary.],
    [Sensitive writes use narrow operations with deterministic checks.],
  )
  #v(0.7em)
  #accent[*Common strategies*]
  #v(0.4em)
  #list(
    spacing: 0.6em,
    [Agents that read broadly write only to a fixed, authorized destination.],
    [Agents that read private data have restricted subsequent outputs.],
    [Agents that read hostile content get no consequential tools.],
  )
  #notes[
    An untrusted reader can prepare draft data for a separate, narrowly authorized executor. The executor applies policy and exact-action approval; forwarding unrestricted reader output as instructions defeats the separation.
  ]
]
