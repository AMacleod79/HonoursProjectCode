#script to create a graph showing the class distribution for all datasets
#add access to the EDA scripts to get to the class distribution tables
#install.packages("RColorBrewer")
setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode")
source("EDA/FertilityEDA.R")
source("EDA/HeartAttackEDA.R")
source("EDA/LowBackPainEDA.R")
source("EDA/CervicalCancerEDA.R")
source("EDA/DiabetesEDA.R")
source("EDA/LiverDataEDA.R")
source("EDA/BreastCancerEDA.R")
source("EDA/AutismEDA.R")

#create dataframe to hold the percentages for each classes
#three columns Dataset, Minority Class, Majority class
# rows are each dataset

#percentage class distribution CC
majPercCC <- CCDfCount[[1]]
minPercCC <- CCDfCount[[2]]

#percentage class distribution BC
majPercBC <- BCCounts[[1]]
minPercBC <- BCCounts[[2]]

#percentage class distribution liver disease
majPercLiver <- LiverDfCounts[[1]]
minPercLiver <- LiverDfCounts[[2]]

#percentage class distribution diabetes
majPercDiabetes <- DiabetesDfCount[[1]]
minPercDiabetes <- DiabetesDfCount[[2]]

#percentage class distribution low back pain
majPercLBP <- LBPDfCountb[[2]]
minPercLBP <- LBPDfCountb[[1]]

#percentage class distribution low back pain (modified)
majPercLBPm <- totalLBPCount[[2]]
minPercLBPm <- totalLBPCount[[1]]

#percentage class distribution heart attack
majPercHA <- HAPDfCount[[1]]
minPercHA <- HAPDfCount[[2]]

#percentage class distribution heart attack (modified)
majPercHAm <- totalHACount[[1]]
minPercHAm <- totalHACount[[2]]

#percentage class distribution autism 
majPercAus <- AuSDfCount[[1]]
minPercAus <- AuSDfCount[[2]]

#percentage class distribution fertility
majPercFert <- FertDfCount[[2]]
minPercFert <- FertDfCount[[1]]

classDist <- data.frame("Dataset" =c("Cervical Cancer",
                                      "Cervical Cancer",
                                      "Breast Cancer",
                                      "Breast Cancer",
                                      "Liver Disease",
                                      "Liver Disease",
                                      "Diabetes",
                                      "Diabetes",
                                      "Lower Back_Pain",
                                      "Lower Back_Pain",
                                      "Lower Back_Pain modified",
                                      "Lower Back_Pain modified",
                                      "Heart Attack",
                                      "Heart Attack",
                                      "Heart Attack modified",
                                      "Heart Attack modified",
                                      "Autism",
                                      "Autism",
                                      "Fertility",
                                      "Fertility"),
                          "Percentage" =c(majPercCC,
                                          minPercCC,
                                          majPercBC,
                                          minPercBC,
                                          majPercLiver,
                                          minPercLiver,
                                          majPercDiabetes,
                                          minPercDiabetes,
                                          majPercLBP,
                                          minPercLBP,
                                          majPercLBPm,
                                          minPercLBPm,
                                          majPercHA,
                                          minPercHA,
                                          majPercHAm,
                                          minPercHAm,
                                          majPercAus,
                                          minPercAus,
                                          majPercFert,
                                          minPercFert),
                          "Category" = c("Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class",
                                        "Majority Class","Minority Class"))

classDist2 <- data.frame("Datasets" = c("Cervical_Cancer",
                                        "Breast_Cancer",
                                        "Liver_Disease",
                                        "Diabetes",
                                        "Lower_Back_Pain",
                                        "Lower_Back_Pain modified",
                                        "Heart_Attack",
                                        "Heart_Attack modified",
                                        "Autism",
                                        "Fertility"),
                        "Majority Class"=c(majPercCC,
                                           majPercBC, 
                                           majPercLiver, 
                                           majPercDiabetes,
                                           majPercLBP,
                                           majPercLBPm, 
                                           majPercHA,
                                           majPercHAm,
                                           majPercAus, 
                                           majPercFert),
                        "Minority Class" = c(minPercCC,
                                             minPercBC,
                                             minPercLiver,
                                             minPercDiabetes,
                                             minPercLBP,
                                             minPercLBPm,
                                             minPercHA,
                                             minPercHAm,
                                             minPercAus,
                                             minPercFert))
str(classDist2)

library(stringr)
classDist$wrappedData = str_wrap(classDist$Dataset, width = 1)


write.csv(classDist2, file = "Figures/ClassDistribution.csv")
x <- read.csv('Figures/ClassDistribution.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)


#import ggplot2
library(ggplot2)

install.packages("wesanderson")
library(wesanderson)
# Use position=position_dodge()
# need to adjust size
#png("Figure 4.2.png")
ggplot(data=classDist, aes(x=wrappedData, y=Percentage, fill=Category )) +
  geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values = wes_palette(n=3, name = "GrandBudapest1")) + xlab("Datasets") + ylab("Percentage")
ggsave("Figures/figure4_1b.png",  width = 9, height = 5, dpi = 300)
