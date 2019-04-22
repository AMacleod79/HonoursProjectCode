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


accuVariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                               Variation75 = VariationsUnderDf$AccuVariation75,
                               Variation60 = VariationsUnderDf$AccuVariation60,
                               Variation40 = VariationsUnderDf$AccuVariation40)

sensiVariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                                Variation75 = VariationsUnderDf$SensiVariation75,
                                Variation60 = VariationsUnderDf$SensiVariation60,
                                Variation40 = VariationsUnderDf$SensiVariation40)
preciVariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                                Variation75 = VariationsUnderDf$PreciVariation75,
                                Variation60 = VariationsUnderDf$PreciVariation60,
                                Variation40 = VariationsUnderDf$PreciVariation40)
F1VariationsDf <- data.frame(Dataset = RfResDf$Dataset,
                             Variation75 = VariationsUnderDf$F1Variation75,
                             Variation60 = VariationsUnderDf$F1Variation60,
                             Variation40 = VariationsUnderDf$F1Variation40)

accuVariationsPlot <- data.frame(Dataset = c("Autism", "Autism", "Autism",
                                            "Breast Cancer", "Breast Cancer", "Breast Cancer",
                                            "Cervical Cancer", "Cervical Cancer", "Cervical Cancer",
                                            "Diabetes", "Diabetes", "Diabetes",
                                            "Fertility", "Fertility", "Fertility",
                                            "Heart Attack", "Heart Attack", "Heart Attack",
                                            "Low Back Pain", "Low Back Pain", "Low Back Pain",
                                            "Liver", "Liver", "Liver",
                                            "modHA","modHA", "modHA",
                                            "modLBP","modLBP", "modLBP"),
                                 Condition = c("75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %",
                                               "75 %", "60 %", "40 %"),
                                 Variation = c(VariationsUnderDf$AccuVariation75,
                                               VariationsUnderDf$AccuVariation60,
                                               VariationsUnderDf$AccuVariation40))
library(ggplot2)
ggplot(data = accuVariationsPlot, aes(x=Condition, y = Variation , fill = Dataset))+ geom_bar(stat="identity",position = position_dodge())
ggsave("Figures/Chapter5/AccuVariationUnder.png", width = 16, height =25, dpi = 200)
#need to change the colours to make it  more legible, also change the aspect ratio?
#repeat for other metrics

