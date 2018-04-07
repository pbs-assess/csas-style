all: pdf

pdf: 
	Rscript -e "library(knitr); knit('example.rnw')"
	pdflatex example.tex
	pdflatex example.tex

