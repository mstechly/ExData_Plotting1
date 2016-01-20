Sys.setlocale("LC_ALL", "en_GB.UTF-8")

setwd("~/Elerning/Data_Science/04ExploratoryAnalysis/01Project/ExData_Plotting1/")
raw_data <- read.table("household_power_consumption.txt",header=FALSE, sep=";",na.strings = "?", skip = grep("^[12]/2/2007", readLines("household_power_consumption.txt")), nrows = 2880)
names(raw_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

dateTimes <- paste(raw_data$Date, raw_data$Time)

raw_data$dateTimes <- strptime(dateTimes, "%d/%m/%Y %H:%M:%S")

plot(raw_data$dateTimes, raw_data$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(raw_data$dateTimes, raw_data$Sub_metering_2, col="red")
lines(raw_data$dateTimes, raw_data$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1,1), col=c("black", "red","blue"))


dev.copy(png, 'plot3.png')
dev.off()
