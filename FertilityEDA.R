#script for the heart attack dataset data preprocessing

#packages
#install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

#upload the dataset
FertDf <- read.csv(file = "Datasets/fertility.csv", header = TRUE, sep =",")

cat("Shape of FertDf is: ", dim(FertDf))
head(FertDf)
summary(FertDf)
colnames(FertDf)
str(FertDf)

#levels in class labels
levels(FertDf$Diagnosis)
#change levels to 0 for Normal and 1 for Altered
levels(FertDf$Diagnosis)[1] <- 1 ##uncomment if dataset is reloaded
levels(FertDf$Diagnosis)[2] <- 0 #uncomment if dataset is reloaded
levels(FertDf$Diagnosis)

FertDf[!complete.cases(FertDf),]

#class distribution
FertDfCount <- table(FertDf$Diagnosis)


#plot class distribution
png("Figures/figure4_19.png")
barplot(FertDfCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
FertnRows <- nrow(FertDf)
FertDfCount[[1]] <- FertDfCount[[1]]/FertnRows*100
FertDfCount[[2]] <- FertDfCount[[2]]/FertnRows*100
png("Figures/figure4_20.png")
barplot(FertDfCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()


#save the fertility dataset
write.csv(FertDf, file = "ModellingDatasets/FertDf.csv")