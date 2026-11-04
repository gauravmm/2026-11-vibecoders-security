#import "theme.typ": opening-theme, theme

// Apply the deck-wide configuration once, before any slide content.
#show: theme

#opening-theme[
  #include "opening.typ"
]
#include "constrain.typ"
#include "pace.typ"
#include "observe.typ"
#include "recover.typ"
#include "closing.typ"
