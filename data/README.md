This subdirectory contains all the outputs generated from the R scripts as well as the main data set

Data credit: Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani
The data set is in the `Advertising.csv` file available here:

[http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv](http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv)

eda-output.txt is a text file containing the summary statistics of all the variables, and the correlation matrix. This file should be produced via sink() from the eda-script.R file.
correlation-matrix.RData is an R's binary format file containing the matrix of correlations among all variables. This file should be produced via save() from the eda-script.R file.
regression.RData is an R's binary format file containing the regression objects obtained when running regression-script.R. This file should be produced via save() from the regression-script.R file.

The list of files includes:
+ `Advertising.csv` is the main data set.
+ `eda-output.txt` is a text file containing the summary statistics of all the variables, and the correlation matrix. This file should be produced via sink() from the eda-script.R file.
+ `correlation-matrix.RData` is an R's binary format file containing the matrix of correlations among all variables. This file should be produced via save() from the eda-script.R file.

+ `regression.RData` is an R's binary format file containing the regression objects obtained when running regression-script.R. This file should be produced via save() from the regression-script.R file.
