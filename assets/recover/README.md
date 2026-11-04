# DataTalks.Club recovery evidence

- `datatalks-website.png`: current [DataTalks.Club homepage](https://datatalks.club/), captured 4 November 2026 with `agent-browser` in session `recover-website`, viewport 900 × 940, after dismissing the announcement banner. The left panel fills its space with this screenshot. It is an establishing image, not a capture of the February incident or the affected course platform.

- Original: [Alexey Grigorev, How I Dropped Our Production Database and Now Pay 10% More for AWS](https://aishippingblog.com/p/how-i-dropped-our-production-database), published 6 March 2026; incident 26 February 2026.
- `datatalks-aws-restoration.jpeg`: unchanged original 1202 × 596 screenshot of the AWS support restoration email, published under “4. 24 Hours Later.” Downloaded 4 November 2026 from the [original image asset](https://substack-post-media.s3.amazonaws.com/public/images/c876176d-91a9-4005-a2e7-41bf2033901f_1202x596.jpeg).
- The slide clips the display to the two paragraphs thanking the customer and confirming snapshot availability, starting 95 pixels below the original top. The original asset remains intact. No message text or interface content was reconstructed.
- This is evidence published by the operator, not an independently audited AWS recovery trace. He reports full recovery in about 24 hours. Do not imply AWS guarantees recovery after snapshot deletion.

## Archived GitLab recovery evidence

- Original: [GitLab, Postmortem of database outage of January 31](https://about.gitlab.com/blog/postmortem-of-database-outage-of-january-31/), published 10 February 2017.
- Captured 4 November 2026 with `agent-browser`, isolated session `recover-evidence`, viewport 1440 × 1100. Read the agent-browser skill and core workflow before capture.
- `gitlab-backup-failure.png`: unaltered rectangular crop of the rendered “Database backups using pg_dump” heading and first paragraph. Original viewport crop bounds: left 126, top 93, right 960, bottom 300 pixels. No text, colors or interface content were changed. Only navigation, advertising and unrelated paragraphs were excluded.
- Full viewport captures were temporary working files and are not retained. Reproduction: open the source, set viewport, scroll the `h3` whose text is `Database backups using pg_dump` to 100 pixels below the viewport top using instant scrolling, capture, then crop the stated rectangle.
- The image is a source screenshot, not a simulated terminal or a performed recovery drill. The slide identifies the event as human operational error, not an AI incident, and links to the complete postmortem.
