# this script to upload and preprocess data for the Autism dataset

#packages
#install.packages("RColorBrewer")

#library
library("RColorBrewer")
display.brewer.all()
#set working directory
getwd()
list.files()

# upload the  autism screening dataset
AuSDf <- read.csv(file = "Datasets/Autism_data.csv", header = TRUE, sep= ",")

cat("Shape of AuSDf is: ", dim(AuSDf))
head(AuSDf)
summary(AuSDf)
colnames(AuSDf)
str(AuSDf)

#notes on column
#the "autism" column (column 15) refers to whether or not a family member has PDD or not
# the result (column 18) is an integer score from the diagnostic
#the label in this case is the last column Class.ASD

levels(AuSDf$Class.ASD)
AuSDfCount <- table(AuSDf$Class.ASD)

#levels are NO and Yes, let's convert this to 0 for No and 1 for yes
levels(AuSDf$Class.ASD)[1] <-0 #uncomment if dataset is reloaded
levels(AuSDf$Class.ASD)[2]<-1 #uncomment if dataset is reloaded
levels(AuSDf$Class.ASD)
AuSDfCount <- table(AuSDf$Class.ASD)

#identify all the levels for the columns that are factors
#replace na for age column
levels(AuSDf$age)
AuSDf$age<- as.numeric(as.character(AuSDf$age))
AuSDf$age[is.na(AuSDf$age)]<- mean(AuSDf$age, na.rm = TRUE)
AuSDf$age<- as.factor((AuSDf$age))
levels(AuSDf$age)
#replace na for ethinicity
levels(AuSDf$ethnicity)
levels(AuSDf$ethnicity)[1]<- "unknown"
levels(AuSDf$ethnicity)

#replace na for relation
levels(AuSDf$relation)
levels(AuSDf$relation)[1]<- "unknown"
levels(AuSDf$relation)
AuSDf[!complete.cases(AuSDf),]
#too many levels in countries column
#there are 67 possible country of residence, RF only supports up to 53
#consider that country of residence may not have an impact on autism diagnostic and drop the column?
#drop the contry of residence in train and test
#or convert to string 
# returns an error (see unusued code at bottom of notebook)

autPos <- AuSDf[AuSDf$Class.ASD==1,]
autNeg <- AuSDf[AuSDf$Class.ASD==0,]
countries <- levels(AuSDf$contry_of_res)
countryDist <- data.frame(Country=as.character(),
                          CountryCode = as.numeric(),
                          Pos = as.numeric(),
                          PosPerc =as.numeric(),
                          Neg = as.numeric(),
                          NegPerc = as.numeric(),
                          TotalSample = as.numeric())
for(i in 1:length(countries)){
  country <- countries[[i]]
  countryCode <- i
  pos <- nrow(autPos[autPos$contry_of_res==countries[[i]],])
  posPerc <- nrow(autPos[autPos$contry_of_res==countries[[i]],])*100/nrow(AuSDf[AuSDf$contry_of_res==countries[[i]],])
  neg <- nrow(autNeg[autNeg$contry_of_res==countries[[i]],])
  negPerc <- nrow(autNeg[autNeg$contry_of_res==countries[[i]],])*100/nrow(AuSDf[AuSDf$contry_of_res==countries[[i]],])
  total <- nrow(AuSDf[AuSDf$contry_of_res==countries[[i]],])
  countryDist <- rbind(countryDist, data.frame(Country = countries[[i]],
                                               CountryCode = countryCode,
                                               Pos = pos,
                                               PosPerc = posPerc,
                                               Neg = neg,
                                               NegPerc = negPerc,
                                               TotalSample = total))
                  
}
countryDist
subCountryDist <- countryDist[countryDist$TotalSample>=5,]
library(ggplot2)
ggplot(data=countryDist, aes(x=countryDist$CountryCode, y=countryDist$PosPerc)) +
  geom_bar(stat="identity")
ggsave("Figures/figure4.2c.png",  width = 16, height = 10, dpi = 160)

ggplot(data=countryDist, aes(x=countryDist$CountryCode, y=countryDist$TotalSample)) +
  geom_bar(stat = "identity")
ggsave("Figures/figure4.2b.png",  width = 16, height = 10, dpi = 160)

##

AuSDf<-subset(AuSDf,select=c(- contry_of_res))

#visualisation
## barplots
barplot(table(AuSDf$Class.ASD, AuSDf$age), beside = TRUE, legend = levels(AuSDf$Class.ASD), ylim = c(0, 110))
barplot(table(AuSDf$Class.ASD, AuSDf$gender), beside = TRUE, legend = levels(AuSDf$Class.ASD), ylim = c(0, 300))
barplot(table(AuSDf$Class.ASD, AuSDf$austim), beside = TRUE, legend = levels(AuSDf$Class.ASD), ylim = c(0,500))
barplot(table(AuSDf$Class.ASD, AuSDf$ethnicity), beside = TRUE, legend = levels(AuSDf$Class.ASD), ylim = c(0,500))


barplot(table(AuSDf$Class.ASD, AuSDf$result), beside = TRUE, legend = levels(AuSDf$Class.ASD), ylim = c(0,500))


#class distribution
png("Figures/figure4_1.png")
barplot(AuSDfCount, beside = TRUE, ylim = c(0, 600), col= brewer.pal(n = 3, name = "Pastel2"))
#col=brewer.pal(n = 3, name = "RdBu")
dev.off()

#show percentage
str(AuSDfCount)
AuSDfRows <- nrow(AuSDf)
AuSDfCount[[1]] <- AuSDfCount[[1]]/AuSDfRows*100
AuSDfCount[[2]] <- AuSDfCount[[2]]/AuSDfRows*100
png("Figures/figure4_2.png")
barplot(AuSDfCount, beside = TRUE, ylim = c(0, 100), col= brewer.pal(n = 3, name = "Pastel2"))
dev.off()

#save the modified dataset
write.csv(AuSDf, file = "ModellingDatasets/AuSDf.csv")