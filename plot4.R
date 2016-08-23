#Read data from file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Launch 'png' graphics device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#set up 2 x 2 grid plot window
par(mfrow=c(2,2))

#get subset of data from 1/2/2007 & 2/2/2007
datasubset <- subset(na.omit(data), Date=="1/2/2007" | Date=="2/2/2007")

#Add 'Datetime' perameter to subset
datasubset$Datetime <- strptime(paste(datasubset$Date," ",datasubset$Time),"%d/%m/%Y %H:%M:%S")

#set up first plot 
with(datasubset,
     plot( Datetime, Global_active_power, type="n",
           main = "", xlab="", ylab = "Global Active Power"))
#Add lines to first plot
with(datasubset,
     lines(Datetime ,Global_active_power))

#set up second plot 
with(datasubset,
     plot( Datetime, Voltage, type="n",
           main = "", xlab="datetime", ylab = "Voltage"))
#Add lines to second plot
with(datasubset,
     lines(Datetime ,Voltage))

#Set up third plot
with(datasubset,
          plot(Datetime,Sub_metering_1, type="n"
               , main = "", xlab="", ylab = "Energy sub metering"))
#Add legend to top right of third plot
legend("topright", col=c("black", "red", "blue"), lty = 1, bty="n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Add plot lines to third plot
with(datasubset,
       lines(Datetime,Sub_metering_1))
with(datasubset,
       lines(Datetime,Sub_metering_2, col = "red"))
with(datasubset,
       lines(Datetime,Sub_metering_3, col = "blue"))

#set up fourth plot 
with(datasubset,
     plot( Datetime, Global_reactive_power, type="n",
           main = "", xlab="datetime", ylab = "Global_reactive_power"))
#Add lines to fourth plot
with(datasubset,
     lines(Datetime ,Global_reactive_power))

#Close Graphics Device
dev.off()