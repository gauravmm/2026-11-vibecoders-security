# Developing a principle section

The Constrain section established this workflow for the talk's four principles: **failure examples → principles → implementation patterns**. Develop the audience slides first, then retain only useful lecture cues in the notes.

## 1. Research concrete failures

Use research agents to search incident collections and follow their links to primary accounts, provider postmortems and researcher disclosures. Constrain started with [Awesome Agent Failures](https://github.com/vectara/awesome-agent-failures) and [Awesome GenAI Fails](https://github.com/hb20007/awesome-gen-ai-fails).

Record what happened, which capability made the consequence possible, what boundary would have helped, and the limits of the evidence. Keep reported incidents distinct from controlled demonstrations. Treat the proposed safeguard as an engineering inference unless the source tested it. Individual incidents do not establish prevalence.

## 2. Select examples that teach the mechanism

Choose complementary examples whose failure paths the audience can understand quickly. Constrain used OpenClaw's reported inbox deletions and Invariant's GitHub disclosure demonstration to show ordinary mistakes and hostile instructions reaching consequential tools.

Use authentic screenshots with short, one-line titles, links and citations. Prefer the original disclosure or an attributed incident account. Preserve source attribution and clearly label research demonstrations. Use readable image crops or full-width layouts where useful; do not fabricate evidence or imply that an illustrative trace was an actual experiment.

## 3. Extract principles from authoritative guidance

Check primary OWASP, IMDA and NIST guidance and identify the relevant sections. Separate their explicit recommendations from our application to a startup workflow. Propose a short set of principles, refine the wording, and avoid overlap with neighboring sections.

Constrain settled on three: give each agent a narrowly scoped task; provide only the necessary tools, data and permissions; enforce boundaries through infrastructure that the agent cannot bypass.

## 4. Research implementation patterns

Go beyond general advice to mechanisms that ordinary code, identities, tools and infrastructure can enforce. For each candidate, capture a practical rule, implementation, primary source and limitation. Distinguish deterministic authorization from probabilistic classifiers or model critics, and check alternate execution paths.

Constrain produced ten candidates; the presenter selected seven. A fixed output destination is useful only if it is authorized to receive the inputs. A tool restriction is ineffective if another tool or credential bypasses it.

## 5. Edit for lecture delivery

Put the selected pattern titles on the next slide; keep details in research documentation. Constrain's final pattern list uses one column. Keep the body readable and remove repeated explanations. Match the shared theme rather than introducing a separate visual system.

Assume an expert presenter: notes contain only non-obvious distinctions, evidence caveats or useful lecture cues. Omit speaking timings, scripts, obvious restatements and long source summaries. Primary references and detailed research remain available separately.

## 6. Integrate and review the full sequence

Each section lives in its own file: `constrain.typ`, `pace.typ`, `observe.typ` or `recover.typ`. `slides.typ` controls ordering; `theme.typ` owns shared presentation settings and helpers. Keep the opening and closing coherent with the section changes.

Check evidence attribution, citations, readability, transitions and conceptual overlap. Review the audience slides themselves: an essential qualification should not exist only in notes. Verify that guidance is feasible for a small team and that examples do not imply controls were implemented or tests performed.

Run the repository checks and inspect the audience and notes outputs. Report PDF generation or layout checks only when there is a failure. Commit when requested.

## Applying the workflow to the remaining sections

Use one Sol agent per section to research and implement Pace, Observe and Recover in separate files and accompanying research notes. The coordinating agent integrates the sections, then an Astra agent adversarially reviews the complete opening → Constrain → Pace → Observe → Recover → closing sequence. Record findings and their dispositions, resolve material issues, and verify the final edits.
