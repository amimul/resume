Compiler = pdflatex
Reader = evince

Source = resume.tex
Target = resume.pdf
TmpFile = *.out *.log *.aux *.nav *.snm *.toc

#ifneq ( $(MAKECMDGOALS),clean) 
#include $(sources:.tex=.pdf) 

$(Target): $(Source)
	$(Compiler) $(Source)
	$(Compiler) $(Source)

all: $(Target) clean read 

read:
	$(Reader) $(Target)

clean:
	-rm -f $(TmpFile)

cleanall:
	-rm -f $(TmpFile) $(Target)

.PHONY: all read clean cleanall
