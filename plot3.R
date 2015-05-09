power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

subpower <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

rm(power)

fulldate <- paste(as.Date(subpower$Date), subpower$Time)
subpower$fulldate <- as.POSIXct(fulldate)

png("plot3.png", width = 480, height=480)
with(subpower, {
  plot(Sub_metering_1~fulldate, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~fulldate, col='Red')
  lines(Sub_metering_3~fulldate, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()