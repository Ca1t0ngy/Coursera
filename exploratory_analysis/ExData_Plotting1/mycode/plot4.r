## Exploratory Data Analysis
## Week 1 project Plot 
## plot 4 of 4


# set work directory
setwd('/Users/caitongy/Respository/coursera/exploratory_analysis/
      ExData_Plotting1/mycode/')

library("data.table")
library("dplyr")
library(lubridate)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "household_power_consumption.zip"
# download data 
if (!file.exits(destfile)){
        fileDownloaded <- download.file(url, destfile, method = "curl")
        unzip("household_power_consumption.zip")
}

# load data 
filename <- 'household_power_consumption.txt'
data_raw <- fread(filename)

# subset two day in febrary
data <- filter(data_raw,data_raw$Date=='1/2/2007'|data_raw$Date=='2/2/2007')

# merge date and time 
data <- mutate(data, Date_time = paste(data$Date,data$Time))

# convert to date type
data <- mutate(data, Date_time = dmy_hms(data$Date_time))

# plot parameter

png(file = "plot4.png", width = 480, height = 480)
attach(mtcars)
par(mfrow=c(2,2))

# plot 1 
plot(data$Date_time, data$Global_active_power, "l", xlab = "", ylab = 
             "Global Active Power (kilowatts)")
# plot 2
plot(data$Date_time, data$Voltage, "l", xlab = "datetime", ylab = 
             "Voltage") 
# plot 3
plot(data$Date_time, data$Sub_metering_1, "l", xlab = "", ylab = 
             "Energy sub metering")
lines(data$Date_time, data$Sub_metering_2, col = "red")

lines(data$Date_time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1, 1, 1))


# plot 4
plot(data$Date_time, data$Global_reactive_power, "l", xlab = "datetime") 

dev.off()
