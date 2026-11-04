#import "theme.typ": *

#slide(title: [Pace · Put the checkpoint before the consequence.])[
  #align(center)[
    #big[Draft → review → approved send]
    #v(0.9em)
    Show the recipient and the exact content.
    #v(1em)
    #callout[“Ask first” belongs in the tool boundary.]
  ]
  #v(0.35em)
  #small[Sources: #cite-source("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]]
  #notes[
    *8:00--9:35 · 95 seconds.* The inbox agent prepares a draft. The person sees recipient and content; only the approved action executes. Application code validates the authenticated actor, object/target and action, independently of the model. The model cannot approve itself. If recipient or content changes, earlier approval no longer authorizes the send. Expire approvals and prevent replay/duplicate side effects as appropriate.

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
  #v(0.35em)
  #small[Sources: #cite-source("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]]
  #notes[
    *9:35--11:00 · 85 seconds.* Pace means when it acts, how much it does and when it must ask. For inbox cleanup, a small reviewable batch beats an unlimited loop. Bound tool calls, retries, total runtime, records affected and spend using ordinary runtime/tool controls. There is no universal safe count; choose a batch a person can understand and a loss the business can tolerate.

    Enforce across the workflow, including retries/fan-out, not a counter the model can reset. Alert on the cap. A cap limits damage; it does not authorize an otherwise forbidden action. Keep permanent deletion out of the tool set regardless of batch size.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]. Bridge: limits matter only if you can tell what actually ran.
  ]
]

