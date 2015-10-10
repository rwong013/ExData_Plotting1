library(data.table)
file <- 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/household_power_consumption.txt'
#Read data using fread. data.table format used for speed purposes
powercons <- fread(file, na.strings = '?')
#subset data
powerconsSub <- powercons[powercons$Date == '1/2/2007' | powercons$Date == '2/2/2007']
#convert to date format
powerconsSub$Date <- as.Date(powerconsSub$Date, format = "%d/%m/%Y")
#Create png file with plot data
png(file = 'C:/Users/rwong/Documents/DSS/ExploratoryDataAnalysis/Proj1/ExData_Plotting1/plot1.png')
hist(powerconsSub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()