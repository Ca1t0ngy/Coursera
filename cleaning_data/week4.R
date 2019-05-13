## Coursera Data Science 
## Course 3: Getting and Clearning Data 
## Week 4 Quiz 

## Quiz 1: Housing for the state of idaho
   if(!file.exists("./data")) {dir.create("./data")}
   url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
   download.file(url, destfile ="data/housing.csv", method="curl")
   housing <- read.csv("data/housing.csv")
   
## apply strsplit() to split all the names of the name frame on "wgtp"   
   split_name <- strsplit(names(housing), split = "wgtp")
   elt_123 <- split_name[123]

## answer 1 : "" "15"   

## Quiz 2, 3: Gross Domestic Product data for 190 ranked countries 
   url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
   download.file(url, destfile ="data/gdp.csv", method="curl")
   gdp <- read.csv("data/gdp.csv", stringsAsFactors = FALSE)
   
   # str(gdp)
   # rename the names for better use
   names(gdp) <- c("CountryCode", "Ranking","3","Name" ,"GDP",  6:10)
   
   # Quiz 3: 
   CountryName <- select(gdp, Name)  
   CountryName <- filter(CountryName, Name!="" & !is.na(Name))  
   grep("^United", CountryName$Name, value = TRUE)
## answer 3: 3, UK, USA, UAE   
   # subset GDP 
   gdp_sub <- select(gdp, CountryCode, GDP) 
   gdp_sub <- filter(gdp_sub, CountryCode!="" & GDP!=".."& GDP!="") 
   avg <- gsub(",", "", gdp_sub$GDP)
   avg <- mean(as.numeric(avg[1:190]))
## answer 2 : 377652.4
   
## Quiz 4:  GDP and EDU
   url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
   download.file(url2, destfile ="data/edu.csv", method="curl")
   edu <- read.csv("data/edu.csv", stringsAsFactors = FALSE)
   # match edu with gdp
   matched <- match(edu$CountryCode, gdp$CountryCode)
   sub_edu <- select(edu, CountryCode, Special.Notes)
   matched <- matched[!is.na(matched)]
   sub_edu <- sub_edu[matched,]
   sub_edu <- arrange(sub_edu, CountryCode)
   sub_edu1 <- filter(sub_edu, Special.Notes!="")
   sub_edu1[grep("^Fiscal year end*", sub_edu1$Special.Notes),2]

## Quiz 5: regular expression with date 
   # date = grepl("2012-[0-9]{2}-[0-9]{2}", sampleTimes)
   