#Import file
#PPA_Payments <- read.csv("P:/Capstone/PPA_Payments.csv")
#PAR_ParkingTxns <- read.csv("P:/Capstone/PAR_ParkingTxns.csv")

#Create generic data frame.
data_frame = cleaned_data

#Check out stats on file.
str(data_frame)
View(summary(data_frame))

#Attach file.
attach(data_frame)

#With the following code, we will create two tables 
# which will show if column fields are unique in addition to 
#other info like number of NA's, and frequency of each unique element in a column. 

#-------
install.packages("plyr")
library(plyr)

# table_stats1 will show the number of elements, unique elements and NAs
# in each column of a data table.
# table_stats2 will list all unique values and show the frequency of 
# each unique values in the column.

table_stats1 = data.frame()
table_stats2 = data.frame()

for (i in (1:ncol(data_frame)))
{
  x = data_frame[,i]
  
  NumElements = length(x)
  NumUniqueElements = length(unique(x))
  UniqueElements = unique(x)
  ElementFrequency = data.frame(table(x))
  ElementFrequencyFrequency = data.frame(table(ElementFrequency$Freq))
  NumNAs = sum(is.na(x))
  
  y = data.frame((colnames(data_frame)[i]),NumElements,NumUniqueElements,NumNAs)
  table_stats1 = rbind(table_stats1,y)
  
  z = data.frame((colnames(data_frame)[i]),ElementFrequency)
  table_stats2 = rbind.fill(table_stats2,z)
}


View(table_stats1)
View(table_stats2)

#Illustrate range and spread of "Turnover" values - "Turnover" represents net profit
range(Turnover)
quantile(Turnover, probs =c(0.1,0.9))
Turnover_middle80pct=Turnover[Turnover>0&Turnover<10000]
hist(Turnover_middle80pct, xlab = "Turnover")
boxplot(Turnover_middle80pct)

#In the PAR_ParkingTxns dataset, there were 364,638 transactions.
#The PPA_Payments dataset has only 171,578 transactions.

#When Discounted is Y and PaymentMethod is 0, Turnover and NetTurnover are zero.
#When Discounted is Y and PaymentMethod is 1 or 3, Turnover and NetTurnover are not zero.
#Turnover and NetTurnover are identical & Price and NetPrice are also identical


