all: dvi clean

final: pdf clean

dvi: 
	latex livro.tex

see:
	evince livro.dvi

pdf:
	pdflatex livro.tex

clean:
	rm -rf *.aux *.log *.toc
