power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

subpower <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

rm(power)

fulldate <- paste(as.Date(subpower$Date), subpower$Time)
subpower$fulldate <- as.POSIXct(fulldate)

png("plot2.png", width = 480, height=480)
plot(subpower$Global_active_power~subpower$fulldate, type="l",  ylab="Global Active Power (kilowatts)", xlab="")
dev.off()