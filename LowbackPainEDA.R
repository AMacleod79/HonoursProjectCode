#script for the low back pain dataset data preprocessing

#packages
#install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

# upload the Lower back pain symptom dataset
LBPDf <- read.csv(file = "Datasets/dataset_spine.csv", header = TRUE, sep=",")


cat("Shape of LBPDf is: ", dim(LBPDf))
head(LBPDf)
summary(LBPDf)
colnames(LBPDf)
#need to rename all the columns
#Col1pelvic_incidence
#Col2pelvic tilt
#Col3lumbar_lordosis_angle
#Col4sacral_slope
#Col5pelvic_radius
#Col6degree_spondylolisthesis
#Col7pelvic_slope
#Col8Direct_tilt
#Col9thoracic_slope
#Col10cervical_tilt
#Col11sacrum_angle
#Col12scoliosis_slope
names(LBPDf) <- c("pelvic_incidence", "pelvic_tilt", 
                  "lumbar_lordosis_angle", "sacral_slope",
                  "pelvic_radius", "degree_spondylolisthesis",
                  "pelvic_slope", "direct_tilt",
                  "thoracic_slope", "cervical_tilt",
                  "sacrum_angle", "scoliosis_slope",
                  "Class_label", "X")
colnames(LBPDf)
#need to recode class label 0 for Normal and 1 for abnormal
#Class_attAbnormal, Normal
levels(LBPDf$Class_label)
levels(LBPDf$Class_label)[1] <- 1 #uncomment if dataset is reloaded
levels(LBPDf$Class_label)[2] <-0 #uncomment if dataset is reloaded
levels(LBPDf$Class_label)
is.ordered(levels(LBPDf$Class_label))

LBPDf <- subset(LBPDf, select = c(-X))

LBPDf[!complete.cases(LBPDf),]

#class distribution
LBPDfCount <- table(LBPDf$Class_label)
LBPDfCountb <- array()
LBPDfCountb[[1]] <- LBPDfCount[[2]]
LBPDfCountb[[2]] <- LBPDfCount[[1]]

#plot class distribution
png("Figures/figure4_11.png")
barplot(LBPDfCountb, beside = TRUE, ylim = c(0, 450), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
LBPnRows <- nrow(LBPDf)
LBPDfCountb[[1]] <- LBPDfCountb[[1]]/LBPnRows*100
LBPDfCountb[[2]] <- LBPDfCountb[[2]]/LBPnRows*100
png("Figures/figure4_12.png")
barplot(LBPDfCountb, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()
#note their are more observations in the abnormal class than in the normal class. 
#consider subsetting the data to have a minority class and majority class instead

dfSubNegLBP <- LBPDf[which(LBPDf$Class_label==0),]  #will keep all of this data
# then get the rows where lable = 1 and save as df
dfSubPosLBP <- LBPDf[which(LBPDf$Class_label==1),] #will keep only a subset for the experiment

# then pick 100% of data where label = 0 and save as df
#pick 7% of the data where label = 1 and save as df
sampleSizeNegLBP <- 100 * nrow(dfSubNegLBP)/100
sampleSizePosLBP <- 7 * nrow(dfSubPosLBP)/100

dfSubNegLBP <- dfSubNegLBP[sample(1:nrow(dfSubNegLBP), sampleSizeNegLBP,replace=FALSE),]
dfSubPosLBP <- dfSubPosLBP[sample(1:nrow(dfSubPosLBP),sampleSizePosLBP,replace = FALSE),]

# then put the two df together and shuffle
totalLBP <- rbind(dfSubNegLBP,dfSubPosLBP)
totalLBP <- totalLBP[sample(nrow(totalLBP)),]

#new class distribution
totalLBPCount <- table(totalLBP$Class_label)

# plot new class distribution
png("Figures/figure4_13.png")
barplot(totalLBPCount, beside = TRUE, ylim = c(0, 200), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
totalLBPRows <- nrow(totalLBP)
totalLBPCount[[1]] <- totalLBPCount[[1]]/totalLBPRows*100
totalLBPCount[[2]] <- totalLBPCount[[2]]/totalLBPRows*100
png("Figures/figure4_14.png")
barplot(totalLBPCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()



#save the modified dataset
write.csv(LBPDf, file = "ModellingDatasets/LBPDf.csv")

#and the subsetted one
write.csv(totalLBP, file = "ModellingDatasets/subLBPDf.csv")


