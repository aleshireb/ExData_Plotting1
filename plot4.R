library(tidyverse)
library(lubridate)

#Load data into R
powercon <- read_delim("household_power_consumption 2.txt", skip = 1, delim = ";")

#change variable names to descriptive labels,aligning with those given in project instructions
names(powercon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#adjusting column data types
cols(
  Date = col_date(format = "%d/%m/%Y"),
  Time = col_time(format = "")
)

powercon$Datetime <- with(powercon, dmy(Date) + hms(Time))

powercon <- subset(powercon, Date %in% c("1/2/2007","2/2/2007"))

dev.copy(png, file="plot4.png", height=480, width=480)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
  plot(powercon$Datetime, powercon$Global_active_power, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  
  plot(powercon$Datetime, powercon$Voltage, type="l", 
       ylab = "Voltage (volt)", xlab = "")
  
  plot(powercon$Datetime, powercon$Sub_metering_1, type="l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(powercon$Datetime, powercon$Sub_metering_2, col = "red")
    lines(powercon$Datetime, powercon$Sub_metering_3, col = "blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 
     plot(powercon$Datetime, powercon$Global_reactive_power, type = "l", 
       ylab="Global Rective Power (kilowatts)",xlab="")

dev.off()