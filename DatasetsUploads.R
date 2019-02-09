# this is a script to upload datasets from csv as dataframes
datasetUpload <- function(){
  #create empty lists to hold all the dataframes
  dfList <- list()
  #define file path
  filenames <- Sys.glob("./ModellingDatasets/*.csv")
  #check if there are more than one file
  if(length(filenames)>1){
    #add each dataset to list as dataframe
    dfList = sapply(filenames, read.csv,stringsAsFactors=TRUE) #here change to true and upload so that factors are maintained
    #name each dataframe as the csv file
    #list of names
    dfNameList <- names(dfList)
    dfNameList <- basename(dfNameList)
    dfNameList<- gsub(".csv", "", dfNameList, fixed = TRUE)
    names(dfList) <- dfNameList
  }
  else{     
    #if only file in the folder
    dfList[[1]] <- read.csv(filenames, stringsAsFactors=TRUE)
    dfNameList<- basename(filenames) 
    dfNameList<- gsub(".csv", "", dfNameList, fixed = TRUE)
    names(dfList) <- dfNameList
  }
  
  return (list(dfList,dfNameList))
  
}#end function

datasetUpload()

#function to remove the first column X in a dataset if it exists
# datasetCleanUp <- function(dfList){
#   dfCleanList <- list()
#   for(index in 1:length(dfList)){
#     #create a dataframe for each dataset
#     df <- dfList[[index]]
#     if("X" %in% colnames(df)){
#     df <- df[, - "X")]
#   }#end if
#     dfCleanList <- c(dfCleanList, df)
#   }#end for loop
#   return(dfCleanList)
# }#end function
