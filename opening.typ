// Opening adapted from OcelliQ/2026-04-ABC-Infrastructure,
// commit 900fc7e755dbf97dac5ca405c899c00048f2d8af, through
// “When Designing Infrastructure”. Updated for the current talk and its four principles.
#import "@preview/touying:0.6.1": pause
#import "@preview/tiaoma:0.3.0"
#import "@preview/metropolyst:0.1.0": slide
#import "@preview/touying:0.6.1": config-page
#import "assets/abc-opening/figures/half-page.typ": half-page, title-page

// Numbered principle: big grey index number + bold title, one-line body, optional example.
#let principle(num, title, body, example: none) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.7em,
  row-gutter: 0.5em,
  align: (right + top, left + top),
  text(weight: "bold", size: 3em, fill: luma(140))[#num.],
  [
    *#title* \
    #body
    #if example != none [
      \ #text(size: 0.85em, fill: luma(100))[_e.g._ #example]
    ]
  ],
)

#let opening(notes: none, accent: none) = [
  #half-page[
    #title-page()
    #notes[
      *0:00–0:10 · 10 seconds, including the sticker reveal.* The title and subtitle are updated for this talk; the April event/date and original QR remain from the reference. Twenty minutes for founders/builders in teams of 1–5, then a separate five-minute Q&A. The current talk continues with Constrain, Pace, Observe and Recover after this opening.

      *Clock:* Finish the copied opening at 3:10 and the transition at 4:00. Constrain ends at 8:00, Pace at 11:00, Observe at 15:00; protect 15:00–18:00 for recovery. Source and evidence-limit paragraphs are references, not a script.

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


  #slide(
    title: [Ship Fast Without Shipping Holes],
    composer: (1fr, 1.5fr),
    config: config-page(margin: (right: 0pt, bottom: 0pt)),
  )[

    #notes[
      *0:10–1:00 · 50 seconds.* Summer Yue reported that her OpenClaw agent bulk-trashed/archived mail despite instructions to await approval; chat instructions did not stop the reported execution and she went to the host. Ask rhetorically what would stop your agent. Do not read the screenshot aloud.

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
    title: [A local example: Bee Cheng Hiang],
    composer: (1fr, 1.5fr),
    config: config-page(margin: (right: 0pt, bottom: 0pt)),
  )[

    #notes[
      *1:00–1:20 · 20 seconds.* In April 2026, Bee Cheng Hiang used an AI-written Python script to send marketing emails. It exposed 95,364 customers' email addresses to other recipients. Testing checked activity logs without inspecting the actual test email. Bridge: a successful send is not the same as a safe send.

      *Source:* #link("https://www.channelnewsasia.com/singapore/bee-cheng-hiang-data-breach-ai-pdpc-emails-6421711")[CNA reporting of PDPC's findings, 30 September 2026]. Only email addresses were affected; PDPC reported no evidence of further misuse. This was AI-assisted code development, not an autonomous agent sending mail. The lesson is to inspect real outputs and constrain bulk actions.

      *Screenshot:* User-supplied capture of #link("https://www.straitstimes.com/tech/bad-ai-prompt-exposes-bee-cheng-hiang-customers-e-mail-addresses-in-first-case-of-ai-related-data")[The Straits Times, Kenny Chee, 30 September 2026; updated 2 October 2026]. Photo: Lim Yaohui / The Straits Times.
    ]
    #v(1fr)
    #accent[#text(size: 2em, weight: 700)[95,364]]

    customers' email addresses exposed.

    #v(1em)
    *Testing checked the logs.\
    Nobody inspected the test email.*

    #v(1fr)
    Singapore · April 2026
    #v(0.5em)
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

    #notes[
      *1:20–1:45 · 25 seconds.* Two examples, one sentence each. At PocketOS, an agent found an account-wide Railway token on disk and used one API call to delete the production database volume. The dashboard had a 48-hour deletion delay; the legacy API endpoint did not. Replit separately acknowledged an Agent database-deletion incident in July 2025. Bridge immediately to why the system allowed that much damage.

      *PocketOS source and outcome:* #link("https://blog.railway.com/p/your-ai-wants-to-nuke-your-database")[Railway's incident response, 29 April 2026]. Railway confirms the authenticated volume deletion, the account-wide token and the missing API deletion delay. Railway recovered all the customer's data and extended the 48-hour soft-delete window to API deletions. Do not describe this as permanent loss or claim all backup copies were destroyed. The lesson is to scope credentials and enforce safeguards on every execution path. The screenshot is a capture of Railway's response.

      *Replit source and evidence limit:* #link("https://replit.com/blog/doubling-down-on-our-commitment-to-secure-vibe-coding")[Replit incident response, 29 July 2025]. The retained screenshot is a user's account copied from the April deck. These incidents are examples, not frequency estimates.
    ]
    #v(1fr)
    #link("https://blog.railway.com/p/your-ai-wants-to-nuke-your-database")[
      #image("assets/pocketos-railway-response.png", width: 100%)
    ]
    #v(1fr)

    *One API call deleted PocketOS's production database.*

    The agent found an account-wide token on disk.

    _The dashboard had a deletion delay. The API didn't._
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

  #let principles = stack(
    dir: ttb,
    spacing: 1.5em,
    principle(1, [Constrain], [Limit access and authority.]),
    principle(2, [Pace], [Use approvals and action limits.]),
    principle(3, [Observe], [Verify actual tool outcomes.]),
    principle(4, [Recover], [Test your backups.]),
  )

  #grid(
    columns: (1.3fr, auto, 1fr),
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
    Four practical habits for containing mistakes.

    Enforce them in the tools and infrastructure.

  ]
  #v(1em)
  While remaining _powerful enough_ to be useful.



  #notes[
    *2:30–3:10 · 40 seconds across all three builds.* Name the four principles: Constrain access and authority; Pace actions with approvals and limits; Observe actual tool outcomes; Recover with an independent stop and tested restores. Reveal the brace, then the usefulness line. Bridge: “We will apply each of these to one useful inbox assistant.”

    *Author:* Summary of the four sections in this talk. These are general design principles, not guarantees for a named connector. Keep the assistant useful while reducing the damage a mistake can cause.
  ]

]
