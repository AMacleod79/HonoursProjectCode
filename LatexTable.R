## script to create latex table code from a dataframe or csv file.


x <- read.csv('foo.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)