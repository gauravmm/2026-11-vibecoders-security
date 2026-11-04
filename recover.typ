#import "theme.typ": *
// cspell:words datatalks

== 4. Recover: Stop Harm and Restore Service

#slide(
  composer: (1fr, 1fr),
  config: config-page(margin: (left: 0pt, bottom: 0pt)),
)[
  #layout(size => link("https://datatalks.club/", image(
    "assets/recover/datatalks-website.png",
    width: size.width,
    height: size.height,
    fit: "cover",
    alt: "DataTalks.Club website: The place to talk about data.",
  )))
][
  #v(1fr)
  #big(size: 1.35em)[DataTalks.Club: recovery took 24 hours.]
  #v(0.4em)
  #small[
    26 February 2026 · Operator postmortem.#cite-source("https://aishippingblog.com/p/how-i-dropped-our-production-database")[Alexey Grigorev. _How I Dropped Our Production Database and Now Pay 10% More for AWS_. 6 March 2026. Recovery timeline and daily restore tests.]
  ]
  #v(0.65em)
  #link("https://aishippingblog.com/p/how-i-dropped-our-production-database")[
    // Display the two recovery paragraphs; preserve the original published image.
    #layout(size => block(
      width: size.width,
      height: size.width * 200 / 1202,
      clip: true,
      place(top + left, dy: -size.width * 95 / 1202, image(
        "assets/recover/datatalks-aws-restoration.jpeg",
        width: size.width,
        height: size.width * 596 / 1202,
        alt: "AWS support thanks the operator for waiting and confirms the restored snapshot is available.",
      )),
    ))
  ]
  #v(0.55em)
  Claude Code destroyed production infrastructure and automated snapshots.\
  AWS support recovered a snapshot; the operator restored the service.
  #v(0.4em)
  #small[Afterward: separate backups and daily automated restore tests.]
  #v(1fr)
  #notes[
    Website captured 4 November 2026, not the incident state. Operator account, not an independent execution trace. AWS recovered a snapshot unavailable in his console; provider assistance is not a guaranteed recovery path. His daily drill checked a read query, not a complete user flow. Shared infrastructure and permission choices were central to the incident.
  ]
]

#slide()[
  #principle(
    1,
    [Stop execution without the model's cooperation.],
    [Have mechanisms to disable tools & credentials, pause in-flight work.],
  )
  #v(0.55em)
  #principle(
    2,
    [Protect the recovery path from the agent.],
    [Keep versioned backups and restore credentials outside its authority.],
  )
  #v(0.55em)
  #principle(
    3,
    [Rehearse restoration before you need it.],
    [Verify the data and a working user flow; measure time and lost work.],
  )
  #v(0.55em)
  #principle(
    4,
    [Restoration cannot recall disclosed information.],
    [Rotate leaked credentials, inform affected users promptly.],
  )
  #v(0.55em)
  #small[
    OWASP: emergency off-switches#cite-source("https://genai.owasp.org/download/49059/?tmstv=1753666640")[OWASP GenAI Security Project. _Securing Agentic Applications Guide_. Version 1.0, 28 July 2025, §4.1.4, printed p. 50.] · NCSC: protected, tested backups#cite-source("https://www.ncsc.gov.uk/guidance/mitigating-malware-and-ransomware-attacks")[UK National Cyber Security Centre. _Mitigating malware and ransomware attacks_. Action 1: make regular backups; accessed 4 November 2026.] · NIST: verified recovery#cite-source("https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-61r3.pdf")[NIST. _SP 800-61r3: Incident Response Recommendations and Considerations for Cybersecurity Risk Management_. April 2025. RC.RP-03--06, printed pp. 34--35.]
  ]
  #notes[
    Revocation need not cancel work a provider already accepted. Quarantine pending jobs and reconcile completed side effects before replay. Preserve evidence; close the failure path before reconnecting the restored service.
  ]
]

#slide()[
  #set text(size: 0.85em)
  #grid(
    columns: (1.65fr, 1fr),
    column-gutter: 0.9em,
    align: horizon,
    [
      #enum(
        spacing: 0.65em,
        [Independent emergency stop.],
        [Quarantine jobs; reconcile effects before resuming.],
        [Protected, versioned backups.],
        [Separate code and data recovery plans.],
        [Verified restore before reconnecting.],
        [Monthly UAT drill and recovery receipt.],
      )
    ],
    [
      #align(center)[
        #text(weight: 700, fill: C.accent)[The AI wheel of misfortune]
        #v(0.3em)
        #image("assets/recovery-wheel.svg", width: 70%)
        #v(0.3em)
        #small[Proposed practice: one bounded UAT drill.]
      ]
    ],
  )
  #v(0.7em)
  #small[
    Known baseline → inject failure → recover → verify → keep the receipt.
    #v(0.25em)
    UAT is isolated from production; success does not prove production recovery time.#cite-source("https://principlesofchaos.org/")[Principles of Chaos Engineering. _Principles of Chaos Engineering_. Controlled experiments and minimizing blast radius; accessed 4 November 2026. The UAT wheel and monthly cadence are this talk's proposed practice.]
  ]
  #notes[
    A refresh can mask a failed restore: serialize refreshes and drills. Raw production backups stay in a restricted recovery environment. Invalid failure injection is not a passed drill; code rollback may leave schema or data changes behind.
  ]
]
