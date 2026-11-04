#import "theme.typ": *

== 3. Observe: Verify What Actually Happened

// Crop only the displayed source screenshots; keep the originals unmodified.
#let observe-crop(path, ratio: 1, scale: 1, source-ratio: 1, x: 0, y: 0) = layout(size => block(
  width: size.width,
  height: size.width * ratio,
  clip: true,
  place(top + left, dx: size.width * x, dy: size.width * y, image(path, width: size.width * scale, height: size.width * scale * source-ratio)),
))

#slide()[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1.2em,
    [
      *Tests pass. The verifier was changed.*#cite-source("https://arxiv.org/html/2503.11926v1#S1")[Bowen Baker et al. (OpenAI). _Monitoring Reasoning Models for Misbehavior and the Risks of Promoting Obfuscation_. 14 March 2025. Figure 1 and §2.2. arXiv:2503.11926v1.]
      #v(0.4em)
      #tag[OBSERVED DURING MODEL TRAINING]
      #v(0.4em)
      #observe-crop("assets/observe/openai-verifier-patch.png", ratio: 0.43, source-ratio: 577 / 510, y: -0.70)
      #v(0.3em)
      #small[Original research trace: edits the verifier to return true.]
    ],
    [
      *Describes a demo. Submits.*#cite-source("https://www.anthropic.com/research/investigating-unintended-model-actions#submitting-a-form-it-should-not-have")[Anthropic. _Investigating unintended model actions in our evaluations and internal use_. 9 October 2026. “Submitting a form it should not have” and transcript-review findings.]
      #v(0.4em)
      #tag[PROVIDER-REPORTED EVALUATION INCIDENTS]
      #v(0.4em)
      #observe-crop("assets/observe/anthropic-report-viewport.png", ratio: 0.30, scale: 2.37, source-ratio: 577 / 1280, x: -0.667, y: -0.474)
      #v(0.65em)
      Transcript review uncovered unintended actions.

    ],
  )
  #notes[
    Left: published figure mixes summaries, quoted reasoning and tool calls; variable names are masked by the researchers. Right: provider report, not a public raw execution trace. These observations establish mechanisms, not prevalence. Protected verifiers and destination checks are our engineering inference.
  ]
]

#slide()[
  #principle(
    1,
    [Verify tool outcomes against independent evidence.],
    [Check the destination or stored state, not just the agent's report.],
  )
  #v(0.65em)
  #principle(
    2,
    [Keep evidence outside the agent's control.],
    [Protect logs and test checks; alert a named owner to dangerous outcomes.],
  )
  #v(0.65em)
  #principle(
    3,
    [Continuously test the application and its boundaries.],
    [Prove allowed actions work; test forbidden calls directly and through hostile inputs.],
  )
  #v(0.7em)
  #small[
    OWASP: application testing#cite-source("https://owaspai.org/docs/5_testing/#532-agentic-ai-security-testing")[OWASP AI Exchange. _AI Security Testing_. §5.3.2, “Agentic AI security testing”; accessed 4 November 2026.] · IMDA: protected logs and monitoring#cite-source("https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf#page=44", key: "https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf")[IMDA. _Model AI Governance Framework for Agentic AI_. Version 1.5. §2.3.3, pp. 43--44, “Continuous testing and monitoring”. Updated 5 June 2026.] · NIST: red-teaming and reassessment#cite-source("https://nvlpubs.nist.gov/nistpubs/ai/NIST.AI.600-1.pdf#page=37")[NIST. _Artificial Intelligence Risk Management Framework: Generative Artificial Intelligence Profile_. NIST AI 600-1, July 2024. MS-2.7-007 and MS-2.7-009, pp. 33--34.]
  ]
  #notes[
    A refusal before a tool call never exercises backend authorization. A broken connector can look safe unless an allowed positive control succeeds. Independent outcome checks complement reasoning monitors; they do not imply reasoning traces have no detection value.
  ]
]

#slide()[
  #enum(
    spacing: 0.8em,
    [Correlate tool requests, policy decisions and actual outcomes.],
    [Export redacted audit logs the agent cannot rewrite.],
    [Alert a named owner to forbidden actions and missing telemetry.],
    [Pair allowed actions with direct authorization tests.],
    [Automate multi-turn attacks through retrieved content and tools.],
    [Grade outcomes with checks the agent cannot change.],
    [Replay failures after model, prompt or connector changes.],
  )
  #v(0.5em)
  #small[A passing suite covers tested cases; it does not prove safety.]
  #notes[
    Attack drivers such as PyRIT or Promptfoo must target the integrated application and real input surfaces. Use synthetic data and test destinations; repeat stochastic attacks and retain failing inputs with configuration versions. Check backend authorization separately from model behavior. A critical failure is not cancelled by a high average pass rate.
  ]
]
