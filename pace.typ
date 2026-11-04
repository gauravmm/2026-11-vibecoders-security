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
    A recipient or payload change invalidates approval. Consume approvals once, at execution; retries must not duplicate side effects. Excessive prompts encourage rubber-stamping.
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
    Count retries and fan-out against the whole workflow budget. A cap limits damage; it never authorizes an otherwise forbidden action.
  ]
]

