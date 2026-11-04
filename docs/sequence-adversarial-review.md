# Full-sequence adversarial review

Reviewed 4 November 2026 by the delegated Astra reviewer, after all three section authors completed their work. This report supersedes older reviews **for the current slide sequence only**. Scope: `slides.typ`, shared theme, opening, all four principles, closing, section research, development process and recovery drill. Audience-visible claims take precedence over qualifications confined to presenter notes. No slide sources were edited by this reviewer.

The sequence is coherent and the new sections substantially meet the requested process. No critical technical error was found in Pace, Observe or Recover. Remaining must-fix items concern evidence presentation in the inherited opening/Constrain and the misleading QR label. Recommendations below are distinguished from factual errors; a rehearsal is still needed to establish the twenty-minute delivery target.

## Must fix before delivery

### M1 — Constrain's evidence types are invisible to the audience

**Location:** `constrain.typ`, first slide, “Mistake: deletes the inbox” / “Injection: publishes private data.”

**Type:** Important evidence-classification omission, not a claim that the demonstrated attack is fictitious.

The notes correctly distinguish a user report from a controlled demonstration, but the audience sees matching incident-style headings with no equivalent qualification. The displayed Invariant screenshot is the disclosure's introductory page and does not itself identify the selected attack as a demonstration. Its [primary account](https://invariantlabs.ai/blog/mcp-github-vulnerability) explicitly describes demo repositories and an experimental attack setup. Treating the two panels alike invites an inference of two observed customer compromises.

**Smallest fix:** Add visible labels beside/below the headings: “User-reported incident” and “Research demonstration.” Preserve the screenshots and layout. Prefer the original Summer Yue account as the incident link, retaining secondary reporting as corroboration if useful.

### M2 — The local opening example lacks its mechanism label

**Location:** `opening.typ`, “A local example: Bee Cheng Hiang.”

**Type:** Important scope omission; the supplied report is not being disputed.

The notes explain that this involved AI-assisted code, not an autonomous agent. The audience only sees exposed email addresses and failure to inspect a test email, between agent incidents. That placement can imply autonomous-agent behavior. The slide's own [CNA citation](https://www.channelnewsasia.com/singapore/bee-cheng-hiang-data-breach-ai-pdpc-emails-6421711) identifies the AI-written marketing script.

**Smallest fix:** Add “AI-assisted marketing script” visibly. This preserves the local example and makes its connection to outcome verification clear without retelling it.

### M3 — The QR label promises the current material but links to the April talk

**Location:** `opening.typ`, title slide.

**Type:** Concrete destination/label mismatch, already acknowledged in notes.

“Slides and Code” beside the current talk title reasonably promises this presentation. Both the QR payload and link target the April infrastructure lecture.

**Smallest fix:** Retain the historical URL and relabel it “Original talk and code.” Do not invent a current publication URL. Remove or update the obsolete presenter reminder after the label is accurate.

## Recommended refinements

| ID | Location | Impact and smallest useful change |
|---|---|---|
| R1 | `opening.typ`, Summer Yue headline | “Lost her emails” is ambiguous, **not an explicit assertion of permanent loss**. “Reported her agent deleting emails” plus a visible user-report label is more precise. Keep the existing caveat against asserting permanent loss or an established compaction cause. |
| R2 | `recover.typ`, implementation titles | The first principle correctly requires checking queued/in-flight work; it does not claim revocation cancels everything. However, reconciliation before resumption remains only in notes. Refine a title to “Quarantine jobs; reconcile effects before resuming.” Retain credential revocation in the principle/notes. This makes already-completed external effects visible, without adding a new slide. |
| R3 | Opening → Constrain → Pace | Summer Yue and Replit recur. Their different mechanisms justify callbacks, but repeating the narratives would consume the twenty-minute budget. Use the later headings as callbacks. The opening currently contains more incident material than `docs/talk-content.md`'s “two beats” description; align that description with the retained opening or explicitly select the supporting beats during rehearsal. This is a delivery risk, not a measured overrun. |
| R4 | Constrain pattern 6 → closing inbox example | “Agents that read hostile content get no consequential tools” is a conservative design choice. Explain once in a terse note that a reader can draft for a separate narrow executor, which enforces Pace's exact-action approval. This connects usefulness to separation of authority without suggesting the same compromised reader gains authority after a prompt. |
| R5 | Opening four-principle overview | “Recover: Test your backups” understates the final section's independent stop and response. “Stop harm; rehearse recovery” would align the overview with the section and closing. Editorial consistency only. |

## Findings that do not require fixes

- **Evidence and provenance:** Pace visibly distinguishes a user report and provider postmortem. [Anthropic's April postmortem](https://www.anthropic.com/research/april-23-postmortem) supports disproportionate latency/token use, not a verified spending attack; the deck respects that limit. Observe labels training and evaluation evidence. The selected [Anthropic Haiku paragraph](https://www.anthropic.com/research/investigating-unintended-model-actions#submitting-a-form-it-should-not-have) is the case expecting another confirmation page; it is not the separate police-tip/spam-filter example. No conflation appears in the final slides or research.
- **Protected verification:** The [OpenAI paper's Figure 1 and §2.2](https://arxiv.org/html/2503.11926v1#S1) support the editable-verifier mechanism. Its positive findings about reasoning monitoring are not denied by the slide. Observe explicitly includes allowed positive controls, direct backend policy tests, integrated hostile-input tests, protected graders and regression replay. No missing-positive-control finding remains.
- **Recovery:** [GitLab's postmortem](https://about.gitlab.com/blog/postmortem-of-database-outage-of-january-31/) supports the stated database-loss scope; the audience sees that this is a non-AI operational precedent. Restoration is not presented as recalling disclosure. The drill uses an isolated, bounded target, a working baseline, verified failure injection and a receipt; UAT success is not equated with production recovery time. The previously stale research paragraph about mismatched wheel wedges was corrected before final review.
- **Guidance and boundaries:** The local official IMDA v1.5 PDF supports meaningful approvals and protected monitoring. [OWASP's agent security guidance](https://cheatsheetseries.owasp.org/cheatsheets/AI_Agent_Security_Cheat_Sheet.html) supports independent authorization and action integrity; [NIST SP 800-61r3](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-61r3.pdf) supports verified recovery. Constrain addresses authority, Pace timing/quantity, Observe evidence/testing, and Recover response/restoration. The proposed implementations are not represented as measured mitigation outcomes or certification.
- **Tiny-team feasibility:** Selecting one workflow and one missing safeguard limits scope. Monthly UAT practice is visibly proposed, not a universal requirement. Implementation detail appropriately lives in research documents. No security department or new mandatory platform is implied.
- **Presentation discipline:** Shared theme and three-slide section structure are consistent. Notes retain technical caveats rather than timings or scripts. The visible five-minute Q&A is separate from the talk budget. No additional screenshot reconstruction or new demonstration is needed.

## Parent dispositions

The coordinating agent recorded the following changes and accepted tradeoffs after the independent review. Preserve the findings above rather than rewriting them as though the issues never existed.

| Finding | Disposition | Evidence / reason |
|---|---|---|
| M1 | Implemented | Visible user-report and research-demonstration labels added to the Constrain panels; original screenshots and their links retained. |
| M2 | Implemented | Bee Cheng Hiang audience text now explicitly labels the AI-assisted marketing script and distinguishes it from an autonomous agent. |
| M3 | Implemented | QR now says Original talk and code; historical URL retained, obsolete note removed. |
| R1 | Implemented | Opening headline now attributes the report to Summer Yue; a visible user-report label is included. No permanent-loss assertion. |
| R2 | Implemented | Recover implementation title now says Quarantine jobs; reconcile effects before resuming. Revocation remains in the principles slide. |
| R3 | Accepted delivery tradeoff | Content plan describes the retained opening and marks repeated OpenClaw/Replit images as brief callbacks. No extra slide added; twenty-minute delivery remains a rehearsal target. |
| R4 | Implemented | One terse Constrain note explains the untrusted reader / narrow executor split and warns against promoting unrestricted output into instructions. |
| R5 | Implemented | Opening Recover overview now reads Stop harm; rehearse recovery. |

## Independent follow-up verification

On 4 November 2026, the Astra reviewer reread the revised slide sources and parent dispositions. M1–M3 are resolved: Constrain now displays both evidence labels, Bee Cheng Hiang explicitly identifies AI-assisted code, and the historical QR is accurately labeled. R1, R2, R4 and R5 are implemented as recorded; credential revocation remains alongside the newly visible reconciliation instruction. R3 is a documented delivery tradeoff, with rehearsal still required rather than a claimed timing result. Observe's shorter “Describes a demo. Submits.” heading preserves the meaning of the selected Haiku passage and its evaluation label; canonical reference keys preserve the cited works. No outstanding must-fix finding remains from this review. This follow-up changed only this report.
