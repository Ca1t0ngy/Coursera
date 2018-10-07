## Coursera Data Science 
## Course 2: R Programming 
## Week 2 Assignemnt : Air Pollution 

corr <- function(directory, threshold = 0){
        ## 'directory'
        
        ## 'threshold'
        
        ##  return
        
        
        # list complete elements according to theshold
        
        file_list <- list.files(directory, pattern = "*.csv")
        list_cor <- c() # store the result
        result <- complete(directory, id = 1:332)
        row_size <- (result)[,2]
        
        
        for(i in 1:332){
                
                # store the complete list
                list_complete <- data.frame()
                
                if(row_size[i] > threshold){
                        
                        data <- read.csv(paste(directory, file_list[i], sep = '/'))
                        data <- data[c('sulfate', 'nitrate')]
                        sub  <- is.na(data)
                        
                        dimension <- dim(data)
                        row_d <- dimension[1]
                        
                        
                        for(j in 1:row_d){
                                if (sum(sub[j,]) == 0){
                                        list_complete <- rbind(list_complete, data[j,])
                                }
                        }
                        
                        correlation <- cor(list_complete[,1], list_complete[,2])
                        list_cor <- c(list_cor, correlation)
                }
                
                       
        }
        

        return(list_cor)
        
}