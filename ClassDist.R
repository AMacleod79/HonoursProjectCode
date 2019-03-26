#script to create a graph showing the class distribution for all datasets
#add access to the EDA scripts to get to the class distribution tables

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
majPercLBP <- LBPDfCount[[2]]
minPercLBP <- LBPDfCount[[1]]

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

classDist <- data.frame("Dataset" =c("Breast_Cancer",
                                                              "Breast_Cancer",
                                                              "Liver_Disease",
                                                              "Liver_Disease",
                                                              "Alzheimer",
                                                              "Alzheimer",
                                                              "Diabetes",
                                                              "Diabetes",
                                                              "Cervical_Cancer",
                                                              "Cervical_Cancer",
                                                              "Lower_Back_Pain",
                                                              "Lower_Back_Pain",
                                                              "Heart_Attack",
                                                              "Heart_Attack",
                                                              "Autism",
                                                              "Autism",
                                                              "Fertility",
                                                              "Fertility"
),
"Percentage" =c(numRowMinBC,
                numMaxRowBC,
                numMinRowLiver,
                numMaxRowLiver,
                numMinRowAlz,
                numMaxRowAlz,
                numMinRowDiab,
                numMaxRowDiab,
                numMinRowCC,
                numMaxRowCC,
                numMinLBP,
                numMaxLBP,
                numMinHA,
                numMaxHA,
                numRowMinAu,
                numRowMaxAu,
                numRowMinFert,
                numRowMaxFert
),
"Category" = c("Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class",
               "Minority Class", "Majority Class")
)

classDist2 <- data.frame("Categories" =c("Majority Class","Minority Class"),
                         "Cervical Cancer" = c(majPercCC, minPercCC),
                         "Breast_Cancer" = c(majPercBC, minPercBC),
                         "Liver_Disease" = c(majPercLiver, minPercLiver),
                         "Diabetes" = c(majPercDiabetes,minPercDiabetes),
                         "Lower_Back_Pain" = c(majPercLBP,minPercLBP), 
                         "Lower_Back_Pain(modified)" = c(majPercLBPm, minPercLBPm),
                         "Heart_Attack" = c(majPercHA,minPercHA),
                         "Heart_Attack(modified)" = c(majPercHAm,minPercHAm),
                         "Autism" = c(majPercAus, minPercAus),
                         "Fertility" = c(majPercFert,minPercFert))
str(classDist2)

write.csv(classDist2, file = "Figures/ClassDistribution.csv")
x <- read.csv('Figures/ClassDistribution.csv')
x$X = NULL
library(xtable)
print(xtable(x),include.rownames = FALSE)


#import ggplot2
library(ggplot2)
# Use position=position_dodge()
# need to adjust size
#png("Figure 4.2.png")
ggplot(data=classDist, aes(x=Dataset, y=Percentage, fill=Category )) +
  geom_bar(stat="identity", position = position_dodge())
ggsave("Figures/figure4_1b.png",  width = 16, height = 10, dpi = 160)
