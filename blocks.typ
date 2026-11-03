// Grey and outlined blocks from the AI for Leaders instructor deck.
#let gblock-center = center
#let gblock(body, inset: (x: 0em, y: 0.4em), outset: (x: 0.4em, y: 0.4em), width: 100%, center: false) = block(
  fill: luma(235),
  inset: inset,
  outset: outset,
  radius: 0.4em,
  width: width,
)[
  #{
    if center {
      set align(gblock-center)
      body
    } else {
      body
    }
  }
]

#let lblock-center = center
#let lblock(
  body,
  inset: (x: 0em, y: 0.4em),
  outset: (x: 0.4em, y: 0.4em),
  width: 100%,
  height: auto,
  fill: white,
  center: false,
) = block(
  fill: fill,
  stroke: 0.5pt + luma(220),
  inset: inset,
  outset: outset,
  radius: 0.4em,
  width: width,
  height: height,
)[
  #{
    if center {
      set align(lblock-center)
      body
    } else {
      body
    }
  }
]
