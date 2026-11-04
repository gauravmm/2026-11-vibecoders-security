// Numbered principles from the AI for Leaders instructor deck.
#let principle(num, title, body, example: none) = grid(
  columns: (auto, 1fr),
  column-gutter: 0.5em,
  row-gutter: 0.1em,
  align: (right + top, left + top),
  text(weight: "bold", size: 2em, fill: luma(140))[#num.],
  [
    *#title* \
    #body
    #if example != none [
      \
      #text(size: 0.85em, fill: luma(100))[_e.g._ #example]
    ]
  ],
)
