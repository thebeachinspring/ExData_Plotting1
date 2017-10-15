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
hist(data$Global_active_power, col = "blue", xlab = "Global Active Power (Kilowatts)", 
     main = "Global Active Power")
#save in png
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", 
     main = "Global Active Power")
dev.off()
