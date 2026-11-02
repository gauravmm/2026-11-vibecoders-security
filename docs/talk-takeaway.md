# Before you connect it

For a team of 1–5: pick **one important workflow**, not every tool at once.

> **What can it read? What can it do? How do I stop and recover?**

Workflow: ____________________  Founder responsible: ____________________

| Question | One change to consider | How to check it |
|---|---|---|
| What can it read? | Remove unused connections; limit access to the data the task needs. | Inspect actual permissions. Read-only still permits copying. |
| What can it do? | Let it draft; review the exact recipient/content before sending. Keep production credentials away from coding agents. | Confirm a consequential action cannot execute without the required permission or approval. |
| How do I stop and recover? | Find the app's disconnect/revoke controls and recovery route. | Revoke disposable test access and verify denial; restore a small piece of important data safely. |

Our next action: ____________________  By: ____________________

Evidence it worked: ___________________________________________________

**Basics first:** strong MFA and secure recovery for email, password manager, source control, and hosting. Use unique passwords. Agree which AI account the team uses and what data may go into it. A paid plan does not automatically supply appropriate business data terms.

**If you use a coding agent:** an isolated workspace must not expose host credentials, authenticated deployment tools, or production secrets. A separate folder alone is insufficient.

**If you build connected AI:** test application authorization directly before adversarial prompts. Use fake records, test identities, mock destructive actions, and controlled destinations. Confirm normal permitted behavior works, then confirm unauthorized behavior fails. Match relevant permissions to production; extra test-only restrictions must not be mistaken for production protection. Repeat and retain cases. Promptfoo, PyRIT, and garak are options to investigate, not required purchases: [testing references](research-ai.md#automated-red-team-practice).

**If you find misuse:** stop the affected workflow, revoke its access, preserve available action history, and establish which data or actions were affected. Record what was revoked and any remaining access or delay. Restoration cannot undo disclosure.

**Build → rehearse → serve:** dev → staging/UAT → production, with separate credentials. Refresh staging on a schedule (weekly is a starting example), through a production-side anonymization and validation step. Replace names, addresses and contact details; remove secrets and identifying free text. No raw production copy in staging. Use synthetic data when safe anonymization cannot be established.

**Spin the wheel monthly:** deleted test records, bad UAT deployment, revoked test key, or unavailable AI provider. Break only the isolated UAT copy; recover, time it, and record the result. Keep scheduled, protected, versioned backups; a staging refresh is not a backup. Fix a failed recovery check before shipping the affected change. [Wheel and practical recipe](recovery-drill.md).

Optional background: [annotated bibliography](annotated-bibliography.md). Start with the one action above; the broader research is not a mandatory checklist.
