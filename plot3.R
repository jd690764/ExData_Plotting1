# read in data and convert data & time to POSIXlt 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$datetime <- paste(data$Date, data$Time, sep=" " )
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
# subset to use only the requested data
reqData <- na.omit(data[data$datetime >= "2007-02-01 00:00:00" & data$datetime <= "2007-02-02 23:59:00",])

# open png device to print the graph
png(file="plot3.png", width=480, height=480, unit="px")

# plot emtpy graph
plot(reqData$datetime, reqData$Sub_metering_1, type="n", main="", xlab="", ylab="Energy sub metering")

# add data to graph
lines(reqData$datetime, reqData$Sub_metering_1)
lines(reqData$datetime, reqData$Sub_metering_2, col="red")
lines(reqData$datetime, reqData$Sub_metering_3, col="blue")

# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

# close device
dev.off()
