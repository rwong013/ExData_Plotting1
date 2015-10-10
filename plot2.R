library(data.table)
file <- 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/household_power_consumption.txt'
powercons <- fread(file, na.strings = '?')
powerconsSub <- powercons[powercons$Date == '1/2/2007' | powercons$Date == '2/2/2007']
powerconsSub$Date <- as.Date(powerconsSub$Date, format = "%d/%m/%Y")
powerconsSub <- as.data.frame(powerconsSub)
powerconsSub$Time <- strptime(paste(powerconsSub$Date, powerconsSub$Time, sep = " "), format = "%Y-%m-%d %H:%M:%S")
png(file = 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/ExData_Plotting1/plot2.png')
plot(powerconsSub$Time,powerconsSub$Global_active_power,type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()