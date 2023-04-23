


PATH_TO_DIA_FILES := ./

SVG_FILES := $(patsubst %.dia,%.svg,$(addprefix svg/,$(wildcard *.dia)))
PDF_FILES := $(patsubst %.dia,%.pdf,$(addprefix pdf/,$(wildcard *.dia)))

INKSCAPE_VERSION=$(shell inkscape --version)


ifeq ($(findstring Inkscape 1,$(INKSCAPE_VERSION)),Inkscape 1)
  INKSCAPE_EXPORT_ARG=-o 
else
  INKSCAPE_EXPORT_ARG=--export-pdf=
endif


all: svg pdf $(PDF_FILES) $(SVG_FILES)

svg:
	mkdir -p svg

pdf:
	mkdir -p pdf

svg/%.svg: %.dia
	dia $< --export=$@
	
pdf/%.pdf: svg/%.svg
	inkscape $< $(INKSCAPE_EXPORT_ARG)$@ 
	

clean:
	rm -fr svg
	rm -fr pdf

.PHONY: clean
.PHONY: create_dirs
.PHONY: all

