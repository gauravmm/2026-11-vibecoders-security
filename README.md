# Vibecoders Security

Slides for a talk on security in AI-assisted software development. The visual
system and build tooling are based on the
[On Speculative Decoding](https://github.com/gauravmm/2026-07-On-Speculative-Decoding)
deck.

## Building

[Typst](https://typst.app) 0.15.1, with Roboto vendored under `.fonts/`:

```sh
make                # build slides.pdf (gitignored)
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
