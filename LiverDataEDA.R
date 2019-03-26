#script for the Liver disease dataset data preprocessing

#packages
#install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

# upload the liver dataset
LiverDf <- read.csv(file = "Datasets/IndianLiver.csv", header = TRUE, sep=",")

cat("Shape of LiverDf is: ", dim(LiverDf))
head(LiverDf)
summary(LiverDf)
colnames(LiverDf)
str(LiverDf)

#-----------------------------------------------------------------------------
# for this dataset label is 1 (no liver disease) and 2 (liver disease)
#so first change all the 1 to 0 and 2 to 1 so all the datasets are the same
LiverDf$Dataset[LiverDf$Dataset==1]<-0  #uncomment if dataset is reloaded
LiverDf$Dataset[LiverDf$Dataset==2]<-1 #uncomment if dataset is reloaded
#--------------------------------------------------------------------------------
#check for missing data
LiverDf[!complete.cases(LiverDf),]
#only four rows, in column albumin and globulin ratio
# replace with mean for that column (0.9471)
LiverDf$Albumin_and_Globulin_Ratio[is.na(LiverDf$Albumin_and_Globulin_Ratio)] <- 0.9471
LiverDf[!complete.cases(LiverDf),]


#--------------------------------------------------------------------------------
#class distribution
LiverDfCounts <- table(LiverDf$Dataset)
#plot class distribution
png("Figures/figure4_5.png")
barplot(LiverDfCounts, beside = TRUE, ylim = c(0, 600), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
LivernRows <- nrow(LiverDf)
LiverDfCounts[[1]] <- LiverDfCounts[[1]]/LivernRows*100
LiverDfCounts[[2]] <- LiverDfCounts[[2]]/LivernRows*100
png("Figures/figure4_6.png")
barplot(LiverDfCounts, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#save modified dataset to directory
write.csv(LiverDf, file = "ModellingDatasets/LiverDf.csv")