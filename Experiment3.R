# experimenting with smote
#install packages
install.packages("DMwR")
library("DMwR")

#call the relevant scripts
setwd("/Users/annabelle/HonoursYear/HonoursProject/HonoursProjectCode")
list.files()
#import the scripts
source("Scripts/Train_Test_Split.R")
source("Scripts/RandomForestModellingSmote.R")
source("Scripts/DatasetsUploads.R")
source("Scripts/SMOTEOne.R")
list.files("/Users/annabelle/HonoursYear/HonoursProject/HonoursProjectCode/ModellingDatasets")
#upload the datasets
dfListExp3 <- datasetUpload()

#now run RF on the SMOTE dfs
RF_ResultsExp3 <- runRandomForestSmote(dfListExp3[[1]], dfListExp3[[2]])


#note on this experiment: if k=6, the subsetted dataset for heart attack returns Na values after smote
#works with 3, 4 but not larger values as there are only 4 observations in the training set for the minority class.

#the modified datasets for heart attack and low back pain need to go through SMOTE separately
#model the others then do SMOTE on those with different parameters

dfListExp3b<- dfListExp3[[1]]
dfListExp3c<- dfListExp3[[2]]
length(dfListExp3b)
dfListExp3b<-dfListExp3b[1:8]
dfListExp3c<- dfListExp3c[1:8]
dfListExp3d <- list()
dfListExp3d[[1]]<- dfListExp3b
dfListExp3d[[2]]<- dfListExp3c
#parameters k=4, perc.under = 100 and perc.over = 200
#change parameters in function smoteOne
RF_ResultsExp3d <- runRandomForestSmote(dfListExp3d[[1]], dfListExp3d[[2]])

write.csv(RF_ResultsExp3d, file = "RF_results5.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results5.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)

RF_ResultsExp3d
write.csv(RF_ResultsExp3d, file = "RF_results5d.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results5d.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)
#will need to rerun this with just subHAPDF and subLBPDf and maybe fertility dataset to change parameters as they are quite small datasets


dfListExp3e<- dfListExp3[[1]]
dfListExp3f<- dfListExp3[[2]]
dfListExp3e<-dfListExp3e[9:10]
dfListExp3f<- dfListExp3f[9:10]
dfListExp3g <- list()
dfListExp3g[[1]]<- dfListExp3e
dfListExp3g[[2]]<- dfListExp3f

#now run RF with smote parameters  #perc.under = 200 and perc.over = 800
#change parameters in function smoteOne
RF_ResultsExp3g <- runRandomForestSmote(dfListExp3g[[1]], dfListExp3g[[2]])
RF_ResultsExp3g
write.csv(RF_ResultsExp3g, file = "RF_results5g.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results5g.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)



#fertility on its own
dfListExp3h<- dfListExp3[[1]]
dfListExp3i<- dfListExp3[[2]]
dfListExp3h<-dfListExp3h[5:5]
dfListExp3i<- dfListExp3i[5:5]
dfListExp3j <- list()
dfListExp3j[[1]]<- dfListExp3h
dfListExp3j[[2]]<- dfListExp3i
length(dfListExp3h)

#now run RF with smote parameters 200, 600
#change parameters in function smoteOne
RF_ResultsExp3j <- runRandomForestSmote(dfListExp3j[[1]], dfListExp3j[[2]])
RF_ResultsExp3j
write.csv(RF_ResultsExp3j, file = "RF_results5j.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results5j.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)













