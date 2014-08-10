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
png(filename = "plot3.png", height = 480, width = 480, units = "px", bg = "transparent")

# Plot Sub_metering1 on file device
plot(consumption$Sub_metering_1 ~ consumption$DateTime, col = "black", 
     type = "l",
	 xlab = "", 
	 ylab = "Energy sub metering")

# Add Sub_metering2 in red and Sub_metering2 in blue
lines(consumption$Sub_metering_2 ~ consumption$DateTime, col = "red")
lines(consumption$Sub_metering_3 ~ consumption$DateTime, col = "blue")

# Add legend
legend("topright", col = c("black", "red", "blue"),
     c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

# Close file device
dev.off()