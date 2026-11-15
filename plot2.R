# Read and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
subdata <- subset(data, DateTime >= as.POSIXct("2007-02-01 00:00:00") & DateTime <= as.POSIXct("2007-02-02 23:59:59"))

# Create Plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(subdata$DateTime, subdata$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()