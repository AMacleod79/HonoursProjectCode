#Experiment with undersampling and oversampling for random forest
setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode")
getwd()
list.files()
#import the scripts
source("Scripts/Train_Test_Split.R")
source("Scripts/DatasetsUploads.R")
source("Scripts/OverUnderSampling.R")
list.files("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/ModellingDatasets")

#upload the dataframes as list
dfListOverUnder <- datasetUpload()
str(dfListOverUnder)
length(dfListOverUnder)
#sample
#default function (40% of majority class retained, 100% of minority class)
dfListMod <- overAndUnder(dfListOverUnder[[1]])

#run random forest
RF_ResultsExp2 <- runRandomForest(dfListMod, dfListOverUnder[[2]])
RF_ResultsExp2

write.csv(RF_ResultsExp2, file = "RF_results2.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results2.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)



#try different percentage of majority class
dfListMod2 <- overAndUnder(dfListOverUnder[[1]], 60, 100)

RF_ResultsExp3 <- runRandomForest(dfListMod2, dfListOverUnder[[2]])
RF_ResultsExp3
write.csv(RF_ResultsExp3, file = "RF_results3.csv")
x <- read.csv('RF_results3.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)


dfListMod3 <- overAndUnder(dfListOverUnder[[1]], 75, 100)
RF_ResultsExp4 <- runRandomForest(dfListMod3, dfListOverUnder[[2]])
RF_ResultsExp4
write.csv(RF_ResultsExp4, file = "RF_results4.csv")
x <- read.csv('RF_results4.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)

