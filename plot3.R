# Code for Plot3 Exploratory data Analysis Coursera
#1 Loading the data to R 
## File path
dataFile <- "./household_power_consumption.txt"
## Header of data in separate file
head <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", nrows=1)
## Using skip and nrows argument to read subset of data. 
data <- read.table(dataFile, header=FALSE, sep=";", stringsAsFactors=FALSE, dec=".", skip=66637, nrows=2880)
colnames(data)<-unlist(head)

#2 Formating date variables
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#3 gen variables for the plot - transforming into numeric variables
global_active_power <- as.numeric(data$Global_active_power)
sub_metering1 <- as.numeric(data$Sub_metering_1)
sub_metering2 <- as.numeric(data$Sub_metering_2)
sub_metering3 <- as.numeric(data$Sub_metering_3)

# 4 using device plot pnp to make plots 
png("plot3.png", width=480, height=480)
plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_metering2, type="l", col="red")
lines(datetime, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
