all          <- read.csv2("household_power_consumption.txt")
all$datetime <- as.POSIXct(paste(all$Date, all$Time), format="%d/%m/%Y %T")

sub          <- subset(all,
                       datetime >= as.POSIXct("2007-02-01 00:00:00") & datetime < as.POSIXct("2007-02-03 00:00:00"),
                       select = c(
                         Global_active_power,
                         Voltage,
                         Sub_metering_1,
                         Sub_metering_2,
                         Sub_metering_3,
                         Global_reactive_power,
                         datetime
                       ))
sub$Global_active_power   <- as.numeric(as.character(sub$Global_active_power))
sub$Voltage               <- as.numeric(as.character(sub$Voltage))
sub$Sub_metering_1        <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2        <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3        <- as.numeric(as.character(sub$Sub_metering_3))
sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))

png(file="plot4.png", width=480, height=480)
op <- par(mfrow = c(2, 2))
with(sub, {
  plot(datetime, Global_active_power,
       main = "",
       xlab = "",
       ylab = "Global Active Power",
       type = "l",
       col  = "black")
  plot(datetime, Voltage,
       main = "",
       type = "l",
       col  = "black")
  plot(datetime, Sub_metering_1,
       main = "",
       xlab = "",
       ylab = "Energy sub metering",
       type = "l",
       col  = "black")
  lines(datetime, Sub_metering_2,
        main = "",
        xlab = "",
        ylab = "",
        type = "l",
        col  = "red")
  lines(datetime, Sub_metering_3,
        main = "",
        xlab = "",
        ylab = "",
        type = "l",
        col  = "blue")
  legend("topright", lwd = 1,
         col = c("black", "blue", "red"),
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Global_reactive_power,
       main = "",
       type = "l",
       col  = "black")
  })
par(op)
dev.off()
