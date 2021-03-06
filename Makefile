DRAWER=env dot -Tpng -O
SOURCE=bike-area.dot

.PHONY: clean
graph-png: $(SOURCE)
	$(DRAWER) $(SOURCE)
graph-pdf: was.ps
	ps2pdf was.ps
graph-ps: $(SOURCE)
	neato -Tps $(SOURCE) -o was.ps
article-pdf: where-i-was.tex was.pdf
	pdflatex where-i-was.tex
clean:
	@rm -f *ps *~
