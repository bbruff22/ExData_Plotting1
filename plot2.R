######################################################################################
# Course 4, Exploratory Data Analysis - Project 1, plot2
install.packages("dplyr")
library("dplyr")

# read file and filter the days we care about
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# read plot data
datetime <- strptime(paste(filteredData$Date, filteredData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filteredData$Global_active_power)

# open png grahics device and add plot features
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close the plot file
dev.off() 
