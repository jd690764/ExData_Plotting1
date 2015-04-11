# read in data and convert data & time to POSIXlt 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$datetime <- paste(data$Date, data$Time, sep=" " )
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
# subset to use only the requested data
reqData <- na.omit(data[data$datetime >= "2007-02-01 00:00:00" & data$datetime <= "2007-02-02 23:59:00",])

# open png device to print the graph
png(file="plot1.png", width=480, height=480, unit="px")

# print graph
hist(reqData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close device
dev.off()
