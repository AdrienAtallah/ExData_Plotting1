# Adrien Atallah
#  
# Exploratory Data Analysis: Project 1
#
# plot4.R reads in data file "household_power_consumption.txt" which should be in the current directory, and generates
# the fourth plot specified in the project description.  
#

table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

table$Date <- as.Date(table$Date, format = "%d/%m/%Y")

d1 <- as.Date("01/02/2007", format = "%d/%m/%Y")
d2 <- as.Date("02/02/2007", format = "%d/%m/%Y")


range <- table[table$Date %in% d1:d2, ]

days <- paste(as.Date(range$Date), range$Time)
range$Days <- as.POSIXct(days)

Global_active_power <- range$Global_active_power
Sub_metering_1 <- range$Sub_metering_1
Sub_metering_2 <- range$Sub_metering_2
Sub_metering_3 <- range$Sub_metering_3
Voltage <- range$Voltage
Global_reactive_power <- range$Global_reactive_power


xdays <- range$Days

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(xdays, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(xdays, Voltage, type = "l", xlab = "", ylab = "Voltage")

plot(xdays, Sub_metering_1 , type = "l", xlab = "", ylab = "Engery Submetering")
lines(xdays, Sub_metering_2, type = "l", col = "red")
lines(xdays, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, lty = 1, bty = "n" )

plot(xdays, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")



dev.off()
