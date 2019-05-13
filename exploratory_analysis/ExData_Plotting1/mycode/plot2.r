## Exploratory Data Analysis
## Week 1 project Plot 
## plot 2 of 4


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

# plot 
png(file = "plot2.png", width = 480, height = 480)
with(data, plot(Date_time, Global_active_power, "l", xlab = "", ylab = 
                        "Global Active Power (kilowatts)"))
dev.off()

