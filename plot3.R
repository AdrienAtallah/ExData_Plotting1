# Adrien Atallah
#  
# Exploratory Data Analysis: Project 1
#
# plot3.R reads in data file "household_power_consumption.txt" which should be in the current directory, and generates
# the second plot specified in the project description.  This plot shows the 3 Energy sub metering readings
# from February 1, 2007 to February 2, 2007
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

xdays <- range$Days

png(file = "plot3.png", width = 480, height = 480)

plot(xdays, Sub_metering_1 , type = "l", xlab = "", ylab = "Engery Submetering")
lines(xdays, Sub_metering_2, type = "l", col = "red")
lines(xdays, Sub_metering_3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2, lty = 1)

dev.off()
