setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Performance")
getwd()
list.files()

source("VariationsGraph.R")
setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode")
source("OverSamplingGraphs.R")

setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Performance")

#get the metrics for each datasets abd for all conditions
#for undersampling
BCData <- VariationsUnderDf[VariationsUnderDf$Dataset=="BCDf",]
CCData <- VariationsUnderDf[VariationsUnderDf$Dataset=="CCDf",]
DiabetesData <- VariationsUnderDf[VariationsUnderDf$Dataset=="DiabetesDf",]
FertData <- VariationsUnderDf[VariationsUnderDf$Dataset=="FertDf",]
HAData <- VariationsUnderDf[VariationsUnderDf$Dataset=="HAPDf",]
LBPData <- VariationsUnderDf[VariationsUnderDf$Dataset=="LBPDf",]
LiverData <- VariationsUnderDf[VariationsUnderDf$Dataset=="LiverDf",]
subHAData <- VariationsUnderDf[VariationsUnderDf$Dataset=="subHAPDf",]
subLBPData <- VariationsUnderDf[VariationsUnderDf$Dataset=="subLBPDf",]

setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode")

#for oversampling
BCDataOver <- overVariations2[overVariations2$Dataset=="BCDf",]
CCDataOver <- overVariations2[overVariations2$Dataset=="CCDf",]
DiaDataOver <- overVariations2[overVariations2$Dataset=="DiabetesDf",]
HADataOver <- overVariations2[overVariations2$Dataset=="HAPDf",]
LBPDataOver <- overVariations2[overVariations2$Dataset=="LBPDf",]
LiverDataOver <- overVariations2[overVariations2$Dataset=="LiverDf",]
subHADataOver <- overVariations2[overVariations2$Dataset=="subHAPDf",]
subLBPDataOver <- overVariations2[overVariations2$Dataset=="subLBPDf",]
FertDataOver <- overVariations2[overVariations2$Dataset=="FertDf",]

setwd("/Users/annabelle/Documents/HonoursYear/HonoursProject/HonoursProjectCode/Performance")

#then  merge undersampling and oversampling df
BCData$AccuOver <- BCDataOver$AccuVariation
BCData$SensiOver <- BCDataOver$SensiVariation
BCData$PreciOver <- BCDataOver$PreciVariation
BCData$F1Over <- BCDataOver$F1Variation

CCData$AccuOver <- CCDataOver$AccuVariation
CCData$SensiOver <- CCDataOver$SensiVariation
CCData$PreciOver <- CCDataOver$PreciVariation
CCData$F1Over <- CCDataOver$F1Variation

DiabetesData$AccuOver <- DiaDataOver$AccuVariation
DiabetesData$SensiOver <- DiaDataOver$SensiVariation
DiabetesData$PreciOver <- DiaDataOver$PreciVariation
DiabetesData$F1Over <- DiaDataOver$F1Variation

HAData$AccuOver <- HADataOver$AccuVariation
HAData$SensiOver <- HADataOver$SensiVariation
HAData$PreciOver <- HADataOver$PreciVariation
HAData$F1Over <- HADataOver$F1Variation

LBPData$AccuOver <- LBPDataOver$AccuVariation
LBPData$SensiOver <- LBPDataOver$SensiVariation
LBPData$PreciOver <- LBPDataOver$PreciVariation
LBPData$F1Over <- LBPDataOver$F1Variation

LiverData$AccuOver <- LiverDataOver$AccuVariation
LiverData$SensiOver <- LiverDataOver$SensiVariation
LiverData$PreciOver <- LiverDataOver$PreciVariation
LiverData$F1Over <- LiverDataOver$F1Variation

subHAData$AccuOver <- subHADataOver$AccuVariation
subHAData$SensiOver <- subHADataOver$SensiVariation
subHAData$PreciOver <- subHADataOver$PreciVariation
subHAData$F1Over <- subHADataOver$F1Variation

subLBPData$AccuOver <- subLBPDataOver$AccuVariation
subLBPData$SensiOver <- subLBPDataOver$SensiVariation
subLBPData$PreciOver <- subLBPDataOver$PreciVariation
subLBPData$F1Over <- subLBPDataOver$F1Variation

FertData$AccuOver <- FertDataOver$AccuVariation
FertData$SensiOver <- FertDataOver$SensiVariation
FertData$PreciOver <- FertDataOver$PreciVariation
FertData$F1Over <- FertDataOver$F1Variation



#create the metric and condition labels
Metric <- c("Accuracy", "Sensitivity", "Precision", "F1 Score")
Condition <-c("Under40", "Under40", "Under40", "Under40", 
              "Under60", "Under60", "Under60", "Under60",
              "Under75", "Under75", "Under75", "Under75",
              "Over","Over", "Over", "Over")

#Rearrange the data so it can be used with ggplot 
#Breast Cancer plot
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


#Cervical Cancer plot
CCData40 <- data.frame(Metric= (Metric),
                       Variation=c(CCData$AccuVariation40, 
                                   CCData$SensiVariation40,
                                   CCData$PreciVariation40,
                                   CCData$F1Variation40)
)
CCData60 <- data.frame(Metric=Metric,
                       Variation=c(CCData$AccuVariation60,
                                   CCData$SensiVariation60,
                                   CCData$PreciVariation60,
                                   CCData$F1Variation60))
CCData75 <- data.frame(Metric=Metric,
                       Variation=c(CCData$AccuVariation75,
                                   CCData$SensiVariation75,
                                   CCData$PreciVariation75,
                                   CCData$F1Variation75))
CCDataOver <- data.frame(Metric = Metric,
                         Variation =c(CCData$AccuOver,
                                      CCData$SensiOver,
                                      CCData$PreciOver,
                                      CCData$F1Over))

#diabetes 
DiabetesData40 <- data.frame(Metric= (Metric),
                       Variation=c(DiabetesData$AccuVariation40, 
                                   DiabetesData$SensiVariation40,
                                   DiabetesData$PreciVariation40,
                                   DiabetesData$F1Variation40)
)
DiabetesData60 <- data.frame(Metric=Metric,
                       Variation=c(DiabetesData$AccuVariation60,
                                   DiabetesData$SensiVariation60,
                                   DiabetesData$PreciVariation60,
                                   DiabetesData$F1Variation60))
DiabetesData75 <- data.frame(Metric=Metric,
                       Variation=c(DiabetesData$AccuVariation75,
                                   DiabetesData$SensiVariation75,
                                   DiabetesData$PreciVariation75,
                                   DiabetesData$F1Variation75))
DiabetesDataOver <- data.frame(Metric = Metric,
                         Variation =c(DiabetesData$AccuOver,
                                      DiabetesData$SensiOver,
                                      DiabetesData$PreciOver,
                                      DiabetesData$F1Over))

#Heart Attack
HAData40 <- data.frame(Metric= (Metric),
                             Variation=c(HAData$AccuVariation40, 
                                         HAData$SensiVariation40,
                                         HAData$PreciVariation40,
                                         HAData$F1Variation40)
)
HAData60 <- data.frame(Metric=Metric,
                             Variation=c(HAData$AccuVariation60,
                                         HAData$SensiVariation60,
                                         HAData$PreciVariation60,
                                         HAData$F1Variation60))
HAData75 <- data.frame(Metric=Metric,
                             Variation=c(HAData$AccuVariation75,
                                         HAData$SensiVariation75,
                                         HAData$PreciVariation75,
                                         HAData$F1Variation75))
HADataOver <- data.frame(Metric = Metric,
                               Variation =c(HAData$AccuOver,
                                            HAData$SensiOver,
                                            HAData$PreciOver,
                                            HAData$F1Over))
#Low Back Pain
LBPData40 <- data.frame(Metric= (Metric),
                       Variation=c(LBPData$AccuVariation40, 
                                   LBPData$SensiVariation40,
                                   LBPData$PreciVariation40,
                                   LBPData$F1Variation40)
)
LBPData60 <- data.frame(Metric=Metric,
                       Variation=c(LBPData$AccuVariation60,
                                   LBPData$SensiVariation60,
                                   LBPData$PreciVariation60,
                                   LBPData$F1Variation60))
LBPData75 <- data.frame(Metric=Metric,
                       Variation=c(LBPData$AccuVariation75,
                                   LBPData$SensiVariation75,
                                   LBPData$PreciVariation75,
                                   LBPData$F1Variation75))
LBPDataOver <- data.frame(Metric = Metric,
                         Variation =c(LBPData$AccuOver,
                                      LBPData$SensiOver,
                                      LBPData$PreciOver,
                                      LBPData$F1Over))

#Liver
LiverData40 <- data.frame(Metric= (Metric),
                        Variation=c(LiverData$AccuVariation40, 
                                    LiverData$SensiVariation40,
                                    LiverData$PreciVariation40,
                                    LiverData$F1Variation40)
)
LiverData60 <- data.frame(Metric=Metric,
                        Variation=c(LiverData$AccuVariation60,
                                    LiverData$SensiVariation60,
                                    LiverData$PreciVariation60,
                                    LiverData$F1Variation60))
LiverData75 <- data.frame(Metric=Metric,
                        Variation=c(LiverData$AccuVariation75,
                                    LiverData$SensiVariation75,
                                    LiverData$PreciVariation75,
                                    LiverData$F1Variation75))
LiverDataOver <- data.frame(Metric = Metric,
                          Variation =c(LiverData$AccuOver,
                                       LiverData$SensiOver,
                                       LiverData$PreciOver,
                                       LiverData$F1Over))
#modified HA

subHAData40 <- data.frame(Metric= (Metric),
                          Variation=c(subHAData$AccuVariation40, 
                                      subHAData$SensiVariation40,
                                      subHAData$PreciVariation40,
                                      subHAData$F1Variation40)
)
subHAData60 <- data.frame(Metric=Metric,
                          Variation=c(subHAData$AccuVariation60,
                                      subHAData$SensiVariation60,
                                      subHAData$PreciVariation60,
                                      subHAData$F1Variation60))
subHAData75 <- data.frame(Metric=Metric,
                          Variation=c(subHAData$AccuVariation75,
                                      subHAData$SensiVariation75,
                                      subHAData$PreciVariation75,
                                      subHAData$F1Variation75))
subHADataOver <- data.frame(Metric = Metric,
                            Variation =c(subHAData$AccuOver,
                                         subHAData$SensiOver,
                                         subHAData$PreciOver,
                                         subHAData$F1Over))

#subLBP
subLBPData40 <- data.frame(Metric= (Metric),
                          Variation=c(subLBPData$AccuVariation40, 
                                      subLBPData$SensiVariation40,
                                      subLBPData$PreciVariation40,
                                      subLBPData$F1Variation40)
)
subLBPData60 <- data.frame(Metric=Metric,
                          Variation=c(subLBPData$AccuVariation60,
                                      subLBPData$SensiVariation60,
                                      subLBPData$PreciVariation60,
                                      subLBPData$F1Variation60))
subLBPData75 <- data.frame(Metric=Metric,
                          Variation=c(subLBPData$AccuVariation75,
                                      subLBPData$SensiVariation75,
                                      subLBPData$PreciVariation75,
                                      subLBPData$F1Variation75))
subLBPDataOver <- data.frame(Metric = Metric,
                            Variation =c(subLBPData$AccuOver,
                                         subLBPData$SensiOver,
                                         subLBPData$PreciOver,
                                         subLBPData$F1Over))
#fertility
FertData40 <- data.frame(Metric= (Metric),
                           Variation=c(FertData$AccuVariation40, 
                                       FertData$SensiVariation40,
                                       FertData$PreciVariation40,
                                       FertData$F1Variation40)
)
FertData60 <- data.frame(Metric=Metric,
                           Variation=c(FertData$AccuVariation60,
                                       FertData$SensiVariation60,
                                       FertData$PreciVariation60,
                                       FertData$F1Variation60))
FertData75 <- data.frame(Metric=Metric,
                           Variation=c(FertData$AccuVariation75,
                                       FertData$SensiVariation75,
                                       FertData$PreciVariation75,
                                       FertData$F1Variation75))
FertDataOver <- data.frame(Metric = Metric,
                             Variation =c(FertData$AccuOver,
                                          FertData$SensiOver,
                                          FertData$PreciOver,
                                          FertData$F1Over))


#combine into one big dataframe
BCDataAll <- rbind(BCData40, BCData60, BCData75, BCDataOver)
BCDataAll$Condition <- Condition
BCDataAll$Dataset <-c("Breast Cancer", "Breast Cancer", "Breast Cancer", "Breast Cancer",
                     "Breast Cancer", "Breast Cancer", "Breast Cancer", "Breast Cancer",
                     "Breast Cancer", "Breast Cancer", "Breast Cancer", "Breast Cancer",
                     "Breast Cancer", "Breast Cancer", "Breast Cancer", "Breast Cancer")

CCDataAll <- rbind(CCData40, CCData60, CCData75, CCDataOver)
CCDataAll$Condition <- Condition
CCDataAll$Dataset <- c("Cervical Cancer", "Cervical Cancer", "Cervical Cancer", "Cervical Cancer",
                       "Cervical Cancer", "Cervical Cancer", "Cervical Cancer", "Cervical Cancer",
                       "Cervical Cancer", "Cervical Cancer", "Cervical Cancer", "Cervical Cancer",
                       "Cervical Cancer", "Cervical Cancer", "Cervical Cancer", "Cervical Cancer")

DiabetesDataAll <- rbind(DiabetesData40, DiabetesData60, DiabetesData75, DiabetesDataOver)
DiabetesDataAll$Condition <- Condition
DiabetesDataAll$Dataset <-c("Diabetes", "Diabetes", "Diabetes", "Diabetes",
                            "Diabetes", "Diabetes", "Diabetes", "Diabetes",
                            "Diabetes", "Diabetes", "Diabetes", "Diabetes",
                            "Diabetes", "Diabetes", "Diabetes", "Diabetes")


HADataAll <- rbind(HAData40, HAData60, HAData75, HADataOver)
HADataAll$Condition <- Condition
HADataAll$Dataset <- c("Heart Attack", "Heart Attack", "Heart Attack", "Heart Attack",
               "Heart Attack", "Heart Attack", "Heart Attack", "Heart Attack",
               "Heart Attack", "Heart Attack", "Heart Attack", "Heart Attack",
               "Heart Attack", "Heart Attack", "Heart Attack", "Heart Attack")

LBPDataAll <- rbind(LBPData40, LBPData60, LBPData75, LBPDataOver)
LBPDataAll$Condition <- Condition
LBPDataAll$Dataset <- c("Low Back Pain", "Low Back Pain", "Low Back Pain", "Low Back Pain",
                "Low Back Pain", "Low Back Pain", "Low Back Pain", "Low Back Pain",
                "Low Back Pain", "Low Back Pain", "Low Back Pain", "Low Back Pain",
                "Low Back Pain", "Low Back Pain", "Low Back Pain", "Low Back Pain")



LiverDataAll <- rbind(LiverData40, LiverData60, LiverData75, LiverDataOver)
LiverDataAll$Condition <- Condition
LiverDataAll$Dataset <- c("Liver", "Liver", "Liver", "Liver",
                  "Liver", "Liver", "Liver", "Liver",
                  "Liver", "Liver", "Liver", "Liver",
                  "Liver", "Liver", "Liver", "Liver")

subHADataAll <- rbind(subHAData40, subHAData60, subHAData75, subHADataOver)
subHADataAll$Condition <- Condition
subHADataAll$Dataset <- c("modified Heart Attack", "modified Heart Attack", "modified Heart Attack", "modified Heart Attack",
                          "modified Heart Attack", "modified Heart Attack", "modified Heart Attack", "modified Heart Attack",
                          "modified Heart Attack", "modified Heart Attack", "modified Heart Attack", "modified Heart Attack",
                          "modified Heart Attack", "modified Heart Attack", "modified Heart Attack", "modified Heart Attack")

subLBPDataAll <- rbind(subLBPData40, subLBPData60, subLBPData75, subLBPDataOver)
subLBPDataAll$Condition <- Condition
subLBPDataAll$Dataset <- c("modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain",
                           "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain",
                           "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain",
                           "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain", "modified Low Back Pain")

FertDataAll <- rbind(FertData40, FertData60, FertData75, FertDataOver)
FertDataAll$Condition <- Condition
FertDataAll$Dataset <- c("Fertility", "Fertility", "Fertility", "Fertility",
                         "Fertility", "Fertility", "Fertility", "Fertility",
                         "Fertility", "Fertility", "Fertility", "Fertility",
                         "Fertility", "Fertility", "Fertility", "Fertility")


#all together now
AllMetric <- rbind(BCDataAll, CCDataAll, DiabetesDataAll, HADataAll, LBPDataAll, LiverDataAll, subHADataAll, subLBPDataAll, FertDataAll)
colnames(AllMetric)
str(AllMetric)


tail(AllMetric)
library(ggplot2)
library(wesanderson)


# ggplot(data = BCData40, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
# ggsave("BCData40.png", width = 4, height=6, dpi=150)
# ggplot(data = BCData60, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
# ggsave("BCData60.png", width = 4, height=6, dpi=150)
# ggplot(data = BCData75, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
# ggsave("BCData75.png", width = 4, height=6, dpi=150)
# ggplot(data = BCDataOver, aes(x=Metric, y=Variation, fill= Metric )) + geom_bar(stat="identity") + scale_fill_manual(values=wes_palette(n=4, name="GrandBudapest1")) + xlab("Metrics") + ylab("Variation")
# ggsave("BCDataOver.png", width = 4, height=6, dpi=150)
# 
# 

install.packages("ggplot2")
library(ggplot2)

ggplot(data=AllMetric, aes(x=Metric, y = Variation, fill= Metric)) + geom_bar(stat="identity", position = position_dodge())+ scale_fill_manual(values=wes_palette(n=4, name = "GrandBudapest1"))  + xlab("Metrics") + ylab("Variation") + facet_grid(Condition ~ Dataset) + theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("AllMetrics.png", width = 10, height=8, dpi=200)

ggplot(data=BCDataAll, aes(x=Metric, y = Variation, fill= Metric)) + geom_bar(stat="identity", position = position_dodge()) + scale_fill_manual(values=wes_palette(n=4, name = "GrandBudapest1")) + xlab("Metrics") + ylab("Variation") + facet_grid(.~ Condition)
ggsave("BCDataAll.png", width = 10, height=6, dpi=200)

