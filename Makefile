READER = evince
TARGET = site/resume.pdf
YST = ~/.cabal-sandbox/bin/yst
TmpFile = *.out *.log *.aux *.nav *.snm *.toc *.cls

all: pdf md

pdf: tex
	cp templates/tccv.cls site/
	cd site; pdflatex resume.tex; \
	rm -f $(TmpFile)
	cp $(TARGET) ../iceboal.github.com/

md: data/* templates/*
	rm -f site/resume.md
	$(YST)
	cp site/resume.md ../iceboal.github.com/

tex: data/* templates/tex*
	rm -f site/resume.tex
	$(YST)
	cd site; sed -e 's#\([0-9]\)\(st\|nd\|rd\|th\)#\1\\textsuperscript{\2}#g' resume.tex; \
	sed -e 's#\(cny\)#\\textsc{\1}#g' resume.tex

read:
	$(READER) $(TARGET) &
