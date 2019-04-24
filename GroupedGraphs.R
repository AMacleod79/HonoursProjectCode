setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Performance")
getwd()
list.files()

source("VariationsGraph.R")
setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode")
source("OverSamplingGraphs.R")

setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Performance")


BCData <- VariationsUnderDf[VariationsUnderDf$Dataset=="BCDf",]
CCData <- VariationsUnderDf[VariationsUnderDf$Dataset=="CCDf",]
DiabetesData <- VariationsUnderDf[VariationsUnderDf$Dataset=="DiabetesDf",]
FertData <- VariationsUnderDf[VariationsUnderDf$Dataset=="FertDf",]
HAData <- VariationsUnderDf[VariationsUnderDf$Dataset=="HAPDf",]
LBPData <- VariationsUnderDf[VariationsUnderDf$Dataset=="LBPDf",]
LiverData <- VariationsUnderDf[VariationsUnderDf$Dataset=="LiverDf",]
subHAData <- VariationsUnderDf[VariationsUnderDf$Dataset=="subHAPDf",]
subLBPData <- VariationsUnderDf[VariationsUnderDf$Dataset=="subLBPDf",]

BCDataOver <- overVariations2[overVariations2$Dataset=="BCDf",]
CCDataOver <- overVariations2[overVariations2$Dataset=="CCDf",]
DiaDataOver <- overVariations2[overVariations2$Dataset=="DiabetesDf",]
HADataOver <- overVariations2[overVariations2$Dataset=="HAPDf",]
LBPDataOver <- overVariations2[overVariations2$Dataset=="LBPDf",]
LiverDataOver <- overVariations2[overVariations2$Dataset=="LiverDf",]
subHAData <- overVariations2[overVariations2$Dataset=="subHAPDf",]
subLBPData <- overVariations2[overVariations2$Dataset=="subLBPDf",]
FertDatOver <- overVariations2[overVariations2$Dataset=="FertDf",]

BCData$AccuOver <- BCDataOver$AccuVariation
BCData$SensiOver <- BCDataOver$SensiVariation
BCData$PreciOver <- BCDataOver$PreciVariation
BCData$F1Over <- BCDataOver$F1Variation
Metric <- c("Accuracy", "Sensitivity", "Precision", "F1 Score")
Condition <-c("Under40", "Under40", "Under40", "Under40", 
              "Under60", "Under60", "Under60", "Under60",
              "Under75", "Under75", "Under75", "Under75",
              "Over","Over", "Over", "Over")
BCData40 <- data.frame(Metric= (Metric),
                       Variation=c(BCData$AccuVariation40, 
                                  BCData$SensiVariation40,
                                  BCData$PreciVariation40,
                                  BCData$F1Variation40)
                       )
BCData60 <- data.frame(Metric=Metric,
                       Variation=c(BCData$AccuVariation60,
                                   BCData$SensiVariation60,
                                   BCData$PreciVariation60,
                                   BCData$F1Variation60))
BCData75 <- data.frame(Metric=Metric,
                       Variation=c(BCData$AccuVariation75,
                                   BCData$SensiVariation75,
                                   BCData$PreciVariation75,
                                   BCData$F1Variation75))
BCDataOver <- data.frame(Metric = Metric,
                         Variation =c(BCData$AccuOver,
                                      BCData$SensiOver,
                                      BCData$PreciOver,
                                      BCData$F1Over))



library(ggplot2)
library(wesanderson)

remove.packages("cowplot")
remove.packages("gridExtra")
theme_set(theme_gray())
ggplot(data = BCData40, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
ggsave("BCData40.png", width = 4, height=6, dpi=150)
ggplot(data = BCData60, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
ggsave("BCData60.png", width = 4, height=6, dpi=150)
ggplot(data = BCData75, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
ggsave("BCData75.png", width = 4, height=6, dpi=150)
ggplot(data = BCDataOver, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
ggsave("BCDataOver.png", width = 4, height=6, dpi=150)



BCDataAll <- rbind(BCData40, BCData60, BCData75, BCDataOver)
BCDataAll$Condition <- Condition

ggplot(data=BCDataAll, aes(x=Metric, y = Variation, fill= Metric)) + geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values=wes_palette(n=4, name = "GrandBudapest1")) + xlab("Metrics") + ylab("Variation") + facet_grid(.~ Condition)
ggsave("BCDataAll.png", width = 10, height=6, dpi=200)
