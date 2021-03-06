# Read the complete dataset
consumption_all <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?")

# Transform the dates
consumption_all$Date <- as.Date(consumption_all$Date, format="%d/%m/%Y")

# Subset to use data from the dates 2007-02-01 and 2007-02-02 only
consumption <- subset(consumption_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove the dataset with all consumption data
rm(consumption_all)

# Open file device plot1.png
png(filename = "plot1.png", height = 480, width = 480, units = "px", bg = "transparent")

# Plot on file device
hist(consumption$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
	 ylab = "Frequency", 
	 col = "Red")

# Close file device
dev.off()