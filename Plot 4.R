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
par(mfrow = c(2, 2))
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power",  
     xlab = "")
plot(data$Voltage ~ data$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(data$Sub_metering_1 ~ data$Datetime, type = "l",ylab = "Energy sub metering", xlab = " ")
lines(data$Sub_metering_2 ~ data$Datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$Datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
plot(data$Global_reactive_power ~ data$Datetime, type = "l", ylab = "Global_reactive_power",
     xlab = "datetime")
#save in png
png("plot4.png", width=480, height=480)
plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power",  
     xlab = "")
plot(data$Voltage ~ data$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(data$Sub_metering_1 ~ data$Datetime, type = "l",ylab = "Energy sub metering", xlab = " ")
lines(data$Sub_metering_2 ~ data$Datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$Datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
plot(data$Global_reactive_power ~ data$Datetime, type = "l", ylab = "Global_reactive_power",
     xlab = "datetime")
dev.off()
