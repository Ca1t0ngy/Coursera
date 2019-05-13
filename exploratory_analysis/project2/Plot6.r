## Question 6
# load package 
library(ggplot2)

# load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# check if there are missing values 
sum(is.na(NEI$Emissions)) # = 0, no missing value 

# total emissions by year in Baltimore City
Baltimore <- unique(subset(NEI, fips=="24510", c(SCC, Emissions, year, type)))
LA <- unique(subset(NEI, fips=="06037", c(SCC, Emissions, year, type)))
scc_vehicle <- subset(SCC, grepl("Vehicle",SCC.Level.Two), c(SCC, SCC.Level.Two))
emission_vehicle_BA <- Baltimore[Baltimore$SCC %in% scc_vehicle$SCC,]
emission_vehicle_LA <- LA[LA$SCC %in% scc_vehicle$SCC,]
emission_vehicle_by_year_BA <- with(emission_vehicle_BA, tapply(Emissions, year, 
                                                                FUN=sum))
emission_vehicle_by_year_LA <- with(emission_vehicle_LA, tapply(Emissions, year, 
                                                                FUN=sum))
# yearly emission change from 1998 to 2008  
rate_BA <- emission_vehicle_by_year_BA
rate_LA <- emission_vehicle_by_year_LA

rate_BA[1] <- 1
rate_LA[1] <- 1

for (i in 1:3){
rate_BA[i+1] <- (emission_vehicle_by_year_BA[i+1] - emission_vehicle_by_year_BA[i])/ 
                         emission_vehicle_by_year_BA[i] 
rate_LA[i+1] <- (emission_vehicle_by_year_LA[i+1] - emission_vehicle_by_year_LA[i]) / 
                         emission_vehicle_by_year_LA[i] 
}

# plot 
png(file = "plot6.png", width = 480, height = 480)
margin(2, 2, 2, 2)
rate_BA <- as.data.frame(rate_BA)
rate_LA <- as.data.frame(rate_LA)

colnames(rate_BA) <- "emission"
colnames(rate_LA) <- "emission"

plot6 <- ggplot(rate_BA, 
                aes(as.Date(rownames(rate_BA), "%Y"),
                    emission, col="Baltimore"))

mytitle="Yearly rates for motor vehicle sources emission from 1999–2008"
plot6 + geom_point(shape=19) + geom_line() +
        geom_point(aes(y=rate_LA$emission, col="Los Angelos")) +
        geom_line(aes(y=rate_LA$emission, col="Los Angelos")) +
        theme_bw(base_size=10) + 
        labs(y = "Percent comparing to last year ", x = "year", 
             title = mytitle, col="City") + 
        theme(plot.title = element_text(hjust=0.5))
dev.off()