# this is a script to run random forest on a list of datasets and outputs results a dataframe with various performance metrics
library(randomForest)
library(ROCR)
setwd("/Users/annabelle/Documents/school/HonoursYear/HonoursProject/HonoursProjectCode")
source("Scripts/Train_Test_Split.R") #import the train_test_split function

#create a function to run random forest
runRandomForest <- function (dfList, partition = 0.7, ntrees = 1000){
  #create a dataframe to hold the results
  RF_results <- data.frame(Dataset=as.character(), 
                           Accuracy=as.numeric(),
                           Sensitivity = as.numeric(),
                           Specificity= as.numeric())
  
  #iterate through the list of datasets
  for(index in 1:length(dfList)){
    #create a dataframe for each dataset
    df <- dfList[[index]]
    df<- subset(df,select=c(- X))
    #the target label must be in the last column for all datasets
    df[, ncol(df)] <-factor(df[,ncol(df)])
    #split dataset and outputs train and test as list
    listTrainTest <- train_test_split(df)
    #retrieve train and test sets from the list
    trainDf <- listTrainTest[[1]]
    testDf <- listTrainTest[[2]]
    
    # fit random forest
    labels<- as.factor(trainDf[, ncol(trainDf)])
    train <- trainDf[, -ncol(trainDf)]
    RFModel <- randomForest(train, labels, xtest= testDf[, -ncol(testDf)],
                            ytest = factor(testDf[,ncol(testDf)]),
                            ntrees = ntrees, proximity = TRUE, importance = TRUE,
                            keep.forest = TRUE)

    predictions <- levels(labels)[RFModel$test$predicted]
    
    #accuracy
    RF_accur <- (sum(predictions ==testDf[,ncol(testDf)])/nrow(testDf))*100
    #confusion matrix
    RF_confMat <- confusionMatrix(predictions, testDf[, ncol(testDf)], "1")
    perfMetrics <- RF_confMat$byClass
    RF_sens <- perfMetrics[1]
    RF_spec <- perfMetrics[2]
   
    # #add results to dataframe results
    RF_results <- rbind(RF_results, data.frame(Dataset = deparse(substitute(dfList[index])),
                                               Accuracy=RF_accur,
                                               Sensitivity = RF_sens,
                                               Specificity= RF_spec))
    
  }#end for loop
  
  return (RF_results)
  
} #end function

    # Store results 
    #byClass(confMatRF)
    #confusion matrix function
    #confMatRF <-confusionMatrix(predictions, positive = 1, testDf[, ncol(testDf)], mode= "everything")
    #RF_precFunc <- positive(RFModel)