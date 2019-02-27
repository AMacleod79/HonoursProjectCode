#SMOTE function for each dataset
#will output a list of df that have been run through the SMOTE function

SMOTE_All <- function(dfList, dfNames, percPos=200, percNeg=100){
  dfListSmitten <- list()
  classDistributionDf <-data.frame(Dataset=as.character(),
                                 NegativeClass = as.numeric(),
                                 PositiveClass = as.numeric(),
                                 NewNegativeClass = as.numeric(),
                                 NewPositiveClass = as.numeric()
                                 )
  #iterate through the list
  for(i in 1:length(dfList)){
    df <- dfList[[i]]
    #rename last column "label" for all sets
    names(df)[ncol(df)]<-"label"
    dist <- as.data.frame(table(df$label))
    #convert label column as factor
    df[, ncol(df)] <-factor(df[,ncol(df)])
    #col_names <- names(df)
    #df[, col_names] <- lapply(df[, col_names], factor) 
    smittenDf <- SMOTE(label ~., df, perc.over = percPos, perc.under = percNeg)
    dist2 <- as.data.frame(table(smittenDf$label))
    dfListSmitten[[i]]<- smittenDf
    classDistributionDf <- rbind(classDistributionDf, data.frame(Dataset = dfNames[[i]],
                                          NegativeClass=dist[1,2],
                                          PositiveClass = dist[2,2],
                                          NewNegativeClass= dist2[1,2],
                                          NewPositiveClass = dist2[2,2]))
    
  }#end for loop
  
  print(classDistributionDf)
  
  write.csv(classDistributionDf, file = "Smote.csv")
  ####### This code to produce Latex code to reproduce the table ########
  x <- read.csv('Smote.csv')
  x$X = NULL
  library(xtable)
  print(xtable(x),include.rownames = FALSE)
  
  return(dfListSmitten)
  
}#end function

#In the smote function havecsome print statements to output the new class distribution 
#Or try to save that + new dimensions to a data frame (if dataframe is set as global variable?)