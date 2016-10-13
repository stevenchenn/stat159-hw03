.PHONY: all data clean tests eda regression report

all: data eda regression session-info.txt report

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv -o data/Advertising.csv

eda: 
	Rscript code/scripts/eda-script.R

regression:
	Rscript code/scripts/regression-script.R

session-info.txt:
	Rscript code/scripts/session-info-script.R

report:
	Rscript -e "library(rmarkdown); render('report/report.Rmd','pdf_document')"

tests:
	Rscript code/test-that.R 

clean:
	rm report/report.pdf
