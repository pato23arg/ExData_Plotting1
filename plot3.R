household_power_consumption <- read.table("C:/Users/pv532f/Desktop/R&D/DataScience/Exploratory Data Analysis/project1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?")
new_household_power <- subset.data.frame(household_power_consumption, household_power_consumption$V1 == "1/2/2007" | household_power_consumption$V1 == "2/2/2007")
names(new_household_power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")


char_date <- paste(new_household_power$Date, new_household_power$Time)
DateTime <- strptime(char_date, "%d/%m/%Y %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(x = DateTime, y = new_household_power$Sub_metering_1, main = "", ylab = "Energy sub metering", xlab = "", type="l")
lines(x = DateTime, y = as.numeric(as.character(new_household_power$Sub_metering_2)), col = "Red")
lines(x = DateTime, y = as.numeric(as.character(new_household_power$Sub_metering_3)), col = "Blue")
legend('topright', names(new_household_power[7:9]), col=c("Black", "Red", "Blue"), lty=1, bty='o')
dev.off()
