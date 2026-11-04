#import "theme.typ": *

// Opening adapted from OcelliQ/2026-04-ABC-Infrastructure,
// commit 900fc7e755dbf97dac5ca405c899c00048f2d8af, through
// “When Designing Infrastructure”. Updated for the current talk and its four principles.

#half-page[
  #title-page()

][
  #talk-code-panel()
]


// Personal introduction imported from ai-for-clm/01-intro/slides.typ.
#slide(title: [About Me])[
  #grid(
    columns: (1fr, 2fr),
    gutter: 1.5em,
    align(center + horizon)[
      #block(radius: 0.5em, clip: true)[
        #image("assets/about/portrait.jpg", width: 100%, height: 100mm)
      ]
    ],
    align(horizon)[
      #text(weight: "bold", size: 1.35em)[Dr. Gaurav Manek]
      #v(0.3em)
      - Founder, *Ocellivision*
      - Technical Lead, *ORBIT* @ IMCB
      - *PhD* in AI/ML --- Carnegie-Mellon University (2023)
      - Founder, *Visigoth.ai* (SaaS)

      #v(0.6em)
      #text(size: 0.85em, fill: luma(100))[
        For follow-up questions:\
        #link("mailto:gaurav_manek@a-star.edu.sg")[#box(baseline: 20%)[#image(
            "assets/about/email.svg",
            height: 1.2em,
            alt: "Email",
          )] gaurav_manek\@a-star.edu.sg]\
        #link("https://www.linkedin.com/in/gauravmanek")[#box(baseline: 20%)[#image(
            "assets/about/linkedin.svg",
            height: 1.2em,
            alt: "LinkedIn profile",
          )] gauravmanek]
      ]
    ],
  )

]

#slide(
  title: [Ship Fast Without Shipping Holes],
  composer: (1fr, 1.5fr),
  config: config-page(margin: (right: 0pt, bottom: 0pt)),
)[

  #cite-source(
    "https://simonwillison.net/2026/Feb/23/summer-yue/",
    display: false,
  )[Summer Yue account, reproduced by Simon Willison. 23 February 2026.]
  #notes[
    User-reported account; permanent loss and a compaction root cause were not independently established. Chat stop commands did not halt the reported run.
  ]
  #v(1fr)
  *Summer Yue reported her agent deleting emails.*#cite-source("https://simonwillison.net/2026/Feb/23/summer-yue/")[Summer Yue account, reproduced by Simon Willison. 23 February 2026.]
  #v(0.35em)
  #small[User-reported incident]
  #v(1fr)
  _I had to run to my Mac mini like I was defusing a bomb._

  #align(right)[
    -- Summer Yue
  ]
  #v(1fr)
][
  #image("assets/abc-opening/images/meta_email.png", height: 110%)
]


#slide(
  title: [A local example: Bee Cheng Hiang],
  composer: (1fr, 1.5fr),
  config: config-page(margin: (right: 0pt, bottom: 0pt)),
)[

  #cite-source(
    "https://www.channelnewsasia.com/singapore/bee-cheng-hiang-data-breach-ai-pdpc-emails-6421711",
    display: false,
  )[CNA. _Bee Cheng Hiang data breach: AI-written marketing script_. Reporting of PDPC findings, 30 September 2026.]
  #cite-source(
    "https://www.straitstimes.com/tech/bad-ai-prompt-exposes-bee-cheng-hiang-customers-e-mail-addresses-in-first-case-of-ai-related-data",
    display: false,
  )[The Straits Times, Kenny Chee, 30 September 2026; updated 2 October 2026]
  #notes[
    AI-assisted code, not an autonomous agent. Testing checked logs without inspecting the actual email. Only email addresses were affected; PDPC reported no evidence of further misuse.
  ]
  #v(1fr)

  #accent[#text(size: 4em, weight: 700)[95,364]]\
  #v(0.25em)
  customer emails exposed.#cite-source("https://www.channelnewsasia.com/singapore/bee-cheng-hiang-data-breach-ai-pdpc-emails-6421711")[CNA. Bee Cheng Hiang data breach; reporting of PDPC findings. 30 September 2026.]

  #v(1em)
  *Nobody inspected the test email.*
  #v(0.35em)
  #small[AI-assisted marketing script; not an autonomous agent.]

  #v(1fr)
][
  #layout(size => block(width: size.width, height: size.height, clip: true)[
    #place(top + left)[
      // Explicit natural height prevents the image frame from cropping its top.
      #image("assets/bee-cheng-hiang-straits-times.png", width: size.width, height: size.width * 1548 / 936)
    ]
  ])
]


#slide(
  title: [Infrastructure-based Safety For Your Claw],
  composer: (1fr, 1fr),
)[

  #cite-source(
    "https://blog.railway.com/p/your-ai-wants-to-nuke-your-database",
    display: false,
  )[Railway. _Your AI wants to nuke your database_. 29 April 2026. All customer data was recovered.]
  #cite-source(
    "https://replit.com/blog/doubling-down-on-our-commitment-to-secure-vibe-coding",
    display: false,
  )[Replit. _Doubling down on our commitment to secure vibe coding_. 29 July 2025.]
  #notes[
    PocketOS: an account-wide token was on disk; the API lacked the dashboard's deletion delay. Railway recovered all customer data. The Replit screenshot is a user account; the vendor separately acknowledged the incident.
  ]
  #v(1fr)
  #link("https://blog.railway.com/p/your-ai-wants-to-nuke-your-database")[
    #image("assets/pocketos-railway-response.png", width: 100%)
  ]
  #v(1fr)

  *One API call deleted PocketOS's production database.*#cite-source("https://blog.railway.com/p/your-ai-wants-to-nuke-your-database")[Railway. _Your AI wants to nuke your database_. 29 April 2026. All customer data was recovered.]

  The agent found an account-wide token on disk.

  _The dashboard had a deletion delay. The API didn't._
][
  #v(1fr)
  #image("assets/abc-opening/images/replit.png", width: 100%)
  #v(1fr)

  Replit wiped the entire production db of SaaStr.AI.#cite-source("https://replit.com/blog/doubling-down-on-our-commitment-to-secure-vibe-coding")[Replit. _Doubling down on our commitment to secure vibe coding_. 29 July 2025.]
]


== The Problem
#slide()[


  #v(0.4fr)
  #align(center)[
    *"LLM accident" is not a diagnosis, its a thought-terminating cliché.*

    It is like writing "pilot error" in an air-crash report.
  ]

  #v(1fr)
  #line(length: 100%, stroke: .5pt)

  #grid(
    columns: (1fr, auto, auto, auto, 1fr),
    column-gutter: 1em,
  )[~][
    *Bad framing*

    - all blame to the operator
    - the fault was not foreseeable
    - no explanatory value

  ][
    #sym.arrow.r
  ][
    *Useful framing*

    - design defends against operator mistakes
    - failure modes are predictable
    - points to concrete safeguards
  ][~]

  #line(length: 100%, stroke: .5pt)
  #v(1fr)

  #pause
  #align(center)[
    We don't make humans perfect.

    #accent[
      *We design systems that stay safe when humans are imperfect.*
    ]
  ]
  #v(0.4fr)
]


== When Designing Infrastructure

#let principles = stack(
  dir: ttb,
  spacing: 1.5em,
  principle(1, [Constrain], [Limit access and authority.]),
  principle(2, [Pace], [Use approvals and action limits.]),
  principle(3, [Observe], [Verify actual tool outcomes.]),
  principle(4, [Recover], [Stop harm; rehearse recovery.]),
)

#grid(
  columns: (1fr, auto, 1fr),
  column-gutter: 0.8em,
  align: (left, center),
)[
  #principles
][
  #pause
  #align(center + horizon)[
    // Measure the single-line rows without the narrow brace column's width constraint.
    #context $stretch(brace.r, size: #measure(principles, width: 30em).height)$
  ]
][
  #only("1-2")[
    Four practical habits for containing mistakes.

    Enforce them in the tools and infrastructure.
  ]
  #only(3)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      row-gutter: 0.7em,
      align: (left + horizon, left + horizon),
      box(stroke: 0.5pt + luma(180), image("assets/governance/imda-agentic-ai.png", width: 3.2em)),
      [
        *IMDA Model AI Governance Framework for Agentic AI*#cite-source("https://www.imda.gov.sg/-/media/imda/files/about/emerging-tech-and-research/artificial-intelligence/mgf-for-agentic-ai.pdf")[Infocomm Media Development Authority (IMDA). _Model AI Governance Framework for Agentic AI_. Version 1.5. Published 20 May 2026; updated 5 June 2026.] \ Risk assessment, policies and oversight.
      ],

      box(stroke: 0.5pt + luma(180), image("assets/governance/nist-ai-rmf.png", width: 3.2em)),
      [
        *NIST AI RMF 1.0*#cite-source("https://doi.org/10.6028/NIST.AI.100-1")[National Institute of Standards and Technology. _Artificial Intelligence Risk Management Framework (AI RMF 1.0)_. NIST AI 100-1, January 2023.] \ Govern, Map, Measure, Manage
      ],

      box(stroke: 0.5pt + luma(180), image("assets/governance/owasp-agentic-ai-threats.png", width: 3.2em)),
      [
        *OWASP*#cite-source("https://genai.owasp.org/resource/agentic-ai-threats-and-mitigations/")[OWASP GenAI Security Project, Agentic Security Initiative. _Agentic AI --- Threats and Mitigations_. Version 1.0, 17 February 2025.] \ Agentic AI: Threats and Mitigations
      ],
    )
  ]
  #only(4)[
    *For when you want to sell your startup:*
    #v(0.5em)

    #grid(
      columns: (auto, 1fr),
      column-gutter: 0.7em,
      row-gutter: 0.7em,
      align: (left + horizon, left + horizon),

      box(stroke: 0.5pt + luma(180), image("assets/governance/iso-42001.png", width: 3.2em)),
      [
        *ISO/IEC 42001*#cite-source("https://www.iso.org/standard/42001")[International Organization for Standardization / International Electrotechnical Commission. _ISO/IEC 42001:2023 --- Artificial intelligence --- Management system_. First edition, December 2023.] \ AI management systems
      ],
    )
  ]

]
#v(0.5em)
#gblock(center: true)[
  *While remaining powerful enough to be _useful_.*
]


#notes[
  The four habits are our teaching structure, not a formal mapping to these frameworks. NIST AI RMF is voluntary risk-management guidance, not a certification standard.
]
