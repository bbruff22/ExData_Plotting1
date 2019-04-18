######################################################################################
# Exploratory Data Analysis - Project 1 - plot4
install.packages("dplyr")
library("dplyr")
# read and subset file to days we care about
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
# creat datetime for x axis
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# set other objects that will be used in plot
globalActivePower <- as.numeric(filteredData$Global_active_power)
globalReactivePower <- as.numeric(filteredData$Global_reactive_power)
voltage <- as.numeric(filteredData$Voltage)
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

# open png grahics device and set features
png("plot4.png", width=480, height=480)
# use par function to enable multiple graphs in one plot
par(mfrow = c(2, 2)) 
# top row of plots
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# bottom left plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# bottom right plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
# close the plot file
dev.off() 
