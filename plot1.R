#Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Launch 'png' graphics device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#get subset of data from 1/2/2007 & 2/2/2007
datasubset <- subset(na.omit(data), Date=="1/2/2007" | Date=="2/2/2007")

#Call hist() function
with(datasubset,hist(Global_active_power,
     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

#Close Graphics Device
dev.off()