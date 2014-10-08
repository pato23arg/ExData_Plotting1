household_power_consumption <- read.table("C:/Users/pv532f/Desktop/R&D/DataScience/Exploratory Data Analysis/project1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?")
new_household_power <- subset.data.frame(household_power_consumption, household_power_consumption$V1 == "1/2/2007" | household_power_consumption$V1 == "2/2/2007")
names(new_household_power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
GAP_list <- as.numeric(as.character(new_household_power$Global_active_power))

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(GAP_list, col = "Red", main = "Global Active Power", xlab = "Global Active Power(kilowatts", ylab= "Frequency")
dev.off()

