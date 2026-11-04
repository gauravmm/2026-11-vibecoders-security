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
    *11:00--11:50 · 50 seconds.* Return to the opening: saying “I've stopped” is not evidence that actions stopped. Record tool calls, targets, approval identity/decision and actual outcomes in logs the agent cannot rewrite. Record blocked attempts, too. Minimize secrets and unnecessary message bodies; restrict log access/retention. Final chat text alone cannot establish whether data was read or a message sent.

    *Author:* Introduce the table as an illustrative policy record before reading it. It is neither a log from the opening incident nor a performed test. For meaningful outcome checks use both tool-side logs and the destination or storage state. Bridge: we can deliberately challenge these boundaries before trusting them.

    *Source:* #link("https://cheatsheetseries.owasp.org/cheatsheets/MCP_Security_Cheat_Sheet.html")[OWASP MCP guidance].
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
    *11:50--13:30 · 100 seconds.* This is the same inbox assistant, now handling two synthetic customers' mail in an isolated staging test. Automated red-teaming means automatically trying hostile inputs against this workflow, then checking whether forbidden actions actually happened. This illustrative trace is a test design, not evidence of a performed test. Narrate each row as a check to make, not an observed result. Use fake records, a controlled destination and production-equivalent policy.

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
  #v(0.35em)
  #small[Sources: #cite-source("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo], #cite-source("https://microsoft.github.io/PyRIT/latest/code/framework/")[Microsoft PyRIT], #cite-source("https://github.com/NVIDIA/garak")[NVIDIA garak]]
  #notes[
    *13:30--15:00 · 90 seconds.* Start by testing authorization directly, without a model: customer A cannot fetch B's record; a send without approval is denied even if requested by the agent; changing approved arguments is denied. Then automate hostile messages through the complete workflow. Check tool outcomes, not just model wording. Repeat probabilistic cases; retain failures as regressions. A clean suite does not prove attack-proof behavior. Fix or disable a demonstrated critical boundary failure before release.

    *Practical tools, optional/Q&A:* #link("https://www.promptfoo.dev/docs/red-team/configuration/")[Promptfoo] can exercise custom applications; #link("https://microsoft.github.io/PyRIT/latest/code/framework/")[Microsoft PyRIT] supports attack workflows; #link("https://github.com/NVIDIA/garak")[NVIDIA garak] probes models/endpoints. Tailor checks to real permissions and side effects; model probes alone are insufficient. Record target/model/prompt/tool/policy/test versions, case outcomes and traces. Cap test runtime/spend and use synthetic data, staging-only credentials and controlled sinks. Hosted-tool users test only their authorized test workspace and infer only what they can observe.

    *Cut:* scanner names and configuration. Preserve direct authorization tests, repeated workflow tests and the limit of a passing suite.
  ]
]

