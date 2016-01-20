Sys.setlocale("LC_ALL", "en_GB.UTF-8")

setwd("~/Elerning/Data_Science/04ExploratoryAnalysis/01Project/ExData_Plotting1/")
raw_data <- read.table("household_power_consumption.txt",header=FALSE, sep=";",na.strings = "?", skip = grep("^[12]/2/2007", readLines("household_power_consumption.txt")), nrows = 2880)
names(raw_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dateTimes <- paste(raw_data$Date, raw_data$Time)

raw_data$dateTimes <- strptime(dateTimes, "%d/%m/%Y %H:%M:%S")

plot(raw_data$dateTimes, raw_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")


dev.copy(png, 'plot2.png')
dev.off()
