setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode")
getwd()
list.files()

#upload result tables as CSV
#RF baseline
RfResDf <-read.csv("RF_results1.csv")
#RF undersample 40%
RFRes40Df <-read.csv("RF_results2.csv")
#RF undersample 60%
RFRes60Df <-read.csv("RF_results3.csv")
#RF undersample 75%
RFRes75Df <-read.csv("RF_results4.csv")

#all the values in one dataframe for convenience
#variations from the baseline calculated
VariationsUnderDf <- data.frame(Dataset=RfResDf$Dataset, 
                         AccuRFBase=RfResDf$Accuracy,
                         AccuRF40 = RFRes40Df$Accuracy,
                         AccuVariation40 = (RFRes40Df$Accuracy - RfResDf$Accuracy),
                         AccuRF60 = RFRes60Df$Accuracy,
                         AccuVariation60= (RFRes60Df$Accuracy- RfResDf$Accuracy),
                         AccuRF75 = RFRes75Df$Accuracy,
                         AccuVariation75= (RFRes75Df$Accuracy -RfResDf$Accuracy),
                         SensiRFBase = (RfResDf$Sensitivity),
                         SensiRF40 = RFRes40Df$Sensitivity,
                         SensiVariation40 = (RFRes40Df$Sensitivity - RfResDf$Sensitivity),
                         SensiRF60 = RFRes60Df$Sensitivity,
                         SensiVariation60 = (RFRes60Df$Sensitivity - RfResDf$Sensitivity),
                         SensiRF75 = RFRes75Df$Sensitivity,
                         SensiVariation75 = (RFRes75Df$Sensitivity - RfResDf$Sensitivity),
                         PreciRFBase = (RfResDf$Precision),
                         PreciRF40 = RFRes40Df$Precision,
                         PreciVariation40 = (RFRes40Df$Precision - RfResDf$Precision),
                         PreciRF60 = RFRes60Df$Precision,
                         PreciVariation60 = (RFRes60Df$Precision - RfResDf$Precision),
                         PreciRF75 = RFRes75Df$Precision,
                         PreciVariation75 = (RFRes75Df$Precision- RfResDf$Precision),
                         F1RFBase = (RfResDf$F1Score),
                         F1RF40 = RFRes40Df$F1Score,
                         F1Variation40 = ( RFRes40Df$F1Score -RfResDf$F1Score),
                         F1RF60 = RFRes60Df$F1Score,
                         F1Variation60 = (RFRes60Df$F1Score -RfResDf$F1Score),
                         F1RF75 = RFRes75Df$F1Score,
                         F1Variation75 = (RFRes75Df$F1Score -RfResDf$F1Score)
                         )

write.csv(VariationsUnderDf, file = "variations2.csv")

#this table to show the variations from the base line for accuracy only
accuVariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                               Variation75 = VariationsUnderDf$AccuVariation75,
                               Variation60 = VariationsUnderDf$AccuVariation60,
                               Variation40 = VariationsUnderDf$AccuVariation40)
getwd()
list.files()
setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Performance")
write.csv(accuVariationsDf, file = "accuVariations.csv")

#this table to show the variations from the base line for sensitivity only
sensiVariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                                Variation75 = VariationsUnderDf$SensiVariation75,
                                Variation60 = VariationsUnderDf$SensiVariation60,
                                Variation40 = VariationsUnderDf$SensiVariation40)
write.csv(sensiVariationsDf, file="sensiVariations.csv")

#this table to show the variations from the base line for precision only
preciVariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                                Variation75 = VariationsUnderDf$PreciVariation75,
                                Variation60 = VariationsUnderDf$PreciVariation60,
                                Variation40 = VariationsUnderDf$PreciVariation40)
write.csv(preciVariationsDf, file="preciVariatins.csv")

#this table to show the variations from the base line for the F1 score only
F1VariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                             Variation75 = VariationsUnderDf$F1Variation75,
                             Variation60 = VariationsUnderDf$F1Variation60,
                             Variation40 = VariationsUnderDf$F1Variation40)
write.csv(F1VariationsDf, file = "F1Variations.csv")


#change directory to save graphs
setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Figures")

#this table to gather all the accuracy data for the ggplot
accuVariationsPlot <- data.frame(Dataset = c("Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                             "Low Back Pain","Liver","modHA","modLBP",
                                             "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                             "Low Back Pain","Liver","modHA","modLBP",
                                             "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                             "Low Back Pain","Liver","modHA","modLBP"),
                                 Condition = c("75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", 
                                               "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %",
                                               "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %"),
                                 Variation = c(VariationsUnderDf$AccuVariation75,
                                               VariationsUnderDf$AccuVariation60,
                                               VariationsUnderDf$AccuVariation40))

#wrap Dataset names to look pretty on the graph
library(stringr)
accuVariationsPlot$wrappedData = str_wrap(accuVariationsPlot$Dataset, width=10)
library("RColorBrewer")
display.brewer.all()
library(ggplot2)

#this graphs displays the variation in accuracy grouped by condition on the x axis
ggplot(data = accuVariationsPlot, aes(x=Condition, y = Variation , fill = Dataset))+ geom_bar(stat="identity",position = position_dodge()) + scale_fill_brewer(palette="Set3")
ggsave("Chapter5/AccuVariationUnder.png", width = 5, height =10, dpi = 300)

install.packages("wesanderson")
library(wesanderson)
#this graphs displays the variations in accuracy grouped by dataset on the x axis
ggplot(data = accuVariationsPlot, aes(x=wrappedData, y = Variation, fill = Condition)) + geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values=wes_palette(n=3, name="GrandBudapest1")) + xlab("Datasets") + ylab("Variation")
ggsave("Chapter5/AccuVariationUnderBySets.png", width = 8, height =10, dpi = 300)


#this table to gather all the sensitivity data for the ggplot
sensiVariationsPlot <- data.frame(Dataset = c("Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                              "Low Back Pain","Liver","modHA","modLBP",
                                              "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                              "Low Back Pain","Liver","modHA","modLBP",
                                              "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                              "Low Back Pain","Liver","modHA","modLBP"),
                                  Condition = c("75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", 
                                                "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %",
                                                "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %"),
                                  Variation = c(VariationsUnderDf$SensiVariation75,
                                                VariationsUnderDf$SensiVariation60,
                                                VariationsUnderDf$SensiVariation40))

#wrap Datasets names to look pretty on the graph
sensiVariationsPlot$wrappedData = str_wrap(sensiVariationsPlot$Dataset, width = 10)
#this graphs displays the variations in sensitivity grouped by dataset on the x axis
ggplot(data = sensiVariationsPlot, aes(x=wrappedData, y= Variation, fill = Condition)) +geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values = wes_palette(n=3, name = "GrandBudapest1")) + xlab("Datasets") + ylab("Variation")
ggsave("Chapter5/SensiVariationUnderBySets.png", width = 8, height =10, dpi = 300)


#this table to gather all the precision data for the ggplot
preciVariationsPlots <- data.frame(Dataset = c("Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                               "Low Back Pain","Liver","modHA","modLBP",
                                               "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                               "Low Back Pain","Liver","modHA","modLBP",
                                               "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                               "Low Back Pain","Liver","modHA","modLBP"),
                                   Condition = c("75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", 
                                                 "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %",
                                                 "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %"),
                                   Variation = c(VariationsUnderDf$PreciVariation75,
                                                 VariationsUnderDf$PreciVariation60,
                                                 VariationsUnderDf$PreciVariation40))
#wrap datasets names to look pretty
preciVariationsPlots$wrappedData = str_wrap(preciVariationsPlots$Dataset, width = 10)
#this graphs displays the variations in precisions grouped by dataset on the x axis
ggplot(data = preciVariationsPlots, aes(x=wrappedData, y = Variation, fill= Condition)) + geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values = wes_palette(n=3, name = "GrandBudapest1")) + xlab("Datasets") + ylab("Variation")
ggsave("Chapter5/PreciVariationUnderBySets.png", width = 8, height=10, dpi=300)


#this table to gather all the F1 score data for the ggplot
F1VariationsPlots <- data.frame(Dataset = c("Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                            "Low Back Pain","Liver","modHA","modLBP",
                                            "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                            "Low Back Pain","Liver","modHA","modLBP",
                                            "Autism","Breast Cancer","Cervical Cancer", "Diabetes", "Fertility","Heart Attack",
                                            "Low Back Pain","Liver","modHA","modLBP"),
                                Condition = c("75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", "75 %", 
                                              "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %", "60 %",
                                              "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %", "40 %"),
                                Variation = c(VariationsUnderDf$F1Variation75,
                                              VariationsUnderDf$F1Variation60,
                                              VariationsUnderDf$F1Variation40))

#wrap datasets names to look pretty
F1VariationsPlots$wrappedData = str_wrap(F1VariationsPlots$Dataset, width = 10)
#this graphs displays the variations in F1 score grouped by dataset on the x axis
ggplot(data = F1VariationsPlots, aes(x = wrappedData, y = Variation, fill = Condition)) + geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values = wes_palette(n=3, name="GrandBudapest1")) + xlab("Datasets") + ylab("Variation")
ggsave("Chapter5/F1VariationUnderBySets.png", width = 8, height = 10, dpi = 300)

