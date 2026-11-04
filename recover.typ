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
    Revocation may not cancel work already accepted by a remote service. Check queues and in-flight jobs before restoring; preserve logs.
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
    A replica can copy a deletion. Keep backup credentials outside the agent's reach. Restore raw production backups in a restricted recovery environment. Restoring data cannot recall disclosed information.
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
    A staging refresh can mask a failed restore: serialize refreshes and drills. Verify relationships and application behavior, not just record counts. Staging success does not establish production recovery time or scale.
  ]
]

