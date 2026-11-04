#import "blocks.typ": gblock, lblock
#import "citations.typ": cite-source, reference-slides
#import "principles.typ": principle
#import "assets/abc-opening/figures/half-page.typ": half-page, title-page
#import "@preview/tiaoma:0.3.0"
#import "@preview/touying:0.6.1": config-common, config-methods, config-page, config-store, only, pause, speaker-note, touying-set-config, utils
#import "@preview/metropolyst:0.1.0": config-info, metropolyst-theme, slide

// Palette and split-page layout from OcelliQ/2026-04-ABC-Infrastructure. Keep colors in
// a dictionary so their names do not shadow Typst builtins.
#let C = (
  paper: white,
  ink: rgb("#333333"),
  accent: rgb("#78334e"),
  header: rgb("#542437"),
  soft: rgb("#e8d0d8"),
  panel: rgb("#baa7af"),
  rule: rgb("#d8c6ce"),
  red: rgb("#b33a3a"),
  green: rgb("#287a44"),
  grey: rgb("#555555"),
  stripe: rgb("#f8f2f5"),
)

#let accent(body) = text(fill: C.accent, body)
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
    fill: (_, y) => if y < head { C.accent } else if calc.odd(y - head + 1) { C.stripe },
    ..cells,
  )
}

#let logo-src = read("assets/icon-logo.svg")
#let logo(fill: white, height: 1.4em) = image(
  bytes(logo-src.replace("#fff", fill.to-hex())),
  height: height,
)

#let theme(body) = {
  show strong: it => text(weight: 700, it.body)
  show: metropolyst-theme.with(
    font: ("Roboto",),
    accent-color: C.accent,
    header-background-color: C.header,
    focus-background-color: C.header,
    focus-text-color: white,
    main-background-color: C.paper,
    main-text-color: C.ink,
    progress-bar-background: C.accent,
    config-common(show-notes-on-second-screen: if sys.inputs.at("notes", default: "false") == "true" { right } else {
      none
    }),
    config-methods(show-notes: (self: none, width: 0pt, height: 0pt) => block(
      fill: C.stripe,
      width: width,
      height: height,
      inset: (x: 32pt, y: 24pt),
      {
        set align(left + top)
        text(size: 12pt, weight: 700, fill: C.accent)[PRESENTER NOTES]
        v(12pt)
        utils.current-slide-note
        utils.slide-note-state.update(none)
      },
    )),
    config-info(
      title: [Ship Fast Without\ Shipping Holes],
      subtitle: [Minimal security for AI startups.],
      author: [Dr. Gaurav Manek],
      date: "2026-11",
      institution: [gauravmanek.com],
      logo: logo(),
    ),
  )
  body
}

// Native Touying notes: PDF presenter metadata in the audience deck; rendered
// beside each slide only with `typst compile --input notes=true`.
#let notes(body) = speaker-note(
  setting: body => {
    set text(size: 16pt, fill: C.ink)
    set par(leading: 0.45em, spacing: 0.7em)
    body
  },
  body,
)
#let big(body, size: 1.65em) = text(size: size, weight: 700, body)
#let small(body) = text(size: 0.66em, fill: C.grey, body)
#let tag(body) = text(size: 0.65em, fill: C.accent, weight: 700, body)
#let card(title, body) = block(fill: C.stripe, radius: 6pt, inset: 12pt, width: 100%)[
  #text(weight: 700, fill: C.accent)[#title]
  #v(0.45em)
  #body
]

// Preserve the reference opening's historical event metadata and logo sizing.
// Title, subtitle and author inherit the single deck configuration above.
#let opening-theme(body) = touying-set-config(
  utils.merge-dicts(
    config-store(footer: none),
    config-info(
      date: "2026-04-18",
      institution: [Ocellivision, A*STAR],
      logo: image("assets/abc-opening/assets/icon-logo.svg", height: 1.5em),
    ),
  ),
  body,
)
