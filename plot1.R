# Adrien Atallah
#  
# Exploratory Data Analysis: Project 1
#
# plot1.R reads in data file "household_power_consumption.txt" which should be in the current directory, and generates
# the first plot specified in the project description.  This plot is a histogram of the Global Active Power in kilowatts
# from February 1, 2007 to February 2, 2007
#


table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

table$Date <- as.Date(table$Date, format = "%d/%m/%Y")
table$Time <- strptime(table$Time, format = "%H:%M:%S")

d1 <- as.Date("01/02/2007", format = "%d/%m/%Y")
d2 <- as.Date("02/02/2007", format = "%d/%m/%Y")

range <- table[table$Date %in% d1:d2, ]

Global_active_power <- range$Global_active_power

png(file = "plot1.png", width = 480, height = 480)

hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
