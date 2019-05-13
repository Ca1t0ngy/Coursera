## Question 3
# load package 
library(ggplot2)

# load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# check if there are missing values 
sum(is.na(NEI$Emissions)) # = 0, no missing value 

# total emissions by year in Baltimore City
Baltimore <- unique(subset(NEI, fips=="24510", c(Emissions, year, type)))
emission_by_year <- with(Baltimore, tapply(Emissions, list(type, year), FUN=sum))

# plot 
png(file = "plot3.png", width = 480, height = 480)
emission_by_year <- as.data.frame(emission_by_year)
plot3 <- ggplot(emission_by_year, aes(as.Date(colnames(emission_by_year), "%Y"), 
                                      emission_by_year$`1999`, 
                                      col="NON-ROAD")) 
 
plot3 + geom_point() + geom_line() +
        geom_point(aes(y=emission_by_year$`2002`, col="NON-POINT")) + 
        geom_line(aes(y=emission_by_year$`2002`, col="NON-POINT")) +
        geom_point(aes(y=emission_by_year$`2005`, col="ON-ROAD")) + 
        geom_line(aes(y=emission_by_year$`2005`, col="ON-ROAD")) + 
        geom_point(aes(y=emission_by_year$`2008`, col="POINT")) + 
        geom_line(aes(y=emission_by_year$`2008`, col="POINT")) +
        theme_bw(base_size=8) + 
        labs(y = "Emission by year by type", x = "year", 
             title = "Emission in Baltimore City by year by type", col = "Type") 
dev.off()

