# Code for Plot1 - Exploratory data Analysis Coursera

#1 Loading the data to R 
## File- Path
dataFile <- "./household_power_consumption.txt"
## Header of data in separate file
head <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", nrows=1)
## Using skip and nrows argument to read subset of data. 
data <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", skip=66637, nrows=2880)
colnames(data)<-unlist(head)

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
