


RUBBER_INSTALLED := $(shell command -v rubber 2>/dev/null)

WD := $(shell pwd)

all: report.pdf

report.pdf: report.tex
ifdef RUBBER_INSTALLED
	rubber -d report.tex
else
	pdflatex report.tex
	#bibtex 
	pdflatex report.tex
	pdflatex report.tex
	@echo "=============================="
	@echo "= consider installing rubber ="
	@echo "=============================="
endif

clean:
	rm -f *.out
	rm -f *.toc
	rm -f *.log
	rm -f *.aux
	rm -f *.pdf
	rm -f *.bbl
	rm -f *.blg
	rm -f *~
	rm -f *.tar.gz

show: 
	evince *.pdf &
