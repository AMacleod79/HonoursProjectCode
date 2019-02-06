#this is a script to split the datasets into train and test
library(caret)
#create a function to split the datatset
train_test_split <- function(df, partition = 0.7, labelIndex = 1){
  set.seed(125)
  train <- createDataPartition(df[,labelIndex], 
                                    p = partition,
                                    list = FALSE,
                                    times = 1) #caret library
  trainSet <- df[ train,]
  testSet  <- df[-train,]
  #add the train and test sets to a list train is element 1 and test element 2
  setsList <- list(trainSet,testSet)
  #return the list
  return (setsList)
  
}
