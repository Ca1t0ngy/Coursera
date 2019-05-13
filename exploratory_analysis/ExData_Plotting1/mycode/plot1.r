## Exploratory Data Analysis
## Week 1 project Plot 
## plot 1 of 4


# set work directory
setwd('/Users/caitongy/Respository/coursera/exploratory_analysis/
      ExData_Plotting1/mycode/')

library("data.table")
library("dplyr")

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

png(file = "plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col = "red", main = 
             "Global Active Power", xlab = 
             "Global Active Power (kilowatts)", ylab = 
             "Frequency")

dev.off()

                   

