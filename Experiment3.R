# experimenting with smote
#install packages
install.packages("DMwR")
library("DMwR")

#call the relevant scripts
setwd("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode")
list.files()
#import the scripts
source("Scripts/Train_Test_Split.R")
source("Scripts/RandomForestModellingSmote.R")
source("Scripts/DatasetsUploads.R")
source("Scripts/SMOTEOne.R")
list.files("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode/ModellingDatasets")
#upload the datasets
dfListExp3 <- datasetUpload()

#now run RF on the SMOTE dfs
RF_ResultsExp3 <- runRandomForestSmote(dfListExp3[[1]], dfListExp3[[2]])


#note on this experiment: if k=6, the subsetted dataset for heart attack returns Na values after smote
#works with 3, 4 but not larger values as there are only 4 observations in the training set for the minority class.


RF_ResultsExp3 
write.csv(RF_ResultsExp3, file = "RF_results3.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results3.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)

#will need to rerun this with just subHAPDF and subLBPDf and maybe fertility dataset to change parameters as they are quite small datasets