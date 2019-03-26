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
HAPDf <- read.csv(file = "Datasets/HeartAttackData.csv", header = TRUE, sep=",")
cat("Shape of HAPDf is: ", dim(HAPDf))
head(HAPDf)
summary(HAPDf)
colnames(HAPDf)
cat(HAPDf$trestbps)
str(HAPDf)

# this appears to contain only the hungarian database (number of rows)
#class labels is expressed as 0 (no heart disease) or 1 -4 (heart disease ) in the num column
#found UCI document that explains the 1-4 a bit though still not clear on the cutoff and actual significance. Original database was only 1-0 but some of it looks corrupted?
max(HAPDf$num)
min(HAPDf$num)

# max and min of num column are 1 and O so looks like the diagnostic is binary after all.

#find missing data
HAPDf[!complete.cases(HAPDf),]


#trestbps
HAPDf$trestbps <- as.numeric(as.character(HAPDf$trestbps))
HAPDf$trestbps[is.na(HAPDf$trestbps)]<- mean(HAPDf$trestbps, na.rm = TRUE)
HAPDf$trestbps<- as.factor((HAPDf$trestbps))
levels(HAPDf$trestbps)

#fbs
HAPDf$fbs <- as.numeric(as.character(HAPDf$fbs))
HAPDf$fbs[is.na(HAPDf$fbs)]<- mean(HAPDf$fbs, na.rm = TRUE)
HAPDf$fbs<- as.factor((HAPDf$fbs))
levels(HAPDf$fbs)

#restecg
HAPDf$restecg <- as.numeric(as.character(HAPDf$restecg))
HAPDf$restecg[is.na(HAPDf$restecg)]<- mean(HAPDf$restecg, na.rm = TRUE)
HAPDf$restecg<- as.factor((HAPDf$restecg))
levels(HAPDf$restecg)

#exang
HAPDf$exang <- as.numeric(as.character(HAPDf$exang))
HAPDf$exang[is.na(HAPDf$exang)]<- mean(HAPDf$exang, na.rm = TRUE)
HAPDf$exang<- as.factor((HAPDf$exang))
levels(HAPDf$exang)

#slope
HAPDf$slope <- as.numeric(as.character(HAPDf$slope))
HAPDf$slope[is.na(HAPDf$slope)]<- mean(HAPDf$slope, na.rm = TRUE)
HAPDf$slope<- as.factor((HAPDf$slope))
levels(HAPDf$slope)

#ca
HAPDf$ca <- as.numeric(as.character(HAPDf$ca))
HAPDf$ca[is.na(HAPDf$ca)]<- mean(HAPDf$ca, na.rm = TRUE)
HAPDf$ca<- as.factor((HAPDf$ca))
levels(HAPDf$ca)

#thal
HAPDf$thal <- as.numeric(as.character(HAPDf$thal))
HAPDf$thal[is.na(HAPDf$thal)]<- mean(HAPDf$thal, na.rm = TRUE)
HAPDf$thal<- as.factor((HAPDf$thal))
levels(HAPDf$thal)


# reduce number of factors for cholesterol (there are 154)
levels(HAPDf$chol)
levelsChol <-as.numeric(as.character(levels(HAPDf$chol)))
sort(levelsChol, decreasing = FALSE)
HAPDf$chol<-as.numeric(as.character(HAPDf$chol))
#change na to mean for column
HAPDf$chol[is.na(HAPDf$chol)]<-250.8
HAPDf$chol[HAPDf$chol<100] <- 100
HAPDf$chol[HAPDf$chol<175 & HAPDf$chol>=150] <- 175
HAPDf$chol[HAPDf$chol<200 & HAPDf$chol>175]<-200
HAPDf$chol[HAPDf$chol>200 & HAPDf$chol<225]<-225
HAPDf$chol[HAPDf$chol>225 & HAPDf$chol<250]<-250
HAPDf$chol[HAPDf$chol>250 & HAPDf$chol<275]<-275
HAPDf$chol[HAPDf$chol>275 & HAPDf$chol<300]<-300
HAPDf$chol[HAPDf$chol>300 & HAPDf$chol<325]<-325
HAPDf$chol[HAPDf$chol>325 & HAPDf$chol<350]<-350
HAPDf$chol[HAPDf$chol>350 & HAPDf$chol<375]<-375
HAPDf$chol[HAPDf$chol>375 & HAPDf$chol<400]<-400
HAPDf$chol[HAPDf$chol>425 & HAPDf$chol<450]<-450
HAPDf$chol[HAPDf$chol>450 & HAPDf$chol<475]<-475
HAPDf$chol[HAPDf$chol>475 & HAPDf$chol<500]<-500
HAPDf$chol[HAPDf$chol>500 & HAPDf$chol<525]<-525
HAPDf$chol[HAPDf$chol>525 & HAPDf$chol<550]<-550
HAPDf$chol[HAPDf$chol>550 & HAPDf$chol<575]<-575
HAPDf$chol[HAPDf$chol>575 & HAPDf$chol<600]<-600

HAPDf$chol<-as.factor(HAPDf$chol)
levels(HAPDf$chol)

#reduce number of levels for thalach (there are 72)
levels(HAPDf$thalach)
HAPDf$thalach <- as.numeric(as.character(HAPDf$thalach))
#replace na by mean for column
HAPDf$thalach[is.na(HAPDf$thalach)]<- 139.1
HAPDf$thalach[HAPDf$thalach<=90]<-90
HAPDf$thalach[HAPDf$thalach >90 & HAPDf$thalach<=95]<-95
HAPDf$thalach[HAPDf$thalach >95 & HAPDf$thalach<=100]<-100
HAPDf$thalach[HAPDf$thalach >100 & HAPDf$thalach<=105]<-105
HAPDf$thalach[HAPDf$thalach >105 & HAPDf$thalach<=110]<-110
HAPDf$thalach[HAPDf$thalach >110 & HAPDf$thalach<=115]<-115
HAPDf$thalach[HAPDf$thalach >115 & HAPDf$thalach<=120]<-120
HAPDf$thalach[HAPDf$thalach >120 & HAPDf$thalach<=125]<-125
HAPDf$thalach[HAPDf$thalach >125 & HAPDf$thalach<=130]<-130
HAPDf$thalach[HAPDf$thalach >130 & HAPDf$thalach<=135]<-135
HAPDf$thalach[HAPDf$thalach >135 & HAPDf$thalach<=140]<-140
HAPDf$thalach[HAPDf$thalach >140 & HAPDf$thalach<=145]<-145
HAPDf$thalach[HAPDf$thalach >145 & HAPDf$thalach<=150]<-150
HAPDf$thalach[HAPDf$thalach >150 & HAPDf$thalach<=155]<-155
HAPDf$thalach[HAPDf$thalach >155 & HAPDf$thalach<=160]<-160
HAPDf$thalach[HAPDf$thalach >160 & HAPDf$thalach<=165]<-165
HAPDf$thalach[HAPDf$thalach >165 & HAPDf$thalach<=170]<-170
HAPDf$thalach[HAPDf$thalach >170 & HAPDf$thalach<=175]<-175
HAPDf$thalach[HAPDf$thalach >175 & HAPDf$thalach<=180]<-180
HAPDf$thalach[HAPDf$thalach >180 & HAPDf$thalach<=185]<-185
HAPDf$thalach[HAPDf$thalach >185 & HAPDf$thalach<=190]<-190

HAPDf$thalach <- as.factor(HAPDf$thalach)

levels(HAPDf$thalach)


#class distribution
HAPDfCount <- table(HAPDf$num)

#plot class distribution
png("Figures/figure4_15.png")
barplot(HAPDfCount, beside = TRUE, ylim = c(0, 450), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
HAnRows <- nrow(HAPDf)
HAPDfCount[[1]] <- HAPDfCount[[1]]/HAnRows*100
HAPDfCount[[2]] <- HAPDfCount[[2]]/HAnRows*100
png("Figures/figure4_16.png")
barplot(HAPDfCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()


#not a lot of imbalance here
#subset the data
#note their are more observations in the abnormal class than in the normal class. 
#consider subsetting the data to have a minority class and majority class instead

dfSubNegHA <- HAPDf[which(HAPDf$num==0),]  #will keep all of this data
# then get the rows where lable = 1 and save as df
dfSubPosHA <- HAPDf[which(HAPDf$num==1),] #will keep only a subset for the experiment

# then pick 100% of data where label = 0 and save as df
#pick 10% of the data where label = 1 and save as df
sampleSizeNegHA <- 100 * nrow(dfSubNegHA)/100
sampleSizePosHA <- 10 * nrow(dfSubPosHA)/100

dfSubNegHA <- dfSubNegHA[sample(1:nrow(dfSubNegHA), sampleSizeNegHA,replace=FALSE),]
dfSubPosHA <- dfSubPosHA[sample(1:nrow(dfSubPosHA),sampleSizePosHA,replace = FALSE),]

# then put the two df together and shuffle
totalHA <- rbind(dfSubNegHA,dfSubPosHA)
totalHA <- totalHA[sample(nrow(totalHA)),]

#new class distribution
totalHACount <- table(totalHA$num)

# plot new class distribution
png("Figures/figure4_17.png")
barplot(totalHACount, beside = TRUE, ylim = c(0, 200), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#plot class distribution in %
totalHARows <- nrow(totalHA)
totalHACount[[1]] <- totalHACount[[1]]/totalHARows*100
totalHACount[[2]] <- totalHACount[[2]]/totalHARows*100
png("Figures/figure4_18.png")
barplot(totalHACount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()


#save the modified dataset
write.csv(HAPDf, file = "ModellingDatasets/HAPDf.csv")

#and the subsetted one
write.csv(totalHA, file = "ModellingDatasets/subHAPDf.csv")











