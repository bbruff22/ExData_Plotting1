######################################################################################
# Course 4, Exploratory Data Analysis - Project 1, plot1
install.packages("dplyr")
library("dplyr")
# read and subset file to days we care about
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filteredData <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
# read plot data
globalActivePower <- as.numeric(filteredData$Global_active_power)
# open png grahics device and set features of the histogram
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
# close the plot file
dev.off() 
