DRAWER=env dot -Tpng -O
SOURCE=bike-area.dot

.PHONY: clean

# Draw graph
$(SOURCE).png graph-png: $(SOURCE)
	$(DRAWER) $(SOURCE)
graph-pdf: was.ps
	ps2pdf was.ps
graph-ps: $(SOURCE)
	neato -Tps $(SOURCE) -o was.ps

article-pdf: where-i-was.tex was.pdf
	pdflatex where-i-was.tex

# Build GraphViz dot-files
$(SOURCE): $(SOURCE).m4 serbia.inc.dot
	m4 $(SOURCE).m4 > $(SOURCE)

serbia.dot: serbia.dot.m4 serbia.inc.dot
	m4 serbia.dot.m4 > serbia.dot

clean:
	@rm -f *ps *~

server:
	echo Go to http://localhost:8000/bike.html
	python3 -m http.server || php -S localhost:8000
