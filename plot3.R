######################################################################################
# Exploratory Data Analysis - Project 1 - plot3
install.packages("dplyr")
library("dplyr")

# read file and filter the days we care about
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# creat plot objects
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filteredData$Global_active_power)
subMetering1 <- as.numeric(filteredData$Sub_metering_1)
subMetering2 <- as.numeric(filteredData$Sub_metering_2)
subMetering3 <- as.numeric(filteredData$Sub_metering_3)

# open png grahics device and set features
png("plot3.png", width=480, height=480)

# set the features of the plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# close the plot file
dev.off() 
