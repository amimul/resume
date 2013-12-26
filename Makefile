Target = resume.pdf
TmpFile = *.out *.log *.aux *.nav *.snm *.toc

$(Target): site/resume.tex
	rm site/resume.tex
	~/.cabal/bin/yst
	cp site/resume.tex tex/resume.tex
	cd tex; pdflatex resume.tex; bibtex resume.aux; \
	pdflatex resume.tex; pdflatex resume.tex
	mv tex/resume.pdf site/

all: resume.pdf clean read 

read:
	evince site/resume.pdf 

clean:
	-rm -f tex/$(TmpFile)

