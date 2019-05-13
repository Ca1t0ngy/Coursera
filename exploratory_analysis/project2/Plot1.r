## Question 1
# load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# check if there are missing values 
sum(is.na(NEI$Emissions)) # = 0, no missing value 

# total emissions by year 
y1999 <- unique(subset(NEI, year==1999, Emissions))
y2002 <- unique(subset(NEI, year==2002, Emissions))
y2005 <- unique(subset(NEI, year==2005, Emissions))
y2008 <- unique(subset(NEI, year==2008, Emissions))

sum1999 <- sum(y1999)
sum2002 <- sum(y2002)
sum2005 <- sum(y2005)
sum2008 <- sum(y2008)

# plot 
year <- cbind(c("1999", "2002", "2005", "2008"))
total_emission <- cbind(year, c(sum1999, sum2002, sum2005, sum2008))

png(file = "plot1.png", width = 480, height = 480)

plot(as.Date(total_emission[, 1], '%Y'), as.double(total_emission[, 2]), 
     xlab='Year', ylab='Total emission', main= 'Total PM2.5 emission by year',
     pch=19, type = "b,c", col="blue")

dev.off()

