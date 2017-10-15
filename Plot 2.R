# add packages
library(dplyr)
#read in data
data<- read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F,
                  na.strings="?")
#clean data
data<-filter(data,Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
summary(data)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#get a visual of plot
plot(x,y, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = " ")
#save in png
png("plot2.png", width=480, height=480)
plot(x,y, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = " ")
dev.off()
