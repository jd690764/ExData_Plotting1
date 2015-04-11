# read in data and convert data & time to POSIXlt 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$datetime <- paste(data$Date, data$Time, sep=" " )
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
# subset to use only the requested data
reqData <- na.omit(data[data$datetime >= "2007-02-01 00:00:00" & data$datetime <= "2007-02-02 23:59:00",])

# open png device to print the graph
png(file="plot4.png", width=480, height=480, unit="px")

# configure the device for 4 graphs
par(mfrow=c(2,2))

# print top left graph
plot(reqData$datetime, reqData$Global_active_power, type="n", main="", xlab="", ylab="Global Active Power (kilowatts)")
lines(reqData$datetime, reqData$Global_active_power)

# print top right graph
plot(reqData$datetime, reqData$Voltage, type="n", main="", xlab="datetime", ylab="Voltage")
lines(reqData$datetime, reqData$Voltage)

# print bottom left graph
plot(reqData$datetime, reqData$Sub_metering_1, type="n", main="", xlab="", ylab="Energy sub metering")
lines(reqData$datetime, reqData$Sub_metering_1)
lines(reqData$datetime, reqData$Sub_metering_2, col="red")
lines(reqData$datetime, reqData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

# print bottom right graph
plot(reqData$datetime, reqData$Global_reactive_power, type="n", main="", xlab="datetime", ylab="Global_reactive_power")
lines(reqData$datetime, reqData$Global_reactive_power)

# close device
dev.off()
