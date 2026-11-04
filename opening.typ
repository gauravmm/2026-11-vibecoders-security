#import "blocks.typ": gblock, lblock
// Opening adapted from OcelliQ/2026-04-ABC-Infrastructure,
// commit 900fc7e755dbf97dac5ca405c899c00048f2d8af, through
// “When Designing Infrastructure”. Updated for the current talk and its four principles.
#import "@preview/touying:0.6.1": only, pause
#import "@preview/tiaoma:0.3.0"
#import "@preview/metropolyst:0.1.0": slide
#import "@preview/touying:0.6.1": config-page
#import "assets/abc-opening/figures/half-page.typ": half-page, title-page

#import "principles.typ": principle
#import "citations.typ": cite-source

#let opening(notes: none, accent: none) = [
  #half-page[
    #title-page()
    #notes[
      *0:00--0:10 · 10 seconds, including the sticker reveal.* The title and subtitle are updated for this talk; the April event/date and original QR remain from the reference. Twenty minutes for founders/builders in teams of 1--5, then a separate five-minute Q&A. The current talk continues with Constrain, Pace, Observe and Recover after this opening.

      *Clock:* Finish the copied opening at 3:10 and the transition at 4:00. Constrain ends at 8:00, Pace at 11:00, Observe at 15:00; protect 15:00--18:00 for recovery. Source and evidence-limit paragraphs are references, not a script.

      *Cut guide:* Drop the Invariant example on “Read-only still means it can copy”, the detailed sanitization examples on “Build, rehearse, serve” and scanner names on “Keep failures as repeatable checks.” On the recovery wheel, walk only the deleted-record restore wedge. If late, speak the one-workflow commitment on the four-safeguard close. Retain the positive control, actual tool outcomes, independent stop and protected backups/tested restore.

      *Provenance:* Opening adapted from Infrastructure-based Safety For Your 'Claw, 18 April 2026, source commit 900fc7e755dbf97dac5ca405c899c00048f2d8af. The title, Bee Cheng Hiang and PocketOS examples, and four-principle summary are updated for this talk; notes supply context for the retained historical claims.
    ]

  ][
    #grid(rows: auto, gutter: 1em)[
      #box(fill: color.rgb("#fff"), inset: 1em, radius: .25em, stroke: 2pt + color.rgb("#444"), link(
        "https://www.gauravmanek.com/lectures/2026/abc-infrastructure/",
      )[
        #tiaoma.qrcode(
          "https://www.gauravmanek.com/lectures/2026/abc-infrastructure/",
          options: (scale: 4.0),
          width: 8cm,
        )
      ])
    ][
      *Slides and Code*
    ]
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
    #notes[
      Briefly introduce yourself before the incident examples. Personal introduction, portrait and contact icons imported from the AI for Leaders instructor deck, `ai-for-clm/01-intro/slides.typ`, at commit `94fc080369219b033acfc35e40ab83ebc55f643e`. Credentials and contact details are retained from that slide; sizing is adapted to this deck's theme.
    ]
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
      *0:10--1:00 · 50 seconds.* Summer Yue reported that her OpenClaw agent bulk-trashed/archived mail despite instructions to await approval; chat instructions did not stop the reported execution and she went to the host. Ask rhetorically what would stop your agent. Do not read the screenshot aloud.

      *Source:* #link("https://simonwillison.net/2026/Feb/23/summer-yue/")[Summer Yue account, reproduced by Simon Willison. 23 February 2026.]. Original April screenshot is unchanged.
    ]
    #v(1fr)
    *Meta's director of AI alignment lost her emails.*#cite-source("https://simonwillison.net/2026/Feb/23/summer-yue/")[Summer Yue account, reproduced by Simon Willison. 23 February 2026.]
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
      *1:00--1:20 · 20 seconds.* In April 2026, Bee Cheng Hiang used an AI-written Python script to send marketing emails. It exposed 95,364 customers' email addresses to other recipients. Testing checked activity logs without inspecting the actual test email. Bridge: a successful send is not the same as a safe send.

      *Source:* #link("https://www.channelnewsasia.com/singapore/bee-cheng-hiang-data-breach-ai-pdpc-emails-6421711")[CNA. _Bee Cheng Hiang data breach: AI-written marketing script_. Reporting of PDPC findings, 30 September 2026.]. Only email addresses were affected; PDPC reported no evidence of further misuse. This was AI-assisted code development, not an autonomous agent sending mail. The lesson is to inspect real outputs and constrain bulk actions.

      *Screenshot:* User-supplied capture of #link("https://www.straitstimes.com/tech/bad-ai-prompt-exposes-bee-cheng-hiang-customers-e-mail-addresses-in-first-case-of-ai-related-data")[The Straits Times, Kenny Chee, 30 September 2026; updated 2 October 2026]. Photo: Lim Yaohui / The Straits Times.
    ]
    #v(1fr)

    #accent[#text(size: 4em, weight: 700)[95,364]]\
    #v(0.25em)
    customer emails exposed.#cite-source("https://www.channelnewsasia.com/singapore/bee-cheng-hiang-data-breach-ai-pdpc-emails-6421711")[CNA. Bee Cheng Hiang data breach; reporting of PDPC findings. 30 September 2026.]

    #v(1em)
    *Nobody inspected the test email.*

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
      *1:20--1:45 · 25 seconds.* Two examples, one sentence each. At PocketOS, an agent found an account-wide Railway token on disk and used one API call to delete the production database volume. The dashboard had a 48-hour deletion delay; the legacy API endpoint did not. Replit separately acknowledged an Agent database-deletion incident in July 2025. Bridge immediately to why the system allowed that much damage.

      *PocketOS source and outcome:* #link("https://blog.railway.com/p/your-ai-wants-to-nuke-your-database")[Railway. _Your AI wants to nuke your database_. 29 April 2026. All customer data was recovered.]. Railway confirms the authenticated volume deletion, the account-wide token and the missing API deletion delay. Railway recovered all the customer's data and extended the 48-hour soft-delete window to API deletions. Do not describe this as permanent loss or claim all backup copies were destroyed. The lesson is to scope credentials and enforce safeguards on every execution path. The screenshot is a capture of Railway's response.

      *Replit source and evidence limit:* #link("https://replit.com/blog/doubling-down-on-our-commitment-to-secure-vibe-coding")[Replit. _Doubling down on our commitment to secure vibe coding_. 29 July 2025.]. The retained screenshot is a user's account copied from the April deck. These incidents are examples, not frequency estimates.
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

    #notes[
      *1:45--2:30 · 45 seconds, including the final reveal.* An accident report that ends at “pilot error” stops before asking how the system allowed the consequence. “The LLM made a mistake” is a beginning, not a diagnosis. Both questions matter; today we focus on why the system allowed that much damage. Advance the reveal and deliver its line once.

      *Author:* Teaching analogy, not a historical claim about aviation accident causes. Preserve the original audience text and pauses exactly.
    ]
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
    principle(4, [Recover], [Test your backups.]),
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
    *2:30--3:10 · 40 seconds across all three builds.* Name the four principles: Constrain access and authority; Pace actions with approvals and limits; Observe actual tool outcomes; Recover with an independent stop and tested restores. Reveal the brace on build 2. On build 3, replace the right-hand summary with the IMDA, NIST and OWASP covers: these frameworks provide structure for governance, risk management and technical threats. Keep the usefulness line as the bridge. Bridge: “We will apply each of these to one useful inbox assistant.”

    *Author:* Summary of the four sections in this talk. These are general design principles, not guarantees for a named connector. Keep the assistant useful while reducing the damage a mistake can cause. The governance panel is adapted from the local AI for Leaders instructor deck (`ai-for-clm`, chapter 06); IMDA and OWASP covers retain its editions; the NIST cover is rendered from the official AI RMF 1.0 publication. NIST describes the AI RMF as a voluntary framework, not a certification standard. These four habits are our talk structure, not a claimed mapping or certification against those frameworks.
  ]

]
