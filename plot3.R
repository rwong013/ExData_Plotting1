library(data.table)
file <- 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/household_power_consumption.txt'
powercons <- fread(file, na.strings = '?')
powerconsSub <- powercons[powercons$Date == '1/2/2007' | powercons$Date == '2/2/2007']
powerconsSub$Date <- as.Date(powerconsSub$Date, format = "%d/%m/%Y")
powerconsSub <- as.data.frame(powerconsSub)
powerconsSub$Time <- strptime(paste(powerconsSub$Date, powerconsSub$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")

png(file = 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/ExData_Plotting1/plot3.png')
plot(powerconsSub$Time, powerconsSub$Sub_metering_1, type="n", ylab = "Global Active Power (kilowatts)", xlab = "",)
with(powerconsSub, lines(Time, Sub_metering_1, col = "black"))
with(powerconsSub, lines(Time, Sub_metering_2, col = "red"))
with(powerconsSub, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", pch = "-", col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()