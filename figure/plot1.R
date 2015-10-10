library(data.table)
file <- 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/household_power_consumption.txt'
powercons <- fread(file, na.strings = '?')
powerconsDate <- powercons[powercons$Date == '1/2/2007' | powercons$Date == '2/2/2007']
powerconsDate$Date <- as.Date(powerconsDate$Date, format = "%d/%m/%Y")
png(file = 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/ExData_Plotting1/plot1.png')
hist(powerconsDate$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()