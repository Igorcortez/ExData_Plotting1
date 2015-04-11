# Code for Exploratory Data Analysis Coursera
#1 Loading the data to R 
## File path
dataFile <- "./household_power_consumption.txt"
## Header of data in separate file
head <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", nrows=1)
## Using skip and nrows argument to read subset of data. 
data <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", skip=66637, nrows=2880)
colnames(data)<-unlist(head)

#2 formating the date variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#3 gen variables for ploting
global_active_power <- as.numeric(data$Global_active_power)
global_reactive_power <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
sub_metering1 <- as.numeric(data$Sub_metering_1)
sub_metering2 <- as.numeric(data$Sub_metering_2)
sub_metering3 <- as.numeric(data$Sub_metering_3)

#3 using device png to make plots
png("plot4.png", width=480, height=480)
## define the box in the format of matrix 2 X 2
par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime,sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,sub_metering2, type="l", col="red")
lines(datetime,sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
