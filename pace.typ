#import "theme.typ": *
// cspell:words Lemkin

== 2. Pace: Review Before Consequence

#slide(
  config: config-page(margin: (left: 0pt, right: 0pt, bottom: 14pt), footer: none),
)[
  #layout(size => block(width: size.width, height: size.height, grid(
    columns: (1fr, 1fr),
    rows: (auto, 1fr, auto),
    column-gutter: 0pt,
    row-gutter: 0.45em,
    align: center,
    [*Acts before permission.*#cite-source("https://x.com/jasonlk/status/1946069562723897802")[Jason Lemkin. _Replit deletes a database during a code freeze_. Public user report, 18 July 2025.]], [*Thinks beyond useful limits.*#cite-source("https://www.anthropic.com/research/april-23-postmortem")[Anthropic. _An update on recent Claude Code quality reports_. 23 April 2026. Section: A change to Claude Code's default reasoning effort.]],

    layout(frame => link("https://x.com/jasonlk/status/1946069562723897802", image(
      "assets/replit.png",
      width: frame.width,
      height: frame.height,
      fit: "contain",
    ))),
    layout(frame => link("https://www.anthropic.com/research/april-23-postmortem", image(
      "assets/pace/anthropic-reasoning-postmortem.png",
      width: frame.width,
      height: frame.height,
      fit: "contain",
    ))),

    small[Replit · user-reported incident · July 2025], small[Anthropic · provider postmortem · April 2026],
  )))
  #notes[
    Replit's chat admission is not an execution log. Anthropic describes excessive reasoning and usage, not an attacker or a verified runaway spending total. The proposed safeguards are engineering inferences; neither example tests them.
  ]
]

#principles-examples[
  #accent[*Principles*]
  #v(0.45em)

  #principle(
    1,
    [Human review before consequential actions.],
    [Send, pay, publish, delete: decide which steps require approval.],
  )
  #v(0.45em)
  #principle(
    2,
    [Approve the exact action that will execute.],
    [Show the target, contents and impact. Changes require fresh approval.],
  )
  #v(0.45em)
  #principle(
    3,
    [Bound how far the agent can go without you.],
    [Enforce limits on batches, calls, retries, runtime and spend outside the model.],
  )
  #v(0.7em)
  #small[
    IMDA: meaningful oversight#cite-source("https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf")[IMDA. _Model AI Governance Framework for Agentic AI_. Version 1.5, published 20 May 2026; updated 5 June 2026. Section 2.2.2, pp. 29--30.] · NIST: human roles#cite-source("https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.100-1.pdf", key: "https://doi.org/10.6028/NIST.AI.100-1")[NIST. _AI Risk Management Framework (AI RMF 1.0)_. January 2023. GOVERN 3.2 and MAP 3.5.] · OWASP: approvals#cite-source("https://cheatsheetseries.owasp.org/cheatsheets/AI_Agent_Security_Cheat_Sheet.html")[OWASP. _AI Agent Security Cheat Sheet_. Tool Authorization Middleware; Human-in-the-Loop Controls; Recursive tool abuse. Accessed 4 November 2026.] and limits#cite-source("https://genai.owasp.org/llmrisk/llm102025-unbounded-consumption/")[OWASP. _LLM10:2025 Unbounded Consumption_. Mitigations 3--5 and 10.]
  ]
  #notes[
    Approval fatigue defeats nominal oversight. A cap never authorizes a forbidden action; a rate limit alone does not cap the total. Budget reservations must include work already in flight.

    An expired or consumed approval cannot authorize a new attempt. Retrying the same operation needs durable execution state and an idempotency key, not a second side effect. A timeout does not prove the first request failed.
  ]
][
  #accent[*Implementation examples*]
  #v(0.45em)

  #enum(
    spacing: 0.9em,
    [Draft → preview → approve → execute.],
    [Approvals are expiring, single-use, and bound to the exact agent and action.],
    [Cap retries and deduplicate consequential requests.],
    [Start with a small batch; approve expansion.],
    [Enforce spend and runtime caps.],
  )
]
