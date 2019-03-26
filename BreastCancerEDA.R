#script for the Breast Cancer dataset data preprocessing

#packages
install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

#import data
BCDf <- read.csv(file = "Datasets/BreastCancerData.csv", header=TRUE, sep=",")

# show number of columns and rows for BCFf
cat("Shape of BCDf is: ", dim(BCDf))
head(BCDf)
summary(BCDf)
colnames(BCDf)

#class labels are B and M - Let's recode to 0 and 1
levels(BCDf$diagnosis)[1] <-0 #uncomment if dataset is reloaded
levels(BCDf$diagnosis)[2] <-1 #uncomment if dataset is reloaded
levels(BCDf$diagnosis)

head(BCDf)
BCDf[!complete.cases(BCDf),]
#only missing data is in the X column (not used)
#remove unused column
BCDf <-subset(BCDf,select=c(- X))
#put class label at the end
#df <- df[, c(col_idx, (1:ncol(df))[-col_idx])]
BCDf$Label <- BCDf$diagnosis
BCDf <- subset(BCDf, select=c(-diagnosis))
names(BCDf)
# class distribution
BCCounts <- table(BCDf$Label)

#plot class distribution
png("Figures/figure4_3.png")
barplot(BCCounts, beside = TRUE, ylim = c(0, 600), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
BCnRows <- nrow(BCDf)
BCCounts[[1]] <- BCCounts[[1]]/BCnRows*100
BCCounts[[2]] <- BCCounts[[2]]/BCnRows*100
png("Figures/figure4_4.png")
barplot(BCCounts, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()


write.csv(BCDf, file = "ModellingDatasets/BCDf.csv")
