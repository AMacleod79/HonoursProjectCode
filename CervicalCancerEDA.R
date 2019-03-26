#script for the cervical cancer  dataset data preprocessing

#packages
#install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

#upload the cervical cancer dataset
CCDf <- read.csv(file="Datasets/kag_risk_factors_cervical_cancer.csv", header = TRUE, sep=",")

cat("Shape of CCDf is: ", dim(CCDf))
head(CCDf)
summary(CCDf)
colnames(CCDf)
str(CCDf)

CCDf[!complete.cases(CCDf),]

# reduce the number of factors so as not exceed 53 for RF
#convert to numeric
CCDf$Smokes..packs.year.<- as.numeric(as.character(CCDf$Smokes..packs.year.))
CCDf$Smokes..packs.year.


#change all values less than 1 to 0
CCDf$Smokes..packs.year.[CCDf$Smokes..packs.year.<1] <- 0
#change na values to mean value for the column
CCDf$Smokes..packs.year.[is.na(CCDf$Smokes..packs.year.)]<- mean(CCDf$Smokes..packs.year., na.rm = TRUE)
CCDf$Smokes..packs.year. <- as.factor(CCDf$Smokes..packs.year.)
levels(CCDf$Smokes..packs.year.)

#number of sexual partners
CCDf$Number.of.sexual.partners <- as.numeric(as.character(CCDf$Number.of.sexual.partners))
CCDf$Number.of.sexual.partners[is.na(CCDf$Number.of.sexual.partners)]<- mean(CCDf$Number.of.sexual.partners, na.rm = TRUE)
CCDf$Number.of.sexual.partners <- as.factor((CCDf$Number.of.sexual.partners))

#first sexual intercourse
CCDf$First.sexual.intercourse <- as.numeric(as.character(CCDf$First.sexual.intercourse))
CCDf$First.sexual.intercourse[is.na(CCDf$First.sexual.intercourse)]<- mean(CCDf$First.sexual.intercourse, na.rm = TRUE)
CCDf$First.sexual.intercourse <- as.factor((CCDf$First.sexual.intercourse))
levels(CCDf$First.sexual.intercourse)

#number of pregnancies
CCDf$Num.of.pregnancies <- as.numeric(as.character(CCDf$Num.of.pregnancies))
CCDf$Num.of.pregnancies[is.na(CCDf$Num.of.pregnancies)]<- mean(CCDf$Num.of.pregnancies, na.rm = TRUE)
CCDf$Num.of.pregnancies <- as.factor((CCDf$Num.of.pregnancies))
levels(CCDf$Num.of.pregnancies)

#smokes
CCDf$Smokes <- as.numeric(as.character(CCDf$Smokes))
CCDf$Smokes[is.na(CCDf$Smokes)]<- mean(CCDf$Smokes, na.rm = TRUE)
CCDf$Smokes <- as.factor((CCDf$Smokes))
levels(CCDf$Smokes)

#smokes years
CCDf$Smokes..years. <- as.numeric(as.character(CCDf$Smokes..years.))
CCDf$Smokes..years.[is.na(CCDf$Smokes..years.)]<- mean(CCDf$Smokes..years., na.rm = TRUE)
CCDf$Smokes..years. <- as.factor((CCDf$Smokes..years.))
levels(CCDf$Smokes..years.)

#hormonal contraceptive
CCDf$Hormonal.Contraceptives <- as.numeric(as.character(CCDf$Hormonal.Contraceptives))
CCDf$Hormonal.Contraceptives[is.na(CCDf$Hormonal.Contraceptives)]<- mean(CCDf$Hormonal.Contraceptives, na.rm = TRUE)
CCDf$Hormonal.Contraceptives<- as.factor((CCDf$Hormonal.Contraceptives))
levels(CCDf$Hormonal.Contraceptives)

#hormonal contraceptive years
CCDf$Hormonal.Contraceptives..years. <- as.numeric(as.character(CCDf$Hormonal.Contraceptives..years.))
CCDf$Hormonal.Contraceptives..years.[is.na(CCDf$Hormonal.Contraceptives..years.)]<- mean(CCDf$Hormonal.Contraceptives..years., na.rm = TRUE)
CCDf$Hormonal.Contraceptives..years.<- as.factor((CCDf$Hormonal.Contraceptives..years.))
levels(CCDf$Hormonal.Contraceptives..years.)

#IUD
CCDf$IUD <- as.numeric(as.character(CCDf$IUD))
CCDf$IUD[is.na(CCDf$IUD)]<- mean(CCDf$IUD, na.rm = TRUE)
CCDf$IUD<- as.factor((CCDf$IUD))
levels(CCDf$IUD)

#IUD years
CCDf$IUD..years. <- as.numeric(as.character(CCDf$IUD..years.))
CCDf$IUD..years.[is.na(CCDf$IUD..years.)]<- mean(CCDf$IUD..years., na.rm = TRUE)
CCDf$IUD..years.<- as.factor((CCDf$IUD..years.))
levels(CCDf$IUD..years.)

#STDS
CCDf$STDs <- as.numeric(as.character(CCDf$STDs))
CCDf$STDs[is.na(CCDf$STDs)]<- mean(CCDf$STDs, na.rm = TRUE)
CCDf$STDs<- as.factor((CCDf$STDs))
levels(CCDf$STDs)

#STDs number
CCDf$STDs..number. <- as.numeric(as.character(CCDf$STDs..number.))
CCDf$STDs..number.[is.na(CCDf$STDs..number.)]<- mean(CCDf$STDs..number., na.rm = TRUE)
CCDf$STDs..number.<- as.factor((CCDf$STDs..number.))
levels(CCDf$STDs..number.)

#STDs condylomatosis
CCDf$STDs.condylomatosis <- as.numeric(as.character(CCDf$STDs.condylomatosis))
CCDf$STDs.condylomatosis[is.na(CCDf$STDs.condylomatosis)]<- mean(CCDf$STDs.condylomatosis, na.rm = TRUE)
CCDf$STDs.condylomatosis<- as.factor((CCDf$STDs.condylomatosis))
levels(CCDf$STDs.condylomatosis)

#STDs cervical condylomatosis
CCDf$STDs.cervical.condylomatosis <- as.numeric(as.character(CCDf$STDs.cervical.condylomatosis))
CCDf$STDs.cervical.condylomatosis[is.na(CCDf$STDs.cervical.condylomatosis)]<- mean(CCDf$STDs.cervical.condylomatosis, na.rm = TRUE)
CCDf$STDs.cervical.condylomatosis<- as.factor((CCDf$STDs.cervical.condylomatosis))
levels(CCDf$STDs.cervical.condylomatosis)

#STDs vaginal condylomatosis
CCDf$STDs.vaginal.condylomatosis <- as.numeric(as.character(CCDf$STDs.vaginal.condylomatosis))
CCDf$STDs.vaginal.condylomatosis[is.na(CCDf$STDs.vaginal.condylomatosis)]<- mean(CCDf$STDs.vaginal.condylomatosis, na.rm = TRUE)
CCDf$STDs.vaginal.condylomatosis<- as.factor((CCDf$STDs.vaginal.condylomatosis))
levels(CCDf$STDs.vaginal.condylomatosis)

#STDs vulvo perineal condylomatosis
CCDf$STDs.vulvo.perineal.condylomatosis <- as.numeric(as.character(CCDf$STDs.vulvo.perineal.condylomatosis))
CCDf$STDs.vulvo.perineal.condylomatosis[is.na(CCDf$STDs.vulvo.perineal.condylomatosis)]<- mean(CCDf$STDs.vulvo.perineal.condylomatosis, na.rm = TRUE)
CCDf$STDs.vulvo.perineal.condylomatosis<- as.factor((CCDf$STDs.vulvo.perineal.condylomatosis))
levels(CCDf$STDs.vulvo.perineal.condylomatosis)

#STDs syphilis
CCDf$STDs.syphilis <- as.numeric(as.character(CCDf$STDs.syphilis))
CCDf$STDs.syphilis[is.na(CCDf$STDs.syphilis)]<- mean(CCDf$STDs.syphilis, na.rm = TRUE)
CCDf$STDs.syphilis<- as.factor((CCDf$STDs.syphilis))
levels(CCDf$STDs.syphilis)

#STDs PID
CCDf$STDs.pelvic.inflammatory.disease <- as.numeric(as.character(CCDf$STDs.pelvic.inflammatory.disease))
CCDf$STDs.pelvic.inflammatory.disease[is.na(CCDf$STDs.pelvic.inflammatory.disease)]<- mean(CCDf$STDs.pelvic.inflammatory.disease, na.rm = TRUE)
CCDf$STDs.pelvic.inflammatory.disease<- as.factor((CCDf$STDs.pelvic.inflammatory.disease))
levels(CCDf$STDs.pelvic.inflammatory.disease)

#STDs genital herpes
CCDf$STDs.genital.herpes <- as.numeric(as.character(CCDf$STDs.genital.herpes))
CCDf$STDs.genital.herpes[is.na(CCDf$STDs.genital.herpes)]<- mean(CCDf$STDs.genital.herpes, na.rm = TRUE)
CCDf$STDs.genital.herpes <- as.factor((CCDf$STDs.genital.herpes))
levels(CCDf$STDs.genital.herpes)

#STDs molluscum contagiosum
CCDf$STDs.molluscum.contagiosum <- as.numeric(as.character(CCDf$STDs.molluscum.contagiosum))
CCDf$STDs.molluscum.contagiosum[is.na(CCDf$STDs.molluscum.contagiosum)]<- mean(CCDf$STDs.molluscum.contagiosum, na.rm = TRUE)
CCDf$STDs.molluscum.contagiosum <- as.factor((CCDf$STDs.molluscum.contagiosum))
levels(CCDf$STDs.molluscum.contagiosum)

#STDs AIDS
CCDf$STDs.AIDS <- as.numeric(as.character(CCDf$STDs.AIDS))
CCDf$STDs.AIDS[is.na(CCDf$STDs.AIDS)]<- mean(CCDf$STDs.AIDS, na.rm = TRUE)
CCDf$STDs.AIDS<- as.factor((CCDf$STDs.AIDS))
levels(CCDf$STDs.AIDS)

#STDs HIV
CCDf$STDs.HIV <- as.numeric(as.character(CCDf$STDs.HIV))
CCDf$STDs.HIV[is.na(CCDf$STDs.HIV)]<- mean(CCDf$STDs.HIV, na.rm = TRUE)
CCDf$STDs.HIV<- as.factor((CCDf$STDs.HIV))
levels(CCDf$STDs.HIV)

#STDs Hep B
CCDf$STDs.Hepatitis.B <- as.numeric(as.character(CCDf$STDs.Hepatitis.B))
CCDf$STDs.Hepatitis.B[is.na(CCDf$STDs.Hepatitis.B)]<- mean(CCDf$STDs.Hepatitis.B, na.rm = TRUE)
CCDf$STDs.Hepatitis.B<- as.factor((CCDf$STDs.Hepatitis.B))
levels(CCDf$STDs.Hepatitis.B)

#STDs HPV
CCDf$STDs.HPV <- as.numeric(as.character(CCDf$STDs.HPV))
CCDf$STDs.HPV[is.na(CCDf$STDs.HPV)]<- mean(CCDf$STDs.HPV, na.rm = TRUE)
CCDf$STDs.HPV<- as.factor((CCDf$STDs.HPV))
levels(CCDf$STDs.HPV)

#STDs num diagnosis
CCDf$STDs..Number.of.diagnosis <- as.numeric(as.character(CCDf$STDs..Number.of.diagnosis))
CCDf$STDs..Number.of.diagnosis[is.na(CCDf$STDs..Number.of.diagnosis)]<- mean(CCDf$STDs..Number.of.diagnosis, na.rm = TRUE)
CCDf$STDs..Number.of.diagnosis<- as.factor((CCDf$STDs..Number.of.diagnosis))
levels(CCDf$STDs..Number.of.diagnosis)

#STDs Time since first
CCDf$STDs..Time.since.first.diagnosis <- as.numeric(as.character(CCDf$STDs..Time.since.first.diagnosis))
CCDf$STDs..Time.since.first.diagnosis[is.na(CCDf$STDs..Time.since.first.diagnosis)]<- mean(CCDf$STDs..Time.since.first.diagnosis, na.rm = TRUE)
CCDf$STDs..Time.since.first.diagnosis<- as.factor((CCDf$STDs..Time.since.first.diagnosis))
levels(CCDf$STDs..Time.since.first.diagnosis)

#STDS time since last
CCDf$STDs..Time.since.last.diagnosis <- as.numeric(as.character(CCDf$STDs..Time.since.last.diagnosis))
CCDf$STDs..Time.since.last.diagnosis[is.na(CCDf$STDs..Time.since.last.diagnosis)]<- mean(CCDf$STDs..Time.since.last.diagnosis, na.rm = TRUE)
CCDf$STDs..Time.since.last.diagnosis<- as.factor((CCDf$STDs..Time.since.last.diagnosis))
levels(CCDf$STDs..Time.since.last.diagnosis)

#class distribution
#there are four labels here (Hinselmann, Schiller, Citology and Biopsy) already expressed numerically as 0 or 1
#make new composite target label
CCDf$Label <- round((CCDf$Hinselmann +CCDf$Schiller + CCDf$Citology + CCDf$Biopsy)/4)

CCDfCount <- table(CCDf$Label)

#plot class distribution
png("Figures/figure4_9.png")
barplot(CCDfCount, beside = TRUE, ylim = c(0, 850), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
CCnRows <- nrow(CCDf)
CCDfCount[[1]] <- CCDfCount[[1]]/CCnRows*100
CCDfCount[[2]] <- CCDfCount[[2]]/CCnRows*100
png("Figures/figure4_10.png")
barplot(CCDfCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#save the modified dataset
write.csv(CCDf, file = "ModellingDatasets/CCDf.csv")

