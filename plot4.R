power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=2075259)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

subpower <- subset(power, power$Date == "2007-02-01" | power$Date == "2007-02-02")

rm(power)

fulldate <- paste(as.Date(subpower$Date), subpower$Time)
subpower$fulldate <- as.POSIXct(fulldate)

png("plot4.png", width = 480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subpower, {
  plot(Global_active_power~fulldate, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~fulldate, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~fulldate, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~fulldate,col='Red')
  lines(Sub_metering_3~fulldate,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~fulldate, type="l", 
       ylab="Global_Rective_Power",xlab="datetime")
})
dev.off()