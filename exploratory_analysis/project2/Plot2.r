## Question 2
# load package 

# load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# check if there are missing values 
sum(is.na(NEI$Emissions)) # = 0, no missing value 

# total emissions by year in Baltimore City
Baltimore <- unique(subset(NEI, fips=="24510", c(Emissions, year)))
emission_by_year <- tapply(Baltimore$Emissions, Baltimore$year, FUN=sum)

# plot 
png(file = "plot2.png", width = 480, height = 480)

plot(as.Date(rownames(emission_by_year), '%Y'), as.double(emission_by_year), 
     xlab='Year', ylab='Total emission', main= 'Total PM2.5 emission by year in
        Baltimore City', pch=19, type = "b,c", col="blue")

dev.off()

