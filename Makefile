Target = resume.pdf
TmpFile = *.out *.log *.aux *.nav *.snm *.toc *.cls

$(Target): site/resume.tex
	rm site/resume.tex
	~/.cabal/bin/yst
	cp templates/tccv.cls site/
	cd site; pdflatex resume.tex; \
	rm -f $(TmpFile)
