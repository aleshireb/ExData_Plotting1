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

dev.copy(png, file="plot2.png", height=480, width=480)

plot(powercon$Datetime, powercon$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")

dev.off()




