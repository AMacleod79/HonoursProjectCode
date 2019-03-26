#script for the Diabetes disease dataset data preprocessing

#packages
#install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

# upload the pima indian diabetes dataset
DiabetesDf <- read.csv(file = "Datasets/diabetes.csv", header = TRUE, sep=",")

cat("Shape of DiabetesDf is: ", dim(DiabetesDf))
head(DiabetesDf)
summary(DiabetesDf)
colnames(DiabetesDf)

#check for missing data
DiabetesDf[!complete.cases(DiabetesDf),]
#class distribution
#outcome is already 1(develop diabetes within 5 years) or 0 (will not develop diabetes within 5 years) so no need to recode
DiabetesDfCount <-table(DiabetesDf$Outcome)

#plot class distribution
png("Figures/figure4_7.png")
barplot(DiabetesDfCount, beside = TRUE, ylim = c(0, 600), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
DiabetesnRows <- nrow(DiabetesDf)
DiabetesDfCount[[1]] <- DiabetesDfCount[[1]]/DiabetesnRows*100
DiabetesDfCount[[2]] <- DiabetesDfCount[[2]]/DiabetesnRows*100
png("Figures/figure4_8.png")
barplot(DiabetesDfCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#save the modified dataset
write.csv(DiabetesDf, file = "ModellingDatasets/DiabetesDf.csv")
