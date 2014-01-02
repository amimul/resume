TmpFile = *.out *.log *.aux *.nav *.snm *.toc *.cls

all: pdf md

pdf: tex
	cp templates/tccv.cls site/
	cd site; pdflatex resume.tex; \
	rm -f $(TmpFile)
	cp site/resume.pdf ../iceboal.github.com/

md: data/* templates/*
	rm -f site/resume.md
	~/.cabal/bin/yst
	cp site/resume.md ../iceboal.github.com/

tex: data/* templates/tex*
	rm -f site/resume.tex
	~/.cabal/bin/yst
	cd site; sed -i 's#\([0-9]\)\(st\|nd\|rd\|th\)#\1\\textsuperscript{\2}#g' resume.tex; \
	sed -i 's#\(cny\)#\\textsc{\1}#g' resume.tex
