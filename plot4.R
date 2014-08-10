# Read the complete dataset
consumption_all <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?")

# Transform the dates
consumption_all$Date <- as.Date(consumption_all$Date, format="%d/%m/%Y")

# Subset to use data from the dates 2007-02-01 and 2007-02-02 only
consumption <- subset(consumption_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove the dataset with all consumption data
rm(consumption_all)
	 
# Converting dates
datetime <- paste(as.Date(consumption$Date), consumption$Time)
consumption$DateTime <- as.POSIXct(datetime)

# Open file device plot3.png
png(filename = "plot4.png", height = 480, width = 480, units = "px", bg = "transparent")

# Partition plot area into four quadrants
par(mfrow = c(2,2))

# Plot 4a, top-left
plot(consumption$Global_active_power ~ consumption$DateTime, 
     type = "l",
	 xlab = "", 
	 ylab = "Global Active Power")

# Plot 4b, top-right
plot(consumption$Voltage ~ consumption$DateTime,
     type = "l",
	 xlab = "datetime", 
	 ylab = "Voltage")

# Plot 4c, bottom-left as defined for plot3.png but this time without a box around the legend
plot(consumption$Sub_metering_1 ~ consumption$DateTime, col = "black", 
     type = "l",
	 xlab = "", 
	 ylab = "Energy sub metering")
lines(consumption$Sub_metering_2 ~ consumption$DateTime, col = "red")
lines(consumption$Sub_metering_3 ~ consumption$DateTime, col = "blue")	 
legend("topright", col = c("black", "red", "blue"),
     c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n")	
	 
# Plot 4d, bottom-right
plot(consumption$Global_reactive_power ~ consumption$DateTime,
     type = "l",
	 xlab = "datetime", 
	 ylab = "Global_reactive_power")

# Close file device
dev.off()