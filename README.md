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
make check          # dash check + build + formatting check + spelling check
make check-dashes   # reject Unicode dash characters in Typst source
make install-hooks  # activate the tracked pre-commit hook
```

`make check` needs [ripgrep](https://github.com/BurntSushi/ripgrep),
[typstyle](https://github.com/typstyle-rs/typstyle) 0.15.2 on `PATH` and `npx`
for [cspell](https://cspell.org). CI runs the same target as the pre-commit
hook. The Makefile discovers all root-level `.typ` files, so new section files
automatically participate in rebuilds and formatting checks.

Typst source uses ASCII `-` only for dashes: write `-`, `--` (en dash), or
`---` (em dash). The check covers `.typ` files, including comments and notes.
For a specific non-ASCII symbol, import it from a package or use a named
Typst symbol such as `#sym.dash.em` instead of writing the literal character.

## Layout

- `slides.typ` — entry point: applies the shared theme once, then includes the sections in presentation order.
- `theme.typ` — deck-wide metadata, colors, typography, presenter-note layout and reusable styles.
- `constrain.typ`, `pace.typ`, `observe.typ`, `recover.typ` — one editable content file per principle.
- `closing.typ` — closing slides, Q&A, appendices and collected references.
- `citations.typ` — linked superscript citations, deduplicated by URL/key, with automatic reference slides.
- `blocks.typ` — grey and outlined blocks; both accept `center: true`.
- `principles.typ` — numbered principle rows with optional examples.
- `opening.typ` — opening content adapted from the April reference, including the introduction and presenter notes.
- `assets/abc-opening/` — original helper and unmodified images for that opening.
- `assets/about/` — portrait and contact icons for the personal introduction imported from `ai-for-clm`.
- `assets/governance/` — IMDA, NIST and OWASP covers for build 3 of “When Designing Infrastructure”, adapted from the AI for Leaders instructor deck.
- `assets/` — images and generated plots.
- `.fonts/` — vendored Roboto fonts for reproducible builds.
- `.githooks/pre-commit` — the tracked local quality gate.
- `.github/workflows/` — checks on pushes and pull requests, plus tagged PDF
  releases.

Edit content in its section file; keep shared presentation settings in `theme.typ`.
Each section imports the shared helpers without applying the theme again.
`slides.typ` applies the theme before including any content. The opening uses
the same talk metadata, colors, fonts and logo settings as the rest of the deck;
intentional slide-specific layouts (such as edge-to-edge images) remain local.
The section files preserve speaker notes; splitting content does not rewrite them.

## Presenting

The personal introduction follows the title slide, adapted from the “About Me” slide in `ai-for-clm/01-intro/slides.typ` with the original portrait, credentials and contact links.

The main deck has 20 spoken slides for a 20-minute talk, followed by a separate five-minute Q&A slide and two optional appendix slides. The opening was adapted from the April ABC Infrastructure deck, through “When Designing Infrastructure”, retaining its QR target, incident imagery, layouts and pause builds. It now uses the unified presentation theme and current talk metadata. The shared title layout lives in `theme.typ`; the original helper remains archived under `assets/abc-opening/`. The opening is budgeted at 3:10, followed by a 50-second transition; Constrain still begins at 4:00.

Speaker notes contain timing, source links, evidence limits, cut material and author comments. Historical incident claims and the original “OWASP's STRIDE” wording remain verbatim on audience slides; notes contextualize them. `make notes` renders native Touying notes beside each slide; the audience PDF also carries presenter metadata. The notes PDF is for presenter/review use.

The red-team trace is explicitly illustrative, not a performed experiment. Rehearse the timing before presenting. All incident screenshots in the opening are unchanged copies from the supplied April ABC Infrastructure deck; their sources and limits are attributed in the relevant speaker notes. The recovery wheel is an authored SVG. The current content plan is `docs/talk-content.md`; detailed references and the recovery recipe live under `docs/`.

The earlier Grok review under `docs/` predates the exact-copy opening and does not review the added historical claims or their new presenter notes.

Citations and the numbered principles design come from the AI for Leaders instructor deck in
`ai-for-clm`; its rendered slides are distributed in
[AI for Leaders](https://github.com/OcelliQ/ai-for-leaders). The citation helper is adapted
to this deck's existing Touying/Metropolyst versions. Write the full reference in
`#cite-source("URL")[Author. _Title_. Date.]` at the claim; repeated URLs reuse their
number. `#reference-slides()` collects references after the appendix. Register any
notes-only source outside `#notes` with `display: false` so it also appears in the
audience PDF. Presenter notes retain the evidence limits and source context.
