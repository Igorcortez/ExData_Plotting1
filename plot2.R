# Code for Plot 2 - Exploratory Data Analysis Coursera
#1 Loading the data to R 
## File path to use data
dataFile <- "./household_power_consumption.txt"
## Header of data in separate file
head <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", nrows=1)
## Using skip and nrows argument to read subset of data. 
data <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", skip=66637, nrows=2880)
colnames(data)<-unlist(head)

#2formating date variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#3formating global active power to numeric
globalActivePower <- as.numeric(data$Global_active_power)
#4doing plot using device png
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
