#import "@preview/touying:0.6.1": config-common, config-methods, config-page, speaker-note, touying-fn-wrapper, utils
#import "@preview/metropolyst:0.1.0": config-info, metropolyst-theme, slide

// Palette and split-page layout from OcelliQ/2026-04-ABC-Infrastructure. Keep colors in
// a dictionary so their names do not shadow Typst builtins.
#let C = (
  paper: white,
  ink: rgb("#333333"),
  accent: rgb("#78334e"),
  header: rgb("#542437"),
  soft: rgb("#e8d0d8"),
  panel: rgb("#baa7af"),
  rule: rgb("#d8c6ce"),
  red: rgb("#b33a3a"),
  green: rgb("#287a44"),
  grey: rgb("#555555"),
  stripe: rgb("#f8f2f5"),
)

#let accent(body) = text(fill: C.accent, body)
#let callout(body) = block(
  fill: C.soft,
  width: 100%,
  outset: (x: 8pt, y: 0pt),
  inset: (x: 0pt, y: 16pt),
  radius: 8pt,
)[#body]

#let dtable(columns: auto, align: auto, size: 0.8em, inset: (x: 5pt, y: 9pt), head: 1, ..cells) = {
  set text(size: size)
  show table.cell: it => {
    set text(fill: white, weight: 700) if it.y < head
    it
  }
  table(
    columns: columns,
    align: align,
    stroke: 0.5pt + C.rule,
    inset: inset,
    fill: (_, y) => if y < head { C.accent } else if calc.odd(y - head + 1) { C.stripe },
    ..cells,
  )
}

#let logo-src = read("assets/icon-logo.svg")
#let logo(fill: white, height: 1.4em) = image(
  bytes(logo-src.replace("#fff", fill.to-hex())),
  height: height,
)

#show strong: it => text(weight: 700, it.body)

#let half-page(lhs, rhs) = slide(
  config: config-page(header: none, margin: (top: 0pt, right: 0pt, bottom: 0pt)),
)[
  #grid(
    columns: (1.3fr, 1fr),
    align: (left + horizon, center + horizon),
    column-gutter: 1em,
    lhs,
    [
      #block(fill: C.panel, width: 100%, height: 100%, stack(
        place(horizon + center, rect(
          fill: tiling(
            size: (5.5cm, 6cm),
            image("assets/bkg.svg", width: 5.5cm, height: 6cm),
          ),
          width: 100%,
          height: 200%,
        )),
        rhs,
      ))
    ],
  )
]

#let title-page() = touying-fn-wrapper((self: none) => {
  let info = self.info
  block(inset: (x: 1em, y: 2em), {
    text(size: 1.6em, weight: 700, info.title)
    v(0.4em)
    if info.at("subtitle", default: none) != none {
      text(size: 1.1em, fill: C.grey, info.subtitle)
      v(0.8em)
    }
    if info.at("author", default: none) != none {
      text(size: 1em, info.author)
      linebreak()
    }
    if info.at("institution", default: none) != none {
      text(size: 0.9em, fill: C.grey, info.institution)
      linebreak()
    }
    if info.at("date", default: none) != none {
      v(0.4em)
      text(size: 0.9em, fill: C.grey, info.date)
    }
  })
})

#show: metropolyst-theme.with(
  font: ("Roboto",),
  accent-color: C.accent,
  header-background-color: C.header,
  focus-background-color: C.header,
  focus-text-color: white,
  main-background-color: C.paper,
  main-text-color: C.ink,
  progress-bar-background: C.accent,
  footer: [Vibecoders Security],
  config-common(show-notes-on-second-screen: if sys.inputs.at("notes", default: "false") == "true" { right } else { none }),
  config-methods(show-notes: (self: none, width: 0pt, height: 0pt) => block(
    fill: C.stripe,
    width: width,
    height: height,
    inset: (x: 32pt, y: 24pt),
    {
      set align(left + top)
      text(size: 12pt, weight: 700, fill: C.accent)[PRESENTER NOTES]
      v(12pt)
      utils.current-slide-note
      utils.slide-note-state.update(none)
    },
  )),
  config-info(
    title: [AI agents:\ build for the mistake],
    subtitle: [Constrain. Pace. Observe. Recover.],
    author: [Dr. Gaurav Manek],
    date: "2026-11",
    institution: [gauravmanek.com],
    logo: logo(),
  ),
)

// Native Touying notes: PDF presenter metadata in the audience deck; rendered
// beside each slide only with `typst compile --input notes=true`.
#let notes(body) = speaker-note(
  setting: body => {
    set text(size: 16pt, fill: C.ink)
    set par(leading: 0.45em, spacing: 0.7em)
    body
  },
  body,
)
#let big(body, size: 1.65em) = text(size: size, weight: 700, body)
#let small(body) = text(size: 0.66em, fill: C.grey, body)
#let tag(body) = text(size: 0.65em, fill: C.accent, weight: 700, body)
#let card(title, body) = block(fill: C.stripe, radius: 6pt, inset: 12pt, width: 100%)[
  #text(weight: 700, fill: C.accent)[#title]
  #v(0.45em)
  #body
]

#half-page[
  #title-page()
  #notes[
    *0:00–0:10 · 10 seconds.* Audience: founders and builders in teams of 1–5. Twenty minutes, then a separate five-minute Q&A. The promise is one useful agent workflow with four safeguards, not a complete security programme.

    *Delivery path / reference, not a script:* Use the twenty-minute clock as checkpoints: setup ends at 4:00, Constrain at 8:00, Pace at 11:00, Observe at 15:00; protect 15:00–18:00 for recovery. Speak the core lesson, not every note. Source, reference and Q&A paragraphs are unspoken unless needed.

    *Cut guide:* First drop the Invariant example on slide 7, the detailed sanitization list on slide 8 and scanner names on slide 13. On slide 16 walk only the deleted-record restore wedge in full; keep the other wedges for Q&A. If late, show slide 17 and speak slide 18's one-workflow commitment there. Retain the positive control, real tool outcomes, independent stop and protected backups/tested restore.

    *Author:* This first cut follows docs/talk-content.md. Preserve the sparse audience slides; implementation detail lives here and in the optional appendix. Rehearse before presenting; the notes are reference material, not a read-aloud script.
  ]
][
  #logo(height: 6em)
]

#slide(title: [It had been told to ask first.])[
  #grid(
    columns: (1.15fr, 1fr),
    column-gutter: 1.1em,
    align: horizon,
    image("assets/meta_email.png", height: 12.5em),
    [#big[“I had to RUN to my Mac mini like I was defusing a bomb.”]
      #v(0.6em)
      #small[Summer Yue · published user account]
      #v(0.7em)
      #accent[What would stop your agent?]],
  )
  #notes[
    *0:10–1:25 · 75 seconds.* Summer Yue reported that her OpenClaw agent bulk-trashed/archived messages despite instructions to wait for approval. Telling it to stop through chat did not stop the reported execution; she went to the host. Pause: it had already been told to ask first. Ask rhetorically: “What would stop your agent if it ignored the next instruction?”

    *Evidence limit:* This is a user's published account and reproduced screenshot, not an independent forensic investigation. Do not claim all mail was irretrievably destroyed or diagnose the internal cause. Screenshot reproduced from the supplied April deck, with attribution intact.

    *Source:* #link("https://simonwillison.net/2026/Feb/23/summer-yue/")[Summer Yue account, reproduced by Simon Willison]. April source: Infrastructure-based Safety For Your 'Claw, 18 April 2026, commit 900fc7e755dbf97dac5ca405c899c00048f2d8af.
  ]
]

#slide(title: [The same authority can touch your product.])[
  #grid(
    columns: (1.1fr, 1fr),
    column-gutter: 1.2em,
    align: horizon,
    image("assets/replit.png", height: 12em),
    [#big[An agent deleted an application database.]
      #v(0.7em)
      #small[Replit acknowledged the incident. July 2025.]],
  )
  #notes[
    *1:25–2:00 · 35 seconds.* One supporting beat only: Replit acknowledged its Agent deleting a user's app database. For a tiny startup this is the product, not an abstract chatbot problem. Bridge: “Blaming the model does not tell us why it had that much authority.”

    *Evidence limit:* Vendor incident response, not a frequency estimate. The screenshot is the user's account, not a verified technical transcript. Do not infer current Replit settings or guarantees from an old incident, and do not read the full screenshot aloud.

    *Source:* #link("https://replit.com/blog/doubling-down-on-our-commitment-to-secure-vibe-coding")[Replit incident response, 29 July 2025]. Image carried over from the supplied April deck.
  ]
]

#slide(title: [An accident is not a diagnosis.])[
  #big[“Pilot error.”]
  #v(0.8em)
  Why was one mistake allowed to do so much damage?
  #v(1em)
  #callout[Constrain. #h(0.5em) Pace. #h(0.5em) Observe. #h(0.5em) Recover.]
  #notes[
    *2:00–2:55 · 55 seconds.* Reuse the April talk's pilot-error analogy: an accident report that ends at “pilot error” stops before asking how the system allowed the consequence. Likewise “the LLM made a mistake” is a beginning, not a diagnosis.

    Both questions matter: why the model made the error, and why the system allowed such damage. Today focuses on the second. The thesis: build a system that contains an agent's mistake while keeping it useful. Name the four verbs once; do not expand them into another framework slide.

    *Author:* This is a teaching analogy, not a claim that all aviation accidents share a cause. Do not turn it into a history lesson. Source of the hook, analogy and structure: supplied April deck; second verb renamed Pace.
  ]
]

#slide(title: [Two routes to the same tool.])[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    card([An ordinary mistake], [The agent misunderstands your cleanup request.]), card([A hostile instruction], [An email tells it to send private data elsewhere.]),
  )
  #v(1em)
  #align(center)[#big[Agent → tool → consequence]]
  #v(0.65em)
  #align(center)[#accent[Enforce the boundary outside the model.]]
  #notes[
    *2:55–4:00 · 65 seconds.* Our one example is an inbox assistant that suggests cleanup and drafts replies. It can misunderstand a legitimate task, or read attacker-controlled instructions in an email, issue, webpage or tool result. The second route is indirect prompt injection: untrusted content is mistaken for authority.

    Available credentials and tools determine the possible consequence. Better prompts and models can help, but consequential limits also need ordinary code/configuration outside the model. A classifier or output filter is supplementary, not an authorization boundary.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP Security Cheat Sheet]. This is a general system design, not a promise about a named agent or connector. Bridge directly into the inbox permissions.
  ]
]

#slide(title: [Constrain · Give it a smaller world.])[
  #dtable(columns: (1fr, 1.6fr), size: 0.9em, [Useful job], [Authority it actually needs], [Summarize mail], [Read the relevant mailbox or records], [Prepare replies], [Create drafts], [Suggest cleanup], [Produce a reviewable list])
  #v(0.8em)
  #accent[Keep permanent deletion outside its authority.]
  #notes[
    *4:00–5:10 · 70 seconds.* The assistant is still useful with less authority. Limit the records it reads; give it draft creation without a general send tool; return a cleanup list rather than permanent deletion. If moving to trash is permitted, keep permanent deletion separate. The agent should not be able to grant itself more access, change its enforcement controls or retrieve bypass credentials.

    *Hosted tools:* These are boundaries to implement and verify, not connector feature guarantees. If a product cannot enforce a narrow scope, disconnect the consequential capability and do that step yourself. A solo founder can start with fewer tools and existing settings; no gateway purchase is required.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]. *Optional:* discuss time-limited task credentials only in Q&A.
  ]
]

#slide(title: [Constrain · Read-only still means it can copy.])[
  #align(center)[
    #big[Private mail → agent → public destination]
    #v(1em)
    Scope what it can read #strong[and] where it can write.
  ]
  #notes[
    *5:10–6:10 · 60 seconds.* Read access is disclosure authority. An agent that can read private mail and write arbitrary public posts or outbound messages has a disclosure path, even if the source connector is read-only. Narrow sources and destinations together, including other tools such as browser, shell and network.

    *Optional evidence, one sentence:* Invariant Labs demonstrated instructions in a public GitHub issue inducing an agent with connected tools to read private-repository information and disclose it through a public PR. It is a researcher demonstration of a particular configuration, not current exploit prevalence or a claim that every GitHub client is exposed.

    *Source:* #link("https://invariantlabs.ai/blog/mcp-github-vulnerability")[Invariant Labs disclosure, 26 May 2025]. *Cut if late:* the researcher example; retain the source/destination principle.
  ]
]

#slide(title: [Constrain · Build, rehearse, serve.])[
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    column-gutter: 0.45em,
    align: horizon,
    card([Dev], [Agent builds with test data.]), [→], card([Staging / UAT], [Rehearse the reviewed change.]), [→], card([Production], [Serve customers.]),
  )
  #v(0.9em)
  #accent[The development agent gets no production credentials.]
  #v(0.65em)
  #small[Scheduled refresh: sanitize in the protected production boundary → validate → staging.]
  #notes[
    *6:10–8:00 · 110 seconds.* Translate to coding agents. Dev builds/tests in an isolated workspace; a reviewed change advances to staging/UAT and then production. UAT means user acceptance testing; it may share staging. No fourth environment is required. Separate data, credentials and integration configuration. Different folders are insufficient if shell access exposes the founder's host credentials. The dev agent gets neither production secrets nor an unrestricted deployment tool.

    *Realistic test data:* For example, a weekly one-way refresh runs a restricted extraction/sanitization job inside a protected production-side boundary. Ordinary staging users and agents never get raw extracts or production credentials. Replace names, addresses, emails and identifying account values with consistent synthetic equivalents; remove secrets, tokens and live integrations. Treat free text, attachments and combinations of fields as identifying too. Validate schema, destinations and relationships before publishing; fail closed on unhandled sensitive fields. If safe de-identification cannot be established, use synthetic fixtures. Bound production load. Show dataset version/date.

    Staging uses test payments and captured email/webhooks, with no path back through shared databases, queues or connectors. A refresh is not a backup. *Sources/detail:* docs/recovery-drill.md, scheduled refresh; #link("https://owasp.github.io/DevSecOpsGuideline/3-Governance/3-2-Data-protection/")[OWASP data protection]. *Cut:* field-by-field examples, not the production credential boundary.
  ]
]

#slide(title: [Pace · Put the checkpoint before the consequence.])[
  #align(center)[
    #big[Draft → review → approved send]
    #v(0.9em)
    Show the recipient and the exact content.
    #v(1em)
    #callout[“Ask first” belongs in the tool boundary.]
  ]
  #notes[
    *8:00–9:35 · 95 seconds.* The inbox agent prepares a draft. The person sees recipient and content; only the approved action executes. Application code validates the authenticated actor, object/target and action, independently of the model. The model cannot approve itself. If recipient or content changes, earlier approval no longer authorizes the send. Expire approvals and prevent replay/duplicate side effects as appropriate.

    A tool wrapper or MCP gateway can enforce this only when every relevant action passes through it and the agent has no shell/direct-credential bypass. This is an implementation option, not a prerequisite. Hosted-tool users should verify supported controls or keep the final action manual. Do not demand a click for each harmless read; approval fatigue makes the meaningful checkpoint worse.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]. *Author:* “Review” means enough information to decide, not a generic “allow all for this session.” Drafting still saves time even if sending stays manual.
  ]
]

#slide(title: [Pace · Cap the damage before you notice.])[
  #big[One small batch. Then pause.]
  #v(1em)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    card([Bound execution], [Tool calls · retries · runtime]), card([Bound exposure], [Records · destinations · spend]),
  )
  #v(0.75em)
  #small[Enforce limits outside the model. Pick limits that fit the job.]
  #notes[
    *9:35–11:00 · 85 seconds.* Pace means when it acts, how much it does and when it must ask. For inbox cleanup, a small reviewable batch beats an unlimited loop. Bound tool calls, retries, total runtime, records affected and spend using ordinary runtime/tool controls. There is no universal safe count; choose a batch a person can understand and a loss the business can tolerate.

    Enforce across the workflow, including retries/fan-out, not a counter the model can reset. Alert on the cap. A cap limits damage; it does not authorize an otherwise forbidden action. Keep permanent deletion out of the tool set regardless of batch size.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]. Bridge: limits matter only if you can tell what actually ran.
  ]
]

#slide(title: [Observe · Test what it did, not what it said.])[
  #tag[ILLUSTRATIVE POLICY RECORD]
  #v(0.55em)
  #big[“I've stopped.”]
  #v(0.85em)
  #dtable(columns: (1fr, 1fr, 1fr), size: 0.8em, [Tool request], [Policy decision], [Actual outcome], [Send message], [No approval → deny], [Nothing delivered])
  #v(0.7em)
  #accent[Keep the evidence outside the agent's control.]
  #notes[
    *11:00–11:50 · 50 seconds.* Return to the opening: saying “I've stopped” is not evidence that actions stopped. Record tool calls, targets, approval identity/decision and actual outcomes in logs the agent cannot rewrite. Record blocked attempts, too. Minimize secrets and unnecessary message bodies; restrict log access/retention. Final chat text alone cannot establish whether data was read or a message sent.

    *Author:* Introduce the table as an illustrative policy record before reading it. It is neither a log from the opening incident nor a performed test. For meaningful outcome checks use both tool-side logs and the destination or storage state. Bridge: we can deliberately challenge these boundaries before trusting them.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance].
  ]
]

#slide(title: [Observe · Automate hostile inputs. Check tool outcomes.])[
  #tag[ILLUSTRATIVE STAGING TRACE · SYNTHETIC DATA · NOT A PERFORMED TEST]
  #v(0.55em)
  #dtable(columns: (0.8fr, 2.5fr), size: 0.78em, inset: 7pt, [Step], [What to verify], [Baseline], [A permitted draft is created. Approved test mail reaches the test inbox.], [Attack read], [A retrieved email asks for another customer's data to be sent elsewhere.], [Boundary], [Unauthorized read/send is rejected by policy; logs and destination agree.])
  #v(0.6em)
  #accent[Did a forbidden action actually happen?]
  #notes[
    *11:50–13:30 · 100 seconds.* This is the same inbox assistant, now handling two synthetic customers' mail in an isolated staging test. Automated red-teaming means automatically trying hostile inputs against this workflow, then checking whether forbidden actions actually happened. This illustrative trace is a test design, not evidence of a performed test. Narrate each row as a check to make, not an observed result. Use fake records, a controlled destination and production-equivalent policy.

    First confirm the legitimate workflow works: check that a permitted draft is created and an explicitly approved delivery reaches a test inbox. A broken connector must not look like a defense. Confirm the attack-bearing content was actually retrieved/read. Then inspect attempted calls, backend decisions, stored state and controlled destinations: confirm unauthorized reads/sends are rejected and nothing forbidden reaches the sink. A denial in the final answer is not enough. If the model refuses without making a call, report that result accurately; it does not prove the backend rejects the call.

    *Author:* Before presentation, either keep this clearly illustrative or replace with a real, safely recorded trace and retain its evidence. Do not imply a completed experiment. *Source/detail:* docs/research-ai.md, automated red-team practice; #link("https://owasp.github.io/DevSecOpsGuideline/2-Process/2-4-Test/2-4-6-AI-LLM-Application-Security-Testing/")[OWASP AI application testing].
  ]
]

#slide(title: [Observe · Keep failures as repeatable checks.])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 0.65em,
    card([Disclosure], [Can it fetch or copy another customer's data?]), card([Unauthorized action], [Can it send without exact approval?]), card([Runaway use], [Can it exceed the execution cap?]),
  )
  #v(0.9em)
  #accent[Repeat after model, prompt, permission or connector changes.]
  #v(0.5em)
  #small[A passing suite means these tests found no failure.]
  #notes[
    *13:30–15:00 · 90 seconds.* Start by testing authorization directly, without a model: customer A cannot fetch B's record; a send without approval is denied even if requested by the agent; changing approved arguments is denied. Then automate hostile messages through the complete workflow. Check tool outcomes, not just model wording. Repeat probabilistic cases; retain failures as regressions. A clean suite does not prove attack-proof behavior. Fix or disable a demonstrated critical boundary failure before release.

    *Practical tools, optional/Q&A:* #link("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo] can exercise custom applications; #link("https://microsoft.github.io/PyRIT/latest/code/framework/")[Microsoft PyRIT] supports attack workflows; #link("https://github.com/NVIDIA/garak")[NVIDIA garak] probes models/endpoints. Tailor checks to real permissions and side effects; model probes alone are insufficient. Record target/model/prompt/tool/policy/test versions, case outcomes and traces. Cap test runtime/spend and use synthetic data, staging-only credentials and controlled sinks. Hosted-tool users test only their authorized test workspace and infer only what they can observe.

    *Cut:* scanner names and configuration. Preserve direct authorization tests, repeated workflow tests and the limit of a passing suite.
  ]
]

#slide(title: [Recover · Stop it without persuading it.])[
  #align(center)[
    #big[Stop execution → disable tools]
    #v(0.35em)
    #big[→ revoke credentials]
    #v(1em)
    Confirm queued and in-flight actions have stopped.
    #v(1em)
    #accent[Then repair the damage.]
  ]
  #notes[
    *15:00–15:50 · 50 seconds · Say this core:* Return to the opening: stopping should not depend on persuading the agent in chat. Have a separate host or supervisor stop control. Disable its tools and revoke its credentials. A remote service may already have accepted queued work, so confirm queued and in-flight actions have stopped before repairing data. Know how to cancel or drain those jobs. Preserve the logs.

    *Reference / Q&A:* Hosted-tool users should find the supported account/connector disable and token-revocation paths before connecting sensitive capabilities. Controls differ by product; verify the path you actually have. Recovery from data loss and response to disclosure differ: restoring a backup cannot recall copied information.

    *Source/detail:* docs/talk-content.md and docs/recovery-drill.md; the independent stop is the design lesson drawn from the opening account, not a claim that every product offers the same control.
  ]
]

#slide(title: [Recover · A backup is a promise. A restore is the rehearsal.])[
  #big[How much work can you lose?]
  #v(0.7em)
  #big[How long can you be down?]
  #v(1em)
  #accent[Versioned backups, protected from the agent.]
  #v(0.6em)
  #small[Code rollback does not restore a database. A staging refresh is not a backup.]
  #notes[
    *15:50–16:40 · 50 seconds · Say this core:* Ask how much work you can lose and how long you can be down. Back up the data the agent can damage, keep recoverable versions and protect them from its delete authority. Practise restoring a working application. Code rollback does not restore a database; a staging refresh is not a backup. And restoring data cannot undo disclosure: copied mail cannot be recalled.

    *Reference / Q&A:* Choose backup frequency/retention to meet tolerated data loss and downtime. Keep restore keys and instructions available. Soft deletion helps; a replica may copy the same deletion. Test raw production-backup restoration only in a restricted recovery environment; sanitize/validate before any ordinary staging access. Check records, relationships, attachments, permissions and a working application flow.

    *Source:* #link("https://www.ncsc.gov.uk/guidance/mitigating-malware-and-ransomware-attacks")[NCSC backup and restore guidance]. The two questions express recovery-point/time requirements in founder language. *Cut:* terminology and backup technology comparisons.
  ]
]

#slide(title: [Recover · The AI wheel of misfortune.])[
  #grid(
    columns: (1.1fr, 1fr),
    column-gutter: 1em,
    align: horizon,
    image("assets/recovery-wheel.svg", width: 95%),
    [#big[Once a month. One bounded UAT drill.]
      #v(0.7em)
      Break it. Recover it. Keep the receipt.
      #v(0.75em)
      #small[Known baseline · stop condition · verification]],
  )
  #notes[
    *16:40–18:00 · 80 seconds · Say this core:* Once a month, try one bounded drill in staging/UAT. Walk only the deleted-record wedge today: start with a working baseline and a known backup; delete seeded test records to simulate a mistake; confirm the deletion; stop writes and restore. Verify the records, their relationships and a working application flow. Measure recovery time and lost work. Keep the receipt and fix failed recovery before shipping the affected change. Set an abort condition and duration; use UAT-only credentials/data. No live destructive demo. A refresh must not mask the failure.

    *Reference / Q&A — other wedges:* Bad change → roll back, verify app/data compatibility; revoked key → old key denied, replacement works, retries bounded; runaway → external cap stops execution and alerts. The delete scenario rehearses an allowed mistake in a test environment; it does not grant our inbox agent permanent-delete authority. Keep scenario, build, owner, failure, recovery time/data loss, verification and one follow-up. An invalid injection is not a pass. Abort if production connectivity appears. Automate only understood, bounded drills.

    *Reference / author:* Red-teaming and the wheel both challenge a safety claim, observe the outcome and keep it repeatable. One probes hostile inputs; the other rehearses failures/recovery. UAT success does not establish production recovery time/scale. docs/recovery-drill.md has an additional provider-outage scenario; this slide chooses runaway use to connect to agent caps. *Sources:* that drill recipe; #link("https://principlesofchaos.org/")[Principles of Chaos Engineering] (our exercise deliberately confines novices to UAT).
  ]
]

#slide(title: [One useful inbox agent. Four safeguards.])[
  #grid(
    columns: (1fr, 1fr),
    rows: (auto, auto),
    gutter: 0.8em,
    card([Constrain], [Relevant mail. Drafts. No permanent deletion.]), card([Pace], [Exact-action approval. Small batches. Execution caps.]),
    card([Observe], [Actual tool outcomes. Adversarial regression tests.]), card([Recover], [Independent stop. Protected backups. Practised restore.]),
  )
  #notes[
    *18:00–19:00 · 60 seconds.* Reassemble the inbox assistant from the opening. It still summarizes relevant mail, suggests cleanup and drafts replies. Consequential actions are gated outside the model; a hostile message cannot authorize itself. Real tool outcomes are visible; failures are retained as tests. If the agent runs away, a separate stop exists and data recovery is practised.

    Four verbs are the only framework to remember. The same pattern applies to a coding agent: isolated development, reviewed promotion, bounded execution, verified actions and rehearsed recovery. Avoid expanding into general SaaS procurement, compliance or every vulnerability generated code might contain.

    *Author:* If time is short, use this as the closing slide and speak the commitment from the next slide. Do not cut the concrete red-team or recovery material to preserve all closing prose.
  ]
]

#slide(title: [This week: choose one agent workflow.])[
  #big[Add one missing safeguard.]
  #v(1em)
  #callout[When the agent gets it wrong, your system should contain the mistake.]
  #notes[
    *19:00–20:00 · 60 seconds.* Ask each founder to choose one agent workflow and one missing safeguard to implement this week. Examples: remove permanent-delete authority; keep final send manual; enforce a tool cap; record real outcomes; run a UAT restore. No new security department or shopping list.

    Pause so they can pick a concrete workflow. Close with the line on screen. Twenty minutes of content ends here. Invite the separate five-minute Q&A; optional references follow it, not within the speaking budget.

    *Author:* This is a proposed talk deck, not an implemented control system or evidence that any test has passed. Rehearse the twenty-minute budget and shorten optional examples before cutting the four actions.
  ]
]

#slide(title: [Questions · 5 minutes])[
  #big[Constrain. Pace. Observe. Recover.]
  #v(1em)
  #accent[gauravmanek.com]
  #v(0.6em)
  #small[Optional implementation references follow.]
  #notes[
    *20:00–25:00 · Separate Q&A.* Prefer questions about one actual workflow, its authority and the missing boundary. Avoid unsupported product-specific guarantees: verify current plan/settings and actual enforcement. Hosted-tool users can disconnect a capability and retain the final step manually.

    Appendix A covers refresh and recovery separation; appendix B covers a tiny test suite. Sources and caveats live in each slide's notes and in docs/research-ai.md. The appendix is optional and outside the twenty-minute talk.
  ]
]

#slide(title: [Appendix A · Realistic staging data, safely.])[
  #tag[OPTIONAL · OUTSIDE THE 20-MINUTE TALK]
  #v(0.6em)
  #align(center)[#big[Extract → sanitize → validate → publish]]
  #v(0.9em)
  Keep raw data and credentials inside the protected boundary.
  #v(0.75em)
  #small[One-way scheduled refresh. Synthetic identities. Test integrations. No raw extracts in staging.]
  #notes[
    *Optional Q&A detail.* Suggested cadence: weekly and after material schema changes, chosen for the product. A narrowly scoped production-side job extracts a needed subset without disrupting production, replaces identifying fields consistently and strips secrets/live integrations. Exclude or sanitize free text, attachments, logs and combinations that could identify someone. Replacing names alone does not establish anonymity. When safe de-identification is uncertain, use synthetic fixtures.

    Validate relationships, schema, sensitive-field absence and captured delivery destinations. Fail closed on failed validation/unhandled schema. Publish only validated output to staging, retain date/version and delete temporary raw extracts under the production policy. Never write staging data back to production. Staging users/agents cannot access the processing area or its credentials. Restrict derived datasets too.

    Backups are separate, versioned recovery assets with production-level protection. A raw restore drill belongs in an isolated recovery environment; sanitize/validate before any ordinary staging access. Serialize refreshes and drills so refresh cannot conceal the injected failure. Details: docs/recovery-drill.md. #link("https://owasp.github.io/DevSecOpsGuideline/3-Governance/3-2-Data-protection/")[OWASP data protection].
  ]
]

#slide(title: [Appendix B · The smallest useful test suite.])[
  #tag[OPTIONAL · OUTSIDE THE 20-MINUTE TALK]
  #v(0.5em)
  #dtable(columns: (1.1fr, 1.7fr), size: 0.75em, inset: 7pt, [Direct policy test], [Then exercise the complete agent workflow], [A cannot read B's record], [Hostile retrieved content requests B's record], [Unapproved send is denied], [An email asks for a send; change approved arguments], [Tool cap cannot be exceeded], [A task induces a bounded retry/tool loop])
  #v(0.6em)
  #accent[Assert from logs and state. Keep every demonstrated failure.]
  #notes[
    *Optional Q&A detail.* Use two synthetic customers, canary records, an approved test inbox and a controlled sink. First prove the normal workflow works. Test the backend directly, then repeated hostile inputs through the agent. Ensure attack content was read. Check retrieval/tool logs, policy decisions, actual messages/state and cap alerts. Model refusal alone does not test backend authorization. If a test never reaches the intended boundary, mark that limit.

    Preserve a critical failure as a regression, fix or disable its path, and rerun after model/prompt/tool/policy changes. Record versions and cap test spend/time. Promptfoo and PyRIT can orchestrate app tests; garak provides model/endpoint probes. None certifies security or replaces outcome assertions. A high average pass rate cannot cancel a demonstrated critical unauthorized action.

    *Sources:* #link("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo configuration]; #link("https://microsoft.github.io/PyRIT/latest/code/framework/")[PyRIT framework]; #link("https://github.com/NVIDIA/garak")[garak repository]. Full teaching recipe: docs/research-ai.md. These are implementation starting points, not benchmark results.
  ]
]
