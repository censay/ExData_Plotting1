power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

subpower <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

rm(power)

png("plot1.png", width = 480, height=480)
hist(subpower$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()