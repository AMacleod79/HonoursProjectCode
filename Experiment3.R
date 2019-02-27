# experimenting with smote
#install packages
install.packages("DMwR")
library("DMwR")

#call the relevant scripts
setwd("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode")
list.files()
#import the scripts
source("Scripts/Train_Test_Split.R")
source("Scripts/RandomForestModelling.R")
source("Scripts/DatasetsUploads.R")
source("Scripts/SMOTEALL.R")
list.files("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode/ModellingDatasets")
#upload the datasets
dfListExp3 <- datasetUpload()

#now need a function that will apply SMOTE to each dataset

dfListSMOTE <- SMOTE_All(dfListExp3[[1]], dfListExp3[[2]], 200, 100) #this keeps all majority class and triple minority class instances

#now run RF on the SMOTE dfs
RF_ResultsExp3 <- runRandomForest(dfListSMOTE, dfListExp3[[2]])

RF_ResultsExp3 
write.csv(RF_ResultsExp3, file = "RF_results3.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results3.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)
