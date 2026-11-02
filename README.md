# Vibecoders Security

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
make fmt            # format slides.typ
make check          # build + formatting check + spelling check
make install-hooks  # activate the tracked pre-commit hook
```

`make check` needs
[typstyle](https://github.com/typstyle-rs/typstyle) 0.15.2 on `PATH` and `npx`
for [cspell](https://cspell.org). CI runs the same target as the pre-commit
hook.

## Layout

- `slides.typ` — the deck and its reusable styles.
- `assets/` — images and generated plots.
- `.fonts/` — vendored Roboto fonts for reproducible builds.
- `.githooks/pre-commit` — the tracked local quality gate.
- `.github/workflows/` — checks on pushes and pull requests, plus tagged PDF
  releases.

## Presenting

The main deck has 18 spoken slides for a 20-minute talk, followed by a separate five-minute Q&A slide and two optional appendix slides. Speaker notes contain the timing budget, source links, evidence limits, cut/optional material and author comments. `make notes` renders these native Touying notes beside each slide; the audience PDF also carries Touying presenter metadata. The notes PDF is a presenter/review artifact and should not be projected as the audience deck.

The red-team trace is explicitly illustrative, not a performed experiment. Rehearse the timing before presenting. The email and database incident screenshots were copied from the supplied April ABC Infrastructure deck; their sources and limits are attributed in the relevant speaker notes. The recovery wheel is an authored SVG. The current content plan is `docs/talk-content.md`; detailed references and the recovery recipe live under `docs/`.
