# Adrien Atallah
#  
# Exploratory Data Analysis: Project 1
#
# plot2.R reads in data file "household_power_consumption.txt" which should be in the current directory, and generates
# the second plot specified in the project description.  This plot shows the Global Active Power in kilowatts
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
xdays <- range$Days

png(file = "plot2.png", width = 480, height = 480)

plot(xdays, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
