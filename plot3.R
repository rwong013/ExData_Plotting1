library(data.table)
file <- 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/household_power_consumption.txt'
#Read data using fread. data.table format used for speed purposes
powercons <- fread(file, na.strings = '?')
#subset data
powerconsSub <- powercons[powercons$Date == '1/2/2007' | powercons$Date == '2/2/2007']
#convert to date format
powerconsSub$Date <- as.Date(powerconsSub$Date, format = "%d/%m/%Y")
#convert from data.table to data.frame to ensure strptime works. If matrix is not converted, strptime doesn't work
powerconsSub <- as.data.frame(powerconsSub)
#convert time to date+time format. combines date data and time data.
powerconsSub$Time <- strptime(paste(powerconsSub$Date, powerconsSub$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
#create png file with plot
png(file = 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/ExData_Plotting1/plot3.png')
plot(powerconsSub$Time, powerconsSub$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab = "",)
with(powerconsSub, lines(Time, Sub_metering_1, col = "black"))
with(powerconsSub, lines(Time, Sub_metering_2, col = "red"))
with(powerconsSub, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", pch = "_", col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()