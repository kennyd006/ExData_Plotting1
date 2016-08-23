#Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Launch 'png' graphics device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#get subset of data from 1/2/2007 & 2/2/2007
datasubset <- subset(na.omit(data), Date=="1/2/2007" | Date=="2/2/2007")

#Add 'Datetime' perameter to subset
datasubset$Datetime <- strptime(paste(datasubset$Date," ",datasubset$Time),"%d/%m/%Y %H:%M:%S")

#set up plot 
with(datasubset,
          plot( Datetime, Global_active_power, type="n",
          main = "", xlab="", ylab = "Global Active Power (kilowatts)"))
#Add lines to plot
with(datasubset,
          lines(Datetime ,Global_active_power))

#Close Graphics Device
dev.off()