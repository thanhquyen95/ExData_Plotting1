##read the data
datasource <- "./household_power_consumption.txt"
data       <- read.table(datasource,header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
##plot 3 code
global_active_power <- as.numeric(subSetData$Global_active_power)
datetime            <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
subMetering1        <- as.numeric(subSetData$Sub_metering_1)
subMetering2        <- as.numeric(subSetData$Sub_metering_2)
subMetering3        <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime,subMetering1, type = "l", ylab = "Energy sub Metering", xlab = "")
lines(datetime,subMetering2,type = "l", col="red")
lines(datetime,subMetering3, type = "l", col="blue")
legend("topright", c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),lty = 1, lwd = 2.5,col = c("black","red","blue"))
dev.off()
