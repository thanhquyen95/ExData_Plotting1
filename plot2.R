##read the data
datasource <- "./household_power_consumption.txt"
data       <- read.table(datasource,header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
##plot 2 code
global_active_power <- as.numeric(subSetData$Global_active_power)
datetime <- strptime(paste(subSetData$Date,subSetData$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480, height = 480)
plot(datetime,global_active_power,type ="l", xlab = "Day", ylab = "Global active power (kilowatts)")
dev.off()
