# Adversarial review of the first slide cut

Reviewed on 2 November 2026 using `grok -p`, with web search and subagents disabled. The reviewer read `slides.typ`, including presenter notes, the content plan and supporting local material. Requested focus: (1) flow and sequencing, (2) coverage of the proposed content. Audience: teams of 1–5; twenty minutes plus five minutes of Q&A; memorable rather than comprehensive. This was a source/content review, not a rehearsal or visual inspection. Sol built the deck; the main agent separately checked structure and rendered slides/notes.

## Disposition

All three findings below were accepted:

1. **Timing:** added an explicit short delivery path and cut order. Recovery notes distinguish concise spoken cores from implementation reference. Walk through the deleted-record restore wedge; keep the other recipes for reference/Q&A. This choice gives the requested backup rehearsal priority. Timing remains a budget to rehearse, not a measured delivery time.
2. **Example continuity:** introduce the same inbox assistant with two synthetic customers' mail before the hostile-input test, and narrate the trace as checks to perform.
3. **Evidence clarity:** label the sample policy record on the audience slide and explicitly distinguish it from the opening incident and from a performed experiment.

The reviewer found no required coverage gaps. Technical detail remains in the presenter notes. No scanner comparison or additional framework was added. The review below predates these fixes; it has not been rerun against them.

## Reviewer findings and coverage

The following is the review output, excluding the CLI's progress messages and an incomplete optional-elaboration tail.

The deck covers the proposed 20-minute talk. Every required beat is in the audience slides or the speaker notes, the clock adds up to exactly 20:00, and the red-team trace is labeled as illustrative. Three delivery fixes are worth making before rehearsal. Nothing required is missing.

Numbers follow source order. The title is slide 1. There are 18 spoken slides, then Questions · 5 minutes, then Appendix A and Appendix B. That matches `README.md`. I did not compile or rehearse the deck. Word budgets below are counts of the spoken note paragraphs.

## Findings

**1. The clock has no slip time, and two Recover slides are at a read-aloud ceiling.** Slides 1–18 sum to 20:00. A straight read of the spoken notes fits most slots at about 100–120 words per minute. These two do not:

- Slide 14, Recover · Stop it without persuading it (50 seconds, about 117 spoken words, roughly 140 wpm).
- Slide 15, Recover · A backup is a promise. A restore is the rehearsal (50 seconds, about 108 spoken words, roughly 130 wpm).

Slide 8, Constrain · Build, rehearse, serve, fits its 110 seconds only as a continuous 200-word read. Slide 16, Recover · The AI wheel of misfortune, fits its 80 seconds only if you skip the author paragraph and recite the four evidence lines without pausing on the wheel.

If you run long, use the cuts already marked in the notes, in this order: the Invariant Labs sentence on slide 7, Constrain · Read-only still means it can copy; the field-by-field sanitization nouns on slide 8; the scanner names on slide 13, Observe · Keep failures as repeatable checks; three of the four evidence recipes on slide 16. Keep one wedge in full. Runaway use is the one that ties back to Pace. If still behind, speak the commitment from slide 18 while showing slide 17, One useful inbox agent. Four safeguards.

Keep these sentences even when you cut: the development agent gets no production credentials; a refresh is de-identified staging data and is separate from a backup; the red-team baseline and the question “Did a forbidden action actually happen?”; a revoked token does not cancel work a remote service already accepted; a restore cannot recall copied mail.

**2. The inbox example changes system at the red-team slide.** Slides 2, 6, 7, 9, and 10 are one assistant: summarize mail, suggest cleanup, draft replies, no permanent delete. Slide 9’s notes already return there after the coding-agent translation, with “The inbox agent prepares a draft.” Slide 12, Observe · Automate hostile inputs. Check tool outcomes, then attacks “another customer’s data,” and slide 13 tests “customer A cannot fetch B’s record,” with no handoff.

Add one sentence at the start of slide 12: this is the same assistant, now with two synthetic customers’ mail (or two private threads). The positive control, the retrieval check, and the direct policy test can stay as written.

**3. One specimen can be heard as a result.** Slide 12 is labeled on the slide: “ILLUSTRATIVE STAGING TRACE · SYNTHETIC DATA · NOT A PERFORMED TEST,” and the column is “What to verify.” Narrate that row as a check (“confirm the send was rejected”), in the present tense. The notes already forbid implying a completed experiment.

Slide 11, Observe · Test what it did, not what it said, shows a concrete row — Send message / No approval → deny / Nothing delivered — with no such label. The notes call it an illustrative policy record. Say that before the table. Placed under “I’ve stopped.”, the row can be heard as a log from Summer Yue’s account or as a test you ran.

## Coverage checklist

| Proposed beat | Status | Where |
|---|---|---|
| Hook: told to ask first, chat did not stop it, attributed user account | Covered | Slide 2, It had been told to ask first. |
| One product beat, evidence limited to the vendor acknowledgement | Covered | Slide 3, The same authority can touch your product. |
| Setup: pilot-error analogy, damage question, thesis, four verbs named once | Covered | Slide 4, An accident is not a diagnosis. |
| Ordinary mistake and hostile instruction; limits outside the model | Covered | Slide 5, Two routes to the same tool. “Indirect prompt injection” is named in the notes. |
| Inbox authority: scoped read, drafts, reviewable cleanup, no permanent delete, no self-granted access | Covered | Slide 6, Constrain · Give it a smaller world. Self-escalation and the hosted-tool fallback are in the notes. |
| Read-only can still disclose | Covered | Slide 7. The Invariant Labs demo is optional and marked cut-if-late. |
| Dev → staging/UAT → production; no production credentials; folders are not isolation | Covered | Slide 8, Constrain · Build, rehearse, serve. |
| One-way scheduled refresh: sanitize inside the production boundary, validate, fail closed, synthetic fallback, refresh is not a backup | Covered | One line on slide 8; full recipe in those notes and Appendix A. Repeated on slide 15 and in the slide 16 notes. |
| Pace: recipient and exact content, approval in the tool boundary, model cannot approve itself, hosted users keep the last step manual | Covered | Slide 9, Pace · Put the checkpoint before the consequence. Gateway is optional in the notes. |
| Caps on calls, retries, runtime, records, destinations, and spend | Covered | Slide 10, Pace · Cap the damage before you notice. |
| Logs of tool, decision, and outcome, outside the agent’s control | Covered | Slide 11. See finding 3 for how the sample row can be heard. |
| Automated red-team, positive control, attack actually retrieved, outcomes from logs and destination, refusal is not a backend proof | Covered | Slide 12. Tag matches the README: not a performed experiment. |
| Direct authorization tests, then repeat through the agent; a clean suite means those tests found no failure | Covered | Slide 13 and Appendix B. Promptfoo, PyRIT, and garak stay in the notes. |
| Stop outside the chat; disable tools; revoke credentials; confirm queued and in-flight work | Covered | Slide 14. The opening question pays off here. |
| Versioned backups the agent cannot delete; restore rehearsed; code rollback is not a database restore; disclosure is not undone by restore | Covered | Slide 15. NCSC is cited as backup guidance. |
| Monthly one bounded UAT drill; four wedges; baseline, abort, receipt; UAT time is not production recovery time | Covered | Slide 16. The SVG labels Deleted records, Bad change, Revoked tool key, and Runaway agent. |
| Close: useful inbox agent, four safeguards, one workflow and one safeguard this week | Covered | Slides 17 and 18. |
| Q&A and implementation detail outside the 20 minutes | Covered | Questions slide, Appendix A, Appendix B. |
| Scope stays on agent-caused harm | Covered | No SSO, offboarding, procurement, or compliance tour. Generated-code vulnerabilities are declined in the slide 17 notes. |

No required section is absent. Presenter notes already carry the implementation detail, and it should stay there.
