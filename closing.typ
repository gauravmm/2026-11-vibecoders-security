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

#slide(title: [This week: choose one agent workflow.])[
  #big[Add one missing safeguard.]
  #v(1em)
  #callout[When the agent gets it wrong, your system should contain the mistake.]

]

#slide(title: [Questions · 5 minutes])[
  #big[Constrain. Pace. Observe. Recover.]
  #v(1em)
  #accent[gauravmanek.com]
  #v(0.6em)
  #small[Optional implementation references follow.]

]

#slide(title: [Appendix A · Realistic staging data, safely.])[
  #tag[OPTIONAL · OUTSIDE THE 20-MINUTE TALK]
  #v(0.6em)
  #align(center)[#big[Extract → sanitize → validate → publish]]
  #v(0.9em)
  Keep raw data and credentials inside the protected boundary.
  #v(0.75em)
  #small[One-way scheduled refresh. Synthetic identities. Test integrations. No raw extracts in staging.]
  #v(0.35em)
  #small[Sources: #cite-source("https://owasp.github.io/DevSecOpsGuideline/3-Governance/3-2-Data-protection/")[OWASP data protection]]
  #notes[
    Replacing names does not establish anonymity: free text, attachments and combinations of fields may identify people. Fail closed on unhandled schema changes. Sanitize raw restores before ordinary staging access; keep refreshes separate from recovery drills.
  ]
]

#slide(title: [Appendix B · The smallest useful test suite.])[
  #tag[OPTIONAL · OUTSIDE THE 20-MINUTE TALK]
  #v(0.5em)
  #dtable(
    columns: (1.1fr, 1.7fr),
    size: 0.75em,
    inset: 7pt,
    [Direct policy test],
    [Then exercise the complete agent workflow],
    [A cannot read B's record],
    [Hostile retrieved content requests B's record],
    [Unapproved send is denied],
    [An email asks for a send; change approved arguments],
    [Tool cap cannot be exceeded],
    [A task induces a bounded retry/tool loop],
  )
  #v(0.6em)
  #accent[Assert from logs and state. Keep every demonstrated failure.]
  #v(0.35em)
  #small[Sources: #cite-source("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo configuration], #cite-source("https://microsoft.github.io/PyRIT/latest/code/framework/")[PyRIT framework], #cite-source("https://github.com/NVIDIA/garak")[garak repository]]
  #notes[
    Distinguish an attack that was never retrieved, a model refusal and a backend denial. Only the last exercises the authorization boundary. A critical failure remains a regression even when the overall pass rate is high.
  ]
]

// Collected in first-use order, including sources registered only in notes.
#reference-slides()
