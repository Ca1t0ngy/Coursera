## Coursera Data Science 
## Course 2: R Programming 
## Week 2 Assignemnt : Air Pollution 

pollutantmean <- function(directory, pollutant, id = 1:332){
        ## 'directory'
        
        ## 'Pollutant'
        
        ## 'id'
        
        ## Return
        
       total <- 0
       total_length <- 0        
       file_list <- list.files(directory, pattern = "*.csv")
     
       for (i in id){
               
               data <- read.csv(paste(directory, file_list[i], sep='/'))
               data <- data[pollutant]
               total <- total + colSums(data, na.rm = TRUE)
               total_length <- total_length + sum(!is.na(data))
               
               }
        
       mean_pollutant <- total / total_length            
       
       return(mean_pollutant)        
}

