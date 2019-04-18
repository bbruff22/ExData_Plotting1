######################################################################################
# Course 4, Exploratory Data Analysis - Project 1, plot2

# read and subset file to days we care about
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsettedData <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
# read plot data
datetime <- strptime(paste(subsettedData$Date, subsettedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsettedData$Global_active_power)
# open png grahics device and set features of the histogram
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# close the plot file
dev.off() 
