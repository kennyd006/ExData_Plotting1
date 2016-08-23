#Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Launch 'png' graphics device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#get subset of data from 1/2/2007 & 2/2/2007
datasubset <- subset(na.omit(data), Date=="1/2/2007" | Date=="2/2/2007")

#Add 'Datetime' perameter to subset
datasubset$Datetime <- strptime(paste(datasubset$Date," ",datasubset$Time),"%d/%m/%Y %H:%M:%S")

#Set up plot
with(datasubset,
          plot(Datetime,Sub_metering_1, type="n"
               , main = "", xlab="", ylab = "Energy sub metering"))
#Add legend to top right
legend("topright", col=c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Add plot lines to plot
with(datasubset,
       lines(Datetime,Sub_metering_1))
with(datasubset,
       lines(Datetime,Sub_metering_2, col = "red"))
with(datasubset,
       lines(Datetime,Sub_metering_3, col = "blue"))
#Close Graphics Device
dev.off()