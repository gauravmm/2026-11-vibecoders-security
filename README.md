# Ship Fast Without Shipping Holes

*AI security for startups that have better things to be famous for.*

Slides for a talk on security in AI-assisted software development. The visual
system is based on the
[ABC Infrastructure](https://github.com/OcelliQ/2026-04-ABC-Infrastructure)
deck: burgundy accents, dark plum headers, white content slides, and a split
title page with a patterned side panel. The build tooling comes from
[On Speculative Decoding](https://github.com/gauravmm/2026-07-On-Speculative-Decoding).

## Building

[Typst](https://typst.app) 0.15.1, with Roboto vendored under `.fonts/`:

```sh
make                # build slides.pdf (gitignored)
make notes          # slides-notes.pdf: slide left, native Touying notes right
make watch          # live preview
make fmt            # format the deck and copied opening helper
make check          # build + formatting check + spelling check
make install-hooks  # activate the tracked pre-commit hook
```

`make check` needs
[typstyle](https://github.com/typstyle-rs/typstyle) 0.15.2 on `PATH` and `npx`
for [cspell](https://cspell.org). CI runs the same target as the pre-commit
hook.

## Layout

- `slides.typ` — the current deck and its reusable styles.
- `opening.typ` — the exact audience opening from the April reference, with new presenter notes.
- `assets/abc-opening/` — original helper and unmodified images for that opening.
- `assets/` — images and generated plots.
- `.fonts/` — vendored Roboto fonts for reproducible builds.
- `.githooks/pre-commit` — the tracked local quality gate.
- `.github/workflows/` — checks on pushes and pull requests, plus tagged PDF
  releases.

## Presenting

The main deck has 20 spoken slides for a 20-minute talk, followed by a separate five-minute Q&A slide and two optional appendix slides. The six-slide opening was copied exactly from the April ABC Infrastructure deck, through “When Designing Infrastructure”, including the original title, April event/date, institution, QR target, images, layouts and pause builds, by request. Its original left footer is empty; the later slides retain the current design. Slide totals in the original footer reflect this deck's length. At the time of copying, all ten opening build pages matched the reference pixel for pixel outside the slide-total digits. The title and subtitle have since been updated for this talk. The opening is budgeted at 3:10, followed by a 50-second transition; Constrain still begins at 4:00.

Speaker notes contain timing, source links, evidence limits, cut material and author comments. Historical incident claims and the original “OWASP's STRIDE” wording remain verbatim on audience slides; notes contextualize them. `make notes` renders native Touying notes beside each slide; the audience PDF also carries presenter metadata. The notes PDF is for presenter/review use.

The red-team trace is explicitly illustrative, not a performed experiment. Rehearse the timing before presenting. All incident screenshots in the opening are unchanged copies from the supplied April ABC Infrastructure deck; their sources and limits are attributed in the relevant speaker notes. The recovery wheel is an authored SVG. The current content plan is `docs/talk-content.md`; detailed references and the recovery recipe live under `docs/`.

The earlier Grok review under `docs/` predates the exact-copy opening and does not review the added historical claims or their new presenter notes.
