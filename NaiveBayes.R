#script to run Naive Bayes Model

setwd("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode")
source("Scripts/Train_Test_Split.R") #import the train_test_split function

library(e1071)
naiveBayesModel <- function(dfList, partition = 0.7, )