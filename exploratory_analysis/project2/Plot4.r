## Question 4
# load package 
library(ggplot2)

# load data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# check if there are missing values 
sum(is.na(NEI$Emissions)) # = 0, no missing value 

# total emissions by year in Baltimore City
scc_coal <- subset(SCC, grepl("Coal",SCC.Level.Three), c(SCC, SCC.Level.Three))
emission_coal <- NEI[NEI$SCC %in% scc_coal$SCC,]
emission_coal_by_year <- with(emission_coal, tapply(Emissions, year, FUN=sum))
# plot 
png(file = "plot4.png", width = 480, height = 480)
margin(2, 2, 2, 2)
emission_coal_by_year <- as.data.frame(emission_coal_by_year)
colnames(emission_coal_by_year) <- "year_str"
plot4 <- ggplot(emission_coal_by_year, 
                aes(as.Date(rownames(emission_coal_by_year), "%Y"), 
                                      year_str))
mytitle="Emissions from coal combustion-related sources changed from 1999–2008"
plot4 + geom_point(shape=19, col="blue") + geom_line() +
        theme_bw(base_size=10) +
        labs(y = "Total Emission ", x = "year", 
             title = mytitle) + 
        theme(plot.title = element_text(hjust=0.5))
dev.off()