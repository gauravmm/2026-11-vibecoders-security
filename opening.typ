// Exact audience opening from OcelliQ/2026-04-ABC-Infrastructure,
// commit 900fc7e755dbf97dac5ca405c899c00048f2d8af, through
// “When Designing Infrastructure”. Only asset paths and speaker notes differ.
#import "@preview/touying:0.6.1": pause
#import "@preview/tiaoma:0.3.0"
#import "@preview/metropolyst:0.1.0": slide
#import "@preview/touying:0.6.1": config-page
#import "assets/abc-opening/figures/half-page.typ": half-page, title-page

#let opening(notes: none, accent: none) = [
  #half-page[
    #title-page()
    #notes[
      *0:00–0:10 · 10 seconds, including the sticker reveal.* This title, April event/date and original QR are retained exactly by request. Twenty minutes for founders/builders in teams of 1–5, then a separate five-minute Q&A. The current talk continues with Constrain, Pace, Observe and Recover after this opening.

      *Clock:* Finish the copied opening at 3:10 and the transition at 4:00. Constrain ends at 8:00, Pace at 11:00, Observe at 15:00; protect 15:00–18:00 for recovery. Source and evidence-limit paragraphs are references, not a script.

      *Cut guide:* Drop the Invariant example on “Read-only still means it can copy”, the detailed sanitization examples on “Build, rehearse, serve” and scanner names on “Keep failures as repeatable checks.” On the recovery wheel, walk only the deleted-record restore wedge. If late, speak the one-workflow commitment on the four-safeguard close. Retain the positive control, actual tool outcomes, independent stop and protected backups/tested restore.

      *Provenance:* Exact audience opening from Infrastructure-based Safety For Your 'Claw, 18 April 2026, source commit 900fc7e755dbf97dac5ca405c899c00048f2d8af. Original visual wording, including historical claims, is preserved; notes supply context.
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
    #pause
    #place(center + horizon, dx: -30pt, dy: 0pt, scale(125%, origin: center + horizon)[
      #image("assets/abc-opening/images/openclaw_sticker.png")
    ])
  ]


  #slide(
    title: [Infrastructure-based Safety For Your Claw],
    composer: (1fr, 1.5fr),
    config: config-page(margin: (right: 0pt, bottom: 0pt)),
  )[

    #notes[
      *0:10–1:00 · 50 seconds.* Summer Yue reported that her OpenClaw agent bulk-trashed/archived mail despite instructions to await approval; chat instructions did not stop the reported execution and she went to the host. Ask rhetorically what would stop your agent. Do not read the screenshot aloud.

      *Evidence limit:* A user's published account, not an independent forensic investigation. The original audience wording is preserved verbatim; do not infer irretrievable loss of all email or diagnose internal cause.

      *Source:* #link("https://simonwillison.net/2026/Feb/23/summer-yue/")[Summer Yue account, reproduced by Simon Willison]. Original April screenshot is unchanged.
    ]
    #v(1fr)
    *Meta's director of AI alignment lost her emails.*
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
    title: [Infrastructure-based Safety For Your Claw],
    composer: (1fr, 1.5fr),
    config: config-page(margin: (right: 0pt, bottom: 0pt)),
  )[

    #notes[
      *1:00–1:20 · 20 seconds.* One quick supporting beat from the original April deck. Preserve the screenshot and its original wording without reading the full issue.

      *Evidence limit:* This is a historical issue screenshot and the original author's framing, not evidence of current OpenClaw defaults, exploit prevalence or an independently verified incident. The “CRITICAL” and “wontfix” labels are reproduced source claims; do not generalize them to every installation. The image contains its original issue context.
    ]
    #v(1fr)
    CRITICAL severity issue, but marked as "wontfix".

    *There are plenty of these traps hiding in OpenClaw.*
    #v(1fr)

    _The boundary between "helpful agent" and "accidentally self-destructing" is dangerously thin._
    #align(right)[
      -- From the issue.
    ]

    #v(1fr)
  ][
    #image("assets/abc-opening/images/wontfix.png", height: 100%)
  ]


  #slide(
    title: [Infrastructure-based Safety For Your Claw],
    composer: (1fr, 1fr),
  )[

    #notes[
      *1:20–1:45 · 25 seconds.* Two historical examples, one sentence each. For a tiny team, the same authority can reach its product. Bridge immediately to why the system allowed that much damage.

      *Evidence limit:* The Claude partition account is the user's report in the original screenshot, not an independently verified technical transcript. Preserve the original 202GB wording without adding a cause or claiming current product behavior. The Replit screenshot is also a user account; Replit separately acknowledged an Agent database-deletion incident in July 2025. These are examples, not frequency estimates.

      *Source:* #link("https://replit.com/blog/doubling-down-on-our-commitment-to-secure-vibe-coding")[Replit incident response, 29 July 2025]. Both images are byte-identical copies from the April deck.
    ]
    #v(1fr)
    #image("assets/abc-opening/images/delete.png", width: 100%)
    #v(1fr)

    Claude deleted a 202GB partition.

    _At least the apology was good._
  ][
    #v(1fr)
    #image("assets/abc-opening/images/replit.png", width: 100%)
    #v(1fr)

    Replit wiped the entire production db of SaaStr.AI.
  ]


  == The Problem
  #slide()[

    #notes[
      *1:45–2:30 · 45 seconds, including the final reveal.* An accident report that ends at “pilot error” stops before asking how the system allowed the consequence. “The LLM made a mistake” is a beginning, not a diagnosis. Both questions matter; today we focus on why the system allowed that much damage. Advance the reveal and deliver its line once.

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

  #grid(
    columns: (1.3fr, auto, 1fr),
    column-gutter: 0.8em,
    align: (left, center),
  )[
    1. Minimize the *blast radius* of a mistake.

    2. Make changes *reversible* where possible.

    3. Make everything *auditable*.

    4. Monitor the output with *guardrails*

    5. Separation of concerns via *isolation*.
  ][
    #pause
    #align(center + horizon)[
      #text(size: 1.2em)[
        $mat(delim: #(none, "}"), row-gap: #2em, ; ; ; ;)$
      ]
    ]
  ][
    Build a threat model with\ *OWASP's STRIDE* (or others)

    These are general principles for most agentic systems.

  ]
  #pause
  #v(1em)
  While remaining _powerful enough_ to be useful.



  #notes[
    *2:30–3:10 · 40 seconds across all three builds.* Name the principles without expanding each into a separate framework. Reveal the brace, then the usefulness line. Bridge: “We will turn these principles into four practical habits: Constrain, Pace, Observe, Recover.”

    *Source/context:* The audience wording “OWASP's STRIDE” is preserved exactly from the April source by request. STRIDE originated at Microsoft; OWASP discusses it as a threat-modeling approach. Do not repeat the original attribution as a new provenance claim. #link("https://owasp.org/www-community/Threat_Modeling_Process")[OWASP threat-modeling process]. These are general design principles, not guarantees for a named connector.
  ]

]
