## Question 5
# load package 
library(ggplot2)

# load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# check if there are missing values 
sum(is.na(NEI$Emissions)) # = 0, no missing value 

# total emissions by year in Baltimore City
Baltimore <- unique(subset(NEI, fips=="24510", c(SCC, Emissions, year, type)))
scc_vehicle <- subset(SCC, grepl("Vehicle",SCC.Level.Two), c(SCC, SCC.Level.Two))
emission_vehicle <- Baltimore[Baltimore$SCC %in% scc_vehicle$SCC,]
emission_vehicle_by_year <- with(emission_vehicle, tapply(Emissions, year, FUN=sum))
# plot 
png(file = "plot5.png", width = 480, height = 480)
margin(2, 2, 2, 2)
emission_vehicle_by_year <- as.data.frame(emission_vehicle_by_year)
colnames(emission_vehicle_by_year) <- "emission"
plot5 <- ggplot(emission_vehicle_by_year, 
                aes(as.Date(rownames(emission_vehicle_by_year), "%Y"), 
                    emission))
mytitle="Emissions from mobile vehicle sources in Baltimore City from 1999–2008"
plot5 + geom_point(shape=19, col="blue") + geom_line() +
        theme_bw(base_size=10) +
        labs(y = "Total Emission ", x = "year", 
             title = mytitle) + 
        theme(plot.title = element_text(hjust=0.5))
dev.off()