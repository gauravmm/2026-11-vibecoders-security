# GitLab recovery evidence

- Original: [GitLab, Postmortem of database outage of January 31](https://about.gitlab.com/blog/postmortem-of-database-outage-of-january-31/), published 10 February 2017.
- Captured 4 November 2026 with `agent-browser`, isolated session `recover-evidence`, viewport 1440 × 1100. Read the agent-browser skill and core workflow before capture.
- `gitlab-backup-failure.png`: unaltered rectangular crop of the rendered “Database backups using pg_dump” heading and first paragraph. Original viewport crop bounds: left 126, top 93, right 960, bottom 300 pixels. No text, colors or interface content were changed. Only navigation, advertising and unrelated paragraphs were excluded.
- Full viewport captures were temporary working files and are not retained. Reproduction: open the source, set viewport, scroll the `h3` whose text is `Database backups using pg_dump` to 100 pixels below the viewport top using instant scrolling, capture, then crop the stated rectangle.
- The image is a source screenshot, not a simulated terminal or a performed recovery drill. The slide identifies the event as human operational error, not an AI incident, and links to the complete postmortem.
