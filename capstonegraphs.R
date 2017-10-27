install.packages("ggplot2")
library(ggplot2)
x=seq(0,600,1)
y=(exp(x/75)-1)
plot(x,y, xlab = "Occupancy", ylab = "Time Taken (s)", type = "l", main="Time Taken to find a Parking Spot")
help(plot)

z=2500-y
plot(x,z)


#Import data
PAR_ParkingTxns <- read.csv("P:/Capstone/PAR_ParkingTxns.csv")
#Create matrix of values
heat.data = table(EntryDeviceNumber,ExitDeviceNumber)

#Install fields package
install.packages("fields")
library(fields)
help("image")
image.plot(1:6, 1:5, heat.data, axes=FALSE, 
           xlab = "EntryDeviceNumber", ylab = "ExitDeviceNumber", main = "Heat Map Showing Entry/Exit Popularity")
# the following pointless command is necessary to make the custom axis labels non-transparent
# google revealed this among a number of other workarounds.
points(0,0)
# now these will display properly
axis(side=1, at=1:6, labels=unique(EntryDeviceNumber), las=2)
axis(side=2, at= 1:5, labels=unique(ExitDeviceNumber), las=1)

#Run Data Cleaning file first
attach(uniquevisitors)
quantile(avg_TimeSpent_Hours, probs =c(0.1,0.9))
as.numeric(avg_TimeSpent_Hours)
hist(as.numeric(avg_TimeSpent_Hours), xlab = "avg time spent by contract parkers (hrs)")

#############

#Create matrix of values
heat.data = table(x$Price,x$YearDay)

#Install fields package
install.packages("fields")
library(fields)
help("image")
image.plot(1:61, 1:363, heat.data, axes=FALSE, 
           xlab = "EntryDeviceNumber", ylab = "ExitDeviceNumber", main = "Heat Map Showing Entry/Exit Popularity")
# the following pointless command is necessary to make the custom axis labels non-transparent
# google revealed this among a number of other workarounds.
points(0,0)
# now these will display properly
axis(side=1, at=1:365, labels=unique(EntryDeviceNumber), las=2)
axis(side=2, at= 1:5, labels=unique(ExitDeviceNumber), las=1)

#Run Data Cleaning file first
attach(uniquevisitors)
quantile(avg_TimeSpent_Hours, probs =c(0.1,0.9))
as.numeric(avg_TimeSpent_Hours)
hist(as.numeric(avg_TimeSpent_Hours), xlab = "avg time spent by contract parkers (hrs)")
