# run the random forest modelling 
#working directory
setwd("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode")
#import the scripts
source("Scripts/Train_Test_Split.R")
source("Scripts/RandomForestModelling.R")
source("Scripts/DatasetsUploads.R")

# upload the files
#dfList <- datasetUpload()
dfListTry <- datasetUpload()
length(dfListTry)

RF_results2 <- runRandomForest(dfListTry[[1]],dfListTry[[2]])
RF_results2
# res <- RF_results2$byClass
# str(res)
# str(RF_results2)
# sensitivity <- res[1]
# sensitivity

write.csv(RF_results2, file = "RF_results1.csv")
####### This code to produce Latex code to reproduce the table ########
x <- read.csv('RF_results1.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)
##########################################################################

