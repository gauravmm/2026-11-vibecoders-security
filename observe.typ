#import "theme.typ": *

#slide(title: [Observe · Test what it did, not what it said.])[
  #tag[ILLUSTRATIVE POLICY RECORD]
  #v(0.55em)
  #big[“I've stopped.”]
  #v(0.85em)
  #dtable(
    columns: (1fr, 1fr, 1fr),
    size: 0.8em,
    [Tool request],
    [Policy decision],
    [Actual outcome],
    [Send message],
    [No approval → deny],
    [Nothing delivered],
  )
  #v(0.7em)
  #accent[Keep the evidence outside the agent's control.]
  #v(0.35em)
  #small[Sources: #cite-source("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance]]
  #notes[
    The table is illustrative, not an incident trace. Verify outcomes at the destination or in storage as well as in tool logs; a logged attempt need not have succeeded.
  ]
]

#slide(title: [Observe · Automate hostile inputs. Check tool outcomes.])[
  #tag[ILLUSTRATIVE STAGING TRACE · SYNTHETIC DATA · NOT A PERFORMED TEST]
  #v(0.55em)
  #dtable(
    columns: (0.8fr, 2.5fr),
    size: 0.78em,
    inset: 7pt,
    [Step],
    [What to verify],
    [Baseline],
    [A permitted draft is created. Approved test mail reaches the test inbox.],
    [Attack read],
    [A retrieved email asks for another customer's data to be sent elsewhere.],
    [Boundary],
    [Unauthorized read/send is rejected by policy; logs and destination agree.],
  )
  #v(0.6em)
  #accent[Did a forbidden action actually happen?]
  #v(0.35em)
  #small[Sources: #cite-source("https://owasp.github.io/DevSecOpsGuideline/2-Process/2-4-Test/2-4-6-AI-LLM-Application-Security-Testing/")[OWASP AI application testing]]
  #notes[
    No experiment was performed. A positive control prevents a broken connector from masquerading as a defense. A model refusal before tool invocation does not test backend authorization; attempt the forbidden call directly too.
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
  #v(0.35em)
  #small[Sources: #cite-source("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo], #cite-source("https://microsoft.github.io/PyRIT/latest/code/framework/")[Microsoft PyRIT], #cite-source("https://github.com/NVIDIA/garak")[NVIDIA garak]]
  #notes[
    Separate direct authorization tests from agent-mediated attacks. Repeat stochastic cases. A high aggregate pass rate cannot cancel a critical failure; model-endpoint probes alone do not establish application security.
  ]
]

