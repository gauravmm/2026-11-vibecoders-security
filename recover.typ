#import "theme.typ": *

== 4. Recover: Stop Harm and Restore Service

#slide()[
  #big(size: 1.35em)[GitLab: the backup was missing.]
  #v(0.4em)
  #small[
    GitLab.com, 31 January 2017 · Human operational error; not an AI incident.#cite-source("https://about.gitlab.com/blog/postmortem-of-database-outage-of-january-31/")[GitLab. _Postmortem of database outage of January 31_. 10 February 2017. Sections: Database backups using pg_dump; Root cause analysis.]
  ]
  #v(0.65em)
  #link("https://about.gitlab.com/blog/postmortem-of-database-outage-of-january-31/")[
    #image("assets/recover/gitlab-backup-failure.png", width: 100%, height: 4.3cm, fit: "contain")
  ]
  #v(0.55em)
  An engineer deleted the primary database directory.\
  Recovery took about 18 hours; some database changes were lost.
  #v(0.4em)
  #small[Git repositories and wikis were not lost. Screenshot: GitLab's own postmortem.]
  #notes[
    This is a recovery precedent, not evidence of agent failure rates. GitLab recovered using an older staging copy; that fortunate fallback does not make staging a backup strategy.
  ]
]

#slide()[
  #principle(
    1,
    [Stop execution without the model's cooperation.],
    [Disable tools, revoke credentials, and confirm queued and in-flight work has stopped.],
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
  #small[
    OWASP: emergency off-switches#cite-source("https://genai.owasp.org/download/49059/?tmstv=1753666640")[OWASP GenAI Security Project. _Securing Agentic Applications Guide_. Version 1.0, 28 July 2025, §4.1.4, printed p. 50.] · NCSC: protected, tested backups#cite-source("https://www.ncsc.gov.uk/guidance/mitigating-malware-and-ransomware-attacks")[UK National Cyber Security Centre. _Mitigating malware and ransomware attacks_. Action 1: make regular backups; accessed 4 November 2026.] · NIST: verified recovery#cite-source("https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-61r3.pdf")[NIST. _SP 800-61r3: Incident Response Recommendations and Considerations for Cybersecurity Risk Management_. April 2025. RC.RP-03--06, printed pp. 34--35.]
    #v(0.35em)
    #accent[Restoration cannot recall disclosed information.]
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
