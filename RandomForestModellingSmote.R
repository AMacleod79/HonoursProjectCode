# this is a script to run random forest with SMOTE on a list of datasets and outputs results a dataframe with various performance metrics
library(randomForest)
library(ROCR)
source("Scripts/SMOTEOne.R")

#create a function to run random forest
runRandomForestSmote <- function (dfList, dbNames, partition = 0.7, ntrees = 1000){
  #create a dataframe to hold the results
  RF_results <- data.frame(Dataset=as.character(), 
                           Accuracy=as.numeric(),
                           Sensitivity = as.numeric(),
                           Precision= as.numeric(),
                           F1Score = as.numeric())
  
  classDistributionTrainDf <-data.frame(Dataset=as.character(),
                                   NegativeClass = as.numeric(),
                                   PositiveClass = as.numeric(),
                                   NewNegativeClass = as.numeric(),
                                   NewPositiveClass = as.numeric()
  )
  
  #iterate through the list of datasets
  for(index in 1:length(dfList)){
    #create a dataframe for each dataset
    df <- dfList[[index]]
    df<- subset(df,select=c(- X))
    #rename last column "label" for all sets
    names(df)[ncol(df)]<-"label"
    #the target label must be in the last column for all datasets
    df[, ncol(df)] <-factor(df[,ncol(df)])
    #split dataset and outputs train and test as list
    listTrainTest <- train_test_split(df)
    #retrieve train and test sets from the list
    trainDf <- listTrainTest[[1]]
    dist <- as.data.frame(table(trainDf$label))
    testDf <- listTrainTest[[2]]
    print(dbNames[[index]])
    print(trainDf[!complete.cases(trainDf),])
    #now apply SMOTE to the training dataset
    trainDfSMOTE <- SMOTEOne(trainDf, dbNames[[index]], 200, 600) #this keeps all majority class and double minority class instances
    print(dbNames[[index]])
    print(trainDfSMOTE[!complete.cases(trainDfSMOTE),])
    dist2 <- as.data.frame(table(trainDfSMOTE$label))
    classDistributionTrainDf <- rbind(classDistributionTrainDf, data.frame(Dataset = dbNames[[index]],
                                                                 MajorityClass=dist[1,2],
                                                                 MinorityClass = dist[2,2],
                                                                 NewMajorityClass= dist2[1,2],
                                                                 NewMinorityClass = dist2[2,2]))
    
    
    # fit random forest
    labels<- as.factor(trainDfSMOTE[, ncol(trainDfSMOTE)])
    train <- trainDfSMOTE[, -ncol(trainDfSMOTE)]
    
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
    RF_prec <- perfMetrics[3]
    RF_F1Score <- 2 * (RF_prec*RF_sens)/(RF_prec+RF_sens)
    
    # #add results to dataframe results
    RF_results <- rbind(RF_results, data.frame(Dataset = dbNames[[index]],
                                               Accuracy=RF_accur,
                                               Sensitivity = RF_sens,
                                               Precision= RF_prec,
                                               F1Score = RF_F1Score))
    
  }#end for loop
  
  write.csv(classDistributionTrainDf, file = "Smote.csv")
  ####### This code to produce Latex code to reproduce the table ########
  x <- read.csv('Smote.csv')
  x$X = NULL
  library(xtable)
  print(xtable(x),include.rownames = FALSE)
  
  
  return (RF_results)
  
} #end function

# Store results 
#byClass(confMatRF)
#confusion matrix function
#confMatRF <-confusionMatrix(predictions, positive = 1, testDf[, ncol(testDf)], mode= "everything")
#RF_precFunc <- positive(RFModel)