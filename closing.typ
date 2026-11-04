#import "theme.typ": *

#slide(title: [One useful inbox agent. Four safeguards.])[
  #grid(
    columns: (1fr, 1fr),
    rows: (auto, auto),
    gutter: 0.8em,
    card([Constrain], [Relevant mail. Drafts. No permanent deletion.]), card([Pace], [Exact-action approval. Small batches. Execution caps.]),

    card([Observe], [Actual tool outcomes. Adversarial regression tests.]), card([Recover], [Independent stop. Protected backups. Practised restore.]),
  )

]

#half-page[
  #block(inset: (x: 1em, y: 2em))[
    #big[Constrain. Pace.\ Observe. Recover.]
    #v(0.0em)
    Dr. Gaurav Manek\
    #accent[gauravmanek.com]

    #v(2em)
    Ask your agent to apply a framework and give you suggestions:
    #text(size: 0.65em)[
      #let governance-reference(cover, body) = grid(
        columns: (auto, 1fr),
        column-gutter: 0.5em,
        align: (left + horizon, left + horizon),
        box(stroke: 0.5pt + luma(180), image(cover, width: 2.6em)), body,
      )
      #grid(
        columns: (1fr, 1fr),
        gutter: 0.9em,
        governance-reference("assets/governance/imda-agentic-ai.png", [
          *IMDA Model AI Governance Framework for Agentic AI*#cite-source("https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf")[Infocomm Media Development Authority (IMDA). _Model AI Governance Framework for Agentic AI_. Version 1.5. Published 20 May 2026; updated 5 June 2026.]
        ]),
        governance-reference("assets/governance/nist-ai-rmf.png", [
          *NIST AI RMF 1.0*#cite-source("https://doi.org/10.6028/NIST.AI.100-1")[National Institute of Standards and Technology. _Artificial Intelligence Risk Management Framework (AI RMF 1.0)_. NIST AI 100-1, January 2023.]
        ]),

        governance-reference("assets/governance/owasp-agentic-ai-threats.png", [
          *OWASP*#cite-source("https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/")[OWASP GenAI Security Project, Agentic Security Initiative. _Agentic AI --- Threats and Mitigations_. Version 1.0, 17 February 2025.]
        ]),
        governance-reference("assets/governance/iso-42001.png", [
          *ISO/IEC 42001*#cite-source("https://www.iso.org/standard/42001")[International Organization for Standardization / International Electrotechnical Commission. _ISO/IEC 42001:2023 --- Artificial intelligence --- Management system_. First edition, December 2023.]
        ]),
      )
    ]
  ]
][
  #talk-code-panel()
]

// Collected in first-use order, including sources registered only in notes.
#reference-slides()
