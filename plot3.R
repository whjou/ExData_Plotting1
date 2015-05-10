all          <- read.csv2("household_power_consumption.txt")
all$datetime <- as.POSIXct(paste(all$Date, all$Time), format="%d/%m/%Y %T")

sub          <- subset(all,
                       datetime >= as.POSIXct("2007-02-01 00:00:00") & datetime < as.POSIXct("2007-02-03 00:00:00"),
                       select = c(
#                         Global_active_power,
#                         Voltage,
                         Sub_metering_1,
                         Sub_metering_2,
                         Sub_metering_3,
#                         Global_reactive_power,
                         datetime
                       ))
#sub$Global_active_power   <- as.numeric(as.character(sub$Global_active_power))
#sub$Voltage               <- as.numeric(as.character(sub$Voltage))
sub$Sub_metering_1        <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2        <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3        <- as.numeric(as.character(sub$Sub_metering_3))
#sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))

png(file="plot3.png", width=480, height=480)
with(sub, {
  plot(datetime, Sub_metering_1,
               main = "",
               xlab = "",
               ylab = "Energy sub metering",
               type = "l",
               col  = "black"
       )
  lines(datetime, Sub_metering_2,
                type = "l",
                col  = "red"
  )
  lines(datetime, Sub_metering_3,
                type = "l",
                col  = "blue"
  )
})
legend("topright", lwd = 1,
       col    = c("black", "blue", "red"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
dev.off()

