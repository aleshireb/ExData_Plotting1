library(tidyverse)

#Load data into R
powercon <- read_delim("household_power_consumption 2.txt", skip = 1, delim = ";")

#change variable names to descriptive labels,aligning with those given in project instructions
names(powercon) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#adjusting column data types
cols(
  Date = col_date(format = ""),
  Time = col_time(format = "")
)

#filter(powercon, Date <= "02/02/2007" & Date >= "01/02/2007")

powercon <- subset(powercon, Date %in% c("1/2/2007","2/2/2007"))

#generate histogram with base plotting system with red color and appropriate titles
dev.copy(png, file="plot1.png", height=480, width=480)

hist(as.numeric(powercon$Global_active_power), main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")

dev.off()



