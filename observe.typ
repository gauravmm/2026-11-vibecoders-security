#import "theme.typ": *
// cspell:words Langfuse Opik PyRIT abliterated Abliteration OrcaRouter evals webp

== 3. Observe: Verify What Actually Happened

// Crop only the displayed source screenshots; keep the originals unmodified.
#let observe-crop(path, ratio: 1, scale: 1, source-ratio: 1, x: 0, y: 0) = layout(size => block(
  width: size.width,
  height: size.width * ratio,
  clip: true,
  place(top + left, dx: size.width * x, dy: size.width * y, image(
    path,
    width: size.width * scale,
    height: size.width * scale * source-ratio,
  )),
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
      Original OpenAI research trace: model edits verifier to pass.
    ],
    [
      *Describes a demo. Submits.*#cite-source("https://www.anthropic.com/research/investigating-unintended-model-actions#submitting-a-form-it-should-not-have")[Anthropic. _Investigating unintended model actions in our evaluations and internal use_. 9 October 2026. “Submitting a form it should not have” and transcript-review findings.]
      #v(0.4em)
      #tag[PROVIDER-REPORTED EVALUATION INCIDENTS]
      #v(0.4em)
      #observe-crop(
        "assets/observe/anthropic-report-viewport.png",
        ratio: 0.30,
        scale: 2.37,
        source-ratio: 577 / 1280,
        x: -0.667,
        y: -0.474,
      )
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
    [Test forbidden calls directly and through hostile inputs.],
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
    [Alert a named owner to forbidden actions and missing telemetry.],
    [Automate multi-turn attacks through retrieved content and tools.],
    [Grade outcomes with checks the agent cannot change.],
    [Rerun evals after changes.],
  )
  #v(0.5em)
  #notes[
    Attack drivers such as PyRIT or Promptfoo must target the integrated application and real input surfaces. Use synthetic data and test destinations; repeat stochastic attacks and retain failing inputs with configuration versions. Check backend authorization separately from model behavior. A critical failure is not cancelled by a high average pass rate.
  ]
]

#slide(
  title: [Observe: Instrument and attack-test],
  composer: (1fr, 1.5fr),
  config: config-page(margin: (right: 0pt, bottom: 0pt)),
)[
  #v(1fr)
  #accent[*Observability*]
  #v(0.35em)
  *Langfuse*#cite-source("https://langfuse.com/docs/observability/overview")[Langfuse. _AI Observability & Application Tracing_. Official documentation; accessed 4 November 2026.] · *Opik*#cite-source("https://www.comet.com/docs/opik/tracing/overview")[Comet. _Opik: Observability Overview_. Official documentation and trace screenshot; accessed 4 November 2026.] · *Phoenix*#cite-source("https://arize.com/docs/phoenix")[Arize. _What is Arize Phoenix?_. Official documentation; accessed 4 November 2026.]\
  LLM traces and evaluations.

  *Jaeger*#cite-source("https://www.jaegertracing.io/")[Jaeger. _Open source, distributed tracing platform_. Official project site; accessed 4 November 2026.]\
  Distributed request tracing.

  #v(0.8em)
  #accent[*Prompt fuzzing / red teaming*]
  #v(0.35em)
  *Promptfoo*#cite-source("https://www.promptfoo.dev/docs/red-team/")[Promptfoo. _LLM red teaming_. Official documentation; accessed 4 November 2026.] · *PyRIT*#cite-source("https://github.com/microsoft/PyRIT")[Microsoft. _PyRIT: AI red teaming for models and applications_. Official repository; accessed 4 November 2026.] · *garak*#cite-source("https://github.com/NVIDIA/garak")[NVIDIA. _garak: the LLM vulnerability scanner_. Official repository; accessed 4 November 2026.]\
  Automated adversarial testing.

  *Abliterated LLMs* as attackers\
  e.g. served by *OrcaRouter*.#cite-source("https://www.orcarouter.ai/blog/how-abliteration-works")[OrcaRouter. _Abliteration, Explained: How Refusal Removal Works Without Any Training_. 17 August 2026. Research and red-teaming applications.]
  #v(1fr)
  #notes[
    Jaeger traces services; LLM-specific scoring needs additional instrumentation. Abliteration reduces refusal behavior, not a guarantee of stronger attacks. Evaluate the application with independent outcome checks, including when the model cooperates with the attacker.
  ]
][
  #layout(size => link("https://www.comet.com/docs/opik/tracing/overview", image(
    "assets/observe/opik-trace.webp",
    width: size.width,
    height: size.height,
    fit: "cover",
    alt: "Opik trace inspector showing nested agent spans, messages and an execution graph.",
  )))
]
