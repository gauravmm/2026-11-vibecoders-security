# Fonts are vendored under .fonts/, so a local build matches CI byte for byte.
FONTS  := --font-path .fonts
# Soft wrap, so no hard line width: a width nothing reaches, plus `--wrap-text=fill`
# to join prose that arrived hard-wrapped. Editors wrap; source lines do not.
TYPSTYLE := typstyle --line-width 100000 --wrap-text=fill
CSPELL := npx -y cspell@10.4.0 lint --no-progress --dot
ASSETS := $(shell find assets -type f)
SOURCES := slides.typ opening.typ

slides.pdf: $(SOURCES) $(ASSETS)
	typst compile $(FONTS) slides.typ

notes: slides-notes.pdf

slides-notes.pdf: $(SOURCES) $(ASSETS)
	typst compile $(FONTS) --input notes=true slides.typ slides-notes.pdf

watch:
	typst watch $(FONTS) slides.typ

fmt:
	$(TYPSTYLE) -i $(SOURCES) assets/abc-opening/figures/half-page.typ

check: slides.pdf slides-notes.pdf
	$(TYPSTYLE) --check $(SOURCES) assets/abc-opening/figures/half-page.typ
	$(CSPELL) .

install-hooks:
	git config core.hooksPath .githooks

.PHONY: notes watch fmt check install-hooks
