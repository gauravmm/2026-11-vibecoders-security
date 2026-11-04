#import "theme.typ": *

#slide(title: [Recover · Stop it without persuading it.])[
  #align(center)[
    #big[Stop execution → disable tools]
    #v(0.35em)
    #big[→ revoke credentials]
    #v(1em)
    Confirm queued and in-flight actions have stopped.
    #v(1em)
    #accent[Then repair the damage.]
  ]
  #notes[
    *15:00--15:50 · 50 seconds · Say this core:* Return to the opening: stopping should not depend on persuading the agent in chat. Have a separate host or supervisor stop control. Disable its tools and revoke its credentials. A remote service may already have accepted queued work, so confirm queued and in-flight actions have stopped before repairing data. Know how to cancel or drain those jobs. Preserve the logs.

    *Reference / Q&A:* Hosted-tool users should find the supported account/connector disable and token-revocation paths before connecting sensitive capabilities. Controls differ by product; verify the path you actually have. Recovery from data loss and response to disclosure differ: restoring a backup cannot recall copied information.

    *Source/detail:* docs/talk-content.md and docs/recovery-drill.md; the independent stop is the design lesson drawn from the opening account, not a claim that every product offers the same control.
  ]
]

#slide(title: [Recover · A backup is a promise. A restore is the rehearsal.])[
  #big[How much work can you lose?]
  #v(0.7em)
  #big[How long can you be down?]
  #v(1em)
  #accent[Versioned backups, protected from the agent.]
  #v(0.6em)
  #small[Code rollback does not restore a database. A staging refresh is not a backup.]
  #v(0.35em)
  #small[Sources: #cite-source("https://www.ncsc.gov.uk/guidance/mitigating-malware-and-ransomware-attacks")[NCSC backup and restore guidance]]
  #notes[
    *15:50--16:40 · 50 seconds · Say this core:* Ask how much work you can lose and how long you can be down. Back up the data the agent can damage, keep recoverable versions and protect them from its delete authority. Practise restoring a working application. Code rollback does not restore a database; a staging refresh is not a backup. And restoring data cannot undo disclosure: copied mail cannot be recalled.

    *Reference / Q&A:* Choose backup frequency/retention to meet tolerated data loss and downtime. Keep restore keys and instructions available. Soft deletion helps; a replica may copy the same deletion. Test raw production-backup restoration only in a restricted recovery environment; sanitize/validate before any ordinary staging access. Check records, relationships, attachments, permissions and a working application flow.

    *Source:* #link("https://www.ncsc.gov.uk/guidance/mitigating-malware-and-ransomware-attacks")[NCSC backup and restore guidance]. The two questions express recovery-point/time requirements in founder language. *Cut:* terminology and backup technology comparisons.
  ]
]

#slide(title: [Recover · The AI wheel of misfortune.])[
  #grid(
    columns: (1.1fr, 1fr),
    column-gutter: 1em,
    align: horizon,
    image("assets/recovery-wheel.svg", width: 95%),
    [#big[Once a month. One bounded UAT drill.]
      #v(0.7em)
      Break it. Recover it. Keep the receipt.
      #v(0.75em)
      #small[Known baseline · stop condition · verification]],
  )
  #v(0.35em)
  #small[Sources: #cite-source("https://principlesofchaos.org/")[Principles of Chaos Engineering]]
  #notes[
    *16:40--18:00 · 80 seconds · Say this core:* Once a month, try one bounded drill in staging/UAT. Walk only the deleted-record wedge today: start with a working baseline and a known backup; delete seeded test records to simulate a mistake; confirm the deletion; stop writes and restore. Verify the records, their relationships and a working application flow. Measure recovery time and lost work. Keep the receipt and fix failed recovery before shipping the affected change. Set an abort condition and duration; use UAT-only credentials/data. No live destructive demo. A refresh must not mask the failure.

    *Reference / Q&A --- other wedges:* Bad change → roll back, verify app/data compatibility; revoked key → old key denied, replacement works, retries bounded; runaway → external cap stops execution and alerts. The delete scenario rehearses an allowed mistake in a test environment; it does not grant our inbox agent permanent-delete authority. Keep scenario, build, owner, failure, recovery time/data loss, verification and one follow-up. An invalid injection is not a pass. Abort if production connectivity appears. Automate only understood, bounded drills.

    *Reference / author:* Red-teaming and the wheel both challenge a safety claim, observe the outcome and keep it repeatable. One probes hostile inputs; the other rehearses failures/recovery. UAT success does not establish production recovery time/scale. docs/recovery-drill.md has an additional provider-outage scenario; this slide chooses runaway use to connect to agent caps. *Sources:* that drill recipe; #link("https://principlesofchaos.org/")[Principles of Chaos Engineering] (our exercise deliberately confines novices to UAT).
  ]
]

