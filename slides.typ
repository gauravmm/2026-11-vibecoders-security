#import "@preview/metropolyst:0.1.0": config-info, metropolyst-theme, slide as _slide, title-slide

// Palette carried over from the On Speculative Decoding deck. Keep colors in
// a dictionary so their names do not shadow Typst builtins.
#let C = (
  paper: rgb("#fcfcfa"),
  ink: rgb("#333333"),
  blue: rgb("#1c58a1"),
  soft: rgb("#ddeeff"),
  muted: rgb("#acc1da"),
  rule: rgb("#d8dde5"),
  red: rgb("#b33a3a"),
  green: rgb("#287a44"),
  grey: rgb("#667085"),
  stripe: rgb("#f3f6fa"),
)

#let accent(body) = text(fill: C.blue, body)
#let callout(body) = block(
  fill: C.soft,
  width: 100%,
  outset: (x: 8pt, y: 0pt),
  inset: (x: 0pt, y: 16pt),
  radius: 8pt,
)[#body]

#let dtable(columns: auto, align: auto, size: 0.8em, inset: (x: 5pt, y: 9pt), head: 1, ..cells) = {
  set text(size: size)
  show table.cell: it => {
    set text(fill: white, weight: 700) if it.y < head
    it
  }
  table(
    columns: columns,
    align: align,
    stroke: 0.5pt + C.rule,
    inset: inset,
    fill: (_, y) => if y < head { C.blue } else if calc.odd(y - head + 1) { C.stripe },
    ..cells,
  )
}

#let logo-src = read("assets/icon-logo.svg")
#let logo(fill: white, height: 1.4em) = image(
  bytes(logo-src.replace("#fff", fill.to-hex())),
  height: height,
)

#show strong: it => text(weight: 700, it.body)

#let body-scale = 1.1
#let body-size = 20pt * body-scale
#let slide = _slide.with(setting: body => {
  set text(size: body-size)
  body
})

#show: metropolyst-theme.with(
  font: ("Roboto",),
  accent-color: C.blue,
  header-background-color: C.blue,
  focus-background-color: rgb("#dbdce5"),
  focus-text-color: C.blue,
  focus-size: 1.4em * body-scale,
  section-size: 1.4em * body-scale,
  main-background-color: C.paper,
  main-text-color: C.ink,
  progress-bar-background: C.muted,
  footer: [Vibecoders Security],
  config-info(
    title: [Vibecoders Security],
    subtitle: [Security for AI-assisted software],
    author: [Dr. Gaurav Manek],
    date: "2026-11",
    institution: [gauravmanek.com],
    logo: logo(),
  ),
)

#title-slide(logo: logo(fill: C.blue, height: 3.2em))

// Replace this starter slide with the talk content.
== Start here

#slide[
  - State the threat model.
  - Show the evidence.
  - Leave the audience with concrete mitigations.
]
