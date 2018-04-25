all: pdf

pdf: 
	Rscript -e "library(knitr); knit('example.rnw')"
	pdflatex example
	bibtex example
	pdflatex example
	pdflatex example

